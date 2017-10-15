<%-- 
    Document   : home
    Created on : 12/10/2017, 16:08:24
    Author     : DioS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<c:if test="${not empty ok }">
    <script>alert("${ok}")</script>
</c:if>

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
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
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
            <hr>
            <div class="row">
                <div class="col-md-2">

                </div>
                <div class="col-md-3">
                    <input id="ligar" value="(Status) Turn on" type="button" onclick="ligar()" style="color: windowtext;">
                    <input id="desligar" value="(Status) Turn off" type="button" onclick="desligar()" style="color: windowtext;">
                </div>
                <div class="col-md-1">

                </div>
                <div class="col-md-2">
                    <input value="Collect data" type="button" onclick="Coletar()" style="color: windowtext">
                </div>
                <div class="col-md-2">

                </div>
                <div class="col-md-2">
                    <form method="post" action="post_menu">
                        <input value="Get out" type="submit" name="com" style="color: windowtext">
                    </form>
                </div>
            </div>
            <hr>
            <div class="row">
                <div class="col-md-4">
                    Info : ( <spam id="info">Please wait ...</spam> )
                    <br>
                    Connection : ( <spam id="connection">Please wait ...</spam> )
                    <br>
                    Status: ( <spam id="status">Please wait...</spam> )

                </div>
                <div class="col-md-3">
                    Ip: ${ip}
                    <br>
                    Port: ${port}
                    <br>
                    ID: ${id}
                    <br>
                    Collect data : ( <spam id="coletaDado">--</spam> ) 
                </div>
                <div class="col-md-5" style="background-color: white;color: black;width: 40%; height: 60px; overflow-y: scroll;">
                    < PostgreSQL >
                    <br>
                    Collect data: <span id="log" style="text-align: center;font-size: 12px"> >_ (starting...)</span>
                </div>
            </div>
            <hr>
            <div class="row">
                <div class="col-md-2">
                    Temperature: <spam id="temperature">...</spam> ºC
                    <div id="T" style="width: 400px; height: 120px;"></div>
                </div>
                <div class="col-md-2">
                    Humidity: <spam id="humidity">...</spam> %
                    <div id="U" style="width: 400px; height: 120px;"></div>
                </div>
                <div class="col-md-2">

                </div>
                <div class="col-md-2">
                    Voltage: <spam id="voltage">...</spam> V
                    <div id="V" style="width: 400px; height: 120px;"></div>
                </div>
                <div class="col-md-2">
                    Current: <spam id="current">...</spam> A
                    <div id="A" style="width: 400px; height: 120px;"></div>
                </div>
                <div class="col-md-2">
                    Power rating: <spam id="power">...</spam> W
                    <div id="P" style="width: 400px; height: 120px;"></div>
                </div>
            </div>
            <hr>
        </div>
        <p style="bottom: 0px;position: absolute;padding-left: 70%;"> By Diovane Soligo </p>
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="https://code.getmdl.io/1.3.0/material.min.js"></script>
    </body>

</html>
<script>
                        /**************VARIAVEIS DE USO GLOBAL**********************/
                        var c = 0.0;
                        var p = 0.0;
                        var v = 0;
                        var t = 0;
                        var u = 0;
                        var s = "";
                        var coleta = false;
                        /******************FUNÇÃO LIGAR TOMADA*********************/

                        function Coletar() {
                            if (coleta) {
                                coleta = false;
                                document.getElementById("log").innerHTML = '>_ stoping ...';
                                sleep(2000);
                            } else {
                                document.getElementById("log").innerHTML = '>_ starting ...';
                                sleep(2000);
                                coleta = true;
                            }
                        }


                        function ligar() {
                            //ligar tomada
                            $.ajax({
                                url: 'http://${ip}:${port}/ligar',
                                dataType: 'text',
                                crossDomain: true,
                                jsonp: false,
                                success: function (data) {
                                    document.getElementById("ligar").style.display = 'none';
                                    document.getElementById("desligar").style.display = 'block';
                                },
                                error: function (err) {
                                    document.getElementById("desligar").style.display = 'none';
                                    document.getElementById("ligar").style.display = 'block';
                                }
                            });
                        }
                        /******************FUNÇÃO DESLIGAR TOMADA******************/
                        function desligar() {
                            //ligar tomada
                            $.ajax({
                                url: 'http://${ip}:${port}/desligar',
                                dataType: 'text',
                                crossDomain: true,
                                jsonp: false,
                                success: function (data) {
                                    document.getElementById("ligar").style.display = 'block';
                                    document.getElementById("desligar").style.display = 'none';
                                },
                                error: function (err) {
                                    document.getElementById("desligar").style.display = 'block';
                                    document.getElementById("ligar").style.display = 'none';
                                }
                            });

                        }
                        /******************FUNÇÃO ATUALIZA DADOS DA TOMADA*********************/
                        $(document).ready(function () {

                            function app() {

                                if (coleta) {
                                    document.getElementById("coletaDado").innerHTML = 'ON';
                                    Collect();
                                } else {
                                    document.getElementById("log").innerHTML = '>_ (OFF)';
                                    document.getElementById("coletaDado").innerHTML = 'OFF';
                                }

                                //Atualiza temperatura
                                $.ajax({
                                    url: 'http://${ip}:${port}/temperatura',
                                    dataType: 'text',
                                    crossDomain: true,
                                    jsonp: false,
                                    success: function (data) {
                                        document.getElementById("temperature").innerHTML = data;
                                        document.getElementById("connection").innerHTML = 'Connected';
                                        document.getElementById('connection').style.color = '#FFFF00';
                                        t = data;
                                    },
                                    error: function (err) {
                                        document.getElementById("temperature").innerHTML = 'null';
                                        t = 0;
                                    }
                                });


                                //Atualiza umidade
                                $.ajax({
                                    url: 'http://${ip}:${port}/umidade',
                                    dataType: 'text',
                                    crossDomain: true,
                                    jsonp: false,
                                    success: function (data) {
                                        document.getElementById("humidity").innerHTML = data;
                                        u = data;
                                    },
                                    error: function (err) {
                                        document.getElementById("humidity").innerHTML = 'null';
                                        u = 0;
                                    }
                                });

                                //Atualiza status
                                $.ajax({
                                    url: 'http://${ip}:${port}/status',
                                    dataType: 'text',
                                    crossDomain: true,
                                    jsonp: false,
                                    success: function (data) {
                                        document.getElementById("status").innerHTML = data;
                                        document.getElementById("info").innerHTML = 'OK 200';
                                        document.getElementById('info').style.color = '#FFFF00';
                                        s = data;
                                    },
                                    error: function (err) {
                                        document.getElementById("status").innerHTML = 'null';
                                        document.getElementById("connection").innerHTML = 'Disconnected or not responding!';
                                        document.getElementById("info").innerHTML = 'ERRO 404';
                                        document.getElementById('info').style.color = 'red';
                                        document.getElementById('connection').style.color = 'red';
                                        s = "null";
                                    }
                                });

                                //Atualiza voltagem
                                $.ajax({
                                    url: 'http://${ip}:${port}/voltagem',
                                    dataType: 'text',
                                    crossDomain: true,
                                    jsonp: false,
                                    success: function (data) {
                                        document.getElementById("voltage").innerHTML = data;
                                        v = data;
                                    },
                                    error: function (err) {
                                        document.getElementById("voltage").innerHTML = 'null';
                                        v = 0;
                                    }
                                });

                                //Atualiza corrente
                                $.ajax({
                                    url: 'http://${ip}:${port}/corrente',
                                    dataType: 'text',
                                    crossDomain: true,
                                    jsonp: false,
                                    success: function (data) {
                                        document.getElementById("current").innerHTML = data;
                                        c = data;
                                    },
                                    error: function (err) {
                                        document.getElementById("current").innerHTML = 'null';
                                        c = 0;
                                    }
                                });

                                //Atualiza potencia
                                $.ajax({
                                    url: 'http://${ip}:${port}/potencia',
                                    dataType: 'text',
                                    crossDomain: true,
                                    jsonp: false,
                                    success: function (data) {
                                        document.getElementById("power").innerHTML = data;
                                        p = data;
                                    },
                                    error: function (err) {
                                        document.getElementById("power").innerHTML = 'null';
                                        p = 0;
                                    }
                                });

                                return false;
                            }

                            setInterval(app, 5000);

                        });
                        /******************FUNÇÕES RELÓGIOS********************/
                        google.charts.load('current', {'packages': ['gauge']});
                        google.charts.setOnLoadCallback(current);
                        google.charts.setOnLoadCallback(pot);
                        google.charts.setOnLoadCallback(volt);
                        google.charts.setOnLoadCallback(umidade);
                        google.charts.setOnLoadCallback(temperatura);

                        function current() {

                            var data = google.visualization.arrayToDataTable([
                                ['Label', 'Value'],
                                ['Current', 0.0]
                            ]);

                            var options = {
                                width: 400, height: 120,
                                redFrom: 12, redTo: 15,
                                yellowFrom: 8, yellowTo: 12,
                                greenFrom: 0, greenTo: 8,
                                minorTicks: 10,
                                max: 15
                            };

                            var chart = new google.visualization.Gauge(document.getElementById('A'));

                            chart.draw(data, options);

                            setInterval(function () {
                                data.setValue(0, 1, c);
                                chart.draw(data, options);
                            }, 500);
                        }

                        function pot() {

                            var data = google.visualization.arrayToDataTable([
                                ['Label', 'Value'],
                                ['Power', 0.0]
                            ]);

                            var options = {
                                width: 400, height: 120,
                                redFrom: 2100, redTo: 2500,
                                yellowFrom: 1800, yellowTo: 2100,
                                greenFrom: 0, greenTo: 1800,
                                minorTicks: 10,
                                max: 2500
                            };

                            var chart = new google.visualization.Gauge(document.getElementById('P'));

                            chart.draw(data, options);

                            setInterval(function () {
                                data.setValue(0, 1, p);
                                chart.draw(data, options);
                            }, 500);
                        }

                        function volt() {

                            var data = google.visualization.arrayToDataTable([
                                ['Label', 'Value'],
                                ['Voltage', 0.0]
                            ]);

                            var options = {
                                width: 400, height: 120,
                                redFrom: 235, redTo: 250,
                                yellowFrom: 225, yellowTo: 235,
                                greenFrom: 200, greenTo: 225,
                                minorTicks: 10,
                                max: 250, min: 180
                            };

                            var chart = new google.visualization.Gauge(document.getElementById('V'));

                            chart.draw(data, options);

                            setInterval(function () {
                                data.setValue(0, 1, v);
                                chart.draw(data, options);
                            }, 500);
                        }

                        function umidade() {

                            var data = google.visualization.arrayToDataTable([
                                ['Label', 'Value'],
                                ['Umidity', 0.0]
                            ]);

                            var options = {
                                width: 400, height: 120,
                                redFrom: 0, redTo: 30,
                                yellowFrom: 30, yellowTo: 40,
                                greenFrom: 40, greenTo: 70,
                                minorTicks: 10,
                                max: 100
                            };

                            var chart = new google.visualization.Gauge(document.getElementById('U'));

                            chart.draw(data, options);

                            setInterval(function () {
                                data.setValue(0, 1, u);
                                chart.draw(data, options);
                            }, 500);
                        }

                        function temperatura() {

                            var data = google.visualization.arrayToDataTable([
                                ['Label', 'Value'],
                                ['Temperature', 0.0]
                            ]);

                            var options = {
                                width: 400, height: 120,
                                redFrom: 40, redTo: 50,
                                yellowFrom: 27, yellowTo: 40,
                                greenFrom: 21, greenTo: 27,
                                minorTicks: 10,
                                max: 50
                            };

                            var chart = new google.visualization.Gauge(document.getElementById('T'));

                            chart.draw(data, options);

                            setInterval(function () {
                                data.setValue(0, 1, t);
                                chart.draw(data, options);
                            }, 500);
                        }

                        /******************FUNÇÕES ARMAZENA DADOS NO POSTGRES COM JAVA*********************/

                        /*Função para enviar requisições HTTP*/
                        function initXHR() {
                            /*criando xhr de acordo com o browser*/
                            if (window.XMLHttpRequest) { // Nao microsoft
                                xhr = new XMLHttpRequest();
                            } else if (window.ActiveXObject) {
                                xhr = new ActiveXObject("Microsoft.XMLHttp");
                            }
                        }
                        /*Este codigo e o initXHR sempre serão os mesmo. Não há necessidade de criar outro*/
                        function sendRequest(url, handler) {
                            document.getElementById("log").innerHTML = '>_ sending data to the database ...';
                            initXHR();
                            /*setando método de resposta no xhr*/
                            xhr.onreadystatechange = handler;
                            /*abrindo requisição*/
                            xhr.open("GET", url, true);
                            /*executando xhr*/
                            xhr.send(null);
                        }
                        /*Função será executada ao Clicar no botão Salvar. A função pega os valores digitados e envia para Servlet*/
                        function Collect() {
                            /*Variável que passará os valores via Ajax para o servlet*/
                            var url = "collect?t=" + document.getElementById("temperature").innerHTML + "&u=" + document.getElementById("humidity").innerHTML + "&v=" + document.getElementById("voltage").innerHTML + "&c=" + document.getElementById("current").innerHTML + "&p=" + document.getElementById("power").innerHTML + "&s=" + document.getElementById("status").innerHTML + "&id=${id}" ;
                            /*Envia a varivável e chama proxima função para verificar a resposta do Servlet*/
                            sendRequest(url, ajaxCadastro);
                        }
                        /*Retorno do Servlet indicando se está tudo Ok.*/
                        function ajaxCadastro() {
                            if (xhr.readyState == 4) { // requisicao concluida
                                /*status da resposta 200 = OK, (404 página não encontrada, 500 erro no servidor)*/
                                if (xhr.status == 200) {
                                    document.getElementById("log").innerHTML = '>_ data stored successfully';
                                    
                                } else {
                                    document.getElementById("log").innerHTML = '>_ data stored error';
                                }
                            }
                        }

                        function sleep(milliseconds) {
                            var start = new Date().getTime();
                            for (var i = 0; i < 1e7; i++) {
                                if ((new Date().getTime() - start) > milliseconds) {
                                    break;
                                }
                            }
                        }

</script>
