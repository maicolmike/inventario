from django import forms
from .models import Equipo

# -------------------------
# LISTAS DE OPCIONES
# -------------------------

CODIGO = [
    ('', ''),
    ('AG01-FDO', 'AG01-FDO'),
    ('AG02-FDO', 'AG02-FDO'),
    ('AG03-FDO', 'AG03-FDO'),
    ('AG04-FDO', 'AG04-FDO'),
    ('AG05-FDO', 'AG05-FDO'),
    ('AG06-FDO', 'AG06-FDO'),
    ('AG07-FDO', 'AG07-FDO'),
    ('AG08-FDO', 'AG08-FDO'),
    ('AG01-NMT', 'AG01-NMT'),
    ('AG02-NMT', 'AG02-NMT'),
    ('AG03-NMT', 'AG03-NMT'),
    ('AG04-NMT', 'AG04-NMT'),
    ('AG05-NMT', 'AG05-NMT'),
    ('AG06-NMT', 'AG06-NMT'),
    ('AG07-NMT', 'AG07-NMT'),
    ('AG08-NMT', 'AG08-NMT'),
]

SUCURSAL = [
    ('', ''),
    ('SIBUNDOY', 'Sibundoy'),
    ('MOCOA', 'Mocoa'),
    ('VILLAGARZON', 'Villagarzon'),
    ('PUERTO ASIS', 'Puerto Asis'),
    ('PUERTO LEGUIZAMO', 'Puerto Leguizamo'),
    ('ORITO', 'Orito'),
    ('HORMIGA', 'Hormiga'),
    ('DORADA', 'Dorada'),
    
]

CLASIFICACION = [
    ('', ''),
    ('Equipo de cómputo', 'Equipo de cómputo'),
    ('Equipo de comunicación y audiovisual', 'Equipo de comunicación y audiovisual'),
    ('Electrodomésticos', 'Electrodomésticos'),
    ('Menaje', 'Menaje'),
    ('Adornos', 'Adornos'),
    ('Muebles y enseres', 'Muebles y enseres'),
    ('Otros', 'Otros'),
]

RECURSOS = [
    ('', ''),
    ('GASTO', 'GASTO'),
    ('FONDO DE EDUCACION', 'FONDO DE EDUCACION'),
    ('FONDO DE SOLIDARIDAD', 'FONDO DE SOLIDARIDAD'),
    ('OTRO', 'OTRO'),
]

ESTADO = [
    ('', ''),
    ('NUEVO', 'NUEVO'),
    ('BUENO', 'BUENO'),
    ('REGULAR', 'REGULAR'),
    ('MALO', 'MALO'),
    ('OBSOLETO', 'OBSOLETO'),
]

class EquipoForm(forms.ModelForm):
    class Meta:
        model = Equipo
        fields = "__all__"
        widgets = {
            'codigo': forms.Select(attrs={'class': 'form-control'}, choices=CODIGO),
            'descripcion': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Descripción del elemento'}),
            'serial': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Serial'}),
            'marca': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Marca'}),
            'modelo': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Modelo'}),
            'color': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Color'}),
            'sucursal': forms.Select(attrs={'class': 'form-control'}, choices=SUCURSAL),
            'clasificacion': forms.Select(attrs={'class': 'form-control'}, choices=CLASIFICACION),
            'valor': forms.NumberInput(attrs={'class': 'form-control', 'placeholder': 'Valor'}),
            'fecha_compra': forms.DateInput(attrs={'class': 'form-control', 'type': 'date'}),
            'recursos': forms.Select(attrs={'class': 'form-control'}, choices=RECURSOS),
            'estado': forms.Select(attrs={'class': 'form-control'}, choices=ESTADO),
            'cargo_funcionario': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Cargo del funcionario'}),
            'funcionario_responsable': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Nombre del funcionario'}),
            'proveedor': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Proveedor'}),
            'observaciones': forms.Textarea(attrs={'class': 'form-control', 'rows': 3}),
        }
