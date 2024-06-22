from django.shortcuts import render, redirect
import numpy as np
import sympy as sp
import matplotlib.pyplot as plt
from io import BytesIO
import base64
from .models import *
from django.http import HttpResponse
import math
from sympy import symbols, sympify
from sympy.parsing.sympy_parser import parse_expr
from django.contrib.auth import authenticate, login
from django.contrib import messages
from django.contrib.auth.models import User
from django.contrib.auth.decorators import login_required
from django.contrib.auth import logout

#Variable importante
from django.contrib.auth.models import User

def Inicio(request):
    return render(request, 'inicio.html')

def LogoutView(request):
    logout(request)
    return redirect('inicio')

def Login(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')

        user = authenticate(request, username=username, password=password)

        if user is not None:
            if user.is_active:
                login(request, user)
                messages.success(request, f'Bienvenido {username}, has iniciado sesión correctamente.')
                return redirect('inicio')
            else:
                messages.error(request, 'Cuenta inactiva.')
        else:
            messages.error(request, 'Credenciales incorrectas.')

    return render(request, 'login.html')

def register(request):
    if request.method == 'POST':
        username = request.POST.get('user')
        email = request.POST.get('email')
        password = request.POST.get('contra')

        if User.objects.filter(username=username).exists():
            messages.error(request, 'El nombre de usuario ya está tomado.')
        elif User.objects.filter(email=email).exists():
            messages.error(request, 'El correo electrónico ya está registrado.')
        else:
            user = User.objects.create_user(username=username, email=email, password=password)
            user.save()
            login(request, user)
            messages.success(request, f'Bienvenido {username}, tu cuenta ha sido creada exitosamente.')
            return redirect('inicio')

    return render(request, 'registro.html')

def Dif_Divididas(request):
    pol_nomio= ''
    polinomio_simplificado = ''
    tabla_final = []
    user = 0
    title = ''
    graphic = ''
    
    #Importante
    objeto = tbl_Ecuaciones()

    if request.method == 'POST':
        xi_str_inp = request.POST.get('xi_valores','')
        fi_str_inp = request.POST.get('fi_valores','')

        # INGRESO , Datos de prueba
        xi = [float(x.strip()) for x in xi_str_inp.replace(' ', '').split(',') if x.strip()]
        fi = [float(x.strip()) for x in fi_str_inp.replace(' ', '').split(',') if x.strip()]
        
        if request.user.is_authenticated:
            user = request.user.id
        else:
            # Valor por defecto para usuarios no autenticados
            user = None 
        # PROCEDIMIENTO

        # Tabla de Diferencias Divididas Avanzadas
        titulo = ['i   ','xi  ','fi  ']
        n = len(xi)
        ki = np.arange(0,n,1)
        tabla = np.concatenate(([ki],[xi],[fi]),axis=0)
        tabla = np.transpose(tabla)

        # diferencias divididas vacia
        dfinita = np.zeros(shape=(n,n),dtype=float)
        tabla = np.concatenate((tabla,dfinita), axis=1)

        # Calcula tabla, inicia en columna 3
        [n,m] = np.shape(tabla)
        diagonal = n-1
        j = 3
        while (j < m):
            # Añade título para cada columna
            titulo.append('F['+str(j-2)+']')

            # cada fila de columna
            i = 0
            paso = j-2 # inicia en 1
            while (i < diagonal):
                denominador = (xi[i+paso]-xi[i])
                numerador = tabla[i+1,j-1]-tabla[i,j-1]
                tabla[i,j] = numerador/denominador
                i = i+1
            diagonal = diagonal - 1
            j = j+1

        # POLINOMIO con diferencias Divididas
        # caso: puntos equidistantes en eje x
        dDividida = tabla[0,3:]
        n = len(dfinita)

        # expresión del polinomio con Sympy
        x = sp.Symbol('x')
        polinomio = fi[0]
        for j in range(1,n,1):
            factor = dDividida[j-1]
            termino = 1
            for k in range(0,j,1):
                termino = termino*(x-xi[k])
            polinomio = polinomio + termino*factor

        # simplifica multiplicando entre (x-xi)
        polisimple = polinomio.expand()

        # polinomio para evaluacion numérica

        px = sp.lambdify(x,polisimple)

        # Puntos para la gráfica
        muestras = 101
        a = np.min(xi)
        b = np.max(xi)
        pxi = np.linspace(a,b,muestras)
        pfi = px(pxi)

        #Salida de las ecuaciones
        tabla_final = tabla.tolist()
        print(tabla_final)
        
        pol_nomio = polinomio
        
        title = titulo
        
        polinomio_simplificado = polisimple
        
        #Grafica
        # Puntos para la gráfica
        muestras = 101
        a = np.min(xi)
        b = np.max(xi)
        pxi = np.linspace(a, b, muestras)
        pfi = px(pxi)

        # Generar gráfica
        plt.figure()
        plt.plot(xi, fi, 'bo', label='Puntos dados')
        plt.plot(pxi, pfi, 'r-', label='Interpolación')
        plt.xlabel('x')
        plt.ylabel('f(x)')
        plt.title('Interpolación por Diferencias Divididas')
        plt.legend()

        # Guardar la gráfica en un objeto BytesIO
        buffer = BytesIO()
        plt.savefig(buffer, format='png')
        buffer.seek(0)
        image_png = buffer.getvalue()
        buffer.close()

        # Convertir la imagen a base64 para pasarla al HTML
        graphic = base64.b64encode(image_png).decode('utf-8')
        
        #Guardar en la DataBase
        objeto.xi_ecuacion = xi
        objeto.fi_ecuacion = fi
        objeto.ecuacion = polinomio
        objeto.ecuacion_simplificada = polisimple
        objeto.user_id = user
        objeto.save()

    return render(request, 'index.html', {'polinomio':pol_nomio, 'simplificado':polinomio_simplificado
                                          ,'tabla':tabla_final, 'titulos':title, 'grafic':graphic})

def funcion(x, y, ecuacion):
    expr = parse_expr(ecuacion, evaluate=True)  # Evaluar la expresión
    return expr.subs({sp.symbols('x'): x, sp.symbols('y'): y})

def Euler_Method(request):
    resultados = []
    Euler_objeto = tbl_Euler()
    user = 0
    graphic = ''
    
    if request.method == 'POST':
        h = float(request.POST.get('h'))
        s = float(request.POST.get('s'))
        ecuacion = request.POST.get('ecuacion')
        
        if request.user.is_authenticated:
            user = request.user.id
        else:
            user = None 
        
        Euler_objeto.h = h
        Euler_objeto.s = s 
        Euler_objeto.ecuacion = ecuacion
        Euler_objeto.user_id = user
        Euler_objeto.save()

        x, y = sp.symbols('x y')

        n = int(s / h) + 1
        x_vals = np.zeros(n)
        y_vals = np.zeros(n)
        
        y_vals[0] = 0

        for i in range(1, n):
            x_n = x_vals[i - 1]
            y_n = y_vals[i - 1]
            y_np1 = y_n + funcion(x_n, y_n, ecuacion) * h
            x_np1 = x_n + h
            
            # Redondear los valores a 4 decimales
            x_n = round(x_n, 4)
            y_n = round(y_n, 4)
            x_np1 = round(x_np1, 4)
            y_np1 = round(y_np1, 4)
            
            y_vals[i] = y_np1
            x_vals[i] = x_np1
            resultados.append((i, x_n, y_n, x_np1, y_np1))
        
       # Crear la figura
        plt.figure()

        # Graficar la línea azul
        plt.plot(x_vals, y_vals, 'b-', label='Aproximación de Euler')

        # Agregar puntos rojos
        plt.scatter(x_vals, y_vals, color='red')

        # Etiquetas y título
        plt.xlabel('x')
        plt.ylabel('y')
        plt.title('Método de Euler')
        plt.legend()

        # Guardar la gráfica en un buffer
        buffer = BytesIO()
        plt.savefig(buffer, format='png')
        buffer.seek(0)
        image_png = buffer.getvalue()
        buffer.close()

        # Convertir la imagen a base64
        graphic = base64.b64encode(image_png).decode('utf-8')
        
    return render(request, 'euler.html', {'resultados': resultados, 'grafic': graphic})

def historial(request):
    user = request.user.id
    #Recorrer tabla de divididas
    obj_tbl_divid = list(tbl_Ecuaciones.objects.filter(user_id=user))
    #Recorrer  tabla de euler
    obj_tbl_euler = list(tbl_Euler.objects.filter(user_id=user))
    return render(request, 'historial.html', {'historial_divid': obj_tbl_divid, 'historial_euler':obj_tbl_euler})

def EulerTeoria(request):
    return render(request, 'EulerTeoria.html')

def DividTeoria(request):
    return render(request, 'DividTeoria.html')

def Perfiles(request):
    return render(request, 'perfil.html')

def usuario_perfil(request):
    nombre = request.user.username
    correo = request.user.email  
    contra = request.user.password
    return render(request, 'usuario_perfil.html', {'nombre_usu':nombre, 'correo_usu':correo, 'contra_usu':contra})