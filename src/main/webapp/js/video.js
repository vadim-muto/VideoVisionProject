var usernameLogged = 0;
window.onbeforeunload = function () {
    if(window.scrollTo) window.scrollTo(0,0);
};

function returnTopPage(){
	location.href = "#infoCanale";
}

window.onload = 
function heightBody(){
	document.getElementById('sidebarCollapse').disabled = false;
    document.getElementById("sidebar").style.minHeight = (window.innerHeight-($("#superiore").height())) + "px";
	document.getElementById("sidebar").style.maxHeight = (window.innerHeight-($("#superiore").height())) + "px";
	document.getElementById("sidebar").style.height = window.innerHeight + "px";
	color();
	if(usernameLogged == 1){
		changeColorSidebar()
	}
}

window.onresize = reportWindowSize;
function reportWindowSize() {
	 document.getElementById("sidebar").style.minHeight = (window.innerHeight-($("#superiore").height())) + "px";
	 document.getElementById("sidebar").style.maxHeight = (window.innerHeight-($("#superiore").height())) + "px";
	 document.getElementById("sidebar").style.height = window.innerHeight + "px";
}

$(document).ready(function(){
	document.getElementById('sidebarCollapse').disabled = true;
    $('sidebarCollapse').prop('disabled',true);
});

function createNewPlaylist(){
	var bool = document.getElementById("checkNewPlaylist");
	
	if(bool.checked === true){
		document.getElementById("titleNewPlaylist").disabled = false;
	} 
}

function disableNewPlaylist(){
	document.getElementById("titleNewPlaylist").disabled = true;
}

function addInPlaylist(){
	var pl = document.getElementsByName("p");
	var nomePl;
	if(pl[pl.length-1].checked === true){
		nomePl = document.getElementById("titleNewPlaylist").value;
	}
	else{
		for(var i=0; i<pl.length-1; i++){
			if(pl[i].checked === true){
				nomePl = pl[i].id;
			}
		}
	}
	
	var link = event.currentTarget.value;
	$.ajax({
		url: "addVideoPlaylist",
		method: "POST",
		data: {linkVideo: link, titolo:nomePl},
		success: function(response){
			document.getElementById("messageSuccess").style.color = "forestgreen";
			document.getElementById("messageSuccess").style.fontWeight = "bold";
			document.getElementById("messageSuccess").innerHTML = "Il video &egrave; stato aggiunto!";
			uploadPlaylistResponse();
			if(document.getElementById("titleNewPlaylist").disabled === false){
				var modal = document.getElementById("elencoPlaylist");
				var b = document.createElement("br");
				var rbutton = document.createElement("input");
				rbutton.setAttribute("type", "radio");
				rbutton.setAttribute("name", "p");
				rbutton.setAttribute("id", nomePl);
				var label = document.createTextNode(" " + nomePl);
				modal.prepend(b);
				modal.prepend(label);
				modal.prepend(rbutton);
				document.getElementById("titleNewPlaylist").value = "";
				document.getElementById("titleNewPlaylist").disabled = true;
			}
		},
		error: function(error){
			document.getElementById("messageSuccess").style.color = "red";
			document.getElementById("messageSuccess").style.fontWeight = "bold";
			document.getElementById("messageSuccess").innerHTML = "Il video non &egrave; stato aggiunto!";
			uploadPlaylistResponse();
			document.getElementById("titleNewPlaylist").value = "";
			document.getElementById("titleNewPlaylist").disabled = true;
		}
	});
}

function uploadPlaylistResponse(){
	setTimeout(function(){
		$('#playlistModal').modal('hide');
		document.getElementById("messageSuccess").innerHTML = "";
    }, 1000)
}

function clearArea(){
	var textAreaComment = document.getElementById("comment");
	textAreaComment.value = "";
	var buttonCommenta = document.getElementById("newComment").id;
	enableButton(textAreaComment, buttonCommenta);
}

var lastIdButton;
function setLastIdComment(lastIdDB){
	if(lastIdDB == null){
		lastIdButton = 1;
	}
	lastIdButton = lastIdDB;
}

function modifyComment(idTestoCommento, buttonCorrente){
	returnTopPage();

	var bottonePulisci = document.getElementById("pulisci");
	bottonePulisci.innerHTML = "Annulla";
	bottonePulisci.onclick = function(){
		annullaModifiche();
	}

	var testoCommento = document.getElementById(idTestoCommento).textContent;
	var textAreaComment = document.getElementById("comment");
	textAreaComment.value = testoCommento;
	var buttonCommenta = document.getElementById("newComment");
	buttonCommenta.innerHTML = "Salva";
	buttonCommenta.value = buttonCorrente.id;
	buttonCommenta.onclick = function(){
		inviaModifica();
	}
	enableButton(textAreaComment, buttonCommenta.id);
}

function annullaModifiche(){
	var textArea = document.getElementById("comment");
	textArea.value = "";
	textArea.placeholder = "Inserisci testo commento";
	var bottoneCommenta = document.getElementById("newComment");
	bottoneCommenta.innerHTML = "Commenta";
	bottoneCommenta.onclick = function(){
		addComment();
	}
	var bottonePulisci = document.getElementById("pulisci");
	bottonePulisci.innerHTML = "Pulisci";
	bottonePulisci.onclick = function(){
		clearArea();
	}

	enableButton(textArea, bottoneCommenta.id);
}

function inviaModifica(){
	var identificativoCommento = event.currentTarget.value;
	var nuovoTesto = document.getElementById("comment").value;
	$.ajax({
        url: "modificaCommento",
        method: "POST",
        data: {testo: nuovoTesto, idComment: identificativoCommento},
        success: function(result) {
			var commentoUtente = document.getElementById(identificativoCommento);
			commentoUtente.textContent = nuovoTesto;
			clearArea();
			var buttonCommenta = document.getElementById("newComment");
			buttonCommenta.innerHTML = "Commenta";
			buttonCommenta.value = document.getElementById("inputVideo").value;
			buttonCommenta.onclick = function(){
				addComment();
			}

			var bottonePulisci = document.getElementById("pulisci");
			var textArea = document.getElementById("comment");
			textArea.value = "";
			textArea.placeholder = "Inserisci testo commento";
			bottonePulisci.innerHTML = "Pulisci";
			bottonePulisci.onclick = function(){
				clearArea();
			}
        },
        error: function(error) {
        	console.log("errore nella modifica");
        }
    });
}

var newComment = "nuovoCommento";
function addComment(){
	lastIdButton = parseInt(lastIdButton) + 1;
	var com = document.getElementById("comment").value;
	var textArea = document.getElementById("comment");
	var immagine = document.getElementById("imgProfilo").src;
	var link =  event.target.value;
	var buttonCommenta = document.getElementById("newComment").id;
	$.ajax({
		url: "../doComment",
		method: "POST",
		data: {commento: com, linkVideo: link},
		success: function(response){
			document.getElementById("")
			clearArea();
			enableButton(textArea, buttonCommenta);

			const div = document.createElement("div");
			div.className = "media border";
			div.id = "div" + lastIdButton;
			var img = document.createElement("img");
			img.className = "mr-3 mt-3 rounded-circle";
			img.style = "width:70px; height:70px";
			img.src = immagine;
			div.append(img);
			
			var divBody = document.createElement("div");
			divBody.className = "media-doby";
			
			//h5 PER IL NOME
			var nome = document.createElement("h5");
			nome.innerHTML = document.getElementById("loginBtn").value;
			divBody.append(nome);
			
			//p PER IL COMMENTO 
			var commentoNuovo = document.createElement("p");
			commentoNuovo.id = lastIdButton;
			commentoNuovo.innerHTML = com;
			divBody.append(commentoNuovo);
			
			var nuovo = document.createElement("p");
			nuovo.textContent = "NUOVO COMMENTO";
			nuovo.className = "badge badge-primary";
			divBody.append(nuovo);
			
			div.append(divBody);
			var linea = document.createElement("hr");
			linea.style = "border-bottom:3px solid black";
			document.getElementById("pCommento").append(div);
			document.getElementById("pCommento").append(linea);

			var buttonElimina = document.createElement("button")
			buttonElimina.className = "btn btn-danger";
			buttonElimina.value = lastIdButton;
			buttonElimina.id = lastIdButton;
			buttonElimina.type = "button";
			buttonElimina.textContent = "Elimina";
			divBody.append(" ");
			divBody.append(buttonElimina);

			buttonElimina.onclick = function(){
				deleteComment(newComment);
			}

			var buttonModifica = document.createElement("button")
			buttonModifica.className = "btn btn-primary";
			buttonModifica.value = lastIdButton;
			buttonModifica.id = lastIdButton;
			buttonModifica.type = "button";
			buttonModifica.textContent = "Modifica";
			divBody.append(" ");
			divBody.append(buttonModifica);

			buttonModifica.onclick = function(){
				modifyComment(lastIdButton, buttonModifica);
			}

			var bottonePulisci = document.getElementById("pulisci");
			textArea.value = "";
			textArea.placeholder = "Inserisci testo commento";
			bottonePulisci.innerHTML = "Pulisci";
			bottonePulisci.onclick = function(){
				clearArea();
			}
		},
		error: function(error){
			console.log("Commento non aggiunto");
		}
	});
	document.getElementById("comment").value = "";
}

function addLike(){
	var link =  document.getElementById("newComment").value;
	var valore = document.getElementById("btnLike").value;
	var numeroAggiornato=parseInt(valore);
	numeroAggiornato=numeroAggiornato+1;
	
	$.ajax({
		url: "like",
		method: "POST",
		data: {linkVideo: link},
		success: function (response){
			document.getElementById("numLike").innerHTML = numeroAggiornato;
		},
		error: function (error){
			console.log("Problema like");
		}
	});
}

function addDislike(){
	var link =  document.getElementById("newComment").value;
	var valore = document.getElementById("btnDislike").value;
	var numeroAggiornato=parseInt(valore);
	numeroAggiornato=numeroAggiornato+1;

	$.ajax({
		url: "disLike",
		method: "POST",
		data: {linkVideo: link},
		success: function (response){
			document.getElementById("numDislike").innerHTML = numeroAggiornato;
		},
		error: function (error){
			console.log("Problema disLike");
		}
	});
}

function color(){
	var checkBox = localStorage.getItem("dark");
	
	changeColorOnload(checkBox);
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
	if(usernameLogged == 1){
		changeColorSidebar()
	}
}

function changeColor(){
    var checkBox = document.getElementById("customSwitches");
    if (checkBox.checked == true){
    	if (c==1){
    		clickButton();
    	}
        darkMode();
        localStorage.setItem("dark", "dark");
    }
    else{
    	if (c==1){
    		clickButton();
    	}
        whiteMode();
        localStorage.setItem("dark", "white");
	}
	if(usernameLogged == 1){
		changeColorSidebar()
	}
}

function darkMode(){
	document.getElementById("superiore").style.backgroundImage = "none";
	document.getElementById("superiore").className= "navbar navbar-expand-sm bg-dark navbar-light justify-content-between";
	document.getElementById("content").className = "bg-secondary text-light";
	document.getElementById("sidebar").style.backgroundImage = "none";
	document.getElementById("sidebar").className = "collapse bg-dark";
	document.getElementById("occhio").src="/images/logoUfficialeDarkMode.png";
	document.getElementById("modalContentPlaylist").className = "modal-content text-light bg-dark";
	document.getElementById("elencoPlaylist").className = "modal-body text-light bg-dark";
	document.getElementById("buttonXPlaylist").className = "close text-light";
	document.getElementById("modalContentLogin").className = "modal-content text-light bg-dark";
	document.getElementById("modalContentSettings").className = "modal-content text-light bg-dark";
	document.getElementById("switchModal1").className = "list-group-item text-light bg-dark";
    document.getElementById("switchModal2").className = "list-group-item text-light bg-dark";
    document.getElementById("switchModal3").className = "list-group-item text-light bg-dark";
    document.getElementById("aItemModal3").className = "text-light text-decoration-none";
    document.getElementById("aItemModal4").className = "text-light text-decoration-none";
	document.getElementById("buttonXLogin").className = "close text-light";
	document.getElementById("buttonXSettings").className = "close text-light";
	document.getElementById("logoutButton").className = "noButton text-light";
	document.getElementById("navTitolo").className = "navbar navbar-expand-sm bg-dark text-light navInfo";
	document.getElementById("navUsername").className = "navbar navbar-expand-sm bg-dark text-light navInfo";
	document.getElementById("newCommentNav").className = "navInfo bg-dark text-light";
	document.getElementById("divCommenti").className = "navInfo text-light bg-dark";
	document.getElementById("navDescrizione1").className = "navbar navbar-expand-sm bg-dark text-light navInfo";
	document.getElementById("navDescrizione2").className = "navbar navbar-expand-sm bg-dark text-light navInfo";
	var a = document.getElementById("list").children;
	for(var i=0; i<a.length; i++){
		a[i].className = "list-group-item bg-dark text-light list-group-item-action";
	}
	
}

function whiteMode(){
    document.getElementById("superiore").className = "navbar navbar-expand-sm justify-content-between";
    document.getElementById("superiore").style.backgroundImage = "linear-gradient(to right, rgb(250, 255, 252), rgb(56, 83, 255))";
    document.getElementById("content").className = "";
    document.getElementById("sidebar").style.backgroundImage = "linear-gradient(to top, rgb(250, 255, 252), rgb(56, 83, 255))";
	document.getElementById("sidebar").className = "collapse";
	document.getElementById("occhio").src="/images/logoVideoVision.png";
	document.getElementById("modalContentPlaylist").className = "modal-content text-dark bg-light";
	document.getElementById("elencoPlaylist").className = "modal-body text-dark bg-light";
	document.getElementById("buttonXPlaylist").className = "close text-dark";
	document.getElementById("modalContentLogin").className = "modal-content text-dark bg-light";
	document.getElementById("modalContentSettings").className = "modal-content text-dark bg-light";
	document.getElementById("switchModal1").className = "list-group-item text-dark bg-light";
    document.getElementById("switchModal2").className = "list-group-item text-dark bg-light";
    document.getElementById("switchModal3").className = "list-group-item text-dark bg-light";
    document.getElementById("aItemModal3").className = "text-dark text-decoration-none";
    document.getElementById("aItemModal4").className = "text-dark text-decoration-none";
	document.getElementById("buttonXLogin").className = "close text-dark";
	document.getElementById("buttonXSettings").className = "close text-dark";
	document.getElementById("logoutButton").className = "noButton text-dark";
	document.getElementById("navTitolo").className = "navbar navbar-expand-sm bg-light text-dark navInfo";
	document.getElementById("navUsername").className = "navbar navbar-expand-sm bg-light text-dark navInfo";
	document.getElementById("newCommentNav").className = "navInfo bg-light text-dark";
	document.getElementById("divCommenti").className = "navInfo text-dark bg-light";
	document.getElementById("navDescrizione1").className = "navbar navbar-expand-sm bg-light text-dark navInfo";
	document.getElementById("navDescrizione2").className = "navbar navbar-expand-sm bg-light text-dark navInfo";
	var a = document.getElementById("list").children;
	for(var i=0; i<a.length; i++){
		if(i==0)
			a[i].className = "list-group-item list-group-item-action active";
		else
			a[i].className = "list-group-item list-group-item-action";
	}
}

function visibilityButton(){
	var text = document.getElementById("searchBar").value;
	var patt1 = new RegExp(/\w+\s*/);
	var patt2 = new RegExp(/\s+/);
	var res1 = patt1.test(text);
	var res2 = patt2.test(text);
	if (text == ""){
		document.getElementById("searchButton").disabled = true;
	}
	else if (res1){
		document.getElementById("searchButton").disabled = false;
	}
	else if (res2){
		document.getElementById("searchButton").disabled = true;
	}
}


function loginError(){
	document.getElementById("commentWarning").textContent = "Effettua il login per procedere";
	$('#myModal').modal('show');
}

function removeWarningFromLogin(){
	document.getElementById("loginWarning").textContent = "";
	document.getElementById("commentWarning").textContent= "";
}

function controlloPermessi(){
	loginError();
}

function submitFormLogin(){
	document.getElementById("formRegistrazione").submit();
}

var pubbSrc;
var videoSrc;
function setLinkPubbAndVideo(link1, link2){
	pubbSrc = link1;
	videoSrc = link2;
}

$(window).on('load', function() {
	if (pubbSrc == "")
		return;
	document.getElementById("buttonSkipBupplicita").style.display = "block";
	document.getElementById("bannerPubblicitario").style.display = "block";
	var myVideo = document.getElementById("videoSelezionato");
	if (myVideo == null)
		return;
	myVideo.src = pubbSrc;
});

function skipPubblicita(){
	var myVideo = document.getElementById("videoSelezionato");
	document.getElementById("bannerPubblicitario").style.display = "none";
	document.getElementById("buttonSkipBupplicita").style.display = "none";
    myVideo.src = videoSrc;
}

var c=0;
function clickButton(){
	document.getElementById("iconBtn").style.transition = "0.5s";
	if(c==0){
		document.getElementById("iconBtn").style.transform = "rotate(-90deg)";
		c=1;
		return;
	}
	if(c==1){
		document.getElementById("iconBtn").style.transform = "rotate(0deg)";
		c=0;
		return;
	}
}

function setUsernameLogged(value){
	usernameLogged = value;
}

var nameUser;
function setUsername(user){
	nameUser = user;
}

function checkComment(nameUserComment, btnElimina, btnModifica){
	if (nameUser != nameUserComment){
		document.getElementById(btnElimina).style.display = "none";
		document.getElementById(btnModifica).style.display = "none";
	}
}

function deleteComment(nameButton){
	var identificativoCommento = event.currentTarget.value;
	var linkVideo = document.getElementById("inputVideo").value;
	$.ajax({
        url: "eliminaCommento",
        method: "POST",
        data: {idComment: identificativoCommento, videoDaVisualizzare: linkVideo},
        success: function(result) {
			var element = document.getElementById("div" + identificativoCommento);
			element.remove();
			var elementDivComment = document.getElementById("pCommento");
			if(nameButton == newComment){
				elementDivComment.removeChild(elementDivComment.childNodes[1]);
			}
        },
        error: function(error) {
        	console.log("errore");
        }
    });
}

function submitFormCanale(canale){
	var usernameCanale = canale.textContent;
	if(usernameCanale === nameUser){
		document.getElementById("formAreaPersonale").submit();
	}
	else{
		document.getElementById("usernameVideo").value = usernameCanale;
		document.getElementById("visual").submit();
	}
}

function changeColorSidebar(){
	var checkBox = localStorage.getItem("dark");
	if (checkBox == "dark"){
        document.getElementById("areaPersonale").className = "noButton text-light";
        document.getElementById("caricaVideo").className = "noButton text-light";
        document.getElementById("playlist").className = "noButton text-light";
        document.getElementById("iscrizioni").className = "noButton text-light";
    }
    else{
        document.getElementById("areaPersonale").className = "noButton text-dark";
        document.getElementById("caricaVideo").className = "noButton text-dark";
        document.getElementById("playlist").className = "noButton text-dark";
        document.getElementById("iscrizioni").className = "noButton text-dark";
	}
}

function submitFormInformazioni(){
	document.getElementById("formInformazioni").submit();
}

function submitFormFeedback(){
	document.getElementById("formFeedback").submit();
}

function enableButton(textArea, idButton){
	var commento = textArea.value.lenght;
	if (commento == 0 || textArea.value == ""){
		document.getElementById(idButton).disabled = true;
	}
	else{
		document.getElementById(idButton).disabled = false;
	}
}