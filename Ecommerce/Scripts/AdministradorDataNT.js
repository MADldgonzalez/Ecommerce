//---------------------------------------- Muestras Pendientes ---------------------------------------------

function SelMuestrasPendientes(idCliente, idEmpresa) {
    var dsMuestrasPendientes;

    dsMuestrasPendientes = CallStoredObj("SelMuestrasPendientes", { IdCliente: idCliente, IdEmpresa: idEmpresa });

    return dsMuestrasPendientes;
}

//----------------------------------------------------------------------------------------------------------


//--------------------------------------------- Equipos -------------------------------------------------------

function SeleccionaEquiposCliente(idCliente, idEmpresa) {
    var dsEquiposCliente;

    dsEquiposCliente = CallStoredObj("SelEquiposCliente", { IdCliente: idCliente, IdEmpresa: idEmpresa });

    return dsEquiposCliente;
}
//--------------------------------------------------------------------------------------------------------------