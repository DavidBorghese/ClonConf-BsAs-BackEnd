//Una arrow function para hacer uso e la funcion validate de bootrstrap en los formularios
    (() => {
        'use strict'
    

        const forms = document.querySelectorAll('.needs-validation')
    

        Array.from(forms).forEach(form => {
        form.addEventListener('submit', event => {
            if (!form.checkValidity()) {
            event.preventDefault()
            event.stopPropagation()
            }
    
            form.classList.add('was-validated')
        }, false)
        })
    })()


    //Función para usar un link adentro de un boton de bootstrap
function goBuyTickets() {
    window.location.href = "./pages/buyTickets.html";
}

let nodoCantidadTickets = document.getElementById("inputCantidad");
let cantTickets = 1
nodoCantidadTickets.addEventListener('change', ()=>{
    cantTickets = parseInt(nodoCantidadTickets.value);
});

let categoria = document.getElementById("selectCategoria");
let categoriaSeleccionada = "1";
categoria.addEventListener('change', ()=>{
    categoriaSeleccionada = categoria.value;
});

let monto = document.getElementById("resumen");

let nodoForm = document.getElementById("formulario");
nodoForm.addEventListener('submit', ()=>{
    event.preventDefault();

    let totalEntrada;
    switch ((parseInt(categoriaSeleccionada))) {
        case 1:
            totalEntrada = (cantTickets * 200) * 0.2;
            break;
        case 2:
            totalEntrada = (cantTickets * 200) * 0.5;
            break;
        case 3:
            totalEntrada = (cantTickets * 200) * 0.85;
            break;
    }
    monto.innerHTML = `Total a Pagar:  ${totalEntrada} $`;
    console.log(totalEntrada)
})

function cambiaSelect(valor) {
    categoria.value=valor
}

