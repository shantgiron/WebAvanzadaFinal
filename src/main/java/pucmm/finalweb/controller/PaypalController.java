package pucmm.finalweb.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/pagos")
public class PaypalController {

    @RequestMapping("/completar")
    public String pagoRealizado(Model model){
        return "pagocompletado";
    }


    @RequestMapping("/realizar/")
    public String efectuarPago(Model model){

        return "payments";
    }



}
