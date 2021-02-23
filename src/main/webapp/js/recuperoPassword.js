window.onbeforeunload = function () {
    if(window.scrollTo) window.scrollTo(0,0);
};

window.onload = function(){
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
    document.getElementById("body").className = "bg-secondary";
    document.getElementById("superiore").style.backgroundImage = "none";
	document.getElementById("superiore").className= "navbar navbar-expand-sm bg-dark navbar-light justify-content-between";
    document.getElementById("divFooter").className = "bg-dark footer";
    document.getElementById("divColForm").className = "col-md-5 form text-light";
    document.getElementById("occhio").src="/images/logoUfficialeDarkMode.png";
    document.getElementById("fotoDestra").src="/images/ComputerConLogoDarkMode.png";
    document.getElementById("modalContent").className = "modal-content text-light bg-dark";
    document.getElementById("switchModal1").className = "list-group-item text-light bg-dark";
    document.getElementById("switchModal2").className = "list-group-item text-light bg-dark";
    document.getElementById("switchModal3").className = "list-group-item text-light bg-dark";
    document.getElementById("aItemModal3").className = "text-light text-decoration-none";
    document.getElementById("aItemModal4").className = "text-light text-decoration-none";
    document.getElementById("buttonX").className = "close text-light";
}

function whiteMode(){
    document.getElementById("body").className = "bg-light";
    document.getElementById("superiore").className = "navbar navbar-expand-sm justify-content-between";
    document.getElementById("superiore").style.backgroundImage = "linear-gradient(to right, rgb(250, 255, 252), rgb(56, 83, 255))";
    document.getElementById("divFooter").className = "bg-secondary footer";
    document.getElementById("divColForm").className = "col-md-5 form text-dark";
    document.getElementById("occhio").src="/images/logoVideoVision.png";
    document.getElementById("fotoDestra").src="/images/ComputerConLogoDarkMode.png";
    document.getElementById("modalContent").className = "modal-content text-dark bg-light";
    document.getElementById("switchModal1").className = "list-group-item text-dark bg-light";
    document.getElementById("switchModal2").className = "list-group-item text-dark bg-light";
    document.getElementById("switchModal3").className = "list-group-item text-dark bg-light";
    document.getElementById("aItemModal3").className = "text-dark text-decoration-none";
    document.getElementById("aItemModal4").className = "text-dark text-decoration-none";
    document.getElementById("buttonX").className = "close text-dark";
}

function submitFormFeedback(){
	document.getElementById("formFeedback").submit();
}