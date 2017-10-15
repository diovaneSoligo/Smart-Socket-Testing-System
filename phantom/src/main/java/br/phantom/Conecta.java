/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.phantom;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;

/**
 *
 * @author DioS
 */
public class Conecta {

    String getConecta(String ip, String port, String comando) {
        String retorno = "";

        if (!ip.equals("")) {
            try {
                URL url = new URL("http://" + ip + ":" + port + "/" + comando);
                URLConnection connection = url.openConnection();

                BufferedReader in = new BufferedReader(
                        new InputStreamReader(
                                connection.getInputStream()));

                String inputLine;
                StringBuffer sb = new StringBuffer();

                while ((inputLine = in.readLine()) != null) {
                    sb.append(inputLine);
                }

                if (!sb.toString().equals("")) {
                    retorno = sb.toString();
                }
                System.out.println("--> " + retorno);
                in.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        return retorno;
    }

}
