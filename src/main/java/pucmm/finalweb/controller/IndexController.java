package pucmm.finalweb.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpMethod;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;
import pucmm.finalweb.model.Cliente;
import pucmm.finalweb.model.Rol;
import pucmm.finalweb.model.Usuario;
import pucmm.finalweb.service.ClienteEquipoServiceImpl;
import pucmm.finalweb.service.RolServiceImpl;
import pucmm.finalweb.service.UsuarioServiceImpl;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

@Controller
public class IndexController {

    @Autowired
    private ClienteEquipoServiceImpl clienteEquipoService;

    @Autowired
    private UsuarioServiceImpl usuarioService;
    @Autowired
    private RolServiceImpl rolService;

    @Autowired
    private MessageSource messageSource;

    @Autowired
    RestTemplate restTemplate;

    @RequestMapping(value = "/")
    public String index(Model model, Locale locale, HttpServletRequest request) {

        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        UserDetails userDetails = (UserDetails) auth.getPrincipal();
        String usuario = userDetails.getUsername();
        model.addAttribute("usuario",usuario);
        return "index";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loginGET(Model model) {

        if (usuarioService.buscarTodosUsuarios().size() == 0) {
            Set<Rol> roles = new HashSet<>();
            Rol rol = new Rol();
            rol.setNombreRol("ADMIN");
            rolService.crearRol(rol);
            Rol rol2 = new Rol();
            rol2.setNombreRol("Vendedor");
            rolService.crearRol(rol2);
            Usuario u = new Usuario();
            Cliente c = new Cliente();
            c.setNombre("Administrador");
            c.setDireccion("C/5 Algun lugar");
            c.setEmail("ricardojoserosario1431@gmail.com");
            u.setEmail("ricardojoserosario1431@gmail.com");
            u.setPassword("admin");
            u.setUsername("admin");
            u.setRol(rol);
            u.setCliente(c);
            usuarioService.crearUsuario(u);


        }
        return "login";
    }


    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String loginPOST(
            @RequestParam(value = "username", required = false) String username,
            @RequestParam(value = "password", required = false) String password
    ) {
        usuarioService.autoLogin(username, password);

        return "redirect:/";
    }




    }







