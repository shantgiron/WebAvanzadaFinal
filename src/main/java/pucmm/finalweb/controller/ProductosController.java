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
import pucmm.finalweb.model.Producto;
import pucmm.finalweb.model.Rol;
import pucmm.finalweb.service.ProductoServiceImpl;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping("/productos")
public class ProductosController {

    private static String UPLOADED_FOLDER =   System.getProperty("user.home")+"/Desktop/";


    @Autowired
    private ProductoServiceImpl equipoService;


    @Autowired
    RestTemplate restTemplate;




    @GetMapping("/")
    public String equipos(Model model)
    {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        UserDetails userDetails = (UserDetails) auth.getPrincipal();
        String usuario = userDetails.getUsername();
        model.addAttribute("usuario",usuario);

        List<Producto> productos = Arrays.asList(restTemplate.getForObject("http://localhost:8082/productos/todos", Producto[].class));


        model.addAttribute("productos", productos);
        return "productos";
    }




}
