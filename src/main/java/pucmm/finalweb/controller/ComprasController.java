package pucmm.finalweb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pucmm.finalweb.model.Cliente;
import pucmm.finalweb.model.ClienteProducto;
import pucmm.finalweb.model.Producto;
import pucmm.finalweb.service.ClienteEquipoServiceImpl;
import pucmm.finalweb.service.ClienteServiceImpl;
import pucmm.finalweb.service.ProductoServiceImpl;

import java.util.ArrayList;
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

    @GetMapping(value = "/")
    public String alquileres(Model model)
    {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        UserDetails userDetails = (UserDetails) auth.getPrincipal();
        String usuario = userDetails.getUsername();
        model.addAttribute("usuario",usuario);
        List<Producto> productos = new ArrayList<>();

        List<ClienteProducto> alquileres = new ArrayList<>();
        List<Cliente> clientes = new ArrayList<>();
        productos = equipoService.buscarTodosEquipos();
        alquileres = clienteEquipoService.buscarTodosClientesEquipos();
        clientes = clienteService.buscarTodosClientes();
        model.addAttribute("clientes", clientes);
        model.addAttribute("equipos", productos);
        model.addAttribute("alquileres",alquileres);
        return "compras";

    }

    @PostMapping(value = "/despacho/")
    public String despacho(@RequestParam("client") String idcliente, @RequestParam("cant[]") List<String> cantidades, @RequestParam("ids[]") List<String> ids, @RequestParam("fecha") String fecha, @RequestParam("fechaentrega") String fechapromesa){

        Cliente c = clienteService.buscarPorId(Long.parseLong(idcliente));
        for(int i=0;i< ids.size();i++) {
            System.out.println(ids.get(i));
            ClienteProducto a = new ClienteProducto();


            Producto e = equipoService.buscarPorId(Long.parseLong(ids.get(i)));
            a.setEstado("Pendiente");



            a.setProducto(e);
            a.setCliente(c);


            clienteEquipoService.crearClienteEquipo(a);

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
        ClienteProducto alquiler = clienteEquipoService.buscarPorId(Long.parseLong(id));
        model.addAttribute("alquiler",alquiler);
        return "compra";
    }


}
