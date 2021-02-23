fetch('https://api.ipify.org/?format=json')
  .then(results=>results.json())
  .then(data=>document.getElementById("ip").value=(data.ip));
  
window.onbeforeunload = function () {
    if(window.scrollTo) window.scrollTo(0,0);
};

window.onload = 
function heightBody(){
    document.getElementById("body").style.height = window.screen.height + "px";
	var checkBox = localStorage.getItem("dark");
	changeColorOnload(checkBox);

	var data = new Date();
	var Hh, Mm, Ss, mm;
	Hh = data.getHours() + ":";
	Mm = data.getMinutes() + ":";
	Ss = data.getSeconds();
	var stringaOrario=Hh + Mm + Ss;
	document.getElementById("orario").value=stringaOrario;
	
	var d = new Date();
	var giorno=d.getDate();
	var mese=d.getMonth()+1;
	var anno=d.getFullYear();
	if(mese>0 && mese<10){
	  mese="0"+mese;
	}
	var dataFinale=giorno+"/"+mese+"/"+anno;
	document.getElementById("data").value=dataFinale;
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
    document.getElementById("occhio").src="/images/logoUfficialeDarkMode.png";
    document.getElementById("head1").className = "card-header text-white bg-dark";
    document.getElementById("head2").className = "card-header text-white bg-dark";
    document.getElementById("head3").className = "card-header text-white bg-dark";
    document.getElementById("head4").className = "card-header text-white bg-dark";
    document.getElementById("head5").className = "card-header text-white bg-dark";
    document.getElementById("head6").className = "card-header text-white bg-dark";
    document.getElementById("divFrase1").className = "card-body text-white bg-dark";
    document.getElementById("corpo1").className = "card-body bg-secondary text-white";
    document.getElementById("corpo2").className = "card-body bg-secondary text-white";
    document.getElementById("corpo3").className = "card-body bg-secondary text-white";
    document.getElementById("corpo4").className = "card-body bg-secondary text-white";
    document.getElementById("corpo5").className = "card-body bg-secondary text-white";
    document.getElementById("corpo6").className = "card-body bg-secondary text-white";
    document.getElementById("btnUniversita").className = "btn text-white bg-secondary";
    document.getElementById("btnDipartimento").className = "btn text-white bg-secondary";
    document.getElementById("btnContinua").className = "btn text-white bg-dark";
    document.getElementById("foot1").className = "card-footer bg-dark";
    document.getElementById("foot2").className = "card-footer bg-dark";
    document.getElementById("modalContentSettings").className = "modal-content text-light bg-dark";
    document.getElementById("switchModal1").className = "list-group-item text-light bg-dark";
    document.getElementById("switchModal2").className = "list-group-item text-light bg-dark";
    document.getElementById("switchModal3").className = "list-group-item text-light bg-dark";
    document.getElementById("aItemModal3").className = "text-light text-decoration-none";
    document.getElementById("aItemModal4").className = "text-light text-decoration-none";
    document.getElementById("buttonXSettings").className = "close text-light";
    document.getElementById("head7").className = "card-header text-white bg-dark";
    document.getElementById("corpo7").className = "card-body text-white bg-secondary";
    document.getElementById("foot7").className = "card-footer text-white bg-dark";
}

function whiteMode(){
    document.getElementById("body").className = "bg-light";
    document.getElementById("superiore").className = "navbar navbar-expand-sm justify-content-between";
    document.getElementById("superiore").style.backgroundImage = "linear-gradient(to right, rgb(250, 255, 252), rgb(56, 83, 255))";
    document.getElementById("occhio").src="/images/logoVideoVision.png";
    document.getElementById("head1").className = "card-header";
    document.getElementById("head2").className = "card-header";
    document.getElementById("head3").className = "card-header";
    document.getElementById("head4").className = "card-header";
    document.getElementById("head5").className = "card-header";
    document.getElementById("head6").className = "card-header";
    document.getElementById("divFrase1").className = "card-body";
    document.getElementById("corpo1").className = "card-body";
    document.getElementById("corpo2").className = "card-body";
    document.getElementById("corpo3").className = "card-body";
    document.getElementById("corpo4").className = "card-body";
    document.getElementById("corpo5").className = "card-body";
    document.getElementById("corpo6").className = "card-body";
    document.getElementById("btnUniversita").className = "btn btn-primary";
    document.getElementById("btnDipartimento").className = "btn btn-primary";
   	document.getElementById("btnContinua").className = "btn btn-primary";
    document.getElementById("foot1").className = "card-footer";
    document.getElementById("foot2").className = "card-footer";
    document.getElementById("modalContentSettings").className = "modal-content text-dark bg-light";
    document.getElementById("switchModal1").className = "list-group-item text-dark bg-light";
    document.getElementById("switchModal2").className = "list-group-item text-dark bg-light";
    document.getElementById("switchModal3").className = "list-group-item text-dark bg-light";
    document.getElementById("aItemModal3").className = "text-dark text-decoration-none";
    document.getElementById("aItemModal4").className = "text-dark text-decoration-none";
    document.getElementById("buttonXSettings").className = "close text-dark";
    document.getElementById("head7").className = "card-header";
    document.getElementById("corpo7").className = "card-body";
    document.getElementById("foot7").className = "card-footer";
}

function initMap() {
  const myLatLng = { lat: 39.35581585030645, lng: 16.227026581764225 };
  const map = new google.maps.Map(document.getElementById("map"), {
    zoom: 10,
    center: myLatLng,
  });
  new google.maps.Marker({
    position: myLatLng,
    map,
    title: "Hello World!",
  });
}

function submitFormFeedback(){
	document.getElementById("formFeedback").submit();
}

