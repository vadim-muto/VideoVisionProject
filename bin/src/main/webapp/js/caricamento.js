window.onbeforeunload = function () {
    if(window.scrollTo) window.scrollTo(0,0);
};


// funzione per height in base ad ogni risoluzione di schermo
window.onload = 
function heightBody(){
    document.getElementById("body").style.height = window.screen.height + "px";
	
	/*anteprima();*/
	
	// dark/white mode
	var checkBox = localStorage.getItem("dark");
	changeColorOnload(checkBox);
}

var file;

// caricamento video tramite API Dropbox
function setNomeVideo(){
	var allFiles = document.getElementById("fileupload");
	var nameVideo = allFiles.files.item(0).name;
	document.getElementById("infoVideo").value = nameVideo;
	file = event.target.files[0];
}

function uploadVideo(){
	var token = "3kKKuvFYXOoAAAAAAAAAAQS05636Spd9eWz0a-ETmbyl-0MaCSZ4yFe1rzVXZ_MB";
    var fileName = $('input[type=file]')[0].files[0].name,
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
        	document.getElementById("divAlert").className="alert alert-success";
			document.getElementById("divAlert").innerHTML += "<strong>Caricamento riuscito!</strong> il video è stato caricato."
			document.getElementById("caricaVideo").submit();
			removeAlert();
        },
        error: function(error) {
        	document.getElementById("divAlert").className="alert alert-danger";
			document.getElementById("divAlert").innerHTML += "<strong>Errore!</strong> errore nel caricamento del video."
			removeAlert();
        }
    });
}

function removeAlert(){
    setTimeout(function(){
        document.getElementById("divAlert").className="";
		var element = document.getElementById("divAlert");
		element.parentNode.removeChild(element);
    }, 5000)
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
    document.getElementById("switchModal4").className = "list-group-item text-light bg-dark";
    document.getElementById("aItemModal1").className = "text-light text-decoration-none";
    document.getElementById("aItemModal2").className = "text-light text-decoration-none";
    document.getElementById("aItemModal3").className = "text-light text-decoration-none";
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
    document.getElementById("switchModal4").className = "list-group-item text-dark bg-light";
    document.getElementById("aItemModal1").className = "text-dark text-decoration-none";
    document.getElementById("aItemModal2").className = "text-dark text-decoration-none";
    document.getElementById("aItemModal3").className = "text-dark text-decoration-none";
    document.getElementById("buttonX").className = "close text-dark";
}