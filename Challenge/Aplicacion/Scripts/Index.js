function Buscar() {

    var ident = $("#select_f").val();

    var dato = $("#input_t").val();

    $("#msjError").text("");

    switch (ident) {

        case "0":

            var dato = $("#input_t").val("");

            BuscarTodos(ident);

            break;

        case "1": 

            if (dato == "") {

                $("#msjError").text("Ingrese DNI");

            } else {                

                BuscarEmpDeterminado(ident, dato);

            }            

            break;

        case "2":

            if (dato == "") {

                $("#msjError").text("Ingrese Legajo");

            } else {

                BuscarEmpDeterminado(ident, dato);

            }           

            break;

        default:

            $("#msjError").text("Seleccione un tipo de busqueda");

            break;

    }   
}

function BuscarEmpDeterminado(ident, dato) {

    var url = "/Home/_Tabla?ident=" + ident + "&dato=" + dato.trim();

    $("#_VpTabla").load(url);
    
}

function BuscarTodos(ident) {

    $("#msjError").text("");

    var url = "/Home/_Tabla?ident=" + ident;

    $("#_VpTabla").load(url);

}


