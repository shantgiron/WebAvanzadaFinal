package pucmm.finalweb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;
import pucmm.finalweb.model.*;
import pucmm.finalweb.service.ClienteEquipoServiceImpl;
import pucmm.finalweb.service.ClienteServiceImpl;
import pucmm.finalweb.service.FacturaServiceImpl;
import pucmm.finalweb.service.ProductoServiceImpl;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping("/compras")
public class ComprasController {


    @Autowired
    private ClienteEquipoServiceImpl clienteEquipoService;


    @Autowired
    private ClienteServiceImpl clienteService;


    @Autowired
    private ProductoServiceImpl equipoService;

    @Autowired
    FacturaServiceImpl facturaService;


    @Autowired
    RestTemplate restTemplate;

    @GetMapping(value = "/")
    public String compras(Model model)
    {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        UserDetails userDetails = (UserDetails) auth.getPrincipal();
        String usuario = userDetails.getUsername();
        model.addAttribute("usuario",usuario);



        List<Producto> productos = Arrays.asList(
                restTemplate.getForObject(
                        "http://localhost:8082/productos/",
                        Producto[].class)
        );

        List<Cliente> clientes = Arrays.asList(
                restTemplate.getForObject(
                        "http://localhost:8083/clientes/",
                        Cliente[].class));

        List<FacturaProducto> compras = Arrays.asList(
                restTemplate.getForObject(
                        "http://localhost:8081/compras/",
                        FacturaProducto[].class));


        model.addAttribute("clientes", clientes);
        model.addAttribute("equipos", productos);
        model.addAttribute("alquileres",compras);
        return "compras";

    }


    @PostMapping(value = "/despacho/")
    public String despacho(@RequestParam("client") String idcliente, @RequestParam("cant[]") List<String> cantidades,
                           @RequestParam("ids[]") List<String> ids, @RequestParam("fecha") String fecha,
                           @RequestParam("condicion") String condicion, @RequestParam("total") String total) {


        HttpHeaders headers = new HttpHeaders();
        headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
        HttpEntity<String> entity = new HttpEntity<String>(headers);
        List<Producto> productos = restTemplate.exchange("http://localhost:8080/productos/todos", HttpMethod.GET, null,
                new ParameterizedTypeReference<List<Producto>>() {
                }).getBody();

        List<Producto> productoList = new ArrayList<>();

        String informacionDespacho = "";


        Factura factura = new Factura();
        FacturaProducto detalles = new FacturaProducto();

        factura.setCliente_id(idcliente);
        LocalDate date = LocalDate.parse(fecha);
        factura.setFecha(date);
        factura.setTotal(Double.parseDouble(total));
        factura.setCondicion(condicion);

        facturaService.crearFactura(factura);

        for (int i = 0; i < ids.size(); i++) {

            detalles.setFactura_id(Integer.toString(factura.getId()));
            detalles.setProducto_id(ids.get(i));
            detalles.setCantidad(Integer.parseInt(cantidades.get(i)));
            for (Producto producto : productos){
                if(ids.get(i) == Integer.toString(producto.getId())){
                    detalles.setSubtotal(Integer.parseInt(cantidades.get(i)) * producto.getPrecio());
                    informacionDespacho = "Producto: "+ producto.getNombre() + ", Cantidad: "+ cantidades.get(i) +"";
                }
            }
            restTemplate.postForObject()
            facturaProductoService.crearFacturaProducto(detalles);
        }


        HttpHeaders headers2 = new HttpHeaders();
        headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
        HttpEntity<String> entity2 = new HttpEntity<String>(headers2);
        List<Usuario> usuariosAlmacen = restTemplate.exchange("http://localhost:8080/usuarios/usuariosalmacen",
                HttpMethod.GET, null,
                new ParameterizedTypeReference<List<Usuario>>() {
                }).getBody();


        for (Usuario usuario : usuariosAlmacen){

            String API_KEY = "eca1ad61d12248452578b2c4f1eda5963d6d94b5";
            Client client = new Client(API_KEY);
            try{
                client.sendMessage(
                        "20120994@ce.pumm.edu.do",
                        usuario.getEmail(),
                        "Despacho de Mercancia",
                        informacionDespacho,
                        "<b>Hola Mundo desde SparkPost</b>");
            }
            catch (SparkPostException s){
                System.out.println("ERROR");
            }
        }

        return "redirect:/compras/";
    }


    @PostMapping(value = "/entrega/{id}")
    public String entrega(@PathVariable("id") String id){

        ClienteProducto a = clienteEquipoService.buscarPorId(Long.parseLong(id));
        a.setEstado("Completado");
        clienteEquipoService.actualizarClienteEquipo(a);
        return "redirect:/compras/";
    }

    @GetMapping(value = "/entregado/{id}")
    public String entregado(Model model, @PathVariable("id") String id){
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        UserDetails userDetails = (UserDetails) auth.getPrincipal();
        String usuario = userDetails.getUsername();
        model.addAttribute("usuario",usuario);
        Factura factura = facturaService.buscarPorId(Long.parseLong(id));
        model.addAttribute("factura",factura);
        return "compra";
    }

    @RequestMapping(value = "/total", method = RequestMethod.GET)
    public String TotalPedidos(){
        String body = restTemplate.exchange("http://localhost:8081/compras/total",
                HttpMethod.GET, null,
                new ParameterizedTypeReference<String>() {
                }).getBody();

        System.out.println(body);
        return body;

    }


}
