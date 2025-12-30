document.addEventListener("DOMContentLoaded", function () {

  const AGENCIAS = [
    'Mocoa','Puerto Asis','Dorada','Hormiga',
    'Orito','Villa Garzon','Puerto Leguizamo','Sibundoy'
  ];

  document.querySelectorAll('.btn-editar').forEach(btn => {
    btn.onclick = () => {
      edit_id.value = btn.dataset.id;
      edit_username.value = btn.dataset.username;
      edit_first_name.value = btn.dataset.first_name;
      edit_email.value = btn.dataset.email;
      edit_superuser.value = btn.dataset.superuser === "True" ? "1" : "0";
      edit_active.value = btn.dataset.active === "True" ? "1" : "0";

      edit_agencia.innerHTML = '';
      AGENCIAS.forEach(a => {
        let opt = document.createElement("option");
        opt.value = a;
        opt.text = a;
        if (a === btn.dataset.agencia) opt.selected = true;
        edit_agencia.appendChild(opt);
      });
    };
  });

  document.querySelectorAll('.btn-clave').forEach(btn => {
    btn.onclick = () => clave_id.value = btn.dataset.id;
  });

  document.querySelectorAll('.btn-eliminar').forEach(btn => {
    btn.onclick = () => {
      delete_id.value = btn.dataset.id;
      delete_username.innerText = btn.dataset.username;
    };
  });

});
