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
    const user = button.getAttribute('user')
    const pass = button.getAttribute('pass')
    const permisos = button.getAttribute('permisos')
    // If necessary, you could initiate an Ajax request here
    // and then do the updating in a callback.

    // Update the modal's content.
    
    const modalBodyidUpd = updateModal.querySelector('.modal-body #idUpd')
    const modalBodyNombre = updateModal.querySelector('.modal-body #nombre')
    const modalBodyApellido = updateModal.querySelector('.modal-body #apellido')
    const modalBodyUser = updateModal.querySelector('.modal-body #user') 
    const modalBodyPass = updateModal.querySelector('.modal-body #pass') 
    const modalBodyPermisos = updateModal.querySelector('.modal-body #permisos')   
    
    modalBodyidUpd.value=idUpd
    modalBodyNombre.value=nombre
    modalBodyApellido.value=apellido
    modalBodyUser.value=user
    modalBodyPass.value=pass
    modalBodyPermisos.value=permisos
  })
}