window.onbeforeunload = function () {
    if(window.scrollTo) window.scrollTo(0,0);
};


function controlloPsw(){
	var pass1=document.getElementById("psw").value;
	var pass2=document.getElementById("psw-repeat").value;
	
	var pMatch = document.getElementById("matchPass");
	if(pass1===pass2){
		pMatch.innerHTML = "Le password coincidono";
		document.getElementById("matchPass").style.color = "#00c91b";
	}
	else{
		pMatch.innerHTML = "Le password non coincidono";
		document.getElementById("matchPass").style.color = "red";
	}
}


// funzione per height in base ad ogni risoluzione di schermo
window.onload = 
function heightBody(){
	createCaptcha();
    document.getElementById("body").style.height = window.screen.height + "px";
    document.getElementById("psw-repeat").addEventListener('keyup', controlloPsw);
	// dark/white mode
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
    document.getElementById("switchModal4").className = "list-group-item text-light bg-dark";
    document.getElementById("aItemModal1").className = "text-light text-decoration-none";
    document.getElementById("aItemModal2").className = "text-light text-decoration-none";
    document.getElementById("aItemModal3").className = "text-light text-decoration-none";
    document.getElementById("buttonX").className = "close text-light";
    document.getElementById("divSignIn").className = "signin text-dark";
    document.getElementById("alert").style.color = "black";
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

function validator() {
  var x = 0;
  var password = document.getElementById('psw').value;
  var bar = document.getElementById("bar");
  var al = document.getElementById("alert");

  //controllo numeri
  var check=/[0-9]/;
  if(check.test(password)){
    x = x + 20;
  }
  //controllo minuscole
  var check2=/[a-z]/;
  if(check2.test(password)){
    x = x + 20;
  }
  //controllo maiuscole
  var check3=/[A-Z]/;
  if(check3.test(password)){
    x = x + 20;
  }
  //controllo simboli
  var check4=/[$-/:-?{-~!"^_`\[\]]/;
  if(check4.test(password)){
    x = x + 20;
  }
  // controllo lunghezza (minore o uguale a 10 caratteri)
  if(password.length >=10){
    x = x + 20;
  }

  // risultato
  bar.style.width = x + "%";
  // voto massimo 100
  if (x == 100) {
    bar.style.backgroundColor = "green";
    al.innerHTML = "Molto difficile";
  }
  if (x >60) {
    bar.style.backgroundColor = "green";
    al.innerHTML = "Difficile";
  }
  if (x <=40) {
    bar.style.backgroundColor = "yellow";
    al.innerHTML = "Buona";
  }
  //voto minimo 20
  if (x <=20) {
    bar.style.backgroundColor = "red";
    al.innerHTML = "Debole";
  }

  if(password.length == 0){
    x == 0;
    al.innerHTML = "";
  }

  //controllo spazi bianchi
  var check5=/\s\S/;
  if(check5.test(password)){
    al.innerHTML = "Password must not contain white spaces";
    bar.style.backgroundColor = "red";
  }
}







var code;
function createCaptcha() {
  //clear the contents of captcha div first 
  document.getElementById('captcha').innerHTML = "";
  var charsArray =
  "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ@!#$%^&*";
  var lengthOtp = 6;
  var captcha = [];
  for (var i = 0; i < lengthOtp; i++) {
    //below code will not allow Repetition of Characters
    var index = Math.floor(Math.random() * charsArray.length + 1); //get the next character from the array
    if (captcha.indexOf(charsArray[index]) == -1)
      captcha.push(charsArray[index]);
    else i--;
  }
  var canv = document.createElement("canvas");
  canv.id = "captcha";
  canv.width = 100;
  canv.height = 50;
  var ctx = canv.getContext("2d");
  ctx.font = "25px Georgia";
  ctx.strokeText(captcha.join(""), 0, 30);
  //storing captcha so that can validate you can save it somewhere else according to your specific requirements
  code = captcha.join("");
  document.getElementById("captcha").appendChild(canv); // adds the canvas to the body element
}

function validateCaptcha() {
  event.preventDefault();
  debugger
  if (document.getElementById("cpatchaTextBox").value == code) {
    alert("Valid Captcha")
  }else{
    alert("Invalid Captcha. try Again");
    createCaptcha();
  }
}


