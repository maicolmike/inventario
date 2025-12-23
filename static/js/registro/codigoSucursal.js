document.addEventListener("DOMContentLoaded", function () {
    const codigoSelect = document.getElementById("id_codigo");
    const sucursalSelect = document.getElementById("id_sucursal");

    // Relación código → sucursal
    const reglas = {
        "ag01-fdo": "mocoa",
        "ag01-nmt": "mocoa",
        "ag02-fdo": "sibundoy",
        "ag02-nmt": "sibundoy",
        "ag03-fdo": "puerto asis",
        "ag03-nmt": "puerto asis",
        "ag04-fdo": "hormiga",
        "ag04-nmt": "hormiga",
        "ag05-fdo": "orito",
        "ag05-nmt": "orito",
        "ag06-fdo": "puerto leguizamo",
        "ag06-nmt": "puerto leguizamo",
        "ag07-fdo": "dorada",
        "ag07-nmt": "dorada",
        "ag08-fdo": "villagarzon",
        "ag08-nmt": "villagarzon"
    };

    codigoSelect.addEventListener("change", function () {
        const codigoSeleccionado = this.value;

        if (reglas[codigoSeleccionado]) {
            sucursalSelect.value = reglas[codigoSeleccionado];
            sucursalSelect.dispatchEvent(new Event("change")); // por si usas validaciones extras
        } else {
            sucursalSelect.value = "";
        }
    });
});
