window.onbeforeunload = function () {
    if(window.scrollTo) window.scrollTo(0,0);
};


// funzione per height in base ad ogni risoluzione di schermo
window.onload = 
function heightBody(){
    document.getElementById("sidebar").style.minHeight = (window.innerHeight-($("#superiore").height())) + "px";
	document.getElementById("sidebar").style.maxHeight = (window.innerHeight-($("#superiore").height())) + "px";
	document.getElementById("sidebar").style.height = window.innerHeight + "px";
	
	color();
}


window.onresize = reportWindowSize;
function reportWindowSize() {
	 document.getElementById("sidebar").style.minHeight = (window.innerHeight-($("#superiore").height())) + "px";
	 document.getElementById("sidebar").style.maxHeight = (window.innerHeight-($("#superiore").height())) + "px";
	 document.getElementById("sidebar").style.height = window.innerHeight + "px";
}


// dark/white mode
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
	document.getElementById("superiore").style.backgroundImage = "none";
	document.getElementById("superiore").className= "navbar navbar-expand-sm bg-dark navbar-light justify-content-between";
	document.getElementById("content").className = "bg-secondary text-light";
	document.getElementById("sidebar").style.backgroundImage = "none";
	document.getElementById("sidebar").className = "collapse bg-dark";
	document.getElementById("occhio").src="/images/logoUfficialeDarkMode.png";
	document.getElementById("modalContentLogin").className = "modal-content text-light bg-dark";
	document.getElementById("modalContentSettings").className = "modal-content text-light bg-dark";
	document.getElementById("switchModal1").className = "list-group-item text-light bg-dark";
    document.getElementById("switchModal2").className = "list-group-item text-light bg-dark";
    document.getElementById("switchModal3").className = "list-group-item text-light bg-dark";
    document.getElementById("switchModal4").className = "list-group-item text-light bg-dark";
    document.getElementById("aItemModal1").className = "text-light text-decoration-none";
    document.getElementById("aItemModal2").className = "text-light text-decoration-none";
    document.getElementById("aItemModal3").className = "text-light text-decoration-none";
	document.getElementById("buttonXLogin").className = "close text-light";
	document.getElementById("buttonXSettings").className = "close text-light";
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
	document.getElementById("modalContentLogin").className = "modal-content text-dark bg-light";
	document.getElementById("modalContentSettings").className = "modal-content text-dark bg-light";
	document.getElementById("switchModal1").className = "list-group-item text-dark bg-light";
    document.getElementById("switchModal2").className = "list-group-item text-dark bg-light";
    document.getElementById("switchModal3").className = "list-group-item text-dark bg-light";
    document.getElementById("switchModal4").className = "list-group-item text-dark bg-light";
    document.getElementById("aItemModal1").className = "text-dark text-decoration-none";
    document.getElementById("aItemModal2").className = "text-dark text-decoration-none";
    document.getElementById("aItemModal3").className = "text-dark text-decoration-none";
	document.getElementById("buttonXLogin").className = "close text-dark";
	document.getElementById("buttonXSettings").className = "close text-dark";
	var a = document.getElementById("list").children;
	for(var i=0; i<a.length; i++){
		if(i==0)
			a[i].className = "list-group-item list-group-item-action active";
		else
			a[i].className = "list-group-item list-group-item-action";
	}
}