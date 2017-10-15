/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.phantom;

import br.conectaBD.Conexao;
import br.dao.Armazena;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author DioS
 */
@Controller
public class Principal {

    @RequestMapping(value = "/test", method = RequestMethod.POST)
    public ModelAndView home(String ip, String port,String id) throws IOException {

        /**
         * Se a porta veio vazia coloca como padrão a porta 80
         */
        if (port.equals("")) {
            port = "80";
        }

        ModelAndView mv = null;

        /**
         * Conetca e traz o retorno
         */
        Conecta conecta = new Conecta();
        String retorno = conecta.getConecta(ip, port, "hello");

        if (retorno.equals("OKDSV2ENCPH@NTOM")) {
            mv = new ModelAndView("sistema/home");
            mv.addObject("ok", ">> Hardware connected successfully <<");
            mv.addObject("ip", ip);
            mv.addObject("port", port);
            mv.addObject("id", id);
            System.out.println("OK");
        } else {
            mv = new ModelAndView("../../index");
            mv.addObject("erro", "<h5>Could not connect! Verify that the hardware is connected to the network with the ip " + ip + " and port " + port + "</h5>");
            mv.addObject("ip", ip);
            mv.addObject("port", port);
            mv.addObject("id", id);
            System.out.println("ERRO");
        }

        return mv;
    }

    @RequestMapping(value = "/post_menu", method = RequestMethod.POST)
    public ModelAndView menu(String com) throws IOException {

        ModelAndView mv = null;

        if (com.equals("Get out")) {
            mv = new ModelAndView("../../index");
        }

        return mv;
    }

    //Classe insere dados no banco
    @RequestMapping(value = "/collect", method = RequestMethod.GET)
    public ModelAndView cadastraDados(
            String t,
            String u,
            String v,
            String c,
            String p,
            String s,
            String id
    ) throws IOException, SQLException {
        System.out.println("Temperatura: " + t);
        System.out.println("Umidade: " + u);
        System.out.println("Voltagem: " + v);
        System.out.println("Corrente: " + c);
        System.out.println("Potencia: " + p);
        System.out.println("Status: " + s);
        System.out.println("Id: " + id);
        Date dat = new Date();
        /** Armazenar cada dado em sua tabela*/
        String data = dat.toString();
        System.out.println("data: " + data);
        
        Connection conn = null;
        conn = Conexao.getConexao();
        
        Armazena.aramzenaDado(id,t,data,"temperatura",conn);
        Armazena.aramzenaDado(id,u,data,"umidade",conn);
        Armazena.aramzenaDado(id,v,data,"voltagem",conn);
        Armazena.aramzenaDado(id,c,data,"corrente",conn);
        Armazena.aramzenaDado(id,p,data,"potencia",conn);
        Armazena.aramzenaDado(id,s,data,"status",conn);
        
        conn.close();
        
        System.out.println("**********************************");    
        ModelAndView mv = null;

        mv = new ModelAndView("../../index");

        return mv;
    }

}
