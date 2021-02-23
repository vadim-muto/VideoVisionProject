function openFile(){
	document.getElementById("chooseImage").click();
}

window.onload = 
function initialize(){
	document.getElementById("body").style.height = window.screen.height + "px";
	var checkBox = localStorage.getItem("dark");
	changeColorOnload(checkBox);
	document.getElementById("modifica").addEventListener("click", modifica);	
	document.getElementById("modificaPassword").addEventListener("click", modificaPass);	
	//document.getElementById("password").addEventListener('keyup', controlloModifica);	
}	

var file;
var fileName;
function setImage(){
	file = event.target.files[0];
	uploadImage();
}

function uploadImage(){
	var token = "3kKKuvFYXOoAAAAAAAAAAQS05636Spd9eWz0a-ETmbyl-0MaCSZ4yFe1rzVXZ_MB";
    fileName = $('input[type=file]')[0].files[0].name,
        dbxHeaderParams = {
            'path': '/' + fileName,
            'mode': { '.tag': 'add' },
            'autorename': true
        };
    $.ajax({
        url: 'https://content.dropboxapi.com/2/files/upload',
        type: 'POST',
        headers: {
            'Authorization': 'Bearer ' + token,
            'Content-Type': 'application/octet-stream',
            'Dropbox-API-Arg': JSON.stringify(dbxHeaderParams)
        },
        data: file,
        processData: false,
        contentType: false,
        success: function(result) {
        	insertImage();
        },
        error: function(error) {
        	console.log("Immagine non caricata");
        }
    });
}

function insertImage(){
	$.ajax({
        url: "updateFoto",
        method: "POST",
        data: {foto_profilo: fileName},
        success: function(result) {
    		document.getElementById("imgProfilo").src = result;
        },
        error: function(error) {
        	console.log("NO");
        }
    });
}

function cambioDati(){
	var name = document.getElementById("nome").value;
	var surname = document.getElementById("cognome").value;
	$.ajax({
        url: "updateInformazioni",
        method: "POST",
        data: {nome: name, cognome: surname},
        success: function(result) {
        	if(result === "SUCCESS"){
	    		document.getElementById("nome").value = name;
	    		document.getElementById("cognome").value = surname;
	    		document.getElementById("nome").disabled = true;
				document.getElementById("cognome").disabled = true;
				document.getElementById("conferma").disabled = true;
	    	}
    		
        },
        error: function(error) {
        	console.log("NO");
        }
    });

}

function cambioPassword(){
	var nuovaPassword = document.getElementById("password").value;
	$.ajax({
        url: "updateInformazioniPass",
        method: "POST",
        data: {password: nuovaPassword},
        success: function(result) {
        	if(result==="SUCCESS"){
    			document.getElementById("password").disabled = true;
    			document.getElementById("cambiaPsw").disabled = true;
    			document.getElementById("l1").remove();
    			document.getElementById("i1").remove();
    		}
        },
        error: function(error) {
        	console.log("NO");
        }
    });
}

function modifica(){
	document.getElementById("modifica").disabled = true;
	document.getElementById("conferma").disabled = false;
	document.getElementById("nome").disabled = false;
	document.getElementById("cognome").disabled = false;
}

function modificaPass(){
	document.getElementById("modificaPassword").removeEventListener("click", modificaPass);	
	document.getElementById("cambiaPsw").disabled = false;
	document.getElementById("password").disabled = false;
	var label = document.createElement("label");
	label.setAttribute("id","l1");
	label.innerHTML = "Conferma Password:";
	label.className = "col-md-5";
	var inputConferma = document.createElement("input");
	inputConferma.setAttribute("id","i1");
	inputConferma.className = "col-md-6";
	inputConferma.placeholder = "Ripeti nuova password";
	inputConferma.type = "password";
	document.getElementById("rowPassword").append(label);
	document.getElementById("rowPassword").append(inputConferma);
}

function changeColorOnload(checkBox){
    if (checkBox == "dark"){
        darkMode();
        localStorage.setItem("dark", "dark");
        document.getElementById("customSwitches").checked = true;
    }
    else{
        whiteMode();
        localStorage.setItem("dark", "white");
        document.getElementById("customSwitches").checked = false;
	}
}

function changeColor(){
    var checkBox = document.getElementById("customSwitches");
    if (checkBox.checked == true){
        darkMode();
        localStorage.setItem("dark", "dark");
    }
    else{
        whiteMode();
        localStorage.setItem("dark", "white");
	}
}


function darkMode(){
	document.body.style.backgroundImage = "none";
    document.body.className = "bg-dark";
    document.getElementById("superiore").style.backgroundImage = "none";
	document.getElementById("superiore").className= "navbar navbar-expand-sm bg-dark navbar-light justify-content-between";
	document.getElementById("occhio").src="/images/logoUfficialeDarkMode.png";
	document.getElementById("navProfilo").style.backgroundImage = "none";
	document.getElementById("nomeProfilo").style.color = "white";
	document.getElementById("navProfilo").className = "navbar navbar-expand-sm bg-dark";
	document.getElementById("navLink").style.backgroundImage = "none";
	document.getElementById("navLink").className = "navbar navbar-expand-sm bg-dark";
	document.getElementById("centrale").className = "bg-secondary text-dark";
	document.getElementById("navProfilo").style.border = "2px solid";
	document.getElementById("navLink").style.border = "3px solid";
	document.getElementById("modalContentSettings").className = "modal-content text-light bg-dark";
	document.getElementById("modalContentInformazioni").className = "modal-content text-light bg-dark";
	document.getElementById("modalFooterInformazioni").className = "modal-footer text-light bg-dark";
	document.getElementById("buttonXInformazioni").className = "text-light";
    document.getElementById("switchModal1").className = "list-group-item text-light bg-dark";
    document.getElementById("switchModal2").className = "list-group-item text-light bg-dark";
    document.getElementById("switchModal3").className = "list-group-item text-light bg-dark";
    document.getElementById("aItemModal3").className = "text-light text-decoration-none";
    document.getElementById("aItemModal4").className = "text-light text-decoration-none";
    document.getElementById("iscritti").style.color = "white";
    document.getElementById("video").style.color = "white";
    document.getElementById("playlist").style.color = "white";
    document.getElementById("iscrizioni").style.color = "white";
    document.getElementById("informazioni").style.color = "white";
    document.getElementById("buttonXSettings").className = "close text-light";
    
    var an = document.getElementsByClassName("info");
   	for(var i =0; i<an.length; i++){
   		an[i].style.borderLeftColor = "black";
   		an[i].style.borderBottomColor = "black";
   	}
   	
   	var inp = document.getElementsByTagName("input");
   	
   	for(var i =0; i<inp.length; i++){
   		inp[i].style.borderLeftColor = "black";
   		inp[i].style.borderBottomColor = "black";
   	}
   
    var x = document.getElementsByTagName("a");
	var i;
	for (i = 0; i < x.length; i++) {
  		x[i].style.color = "white";
	}
}

function whiteMode(){
    document.getElementById("body").className = "";
    document.getElementById("nomeProfilo").style.color = "black";
    document.getElementById("iscritti").style.color ="black";
    document.body.style.backgroundImage = "linear-gradient(to right, rgb(250, 255, 252), rgb(56, 83, 255)";
    document.getElementById("superiore").className = "navbar navbar-expand-sm justify-content-between";
    document.getElementById("superiore").style.backgroundImage = "linear-gradient(to right, rgb(250, 255, 252), rgb(56, 83, 255))";
    document.getElementById("occhio").src="/images/logoVideoVision.png";
    document.getElementById("navProfilo").style.backgroundImage = "linear-gradient(to right, rgb(106, 103, 255), rgb(230, 235, 232))";
	document.getElementById("navProfilo").className = "navbar navbar-expand-sm";
	document.getElementById("navLink").style.backgroundImage = "linear-gradient(to right, rgb(106, 103, 255), rgb(230, 235, 232))";
	document.getElementById("navLink").className = "navbar navbar-expand-sm";
	document.getElementById("centrale").className = "bg-light text-dark";
	document.getElementById("centrale").style.border = "0px solid";
	document.getElementById("navProfilo").style.border = "0px solid";
	document.getElementById("navLink").style.border = "0px solid";
	document.getElementById("modalContentSettings").className = "modal-content text-dark bg-light";
	document.getElementById("modalContentInformazioni").className = "modal-content text-dark bg-light";
	document.getElementById("modalFooterInformazioni").className = "modal-footer text-dark bg-light";
	document.getElementById("buttonXInformazioni").className = "text-dark";
    document.getElementById("switchModal1").className = "list-group-item text-dark bg-light";
    document.getElementById("switchModal2").className = "list-group-item text-dark bg-light";
    document.getElementById("switchModal3").className = "list-group-item text-dark bg-light";
    document.getElementById("aItemModal3").className = "text-dark text-decoration-none";
    document.getElementById("aItemModal4").className = "text-dark text-decoration-none";
    document.getElementById("iscritti").style.color = "black";
    document.getElementById("video").style.color = "black";
    document.getElementById("playlist").style.color = "black";
    document.getElementById("iscrizioni").style.color = "black";
    document.getElementById("informazioni").style.color = "black";
    document.getElementById("buttonXSettings").className = "close text-dark";
    
    var an = document.getElementsByClassName("info");
   	for(var i =0; i<an.length; i++){
   		an[i].style.borderLeftColor = "#2196F3";
   		an[i].style.borderBottomColor = "#2196F3";
   	}
   	
   	var inp = document.getElementsByTagName("input");
   	
   	for(var i =0; i<inp.length; i++){
   		inp[i].style.borderLeftColor = "#2196F3";
   		inp[i].style.borderBottomColor = "#2196F3";
   	}
   	
    var x = document.getElementsByTagName("a");
	var i;
	for (i = 0; i < x.length; i++) {
  		x[i].style.color = "";
  	}
}

$(document).ready(function(){
	$("#myModalSettings").on('show.bs.modal', function(){
		var x = document.getElementsByTagName("html");
		x[0].style.overflowY = "hidden";
	});
});

$(document).ready(function(){
	$("#myModalSettings").on('hidden.bs.modal', function(){
		var x = document.getElementsByTagName("html");
		x[0].style.overflowY = "scroll";
	});
});

function submitFormFeedback(){
	document.getElementById("formFeedback").submit();
}