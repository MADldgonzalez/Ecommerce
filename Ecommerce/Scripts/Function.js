var urlDataSource = '../Data/DataSerial.aspx?Allow-Origin=1'

function GetDS(spName, lispa, callFunctionOK, Modelo) {
    var modeloSend = {}

    if (typeof (Modelo) != 'undefined') {
        modeloSend = Modelo

    }

    var dataSource = new kendo.data.DataSource({


        schema: { model: modeloSend },

        requestEnd: function (e) {
            app.pane.loader.hide()
        },
        requestStart: function (e) {

            app.pane.loader.show();

        }
            ,
        transport: {
            error: function (e) {

                alert(e.errors); // displays "Invalid query"
            }
  ,
            read: {
                url: urlDataSource,
                dataType: "json", // "jsonp" is required for cross-domain requests; use "json" for same-domain requests
                type: 'POST',

                cache: false
            },

            parameterMap: function (data, type) {


                var TempListaPara

                if (typeof (lispa) == 'object') TempListaPara = lispa
                if (typeof (lispa) == 'function') TempListaPara = lispa()


                return { __EVENTARGUMENT: "CallSP",
                    param: kendo.stringify(TempListaPara),
                    spCall: spName


                }



            }



        }


    });


    if (typeof (callFunctionOK) == 'undefined' || callFunctionOK == null)
        return dataSource



    dataSource.fetch(function () {
        callFunctionOK(dataSource)

    });


}


function GetDataLocalStorage(idValueData) {
    if (localStorage.getItem(idValueData) == null) return "";

    return localStorage.getItem(idValueData);
}

function SetDataLocalStorage(idValueData, ValueData) {
    localStorage.setItem(idValueData, ValueData);

}


function Callstored(spname, lispa, CallFunction) {

    var asyncCall = false

    if (typeof (CallFunction) != 'undefined') asyncCall = true

    if (asyncCall) app.pane.loader.show();



    var objRe = null
    $.ajax({
        crossDomain: true,
        type: 'POST',
        url: urlDataSource,
        data: {
            __EVENTARGUMENT: "CallSP",
            param: kendo.stringify(lispa),
            spCall: spname
        },
        success: function (data, status) {

            if (asyncCall) {
                CallFunction(data)
                app.pane.loader.hide()

            }
            else

            { objRe = data }



        },


        error: function (request, status, error) {

            alert('Ha ocurrido un error.')
            alert(request.responseText)


            //  alert(request.responseText);
        }
    ,



        // dataType: dataType,
        async: asyncCall
    });

    return objRe


}

function CallStoredObj(spname, obj, CallFunction) {
    // var obj = JSON.parse(  JSON.stringify(obj)); 

    return Callstored(spname, objToparametrer(JSON.parse(JSON.stringify(obj))), CallFunction)

}

function objToparametrer(obj) {
    var lp = []
    for (key in obj)
        lp.push({ ParaName: key, ParaValue: obj[key] })


    // lp.push({ ParaName: 'IdEmpresa', ParaValue: '<%=1%>' })


    return lp

}



function ListCatalogoReturnFunction(LlamFuncion, DsObj, titulo, TituloList) {





    APP.SeleccionCatalogo.viewModel.set('TituloGrid', ((typeof (TituloList) != 'undefined ') ? TituloList : ''))


    app.pane.loader.show();
    APP.SeleccionCatalogo.viewModel.set('Regresar', false)

    APP.SeleccionCatalogo.viewModel.set('Titulo', titulo)
    APP.SeleccionCatalogo.viewModel.set('ds', DsObj)
    APP.SeleccionCatalogo.viewModel.set('CallFunction', function (clave, descrip) {
        LlamFuncion(clave, descrip)

    }),

              app.navigate("views/SeleccionaCatalogo.html");
    APP.SeleccionCatalogo.viewModel.get('ReCarga')()
}




function ListCatalogo(ObjModelo, ModeloValue, ModeloText, DsObj, titulo, TituloList) {

    app.pane.loader.show();
    APP.SeleccionCatalogo.viewModel.set('Regresar', true)
    if (typeof (TituloList) == 'undefined') TituloList = ''


    APP.SeleccionCatalogo.viewModel.set('TituloGrid', ((typeof (TituloList) != 'undefined ') ? TituloList : ''))


    APP.SeleccionCatalogo.viewModel.set('Titulo', titulo)
    APP.SeleccionCatalogo.viewModel.set('ds', DsObj)
    APP.SeleccionCatalogo.viewModel.set('CallFunction', function (clave, descrip) {
        ObjModelo.viewModel.set(ModeloText, descrip)
        ObjModelo.viewModel.set(ModeloValue, clave)

    }),

              app.navigate("views/SeleccionaCatalogo.html");
    APP.SeleccionCatalogo.viewModel.get('ReCarga')()
}


function SelRangos(ObjModelo, ModeloValueMin, ModeloValueMax, ValueMin, ValueMax, Titulo) {
    APP.SeleccionaRangos.viewModel.set('ValueMin', ValueMin)
    APP.SeleccionaRangos.viewModel.set('ValueMax', ValueMax)
    APP.SeleccionaRangos.viewModel.set('Titulo', Titulo)



    APP.SeleccionaRangos.viewModel.set('CallFunction', function (a, b) {
        ObjModelo.viewModel.set(ModeloValueMin, a)
        ObjModelo.viewModel.set(ModeloValueMax, b)
    })



    app.navigate("views/SeleccionaRangos.html");



}



function AddItemsSelect(cmdObjeto, dsCmd, ValueCmd, TextCmd) {

    $("#" + cmdObjeto).empty();

    $('#' + cmdObjeto).append($('<option>', {
        value: 0,
        text: 'Seleccione'
    }));



    $.each(dsCmd, function (i, item) {
        $('#' + cmdObjeto).append($('<option>', {
            value: eval('item.' + ValueCmd),
            text: eval('item.' + TextCmd)
        }));
    });


}


