package pucmm.finalweb.controller;

import org.jxls.common.Context;
import org.jxls.util.JxlsHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.client.RestTemplate;
import pucmm.finalweb.model.Factura;
import pucmm.finalweb.model.FacturaProducto;
import pucmm.finalweb.service.FacturaProductoServiceImpl;
import pucmm.finalweb.service.FacturaServiceImpl;
import sun.misc.Request;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping("/reportes")
public class ReporteController {



    @Autowired
    RestTemplate restTemplate;

    @RequestMapping("/")
    public void elaborarReporte(){

        List<Factura> pedidos = Arrays.asList(restTemplate.getForObject("http://localhost:8081/compras/todos", Factura[].class));
        String userHomeFolder = System.getProperty("user.home");

        try {
            try(InputStream is = Files.newInputStream(Paths.get("object_collection_template.xlsx"))) {
                try (OutputStream os = new FileOutputStream(userHomeFolder+"/Desktop/pedidos.xls")) {
                    Context context = new Context();
                    context.putVar("pedidos", pedidos);
                    JxlsHelper.getInstance().processTemplate(is, os, context);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
