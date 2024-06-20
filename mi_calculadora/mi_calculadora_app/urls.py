# calculadora_app/urls.py
from django.urls import path
from django.contrib.auth.decorators import login_required
from . import views

urlpatterns = [
    path('inicio/', views.Inicio, name='inicio'),
    path('divid/', views.Dif_Divididas, name = 'divid'),
    path('euler/', views.Euler_Method, name='euler'),
    path('login/', views.Login, name='login'),
    path('registro/', views.register, name='register'),
    path('logout/', views.LogoutView, name='logout'),
    path('EulerTeoria/', views.EulerTeoria, name='EulerTeoria'),
    path('DividTeoria/', views.DividTeoria, name='DividTeoria'),
    path('perfil/',views.Perfiles, name='perfil'),
    path('historial/', views.historial, name='historial')
]