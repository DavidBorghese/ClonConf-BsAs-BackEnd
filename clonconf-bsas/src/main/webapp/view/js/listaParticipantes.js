const deleteModal = document.getElementById('deleteModal')
if (deleteModal) {
  deleteModal.addEventListener('show.bs.modal', event => {
    // Button that triggered the modal
    const button = event.relatedTarget
    // Extract info from data-bs-* attributes
    const idDel = button.getAttribute('idDel')
    const nombre = button.getAttribute('nombre')
    const apellido = button.getAttribute('apellido')
    // If necessary, you could initiate an Ajax request here
    // and then do the updating in a callback.

    // Update the modal's content.
    const modalTitle = deleteModal.querySelector('.modal-title')
    const modalBodyInput = deleteModal.querySelector('.modal-body input')
	modalTitle.textContent = `Eliminar  ${apellido +"  "+ nombre}`
    modalBodyInput.value = idDel
  })
}


const updateModal = document.getElementById('updateModal')
if (updateModal) {
  updateModal.addEventListener('show.bs.modal', event => {
    // Button that triggered the modal
    const button = event.relatedTarget
    // Extract info from data-bs-* attributes
    const idUpd = button.getAttribute('idUpd')
    const nombre = button.getAttribute('nombre')
    const apellido = button.getAttribute('apellido')
    const dni = button.getAttribute('dni')
    const email = button.getAttribute('email')
    const telefono = button.getAttribute('telefono')
    const cantidad = button.getAttribute('cantticket')
    const ocupacion = button.getAttribute('ocupacion')
    const estudios = button.getAttribute('estudios')
    // If necessary, you could initiate an Ajax request here
    // and then do the updating in a callback.

    // Update the modal's content.
    
    const modalBodyidUpd = updateModal.querySelector('.modal-body #idUpd')
    const modalBodyNombre = updateModal.querySelector('.modal-body #nombre')
    const modalBodyApellido = updateModal.querySelector('.modal-body #apellido')
    const modalBodyDni = updateModal.querySelector('.modal-body #dni') 
    const modalBodyEmail = updateModal.querySelector('.modal-body #email') 
    const modalBodyTelefono = updateModal.querySelector('.modal-body #telefono')
    const modalBodyCantidad = updateModal.querySelector('.modal-body #cantticket') 
    const modalBodyOcupacion = updateModal.querySelector('.modal-body #ocupacion') 
    const modalBodyEstudios = updateModal.querySelector('.modal-body #estudios')   
    
    modalBodyidUpd.value=idUpd
    modalBodyNombre.value=nombre
    modalBodyApellido.value=apellido
    modalBodyDni.value=dni
    modalBodyEmail.value=email
    modalBodyTelefono.value=telefono
    modalBodyCantidad.value=cantidad
    modalBodyOcupacion.value=ocupacion
    modalBodyEstudios.value=estudios
  })
}