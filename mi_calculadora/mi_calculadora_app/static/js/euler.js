document.getElementById('continuarBtn').addEventListener('click', function(event) {

    const funcionF = document.getElementById('ecuacion').value;
    const pasoH = parseFloat(document.getElementById('h').value);
    const numPasos = parseInt(document.getElementById('numPasos').value);

    if (funcionF && !isNaN(xInicial) && !isNaN(yInicial) && !isNaN(pasoH) && !isNaN(numPasos)) {
        console.log("Función f(x, y):", funcionF);
        console.log("Tamaño del paso h:", pasoH);
        console.log("Número de pasos:", numPasos);
      
    } else {
        Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'Por favor, llene todos los campos correctamente!'
        });
    }
});

document.addEventListener('DOMContentLoaded', function() {
    const continuarBtn = document.getElementById('continuarBtn');
    const spanRespuesta = document.getElementById('spanRespuesta');

    continuarBtn.addEventListener('click', function(event) {
        
        // Obtener los valores de los input
        const funcionF = document.getElementById('ecuacion').value;
        const pasoH = document.getElementById('h').value;
        const numPasos = document.getElementById('numPasos').value;

        // Construir el texto para el span de respuesta
        const textoRespuesta = `Tu resultado de la ecuación (${funcionF}), con número de pasos=${numPasos} y tamaño del paso h=${pasoH} es:`;

        // Actualizar el contenido del span
        spanRespuesta.textContent = textoRespuesta;

        // Guardar los datos en localStorage si todos los campos están llenos
        if (funcionF && pasoH && numPasos) {
            localStorage.setItem('funcionF', funcionF);
            localStorage.setItem('pasoH', pasoH);
            localStorage.setItem('numPasos', numPasos);

           
        } else {
            // Mostrar un mensaje de error si no se llenaron todos los campos
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: 'Por favor, llene todos los campos correctamente!',
            });
        }
    });

    // Al cargar la página, verificar si hay datos guardados en localStorage y mostrarlos si es necesario
    const funcionGuardada = localStorage.getItem('funcionF');
    const pasoGuardado = localStorage.getItem('pasoH');
    const numPasosGuardados = localStorage.getItem('numPasos');

    if (funcionGuardada && pasoGuardado && numPasosGuardados) {
        // Construir el texto para el span de respuesta
        const textoRespuestaGuardada = `Tus datos guardados son: Ecuación (${funcionGuardada}), pasos=${numPasosGuardados}, tamaño del paso h=${pasoGuardado}`;

        // Actualizar el contenido del span
        spanRespuesta.textContent = textoRespuestaGuardada;
    }
});

