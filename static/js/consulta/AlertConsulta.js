document.addEventListener('DOMContentLoaded', function () {
  const form = document.querySelector('.form-create');

  form.addEventListener('submit', async function (event) {
      event.preventDefault(); // Evitar recarga completa

      const formData = new FormData(form);

      try {
          const response = await fetch(form.action, {
              method: 'POST',
              body: formData,
              headers: {
                  'X-Requested-With': 'XMLHttpRequest',
              },
          });

          if (response.ok) {
              const data = await response.json();
              const { estado, mensaje, mensaje3,mensaje2 } = data;

              let icon = estado === 'HABIL' ? 'success' 
                         : estado === 'INHABIL' ? 'error' 
                         : 'warning'; // Icono para no encontrada

              Swal.fire({
                  title: estado === 'HABIL' ? 'HABIL' 
                         : estado === 'INHABIL' ? 'INHABIL' 
                         : 'No Encontrado',
                  html: `<p>${mensaje}</p><p>${mensaje3}</p><p>${mensaje2}</p>`, // Mostrar ambos mensajes
                  icon: icon,
                  confirmButtonText: 'Ok',
              });
          } else {
              Swal.fire({
                  title: 'Error',
                  text: 'Ocurrió un problema al procesar la solicitud.',
                  icon: 'error',
                  confirmButtonText: 'Ok',
              });
          }
      } catch (error) {
          Swal.fire({
              title: 'Error',
              text: 'No se pudo conectar con el servidor.',
              icon: 'error',
              confirmButtonText: 'Ok',
          });
      }
  });
});
