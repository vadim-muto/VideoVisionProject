var usernameLogged = 0;
window.onbeforeunload = function () {
    if(window.scrollTo) window.scrollTo(0,0);
};

window.onload = 
function heightBody(){
	document.getElementById('sidebarCollapse').disabled = false;
    document.getElementById("sidebar").style.minHeight = (window.innerHeight-($("#superiore").height())) + "px";
	document.getElementById("sidebar").style.maxHeight = (window.innerHeight-($("#superiore").height())) + "px";
	document.getElementById("sidebar").style.height = window.innerHeight + "px";
	color();
	visibilityButton();
	if(usernameLogged == 1){
		changeColorSidebar()
	}
}

$(document).ready(function(){
	document.getElementById('sidebarCollapse').disabled = true;
    $('sidebarCollapse').prop('disabled',true);
    $('[data-toggle="tooltip"]').tooltip(); 
});

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
	document.getElementById("body").className = "bg-secondary";
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
	var a = document.getElementById("list").children;
	for(var i=0; i<a.length; i++){
		a[i].className = "list-group-item bg-dark text-light list-group-item-action";
	}	
}

function whiteMode(){
	document.getElementById("body").className = "bg-light";
    document.getElementById("superiore").className = "navbar navbar-expand-sm justify-content-between";
    document.getElementById("superiore").style.backgroundImage = "linear-gradient(to right, rgb(250, 255, 252), rgb(56, 83, 255))";
    document.getElementById("content").className = "bg-light text-dark";
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
	var a = document.getElementById("list").children;
	for(var i=0; i<a.length; i++){
		if(i==0)
			a[i].className = "list-group-item list-group-item-action active";
		else
			a[i].className = "list-group-item list-group-item-action";
	}
}

function submitFormLogin(){
	document.getElementById("formRegistrazione").submit();
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

function disactiveFocus(bottoneCorrente){
	document.getElementById("textFiltro").value = bottoneCorrente.value;
	document.getElementById("primoFiltro").blur();
	document.getElementById("secondoFiltro").blur();

}

function rimuoviAnnuncio(){
	var element = document.getElementById("pubb");
	element.parentNode.removeChild(element);
}

var nameUser;
function setUsername(user){
	nameUser = user;
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

function submitFormFeedback(){
	document.getElementById("formFeedback").submit();
}