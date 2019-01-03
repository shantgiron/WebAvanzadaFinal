package pucmm.finalweb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import pucmm.finalweb.model.Producto;
import pucmm.finalweb.service.ClienteEquipoServiceImpl;
import pucmm.finalweb.service.ProductoServiceImpl;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/equipos")
public class ProductosController {

    private static String UPLOADED_FOLDER = "C://Users//EmilioFerreiras//Desktop//";


    @Autowired
    private ProductoServiceImpl equipoService;



    @Autowired
    private ClienteEquipoServiceImpl clienteEquipoService;

    @GetMapping("/")
    public String equipos(Model model)
    {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        UserDetails userDetails = (UserDetails) auth.getPrincipal();
        String usuario = userDetails.getUsername();
        model.addAttribute("usuario",usuario);
        List<Producto> productos = new ArrayList<>();
        productos = equipoService.buscarTodosEquipos();



        model.addAttribute("equipos", productos);
        return "equipos";
    }

    @PostMapping("/")
    public String crearEquipo(@RequestParam("foto") MultipartFile foto, @RequestParam("nombre") String nombre, @RequestParam("precio") String precio, @RequestParam("existencia") String existencia,
                              @RequestParam("categoria") String categoria, @RequestParam("subfamilia") String subfamilia,
                              RedirectAttributes redirectAttributes) {



        Producto producto = new Producto();

        try {

            // Get the file and save it somewhere
            byte[] bytes = foto.getBytes();
            producto.setImagen(bytes);
            Path path = Paths.get(UPLOADED_FOLDER + foto.getOriginalFilename());
            Files.write(path, bytes);

            redirectAttributes.addFlashAttribute("message",
                    "You successfully uploaded '" + foto.getOriginalFilename() + "'");

        } catch (IOException e) {
            e.printStackTrace();
        }

        producto.setNombre(nombre);
        producto.setPrecio(Float.parseFloat(precio));
        producto.setStock(Integer.parseInt(existencia));
        System.out.println(categoria);

        equipoService.crearEquipo(producto);
        return "redirect:/equipos/";
    }

    @RequestMapping(value = "/ver/{id}", method = RequestMethod.GET)
    public String ver(Model model, @PathVariable String id)
    {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        UserDetails userDetails = (UserDetails) auth.getPrincipal();
        String usuario = userDetails.getUsername();
        model.addAttribute("usuario",usuario);
        Producto producto = equipoService.buscarPorId(Long.parseLong(id));

        model.addAttribute("equipo", producto);
        return "verproducto";
    }

    @PostMapping("/modificar/")
    public String modificarEquipo(@RequestParam("nombre2") String nombre, @RequestParam("id2") String id,@RequestParam("precio2") String precio,
                               @RequestParam("existencia2") String existencia, @RequestParam("categoria2") String categoria,
                               @RequestParam("foto2") MultipartFile foto,  RedirectAttributes redirectAttributes){

        Producto producto = equipoService.buscarPorId(Long.parseLong(id));
        producto.setNombre(nombre);
        producto.setPrecio(Float.parseFloat(precio));
        producto.setStock(Integer.parseInt(existencia));

        try {

            // Get the file and save it somewhere
            byte[] bytes = foto.getBytes();
            producto.setImagen(bytes);
            Path path = Paths.get(UPLOADED_FOLDER + foto.getOriginalFilename());
            Files.write(path, bytes);

            redirectAttributes.addFlashAttribute("message",
                    "You successfully uploaded '" + foto.getOriginalFilename() + "'");

        } catch (IOException e) {
            e.printStackTrace();
        }
        equipoService.actualizarEquipo(producto);
        return "redirect:/equipos/";
    }


    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String borrarEquipo(@PathVariable String id) {

        Producto producto = equipoService.buscarPorId(Long.parseLong(id));
        equipoService.borrarEquipoPorId(producto);
        return "redirect:/equipos/";

    }


    @RequestMapping(value = "/nodevueltos/", method = RequestMethod.GET)
    public String listadonodevueltos(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        UserDetails userDetails = (UserDetails) auth.getPrincipal();
        String usuario = userDetails.getUsername();
        model.addAttribute("usuario",usuario);

        List<Object[]> nodevueltos = clienteEquipoService.equiposAlquiladosNoDevueltos();
        model.addAttribute("objetos",nodevueltos);
        return "nodevueltos";

    }


}
