// Función para mostrar alertas
function mostrarAlerta(titulo, texto, icono = "info") {
    Swal.fire({
        title: `<strong>${titulo}</strong>`,
        icon: icono,
        html: texto,
        showCloseButton: true,
        focusConfirm: false,
        confirmButtonText: `<i class="fa fa-thumbs-up"></i> Entendido!`,
        confirmButtonAriaLabel: "Thumbs up, great!"
    });
}

// Función de validación de entrada
function validarEntrada(event, regex, mensajeError) {
    let value = event.target.value;
    if (!regex.test(value)) {
        mostrarAlerta("Entrada inválida", mensajeError);
        event.target.value = value.replace(new RegExp(`[^${regex.source.slice(1, -1)}]`, 'g'), '');
    }
}

// Validación de ecuación
document.getElementById('ecuacion').addEventListener('input', function(event) {
    validarEntrada(event, /^[-+*/xyXY0-9\s]*$/, `
        Por favor, escriba la ecuación usando solo los siguientes caracteres: <b>+-*/xyXY</b> y números.
        No se permiten espacios en blanco.
        <br><br>
        Ejemplo válido: <b>-2*x*y + 3</b>
    `);
});

// Validación de h y numPasos
['h', 'numPasos'].forEach(id => {
    document.getElementById(id).addEventListener('input', function(event) {
        validarEntrada(event, /^\d*\.?\d*$/, `
            Ejemplo válido: <b>2.5</b>, sin espacios.
        `);
    });
});

// Botón continuar
document.getElementById('continuarBtn').addEventListener('click', function() {
    let ecuacion = document.getElementById('ecuacion').value.trim();
    let h = document.getElementById('h').value.trim();
    let numPasos = document.getElementById('numPasos').value.trim();

    if (!ecuacion || !h || !numPasos) {
        Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'Por favor, llene todos los campos correctamente!',
        });
        return;
    }
    else{
        // Mostrar la alerta de éxito
        Swal.fire({
            position: "top-center",
            icon: "success",
            title:"Muy bien",
            text: "Tu ejercicio está siendo procesado con éxito",
        });
    }

    // Actualizar el contenido del span
    const textoRespuesta = `Tu resultado de la ecuación (${ecuacion}), con número de pasos=${numPasos} y tamaño del paso h=${h} es:`;
    document.getElementById('spanRespuesta').textContent = textoRespuesta;

    // Guardar los datos en localStorage
    localStorage.setItem('funcionF', ecuacion);
    localStorage.setItem('pasoH', h);
    localStorage.setItem('numPasos', numPasos);
});

// Cargar datos de localStorage al inicio
document.addEventListener('DOMContentLoaded', function() {
    const funcionGuardada = localStorage.getItem('funcionF');
    const pasoGuardado = localStorage.getItem('pasoH');
    const numPasosGuardados = localStorage.getItem('numPasos');

    if (funcionGuardada && pasoGuardado && numPasosGuardados) {
        const textoRespuestaGuardada = `Tus datos guardados son: Ecuación (${funcionGuardada}), pasos=${numPasosGuardados}, tamaño del paso h=${pasoGuardado}`;
        document.getElementById('spanRespuesta').textContent = textoRespuestaGuardada;
    }
});
