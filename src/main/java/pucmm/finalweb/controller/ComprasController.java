package pucmm.finalweb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpMethod;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;
import pucmm.finalweb.model.*;
import pucmm.finalweb.service.*;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping("/compras")
public class ComprasController {


    @Autowired
    private FacturaProductoServiceImpl compraService;


    @Autowired
    private ClienteServiceImpl clienteService;


    @Autowired
    private ProductoServiceImpl productoService;

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
                        "http://localhost:8082/productos/todos",
                        Producto[].class)
        );

        List<Cliente> clientes = Arrays.asList(
                restTemplate.getForObject(
                        "http://localhost:8083/clientes/todos",
                        Cliente[].class));

        List<Factura> compras = Arrays.asList(
                restTemplate.getForObject(
                        "http://localhost:8081/compras/todos",
                        Factura[].class));


        model.addAttribute("clientes", clientes);
        model.addAttribute("productos", productos);
        model.addAttribute("alquileres",compras);
        return "compras";

    }

    @PostMapping(value = "/despacho/")
    public String despacho(@RequestParam("client") String idcliente, @RequestParam("cant[]") List<String> cantidades, @RequestParam("ids[]") List<String> ids, @RequestParam("fecha") String fecha, @RequestParam("fechaentrega") String fechapromesa){

        Cliente c =  restTemplate.getForObject("http://localhost:8083/cliente/"+idcliente, Cliente.class);

        for(int i=0;i< ids.size();i++) {

            FacturaProducto a = new FacturaProducto();


            Producto p = restTemplate.getForObject("http://localhost:8082/producto/"+ids.get(i), Producto.class);
            a.getFactura().setCondicion("Pendiente");



            a.setProducto(p);
            a.getFactura().setCliente(c);


            restTemplate.postForObject("http://localhost:8081/compras/despachar", a, FacturaProducto.class);

        }



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




}
