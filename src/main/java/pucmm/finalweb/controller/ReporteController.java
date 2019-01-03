package pucmm.finalweb.controller;

import org.jxls.common.Context;
import org.jxls.util.JxlsHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import pucmm.finalweb.model.FacturaProducto;
import pucmm.finalweb.service.FacturaProductoServiceImpl;
import sun.misc.Request;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

@Controller
@RequestMapping("/reportes")
public class ReporteController {

    @Autowired
    FacturaProductoServiceImpl facturaProductoService;
    @RequestMapping("/")
    public void elaborarReporte(){

        List<FacturaProducto> pedidos = facturaProductoService.buscarTodasFacturaEquipos();
        try {
            try(InputStream is = FacturaProducto.class.getResourceAsStream("object_collection_template.xls")) {
                try (OutputStream os = new FileOutputStream("target/object_collection_output.xls")) {
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
