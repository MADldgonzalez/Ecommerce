<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Main.aspx.vb" Inherits="Ecommerce.Main" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta http-equiv="cache-control" content="no-cache" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <script type="text/javascript" src="https://kendo.cdn.telerik.com/2018.1.221/js/jquery.min.js"></script>
    <script type="text/javascript" src="https://kendo.cdn.telerik.com/2018.1.221/js/kendo.all.min.js"></script>
    <script type="text/javascript" src="https://apps.madisa.com/jslib/kendo/2015.2.92/kendo/js/kendo.all.min.js"></script>
    <script type="text/javascript" src="../scripts/Function.js"></script>
    <script type="text/javascript" src="../scripts/AdministradorDataNT.js"></script>
    <script type="text/javascript" src="../scripts/AdministradorDataT.js"></script>
    <link rel="stylesheet" href="https://kendo.cdn.telerik.com/2015.2.805/styles/kendo.common.min.css" />
    <link rel="stylesheet" href="https://kendo.cdn.telerik.com/2015.2.805/styles/kendo.rtl.min.css" />
    <link rel="stylesheet" href="https://kendo.cdn.telerik.com/2015.2.805/styles/kendo.default.min.css" />
    <link rel="stylesheet" href="https://kendo.cdn.telerik.com/2015.2.805/styles/kendo.dataviz.min.css" />
    <link rel="stylesheet" href="https://kendo.cdn.telerik.com/2015.2.805/styles/kendo.dataviz.default.min.css" />
    <link rel="stylesheet" href="https://kendo.cdn.telerik.com/2015.2.805/styles/kendo.mobile.all.min.css" />
    <link rel="stylesheet" href="https://kendo.cdn.telerik.com/2019.2.514/styles/kendo.silver.min.css" />
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="https://kendo.cdn.telerik.com/2019.2.514/js/kendo.all.min.js"></script>
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"/>

</head>
<body>
    <input type="hidden" id="hdIdRol" />
    <input type="hidden" id="hdNomUsuario" />
    <input type="hidden" id="hdIdCliente" />
    <input type="hidden" id="hdIdEmpresa" />
    <input type="hidden" id="hdTipoUsuario" />
    <input type="hidden" id="hdIdUsuario" />
    <input type="hidden" id="hdIdClienteSeleccionado" />
    <div class="top-layer" id="DivLoading">
        <div class="spinner">
            <div class="dot1"></div>
            <div class="dot2"></div>
        </div>
    </div>

    <div id="ventanaAddSucursal" style="display: none;">
        <input type="hidden" id="hdAddSucursal" />
        <table>
            <tr>
                <td>
                    <label id="lblAddSucA" style="font-weight: bold; font-family: Arial; font-size: 24px; color: #0061ae;">
                        <a style="color: #e4051f;">S</a>tno
                    </label>
                    <input type="text" id="txtAddStno" class="roundedTextBox" style="width: 50px; color: Black; font-size: 20px;" />
                </td>
            </tr>
            <tr>
                <td>
                    <label id="lblAddSucursal" style="font-weight: bold; font-family: Arial; font-size: 24px; color: #0061ae;">
                        <a style="color: #e4051f;">S</a>ucursal
                    </label>
                    <input type="text" id="txtAddSucursal" class="roundedTextBox" style="width: 70px; color: Black; font-size: 20px;" />
                </td>
            </tr>
            <tr>
                <td>
                    <label id="lbltiposuc" style="font-weight: bold; font-family: Arial; font-size: 24px; color: #0061ae;">
                        <a style="color: #e4051f;">T</a>ipo
                    </label>
                    <input type="text" id="txttiposuc" class="roundedTextBox" style="width: 70px; color: Black; font-size: 20px;" />
                </td>
            </tr>
        </table>
    </div>

    <div id="ventanaAddNoparte" style="display: none;">
        <table width="100%" >
            <tr>
                <td>
                    <label id="lblAddNoparteA" style="font-weight: bold; font-family: Arial; font-size: 24px; color: #0061ae;">
                        <a style="color: #e4051f;">N</a>o. Parte:
                    </label>
                </td>
                <td>
                    <input type="text" id="txtNoparteA" class="roundedTextBox" style="width: 150px; color: Black; font-size: 20px;" />
                </td>
                <td>
                    <label id="lblreleasedateA" style="font-weight: bold; font-family: Arial; font-size: 24px; color: #0061ae;">
                        <a style="color: #e4051f;">R</a>elease Date:
                    </label>
                </td>
                <td>
                    <input type="text" id="txtreleasedateA" class="roundedTextBox" style="width: 100px; color: Black; font-size: 20px;" />
                </td>
            </tr>
            <tr>
                <td>
                    <label id="lblAddSosA" style="font-weight: bold; font-family: Arial; font-size: 24px; color: #0061ae;">
                        <a style="color: #e4051f;">S</a>os:
                    </label>
                </td>
                <td>
                    <input type="text" id="txtAddSosA" class="roundedTextBox" style="width: 50px; color: Black; font-size: 20px;" />
                </td>
                <td>
                    <label id="lblkeywordsA" style="font-weight: bold; font-family: Arial; font-size: 24px; color: #0061ae;">
                        <a style="color: #e4051f;">K</a>ey Words:
                    </label>
                </td>
                <td>
                    <input type="text" id="txtkeywordsA" class="roundedTextBox" style="width: 70px; color: Black; font-size: 20px;" />
                </td>
            </tr>
            <tr>
                <td>
                    <label id="lbleanA" style="font-weight: bold; font-family: Arial; font-size: 24px; color: #0061ae;">
                        <a style="color: #e4051f;">E</a>an:
                    </label>
                </td>
                <td>
                    <input type="text" id="txteanA" class="roundedTextBox" style="width: 70px; color: Black; font-size: 20px;" />
                </td>
                <td>
                    <label id="lbltitleA" style="font-weight: bold; font-family: Arial; font-size: 24px; color: #0061ae;">
                        <a style="color: #e4051f;">T</a>itle:
                    </label>
                </td>
                <td>
                    <input type="text" id="txttitleA" class="roundedTextBox" style="width: 70px; color: Black; font-size: 20px;" />
                </td>
            </tr>
            <tr>
                <td>
                    <label id="lbldepartmenA" style="font-weight: bold; font-family: Arial; font-size: 24px; color: #0061ae;">
                        <a style="color: #e4051f;">D</a>eparment Id:
                    </label>
                </td>
                <td>
                    <input type="text" id="txtdeparmentA" class="roundedTextBox" style="width: 70px; color: Black; font-size: 20px;" />
                </td>
                <td>
                    <label id="lblisactiveA" style="font-weight: bold; font-family: Arial; font-size: 24px; color: #0061ae;">
                        <a style="color: #e4051f;">I</a>s Active:
                    </label>
                </td>
                <td>
                    <input type="text" id="txtisactiveA" class="roundedTextBox" style="width: 70px; color: Black; font-size: 20px;" />
                </td>
            </tr>
            <tr>
                <td>
                    <label id="lblcategoryA" style="font-weight: bold; font-family: Arial; font-size: 24px; color: #0061ae;">
                        <a style="color: #e4051f;">C</a>ategory Id:
                    </label>
                </td>
                <td>
                    <input type="text" id="txtcategoryA" class="roundedTextBox" style="width: 70px; color: Black; font-size: 20px;" />
                </td>
                <td>
                    <label id="lbltaxcodeA" style="font-weight: bold; font-family: Arial; font-size: 24px; color: #0061ae;">
                        <a style="color: #e4051f;">T</a>ax Code:
                    </label>
                </td>
                <td>
                    <input type="text" id="txttaxcodeA" class="roundedTextBox" style="width: 70px; color: Black; font-size: 20px;" />
                </td>
            </tr>
            <tr>
                <td>
                    <label id="lblbrandA" style="font-weight: bold; font-family: Arial; font-size: 24px; color: #0061ae;">
                        <a style="color: #e4051f;">B</a>rand:
                    </label>
                </td>
                <td>
                    <input type="text" id="txtbrandA" class="roundedTextBox" style="width: 70px; color: Black; font-size: 20px;" />
                </td>
                <td>
                    <label id="lblmetatagA" style="font-weight: bold; font-family: Arial; font-size: 24px; color: #0061ae;">
                        <a style="color: #e4051f;">M</a>eta Tag Description:
                    </label>
                </td>
                <td>
                    <input type="text" id="txtmetatagA" class="roundedTextBox" style="width: 70px; color: Black; font-size: 20px;" />
                </td>
            </tr>
            <tr>
                <td>
                    <label id="lblisvisibleA" style="font-weight: bold; font-family: Arial; font-size: 24px; color: #0061ae;">
                        <a style="color: #e4051f;">I</a>s Visible:
                    </label>
                </td>
                <td>
                    <input type="text" id="txtisvisibleA" class="roundedTextBox" style="width: 70px; color: Black; font-size: 20px;" />
                </td>
                <td>
                    <label id="lblshowwithoutstockA" style="font-weight: bold; font-family: Arial; font-size: 24px; color: #0061ae;">
                        <a style="color: #e4051f;">S</a>how without stock:
                    </label>
                </td>
                <td>
                    <input type="text" id="txtshowwithoutstockA" class="roundedTextBox" style="width: 70px; color: Black; font-size: 20px;" />
                </td>
            </tr>
            <tr>
                <td>
                    <label id="lblcommercialconditionA" style="font-weight: bold; font-family: Arial; font-size: 24px; color: #0061ae;">
                        <a style="color: #e4051f;">C</a>ommercial Condition Id:
                    </label>
                </td>
                <td>
                    <input type="text" id="txtcommercialconditionA" class="roundedTextBox" style="width: 70px; color: Black; font-size: 20px;" />
                </td>
                <td>
                    <label id="lbladwordsA" style="font-weight: bold; font-family: Arial; font-size: 24px; color: #0061ae;">
                        <a style="color: #e4051f;">A</a>d words remarketing code:
                    </label>
                </td>
                <td>
                    <input type="text" id="txtadwordsA" class="roundedTextBox" style="width: 70px; color: Black; font-size: 20px;" />
                </td>
            </tr>
            <tr>
                <td>
                    <label id="lblscoreA" style="font-weight: bold; font-family: Arial; font-size: 24px; color: #0061ae;">
                        <a style="color: #e4051f;">S</a>core:
                    </label>
                </td>
                <td>
                    <input type="text" id="txtscoreA" class="roundedTextBox" style="width: 70px; color: Black; font-size: 20px;" />
                </td>
                <td>
                    <label id="lblrefidnuevoA" style="font-weight: bold; font-family: Arial; font-size: 24px; color: #0061ae;">
                        <a style="color: #e4051f;">R</a>efId Nuevo:
                    </label>
                </td>
                <td>
                    <input type="text" id="txtrefidnuevoA" class="roundedTextBox" style="width: 70px; color: Black; font-size: 20px;" />
                </td>
            </tr>
            <tr>
                <td>
                    <label id="lblnameA" style="font-weight: bold; font-family: Arial; font-size: 24px; color: #0061ae;">
                        <a style="color: #e4051f;">N</a>ame:
                    </label>
                </td>
                <td>
                    <input type="text" id="txtnameA" class="roundedTextBox" style="width: 300px; color: Black; font-size: 20px;" />
                </td>
                <td>
                    <label id="lbllinkidA" style="font-weight: bold; font-family: Arial; font-size: 24px; color: #0061ae;">
                        <a style="color: #e4051f;">L</a>ink Id:
                    </label>
                </td>
                <td>
                    <input type="text" id="txtlinkidA" class="roundedTextBox" style="width: 300px; color: Black; font-size: 20px;" />
                </td>
            </tr>
            <tr>
                <td>
                    <label id="lbldescriptionA" style="font-weight: bold; font-family: Arial; font-size: 24px; color: #0061ae;">
                        <a style="color: #e4051f;">D</a>escription:
                    </label>
                </td>
                <td>
                    <%--<input type="text" id="txtdescriptionA" class="roundedTextBox" style="width: 300px; color: Black; font-size: 20px;" />--%>
                    <textarea name="txtdescriptionAdd" id="txtdescriptionA" cols="40" rows="6"></textarea>
                </td>
                <td>
                    <label id="lbldescriptionshortA" style="font-weight: bold; font-family: Arial; font-size: 24px; color: #0061ae;">
                        <a style="color: #e4051f;">D</a>escription short:
                    </label>
                </td>
                <td>
                    <%--<input type="text"  id="txtdescriptionshortA" class="roundedTextBox" style="width: 300px; color: Black; font-size: 20px;" />--%>
                    <textarea name="txtdescriptionshortAdd" id="txtdescriptionshortA" cols="40" rows="6"></textarea>
                </td>
            </tr>
        </table> 
        <table>
            <tr>
                <td>
                    "hola mundo"
                </td>
            </tr>
        </table>
    </div>


    <div data-role="layout" data-id="main">
        <div id="MsgValida" data-role="popover" _data-popup='{ "height": "250px" }'>
            <div data-role="view">
                <br>
                <span id="ContenidoMsgError">View 13333
                </span>
                <br>
                &nbsp;
            </div>
        </div>

        <!-- application views will be rendered here -->

        <div data-role="modalview" id="my-modal" style="width: 200px; height: 200px;">
            <div>dsdsd</div>
            <div>dsdsd</div>
        </div>
    </div>

    <script>
        app = new kendo.mobile.Application(document.body, {
            // comment out the following line to get a UI which matches the look
            // and feel of the operating system
            transition: 'slide',
            skin: 'flat',
            // the application needs to know which view to load first
            initial: '../Views/Login/Login.html'
        });


        $(document).keydown(function (e) {
            var elid = $(document.activeElement).is('input') || $(document.activeElement).is('textarea');

            if (e.keyCode === 8 && !elid) {
                return false;
            }
        });

        var ventanaAddSucursal = $("#ventanaAddSucursal");

        ventanaAddSucursal.kendoWindow({
            width: "700px",
            height: "500px",
            title: "Agregar Sucursal",
            modal: true,
            resizable: true,
            visible: false,
            actions: [
                "close"
            ]
        }).data("kendoWindow").center();

        //var ventanaAddNoparte = $("#ventanaAddNoparte");

        //ventanaAddNoparte.kendoWindow({
        //    width: "1200px",
        //    height: "550px",
        //    title: "Agregar No Parte",
        //    modal: true,
        //    resizable: true,
        //    visible: false,
        //    actions: [
        //        "close"
        //    ]
        //}).data("kendoWindow").center();

        $(document).ready(function () {
            $('#MsgValida').kendoMobilePopOver();

            var el = document.documentElement, rfs = // for newer Webkit and Firefox
                el.requestFullScreen
                || el.webkitRequestFullScreen
                || el.mozRequestFullScreen
                || el.msRequestFullScreen;

            if (typeof rfs != "undefined" && rfs) {
                rfs.call(el);
            } else if (typeof window.ActiveXObject != "undefined") {
                // for Internet Explorer
                var wscript = new ActiveXObject("WScript.Shell");
                if (wscript != null) {
                    wscript.SendKeys("{F11}");
                }
            }
        });
        //window.alert(222)
        //window.external.notify('AlertMessage')

        var Usrdata = { UserName: '<%=Session("UserName") %>', Email: '<%=Session("correo") %>', Vendedor: '<%=Session("NomUsuario") %>', Empresa: '<%=Session("Empresa") %>' };

    </script>
    <script>
        function AbrirVentanaAddSucursal() {
            var objVentanaAddSucursalA = $("#ventanaAddSucursal").data("kendoWindow");
            objVentanaAddSucursalA.center().open();
        }

        function cerrarVentanaAddSucursal() {
            var objcerrarVentanaAddSucursal = $("#ventanaAddSucursal").data("kendoWindow");
            objcerrarVentanaAddSucursal.close();

        }

    </script>
    <%--<script>
        function AbrirVentanaAddNoparte() {
            //var objVentanaAddNoparteA = $("#ventanaAddNoparte").data("kendoWindow");
            //objVentanaAddNoparteA.center().open();
        }

        function cerrarVentanaAddNoparte() {
            //var objcerrarVentanaAddNoparte = $("#ventanaAddNoparte").data("kendoWindow");
            //objcerrarVentanaAddNoparte.close();
        }

    </script>--%>

    <%--<script type="text/javascript">
        var map
        var marker = false;
        var geocoder = null;

        // var baseIcon;

        //alert('aqui entra');

        setTimeout(function () {

            //            baseIcon = new GIcon(G_DEFAULT_ICON);
            //            baseIcon.shadow = "../../recursos/imagenes/iconos/shadow50.png";
            //            baseIcon.iconSize = new GSize(20, 34);
            //            baseIcon.shadowSize = new GSize(37, 34);
            //            baseIcon.iconAnchor = new GPoint(9, 34);
            //            baseIcon.infoWindowAnchor = new GPoint(9, 2);

            //initialize();

            //alert("Hello");
        }, 2000);




        //        var ObjMarker = new Array();
        //        var ObjMarkerHTML = new Array();
        //        var ObjMarkerIDMaquina = new Array();
        //        var varia = new Array();


        //función principal para inicializar la página y crear el mapa
        function load() {

            //alert('inicializa');
            map = new google.maps.Map(document.getElementById("map"))
            map.setCenter(new GLatLng(25.681099, -100.454478), 5);
            map.addControl(new GLargeMapControl());
            map.addControl(new GMapTypeControl());
            map.addControl(new GOverviewMapControl());;
            map.setUIToDefault();




            //agrega evento clic y con el obtiene las coordenadas de donde hizo clic y agrega el marcador
            GEvent.addListener(map, "click", function (overlay, latlng) {

                var lat = latlng.lat();
                var lon = latlng.lng();

                document.getElementById('lat').value = lat;
                document.getElementById('lng').value = lon;
                document.getElementById('punto').value = lat + ' ' + lon;
                document.getElementById('Direccion').value = lat + ' ' + lon;

                //AddMarker(lat, lon, latlng);
                showLocation('click', lat, lon);

            });

            // insertar los controles 
            map.addControl(new GSmallMapControl()); map.addControl(new GMapTypeControl());
            geocoder = new GClientGeocoder();


        }
        //funcion para colocar el punto segun coordenadas

        function AddMarker(lat, lng, latlng) {


            map.clearOverlays();

            var lngSpan = lng;
            var latSpan = lat;

            var point = new GLatLng(latSpan, lngSpan);

            map.addOverlay(new GMarker(point, { title: "Ubicación" }));

            document.getElementById('lat').value = latSpan;
            document.getElementById('lng').value = lngSpan;
            document.getElementById('punto').value = latlng;

        }

        function findMe() {

            //            if (navigator.geolocation) {
            //                alert('Tu navegador ssoporta geolocalizacion');
            //            }
            //            else {
            //                alert('Tu navegador NO soporta geolocalizacion');
            //            }

            function localizacion(posicion) {

                var latitude = posicion.coords.latitude;
                var longitude = posicion.coords.longitude;

                document.getElementById('lat').value = latitude;
                document.getElementById('lng').value = longitude;

            }

            function error() {
                alert('No es posible obtener tu ubicación');
            }

            navigator.geolocation.getCurrentPosition(localizacion, error);


        }

        function showLocation(Tipo, Latitud, Longitud) {
            var address = '';

            if (Tipo = 'button') {
                address = document.getElementById('Direccion').value;
                geocoder.getLocations(address, addAddressToMap);
            }
            else {

                address = Latitud + ' ' + Longitud;
                alert(address);
                geocoder.getLocations(address, addAddressToMap);
            }

        }

        function addAddressToMap(response) {
            map.clearOverlays();

            if (!response || response.Status.code != 200) {
                alert("Lo sentimos, no se ha encontrado su direcci&ocute;n");
            } else {

                place = response.Placemark[0];
                point = new GLatLng(place.Point.coordinates[1], place.Point.coordinates[0]);

                map.setCenter(point, 15);
                marker = new GMarker(point);
                map.addOverlay(marker);
                marker.openInfoWindowHtml(place.address);

                document.getElementById("DireccionCompleta").value = place.address;
                document.getElementById("lat").value = place.Point.coordinates[1];
                document.getElementById("lng").value = place.Point.coordinates[0];
                document.getElementById("punto").value = place.Point.coordinates[1] + ' ' + place.Point.coordinates[0];

            }
        }

        function returnUbicacion() {

            //alert('la direccion completa ' + +document.getElementById("DireccionCompleta").value + '\\' + document.getElementById("lat").value + '\\' + document.getElementById("lng").value) 
            window.returnValue = '0' + '\\' + document.getElementById("DireccionCompleta").value + '\\' + document.getElementById("lat").value + '\\' + document.getElementById("lng").value;
            window.close();
        }

</script>--%>

    <style>
        .top-layer {
            display: block;
            position: absolute;
            top: 0;
            right: 0;
            bottom: 0;
            left: 0;
            z-index: 10000000000;
            overflow-y: scroll;
            background-color: rgb(215, 215, 215);
            opacity: .7;
            filter: alpha(opacity=70); /* For IE8 and earlier */
            overflow: hidden;
            display: none;
        }

        .spinner {
            margin: 100px auto;
            width: 200px;
            height: 200px;
            position: relative;
            text-align: center;
            -webkit-animation: sk-rotate 2.0s infinite linear;
            animation: sk-rotate 2.0s infinite linear;
        }

        .dot1, .dot2 {
            width: 60%;
            height: 60%;
            display: inline-block;
            position: absolute;
            top: 0;
            background-color: #333;
            border-radius: 100%;
            -webkit-animation: sk-bounce 2.0s infinite ease-in-out;
            animation: sk-bounce 2.0s infinite ease-in-out;
        }

        .dot2 {
            top: auto;
            bottom: 0;
            -webkit-animation-delay: -1.0s;
            animation-delay: -1.0s;
        }

        @-webkit-keyframes sk-rotate {
            100% {
                -webkit-transform: rotate(360deg)
            }
        }

        @keyframes sk-rotate {
            100% {
                transform: rotate(360deg);
                -webkit-transform: rotate(360deg)
            }
        }

        @-webkit-keyframes sk-bounce {
            0%, 100% {
                -webkit-transform: scale(0.0)
            }

            50% {
                -webkit-transform: scale(1.0)
            }
        }

        @keyframes sk-bounce {
            0%, 100% {
                transform: scale(0.0);
                -webkit-transform: scale(0.0);
            }

            50% {
                transform: scale(1.0);
                -webkit-transform: scale(1.0);
            }
        }
    </style>

</body>
</html>
