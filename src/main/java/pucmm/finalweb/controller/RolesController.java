package pucmm.finalweb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;
import pucmm.finalweb.model.Rol;
import pucmm.finalweb.service.RolServiceImpl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping("/roles")
public class RolesController {

    @Autowired
    private RolServiceImpl rolService;


    @Autowired
    RestTemplate restTemplate;

    @GetMapping(value="/")
    public String roles(Model model)
    {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        UserDetails userDetails = (UserDetails) auth.getPrincipal();
        String usuario = userDetails.getUsername();
        model.addAttribute("usuario",usuario);
        List<Rol> roles = Arrays.asList(restTemplate.getForObject("http://localhost:8083/roles/todos", Rol[].class));

        model.addAttribute("roles", roles);
        return "roles";
    }



}
