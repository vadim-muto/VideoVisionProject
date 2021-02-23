function openFile(){
	document.getElementById("chooseImage").click();
}

window.onload = 
function initialize(){
	document.getElementById("body").style.height = window.screen.height + "px";
	var checkBox = localStorage.getItem("dark");
	changeColorOnload(checkBox);
	premi();
}	

function scegliVideo(linkVideo){
	document.getElementById("inputVideo").value = linkVideo;
	document.getElementById("formVideo").submit();
}

function eliminaVideo(){
	var link = event.target.value;
	var elementoDaRimuovere = event.target.parentElement.parentElement;
	
	$.ajax({
		url: "../eliminaVideo",
		method: "POST",
		data: {linkVideo: link},
		success: function(result){
		elementoDaRimuovere.remove();
		},
		error: function(error) {
        	console.log("NO");
        }
	});
}

function premi(){
	document.getElementById("body").editable = "True";
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
	document.getElementById("centrale").className = "bg-secondary text-light";
	document.getElementById("navProfilo").style.border = "2px solid";
	document.getElementById("navLink").style.border = "3px solid";
	document.getElementById("modalContentSettings").className = "modal-content text-light bg-dark";
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
  		x[i].style.color = "";
	}
}

function submitFormFeedback(){
	document.getElementById("formFeedback").submit();
}