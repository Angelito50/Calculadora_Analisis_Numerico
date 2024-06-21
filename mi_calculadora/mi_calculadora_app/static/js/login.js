// Constantes con las rutas de las imágenes de fondo
const backgroundImage = "{% static 'img/fondo1.jpg' %}";
const backdropImage = "{% static 'img/PYh.gif' %}";

// Obtener el botón de Ingresar
const loginButton = document.querySelector('#login-submit-L');

// Agregar un evento click al botón de Ingresar
loginButton.addEventListener('click', function(event) {
    event.preventDefault(); // Evitar que el formulario se envíe por defecto

    // Obtener los valores de los campos de inicio de sesión
    const username = document.querySelector('#username-input-L').value.trim();
    const password = document.querySelector('#password-input-L').value.trim();
    
    // Validar que los campos no estén vacíos
    if (username === '' || password === '') {
        Swal.fire({
            icon: 'error',
            title: '¡Error!',
            text: 'Por favor, completa todos los campos.'
        });
        return; // Detener la ejecución si algún campo está vacío
    } else {
        // Mostrar una alerta personalizada con las imágenes de fondo
        Swal.fire({
            title: "Inicio de sesión exitoso!!",
            width: 600,
            padding: "3em",
            color: "#716add",
            background: `#fff url(${backgroundImage})`,
            backdrop: `
              rgba(0,0,123,0.4)
              url(${backdropImage})
              left top
              no-repeat
            `
        });
    }
});


// Obtener el botón de Registrarse
const registerButton = document.querySelector('#register-submit');

// Agregar un evento click al botón de Registrarse
registerButton.addEventListener('click', function(event) {
    event.preventDefault(); // Evitar que el formulario se envíe por defecto

    // Obtener los valores de los campos de registro
    const email = document.querySelector('#email-input').value.trim();
    const username = document.querySelector('#username-input').value.trim();
    const password = document.querySelector('#password-input').value.trim();
    
    // Validar que los campos no estén vacíos
    if (email === '' || username === '' || password === '') {
        Swal.fire({
            icon: 'error',
            title: '¡Error!',
            text: 'Por favor, completa todos los campos.'
        });
        return; // Detener la ejecución si algún campo está vacío
    } else {
        // Mostrar una alerta de registro exitoso
        Swal.fire({
            title: "Registro exitoso!!",
            width: 600,
            padding: "3em",
            color: "#716add",
            background: `#fff url(${backgroundImage})`,
            backdrop: `
              rgba(0,0,123,0.4)
              url(${backdropImage})
              left top
              no-repeat
            `
        });
    }
});