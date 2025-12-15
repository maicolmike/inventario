document.addEventListener("DOMContentLoaded", function () {
    const codigoSelect = document.getElementById("id_codigo");
    const sucursalSelect = document.getElementById("id_sucursal");

    // Relación código → sucursal
    const reglas = {
        "AG01-FDO": "Mocoa",
        "AG01-NMT": "Mocoa",
        "AG02-FDO": "Sibundoy",
        "AG02-NMT": "Sibundoy",
        "AG03-FDO": "Puerto Asis",
        "AG03-NMT": "Puerto Asis",
        "AG04-FDO": "Hormiga",
        "AG04-NMT": "Hormiga",
        "AG05-FDO": "Orito",
        "AG05-NMT": "Orito",
        "AG06-FDO": "Puerto Leguizamo",
        "AG06-NMT": "Puerto Leguizamo",
        "AG07-FDO": "Dorada",
        "AG07-NMT": "Dorada",
        "AG08-FDO": "Villagarzon",
        "AG08-NMT": "Villagarzon",
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
