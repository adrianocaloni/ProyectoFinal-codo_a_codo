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


function redireccionarInicio() {
	
    // Muestra el mensaje de redirección en el modal
    document.getElementById('miModalLabel').textContent = "Redirigiendo...";
    document.getElementById('miModalLabel').style.color = "blue";  // Estilo para resaltar el mensaje

    // Inicia el contador
    var segundos = 5;
    var intervalo = setInterval(function() {
        document.getElementById('estasSeguro').textContent = "Redirigiendo en " + segundos + " segundos...";
        segundos--;

        if (segundos < 0) {
			
            clearInterval(intervalo);  // Detiene el temporizador cuando llega a cero
            
            if(segundos == 0){}
            window.location.href = "FrontController?accion=compraExitosa";  // Redirige al usuario a una nueva pagina
        }
    }, 1000);  // Actualiza cada segundo (1000 milisegundos)
    
    
}
