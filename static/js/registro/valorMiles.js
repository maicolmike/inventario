document.addEventListener("DOMContentLoaded", function () {
    let input = document.querySelector("input[name='valor']");
    if (!input) return;

    function formatNumber(value) {
        return value.replace(/\B(?=(\d{3})+(?!\d))/g, ".");
    }

    input.addEventListener("input", function () {
        let raw = input.value.replace(/\./g, "").replace(/\D/g, "");
        if (raw === "") {
            input.value = "";
            return;
        }
        input.value = formatNumber(raw);
    });

    // Antes de enviar → quitar puntos
    input.form.addEventListener("submit", function () {
        input.value = input.value.replace(/\./g, "");
    });
});