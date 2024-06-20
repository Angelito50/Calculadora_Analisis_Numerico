const loginBtn = document.querySelector("#login");
const registerBtn = document.querySelector("#register");
const loginForm = document.querySelector("#login-form");
const registerForm = document.querySelector("#register-form");

/* JS DE BOTONES DE LOGIN Y REGISTER VALIDACIONES */
const backgroundImage = "{% static 'img/fondo1.jpg' %}";
const backdropImage = "{% static 'img/PYh.gif' %}";

// Obtener los botones de Ingresar y Registrarse
const loginButton = document.querySelector('#login-submit-L');
const registerButton = document.querySelector('#register-submit');

// Agregar un evento click al botón de Ingresar
loginButton.addEventListener('click', function() {
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
        // Mostrar una alerta de "Todo bien"
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

// Agregar un evento click al botón de Registrarse
registerButton.addEventListener('click', function() {
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
    }
    
    // Validar el formato del correo electrónico
    if (!email.includes('@')) {
        Swal.fire({
            icon: 'error',
            title: '¡Error!',
            text: 'Por favor, ingresa un correo electrónico válido.'
        });
        return; // Detener la ejecución si el correo electrónico no es válido
    }
    
    // Validar la contraseña
    if (!/^(?=.*[A-Z])(?=.*\d)(?=.*[@#$*.,])[A-Za-z\d@#$*.,]{8,}$/.test(password)) {
        Swal.fire({
            icon: 'error',
            title: '¡Error!',
            text: 'La contraseña debe tener al menos 8 caracteres, una mayúscula, un número y puede contener *#., como símbolos.'
        });
        return; // Detener la ejecución si la contraseña no cumple con los requisitos
    }
    
    /*Mostrar una alerta de "Todo bien"*/
    Swal.fire({
        title: "Registro de cuenta exitoso!!",
        width: 600,
        padding: "3em",
        color: "#3572EF",
        background: `#fff url(${backgroundImage})`,
            backdrop: `
              rgba(0,0,123,0.4)
              url(${backdropImage})
              left top
              no-repeat
        `
    }); 
});