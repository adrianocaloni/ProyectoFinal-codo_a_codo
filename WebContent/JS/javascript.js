const precioPorTicket = 200;

function obtenerValor(){
var cantidadTicket = document.getElementById("cantidadNumero").value;
var descuentoTotal = document.getElementById("cantidadDescuento").value;

if (cantidadTicket < "0"){

    var muestroResultado = document.getElementById("totalFianl");
    muestroResultado.textContent = "Tiene que seleccionar la cantidad de TICKET"
}
else if (descuentoTotal < "0") {
    var muestroResultado = document.getElementById("totalFianl");
    muestroResultado.textContent = "Debe seleccionar una Categoría"

}
else
{
var subTotal = precioPorTicket * cantidadTicket;
var descuentoFinal = subTotal * descuentoTotal / 100;
var percioFinal = subTotal - descuentoFinal 

var muestroResultado = document.getElementById("totalFianl");
muestroResultado.textContent = "Total a Pagar: $"+percioFinal;
}
}

function borrarValor(){

    var borroResultado = document.getElementById("totalFianl");
    borroResultado.textContent = "Total a Pagar: $0"

    var formulario = document.getElementById("formularioCompraTickets");
    formulario.reset();
}
