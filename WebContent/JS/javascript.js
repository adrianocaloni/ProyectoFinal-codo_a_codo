document.addEventListener("DOMContentLoaded", function() {
    // Obtén referencias a los campos y al botón
    var nombre = document.getElementById('nombre');
    var apellido = document.getElementById('apellido');
    var email = document.getElementById('email');
    var cantidad = document.getElementById('cantidadNumero');
    var categoria = document.getElementById('categoria');
    var botonComprar = document.getElementById('botonComprar');

    // Función para verificar si todos los campos están completos
    function verificarCampos() {
        if (nombre.value.trim() !== '' && apellido.value.trim() !== '' && email.value.trim() !== '' && cantidad.value.trim() !== '' && categoria.value !== '-') {
            botonComprar.removeAttribute('disabled');
             mostrarTotal();
        } else {
            botonComprar.setAttribute('disabled', 'disabled');
        }
    }

    // Agregar event listeners a los campos para verificar cuando cambian
    nombre.addEventListener('input', verificarCampos);
    apellido.addEventListener('input', verificarCampos);
    email.addEventListener('input', verificarCampos);
    cantidad.addEventListener('input', verificarCampos);
    categoria.addEventListener('change', verificarCampos);  // Usamos 'change' para select en lugar de 'input'
});


function mostrarTotal() {
    // Aquí deberías calcular el total y mostrarlo en el modal
    var total = calcularTotal();
    document.getElementById('totalAPagar').textContent = "$" + total.toFixed(2);
}


function calcularTotal() {
    var cantidad = document.getElementById('cantidadNumero').value;
    var categoria = document.getElementById('categoria').value;

    var precioBase = 200;  // Valor base del ticket

    if (categoria === "1") {  // Vengadores Originales
        return precioBase * cantidad * 0.8;  // 80% de descuento
    } else if (categoria === "2") {  // Nuevos Vengadores
        return precioBase * cantidad * 0.5;  // 50% de descuento
    } else if (categoria === "3") {  // Vengadores Oscuros
        return precioBase * cantidad * 0.85;  // 15% de descuento
    } else {
        return precioBase * cantidad;  // Sin descuento
    }
}

function borrarValor() {
    // Esta función se encargará de borrar el valor en el input de cantidad o cualquier otro que necesites
    
    document.getElementById('nombre').value = "";
    document.getElementById('apellido').value = "";
    document.getElementById('email').value = "";
    document.getElementById('cantidadNumero').value = "";
    document.getElementById('categoria').value = "";
    document.getElementById('totalAPagar').value = "";
    botonComprar.setAttribute('disabled', 'disabled');

}

function mostrarTotal() {
    // Aquí deberías calcular el total y mostrarlo en el modal
    var total = calcularTotal();
    document.getElementById('totalAPagar').textContent = "$" + total.toFixed(2);
}


function setRecordId(id) {
    document.getElementById('recordId').value = id;
}

function setRecordEditId(id,nombre,apellido,tipo_ticket,mail) {
	 console.log(id,nombre,apellido,mail,tipo_ticket)
	 			    // Aplicar descuento según la categoría
	if (tipo_ticket == 1) {
		tipo_vengador = 'Vengador Original'
	} else if (tipo_ticket == 2) {
		tipo_vengador = 'Vengador Nuevo'
	} else {
	    tipo_vengador = 'Vengador Oscuro'
	}
	 
     document.getElementById('recordIdEdit').value = id;
     document.getElementById('nombre').value = nombre;
     document.getElementById('apellido').value = apellido;
     document.getElementById('tipoVengador').value = tipo_vengador;
     document.getElementById('mail').value = mail;
}

function setRecordIdOrador(id) {
        document.getElementById('recordIdOrador').value = id;
        console.log(id)
}
