// Ritorna a TOP page dopo il refresh
$(document).ready(function(){
    $(this).scrollTop(0);
});

// funzione per height in base ad ogni risoluzione di schermo
window.onload = 
function heightBody(){
    document.getElementById("body").style.height = window.screen.height + "px";
}