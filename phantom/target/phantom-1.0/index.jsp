<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Smart Socket</title>
        <link  href="socket.jpg" rel="shortcut icon"/>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;lang=en">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.cyan-light_blue.min.css">
        <link rel="stylesheet" href="//cdn.materialdesignicons.com/1.9.32/css/materialdesignicons.min.css">
        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    </head>
    <body style="background-color: black;color: white">
        <div class="container">
            <div class="row">
                <div class="col-md-10">
                    <center><h3>Smart Socket Testing System</h3></center>
                </div>
                <div class="col-md-2">
                    <img src="armazenando.gif" width="100%"/>
                </div>
            </div>
            <div class="row">
                <div class="col-md-5">
                    <img style="width: 100%;"src="phantom.png" alt=""/>
                </div>
                <div class="col-md-7">
                    <center>
                        <h5>(To start, enter the hardware IP and the PORT)</h5>
                        <h6>For example, IP: 192.168.0.55 (Add the points), and Port: 1000</h6>
                        <form method="post" action="test">

                            <input name="ip" value="${ip}" type="text"style="width:110px;font-size: 13px;color: windowtext" maxlength="15" placeholder="Hardware IP" required>
                            <input name="port" value="${port}" type="text" style="width:40px;font-size: 13px;color: windowtext" maxlength="4" placeholder="Port">
                            <input name="id" value="${id}" type="text" style="width:40px;font-size: 13px;color: windowtext" maxlength="4" placeholder="ID">
                            <input value="Start" type="submit" style="color: windowtext">
                        </form>
                    </center>
                </div>
            </div>
                            
            <c:if test="${not empty erro }">
                <br><br>
                <div class="alert alert-danger" style="padding: 5px;border: 0px solid transparent;text-align: center;margin-bottom: 0px;">
                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                     ${erro}
                </div>
            </c:if>
        </div>

        <p style="bottom: 0px;position: absolute;padding-left: 70%;"> By Diovane Soligo </p>
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="https://code.getmdl.io/1.3.0/material.min.js"></script>
    </body>
</html>
