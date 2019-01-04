package pucmm.finalweb.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import pucmm.finalweb.model.Cliente;
import pucmm.finalweb.model.Usuario;
import pucmm.finalweb.service.ClienteServiceImpl;
import pucmm.finalweb.service.UsuarioServiceImpl;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.*;

@Controller
@RequestMapping("/clientes")
public class ClienteController {



    @Autowired
    private ClienteServiceImpl clienteService;


    @Autowired
    private UsuarioServiceImpl usuarioService;



    @Autowired
    RestTemplate restTemplate;

    @RequestMapping(value = "/")
    public String clientes(Model model)
    {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        UserDetails userDetails = (UserDetails) auth.getPrincipal();
        String usuario = userDetails.getUsername();
        model.addAttribute("usuario",usuario);
        List<Cliente> clientes = Arrays.asList(restTemplate.getForObject("http://localhost:8083/clientes/todos", Cliente[].class));
        List<Usuario> usuarios = Arrays.asList(restTemplate.getForObject("http://localhost:8083/usuarios/todos", Usuario[].class));

        model.addAttribute("clientes",clientes);

        model.addAttribute("usuarios",usuarios);
        return "clientes";
    }


    @PostMapping(value = "/crear/")
    public String crearCliente(@RequestParam("nombre") String nombre, @RequestParam("direccion") String direccion, @RequestParam("email") String email,
                               @RequestParam("username") String username, RedirectAttributes redirectAttributes) {

        Cliente cliente = new Cliente();


        cliente.setNombre(nombre);
        cliente.setDireccion(direccion);
        cliente.setEmail(email);
        cliente.setUsuario(usuarioService.findByUsername(username));


        clienteService.crearCliente(cliente);
        return "redirect:/clientes/";
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String borrarCliente(@PathVariable String id) {
        Cliente cliente = clienteService.buscarPorId(Long.parseLong(id));
        clienteService.borrarClientePorId(cliente);
        return "redirect:/clientes/";

    }

    @PostMapping("/modificar/")
    public String modificarCliente(@RequestParam("nombre2") String nombre, @RequestParam("id2") String id,@RequestParam("email2") String email,
                               @RequestParam("username2") String username, @RequestParam("direccion2") String direccion,   RedirectAttributes redirectAttributes){

        Cliente cliente = clienteService.buscarPorId(Long.parseLong(id));
        cliente.setNombre(nombre);
        cliente.setEmail(email);
        cliente.setDireccion(direccion);
        cliente.setUsuario(usuarioService.findByUsername(username));
         clienteService.actualizarCliente(cliente);
        return "redirect:/clientes/";
    }



}
