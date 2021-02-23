var valueCategoryFilter = 0;
var usernameLogged = 0;

window.onbeforeunload = function () {
    if(window.scrollTo) window.scrollTo(0,0);
};

$(document).ready(function(){
  $('[data-toggle="tooltip"]').tooltip();
});

window.onload = 
function heightBody(){
	document.getElementById('sidebarCollapse').disabled = false;
    document.getElementById("sidebar").style.minHeight = (window.innerHeight-($("#superiore").height())) + "px";
    document.getElementById("sidebar").style.maxHeight = (window.innerHeight-($("#superiore").height())) + "px";
    document.getElementById("sidebar").style.height = window.innerHeight + "px";
	document.getElementById("body").style.height = window.innerHeight + "px";
	color();
	doesConnectionExist();
	if(usernameLogged == 1){
		changeColorSidebar()
	}
}

$(document).ready(function(){
	document.getElementById('sidebarCollapse').disabled = true;
    $('sidebarCollapse').prop('disabled',true);
});

function doesConnectionExist() {
    var xhr = new XMLHttpRequest();
    var file = "https://i.imgur.com/7ofBNix.png";
    var randomNum = Math.round(Math.random() * 10000);
    xhr.open('HEAD', file + "?rand=" + randomNum, true);
    xhr.send();
    xhr.addEventListener("readystatechange", processRequest, false);
 
    function processRequest(e) {
      if (xhr.readyState == 4) {
        if (xhr.status >= 200 && xhr.status < 304) {
        	document.getElementById("divSpinner").style.display = "none";
        	document.getElementById("divVideo").style.display = "block";
        } else {
        	document.getElementById("divSpinner").style.display = "block";
        	document.getElementById("divVideo").style.display = "none";
        }
      }
    }
}

function setCategory(){
	if (valueCategoryFilter == 0){
		openCategory()
		valueCategoryFilter = 1;
	}
	else{
		closeCategory()
		valueCategoryFilter = 0;
	}
}

function disactiveFocus(bottoneCorrente){
	document.getElementById("textFiltro").value = bottoneCorrente.value;
	document.getElementById("primoFiltro").blur();
	document.getElementById("secondoFiltro").blur();

}

function openCategory(){
	document.getElementById("listCategory").style.display = "block";
}

function closeCategory(){
	document.getElementById("listCategory").style.display = "none";
	document.getElementById("terzoFiltro").blur();
}

function disableTooltip(){
	$('#divTooltip').tooltip('hide');
	document.getElementById("aFilter").blur();
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

window.onresize = reportWindowSize;
function reportWindowSize() {
	 document.getElementById("sidebar").style.minHeight = (window.innerHeight-($("#superiore").height())) + "px";
	 document.getElementById("sidebar").style.maxHeight = (window.innerHeight-($("#superiore").height())) + "px";
	 document.getElementById("sidebar").style.height = window.innerHeight + "px";
}

function settaVideo(){
	document.getElementById("setVideo").value = event.currentTarget.value;
}

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
	document.getElementById("sidebar").style.backgroundImage = "none";
	document.getElementById("sidebar").className = "collapse bg-dark";
	document.getElementById("occhio").src="/images/logoUfficialeDarkMode.png";
	document.getElementById("body").className = "bg-secondary";
	document.getElementById("navFilter").className = "navbar navbar-expand-sm bg-secondary navbar-secondary";
	document.getElementById("navFilterCollapse").className = "navbar navbar-expand-sm bg-secondary navbar-secondary";
	document.getElementById("primoFiltro").className = "nav-link text-light";
	document.getElementById("secondoFiltro").className = "nav-link text-light";
	document.getElementById("terzoFiltro").className = "nav-link text-light";
	document.getElementById("aFilter").className = "text-warning text-decoration-none";
	document.getElementById("divVideo").className = "container text-light";
	document.getElementById("divSpinner").className = "spinner-border text-primary";
	document.getElementById("categoriaUno").className = "nav-link text-light text-decoration-none";
	document.getElementById("categoriaDue").className = "nav-link text-light text-decoration-none";
	document.getElementById("categoriaTre").className = "nav-link text-light text-decoration-none";
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
	var a = document.getElementById("list").children;
	for(var i=0; i<a.length; i++){
		a[i].className = "list-group-item bg-dark text-light list-group-item-action";
	}
	
}

function whiteMode(){
    document.getElementById("superiore").className = "navbar navbar-expand-sm justify-content-between";
    document.getElementById("superiore").style.backgroundImage = "linear-gradient(to right, rgb(250, 255, 252), rgb(56, 83, 255))";
    document.getElementById("sidebar").style.backgroundImage = "linear-gradient(to top, rgb(250, 255, 252), rgb(56, 83, 255))";
	document.getElementById("sidebar").className = "collapse";
	document.getElementById("occhio").src="/images/logoVideoVision.png";
	document.getElementById("body").className = "bg-light";
	document.getElementById("navFilter").className = "navbar navbar-expand-sm bg-light navbar-light";
	document.getElementById("navFilterCollapse").className = "navbar navbar-expand-sm bg-light navbar-light";
	document.getElementById("primoFiltro").className = "nav-link text-dark";
	document.getElementById("secondoFiltro").className = "nav-link text-dark";
	document.getElementById("terzoFiltro").className = "nav-link text-dark";
	document.getElementById("aFilter").className = "text-primary text-decoration-none";
	document.getElementById("divVideo").className = "container text-dark";
	document.getElementById("divSpinner").className = "spinner-border text-muted";
	document.getElementById("categoriaUno").className = "nav-link text-dark text-decoration-none";
	document.getElementById("categoriaDue").className = "nav-link text-dark text-decoration-none";
	document.getElementById("categoriaTre").className = "nav-link text-dark text-decoration-none";
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
	var a = document.getElementById("list").children;
	for(var i=0; i<a.length; i++){
		if(i==0)
			a[i].className = "list-group-item list-group-item-action active";
		else
			a[i].className = "list-group-item list-group-item-action";
	}
}

function playVideo(e, linkVideo){
	var link = linkVideo;
	e.src = link;
	e.poster = "";
	e.play();
}

function pauseVideo(e, linkFoto){
	e.pause();
	e.src = "";
	e.poster = linkFoto;
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

function scegliVideo(videoCorrente, stringFoto){
	var stringVideo = videoCorrente.src;
	document.getElementById("inputVideo").value = stringVideo;
	document.getElementById("formVideo").submit();
}

function setUsernameLogged(value){
	usernameLogged = value;
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

var nameUser;
function setUsername(user){
	nameUser = user;
}

function checkIscriviti(profiloCanale){
	if (nameUser == profiloCanale){
		document.getElementById(nameUser).style.display = "none";
	}
}

function submitFormCanale(canale){
	var usernameCanale = canale.textContent;
	if(usernameCanale === nameUser){
		document.getElementById("formAreaPersonale").submit();
	}
	else{
		document.getElementById("nomeCanale").value = usernameCanale;
		document.getElementById("formCanale").submit();
	}
}

var iscritto = 0;
function setIscritto(value, canale){
	iscritto = value;
	if(iscritto == 1){
		document.getElementById(canale).onclick = function(){
			annullaIscrizione();
		};
	}
	else{
		document.getElementById(canale).onclick = function(){
			iscrivi();
		}; 
	}
}

function annullaIscrizione(){
	var user = event.currentTarget.value;
	$.ajax({
        url: "annullaIscrizione",
        method: "POST",
        data: {usernameCanale: user},
        success: function(result) {
    		setIscritto(0, user);
    		document.getElementById(user).innerHTML = "Iscriviti";
    		var nameSpan = "span" + user;
    		var nameSpan = "span" + user;
    		var numIscritti = document.getElementById(nameSpan).textContent;
    		document.getElementById(nameSpan).textContent = parseInt(numIscritti) - 1;
        },
        error: function(error) {
        	console.log("errore");
        }
    });
}

function iscrivi(nameCanale){
	var user = event.currentTarget.value;
	$.ajax({
        url: "iscriviCanale",
        method: "POST",
        data: {usernameCanale: user},
        success: function(result) {
    		setIscritto(1, user);
    		document.getElementById(user).innerHTML = "Disiscriviti";
    		var nameSpan = "span" + user;
    		var numIscritti = document.getElementById(nameSpan).textContent;
    		document.getElementById(nameSpan).textContent = parseInt(numIscritti) + 1;
        },
        error: function(error) {
        	console.log("errore");
        }
    });
}

function stampaSpan(span){
	
}