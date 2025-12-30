document.addEventListener("DOMContentLoaded", function () {

  // 👇 LOS VALUES SON EXACTAMENTE LOS DE LA BD
  const AGENCIAS = [
    { value: 'MOCOA', display: 'Mocoa' },
    { value: 'PUERTO ASIS', display: 'Puerto Asis' },
    { value: 'DORADA', display: 'Dorada' },
    { value: 'HORMIGA', display: 'Hormiga' },
    { value: 'ORITO', display: 'Orito' },
    { value: 'VILLA GARZON', display: 'Villa Garzon' },
    { value: 'PUERTO LEGUIZAMO', display: 'Puerto Leguizamo' },
    { value: 'SIBUNDOY', display: 'Sibundoy' }
  ];

  /* =========================
     MODAL EDITAR
  ========================= */
  document.querySelectorAll('.btn-editar').forEach(btn => {
    btn.onclick = () => {

      edit_id.value = btn.dataset.id;
      edit_username.value = btn.dataset.username;
      edit_first_name.value = btn.dataset.first_name;
      edit_email.value = btn.dataset.email;

      edit_superuser.value = btn.dataset.superuser === "True" ? "1" : "0";
      edit_active.value = btn.dataset.active === "True" ? "1" : "0";

      const agenciaUsuario = btn.dataset.agencia; // 👈 VIENE DE BD

      edit_agencia.innerHTML = '';

      AGENCIAS.forEach(a => {
        const opt = document.createElement("option");
        opt.value = a.value;       // BD
        opt.textContent = a.display; // visible

        if (a.value === agenciaUsuario) {
          opt.selected = true; // ✅ AHORA SÍ COINCIDE
        }

        edit_agencia.appendChild(opt);
      });
    };
  });

  /* =========================
     MODAL CLAVE
  ========================= */
  document.querySelectorAll('.btn-clave').forEach(btn => {
    btn.onclick = () => {
      clave_id.value = btn.dataset.id;
    };
  });

  /* =========================
     MODAL ELIMINAR
  ========================= */
  document.querySelectorAll('.btn-eliminar').forEach(btn => {
    btn.onclick = () => {
      delete_id.value = btn.dataset.id;
      delete_username.innerText = btn.dataset.username;
    };
  });

});
