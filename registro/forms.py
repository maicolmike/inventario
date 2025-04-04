from django import forms
from .models import Equipo


# Definición de opciones para el campo
MEMORIA_RAM = [
    ('', ''),
    ('4 GB', '4 GB'),
    ('6 GB', '6 GB'),
    ('8 GB', '8 GB'),
    ('10 GB', '10 GB'),
    ('12 GB', '12 GB'),
    ('14 GB', '14 GB'),
    ('16 GB', '16 GB'),
    ('18 GB', '18 GB'),
    ('20 GB', '20 GB'),
    ('22 GB', '22 GB'),
    ('24 GB', '24 GB'),
    ('26 GB', '26 GB'),
    ('28 GB', '28 GB'),
    ('30 GB', '30 GB'),
    ('32 GB', '32 GB'),
    ('64 GB', '64 GB'),
    
]

# Definición de opciones para el campo
CAPACIDAD_MAX = [
    ('', ''),
    ('8 GB', '8 GB'),
    ('10 GB', '10 GB'),
    ('12 GB', '12 GB'),
    ('14 GB', '14 GB'),
    ('16 GB', '16 GB'),
    ('18 GB', '18 GB'),
    ('20 GB', '20 GB'),
    ('22 GB', '22 GB'),
    ('24 GB', '24 GB'),
    ('26 GB', '26 GB'),
    ('28 GB', '28 GB'),
    ('30 GB', '30 GB'),
    ('32 GB', '32 GB'),
    ('64 GB', '64 GB'),
    
]

# Definición de opciones para el campo
TIPO_MEMORIA = [
    ('', ''),
    ('DDR1', 'DDR1'),
    ('DDR2', 'DDR2'),
    ('DDR3', 'DDR3'),
    ('DDR4', 'DDR4'),
    ('DDR5', 'DDR5'),
]

# Definición de opciones para el campo
DISCO_DURO = [
    ('', ''),
    ('HDD', 'HDD'),
    ('SSD', 'SSD'),
]

# Definición de opciones para el campo
CAPACIDAD = [
    ('', ''),
    ('250 GB', '250 GB'),
    ('500 GB', '500 GB'),
    ('1 TB', '1 TB'),
    ('2 TB', '2 TB'),
]

class EquipoForm(forms.ModelForm):
    class Meta:
        model = Equipo
        fields = '__all__'
        widgets = {
            'serial_contabilidad': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Serial Contabilidad'}),
            'marca': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Marca equipo'}),
            'modelo': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Modelo'}),
            'serial': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Serial equipo'}),
            'procesador': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Procesador'}),
            #'memoria_ram': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Tamaño memoria RAM'}),
            'memoria_ram': forms.Select(attrs={'class': 'form-control', 'id': 'memoria_ram',}, choices=MEMORIA_RAM),
            #'capacidad_max': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Capacidad Máxima'}),
            'capacidad_max': forms.Select(attrs={'class': 'form-control', 'id': 'capacidad_max',}, choices=CAPACIDAD_MAX),
            'tipo': forms.Select(attrs={'class': 'form-control', 'id': 'tipo',}, choices=TIPO_MEMORIA),
            'velocidad': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Velocidad memoria ram'}),
            #'disco_duro': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Disco Duro'}),
            'disco_duro': forms.Select(attrs={'class': 'form-control', 'id': 'disco_duro',}, choices=DISCO_DURO),
            #'capacidad': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Capacidad'}),
            'capacidad': forms.Select(attrs={'class': 'form-control', 'id': 'capacidad',}, choices=CAPACIDAD),
            'version_windows': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Versión de Windows'}),
            'clave_windows': forms.PasswordInput(attrs={'class': 'form-control','placeholder': 'Clave de Windows'}),
            'version_office': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Versión de Office'}),
            'clave_office': forms.PasswordInput(attrs={'class': 'form-control'}),
            'ip': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Dirección IP'}),
            'any_desk': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'AnyDesk'}),
            'clave_admin': forms.PasswordInput(attrs={'class': 'form-control'}),
            'funcionario_a_cargo': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Funcionario a Cargo'}),
            'observaciones': forms.Textarea(attrs={'class': 'form-control', 'rows': 3}),
            'funcionario_registra': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Funcionario registra'}),
        }
