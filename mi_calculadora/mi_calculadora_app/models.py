from django.db import models
from django.contrib.auth.models import User
from django.utils import timezone
class tbl_usuarios(models.Model):
    id_usuario = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=200, null=True)
    correo = models.CharField(max_length=200)
    password = models.CharField(max_length=50)
    last_login = models.DateTimeField(default=timezone.now)
    
"""
class tbl_Historial(models.Model):
    id_busqueda = models.AutoField(primary_key=True)
    id_usuario = models.ForeignKey(tbl_usuarios, on_delete=models.RESTRICT)
    texto_busqueda = models.CharField(max_length=200)
"""
class tbl_Ecuaciones(models.Model):
    id_ecuacion = models.AutoField(primary_key=True) 
    ecuacion = models.CharField(max_length=200)
    ecuacion_simplificada = models.CharField(max_length=200, null=True)
    user = models.ForeignKey(User, on_delete=models.CASCADE, null=True)
    xi_ecuacion = models.CharField(max_length=200, null=True)
    fi_ecuacion = models.CharField(max_length=200, null=True)

class tbl_Euler(models.Model):
    id_ecu = models.AutoField(primary_key=True) 
    user = models.ForeignKey(User, on_delete=models.CASCADE, null=True)
    ecuacion = models.CharField(max_length=200)
    h = models.CharField(max_length=200)
    s = models.CharField(max_length=200)
    
"""    
class tbl_Soluciones(models.Model):
    id_solucion = models.AutoField(primary_key=True)
    id_ecuacion = models.ForeignKey(tbl_Ecuaciones, on_delete=models.RESTRICT)
    text_solucion = models.CharField(max_length=200)
    pasos = models.CharField(max_length=500)
"""