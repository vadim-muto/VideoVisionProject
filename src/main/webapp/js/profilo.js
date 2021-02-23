function openFile(){
	document.getElementById("chooseImage").click();
}

window.onload = 
function initialize(){
	document.getElementById("body").style.height = window.screen.height + "px";
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
	document.getElementById("centrale").style.backgroundColor = "grey";
	document.getElementById("centrale").style.border = "3px solid";
	document.getElementById("navProfilo").style.border = "2px solid";
	document.getElementById("navLink").style.border = "3px solid";
	document.getElementById("modalContentSettings").className = "modal-content text-light bg-dark";
    document.getElementById("switchModal1").className = "list-group-item text-light bg-dark";
    document.getElementById("switchModal2").className = "list-group-item text-light bg-dark";
    document.getElementById("switchModal3").className = "list-group-item text-light bg-dark";
    document.getElementById("aItemModal3").className = "text-light text-decoration-none";
    document.getElementById("aItemModal4").className = "text-light text-decoration-none";
    document.getElementById("iscritti").style.color ="white";
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
	document.getElementById("centrale").style.backgroundColor = "white";
	document.getElementById("centrale").style.border = "0px solid";
	document.getElementById("navProfilo").style.border = "0px solid";
	document.getElementById("navLink").style.border = "0px solid";
    document.getElementById("modalContentSettings").className = "modal-content text-dark bg-light";
    document.getElementById("switchModal1").className = "list-group-item text-dark bg-light";
    document.getElementById("switchModal2").className = "list-group-item text-dark bg-light";
    document.getElementById("switchModal3").className = "list-group-item text-dark bg-light";
    document.getElementById("aItemModal3").className = "text-dark text-decoration-none";
    document.getElementById("aItemModal4").className = "text-dark text-decoration-none";
    var x = document.getElementsByTagName("a");
	var i;
	for (i = 0; i < x.length; i++) {
  		x[i].style.color = "";
  	}	
}

function submitFormFeedback(){
	document.getElementById("formFeedback").submit();
}