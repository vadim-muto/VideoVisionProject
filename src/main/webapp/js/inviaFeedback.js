function returTopPage(){
  if(window.scrollTo) window.scrollTo(0,0);
}

window.onbeforeunload = function () {
  if(window.scrollTo) window.scrollTo(0,0);
};

$(document).ready(function(){


  $('#stars li').on('mouseover', function(){
    var onStar = parseInt($(this).data('value'), 10); // The star currently mouse on
    $(this).parent().children('li.star').each(function(e){
      if (e < onStar) {
        $(this).addClass('hover');
      }
      else {
        $(this).removeClass('hover');
      }
    });
    
  }).on('mouseout', function(){
    $(this).parent().children('li.star').each(function(e){
      $(this).removeClass('hover');
    });
  });
  
  $('#stars li').on('click', function(){
    var onStar = parseInt($(this).data('value'), 10);
    var stars = $(this).parent().children('li.star');
    
for (i = 0; i < stars.length; i++) {
      $(stars[i]).removeClass('selected');
    }
    
    for (i = 0; i < onStar; i++) {
      $(stars[i]).addClass('selected');
    }
    
    var ratingValue = parseInt($('#stars li.selected').last().data('value'), 10);
    document.getElementById("inputStelle").value = ratingValue;
    var msg = "";
    if (ratingValue > 1) {
    	document.getElementById("risStelle").value="Grazie per la valutazione! Hai inserito " + ratingValue + " stelle.";
    }
    else {
        document.getElementById("risStelle").value="Proveremo a migliorare il servizio. Hai inserito " + ratingValue + " stella.";
    }
    responseMessage(msg);
  });
});

function responseMessage(msg) {
  $('.success-box').fadeIn(200);  
  $('.success-box div.text-message').html("<span>" + msg + "</span>");
}

$(document).ready(function(){
	color();

  $("#s1").hover(function(){
    $(this).css("color", "red");
    }, function(){
    $(this).css("color", "grey");
  });
  
  $("#s2").hover(function(){
    $(this).css("color", "red");
    $(s1).css("color", "red");
    }, function(){
    $(this).css("color", "grey");
    $(s1).css("color", "grey");
  });
  
   $("#s3").hover(function(){
    $(this).css("color", "orange");
    $(s1).css("color", "orange");
    $(s2).css("color", "orange");
    }, function(){
    $(this).css("color", "grey");
    $(s1).css("color", "grey");
    $(s2).css("color", "grey");
  });
  
   $("#s4").hover(function(){
    $(this).css("color", "green");
    $(s1).css("color", "green");
    $(s2).css("color", "green");
    $(s3).css("color", "green");
    }, function(){
    $(this).css("color", "grey");
    $(s1).css("color", "grey");
    $(s2).css("color", "grey");
    $(s3).css("color", "grey");
  });
  
  $("#s5").hover(function(){
    $(this).css("color", "green");
    $(s1).css("color", "green");
    $(s2).css("color", "green");
    $(s3).css("color", "green");
    $(s4).css("color", "green");
    }, function(){
    $(this).css("color", "grey");
    $(s1).css("color", "grey");
    $(s2).css("color", "grey");
    $(s3).css("color", "grey");
    $(s4).css("color", "grey");
    
  });
});

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
  document.getElementById("occhio").src="/images/logoUfficialeDarkMode.png";
  document.getElementById("modalContent").className = "modal-content text-light bg-dark";
  document.getElementById("switchModal1").className = "list-group-item text-light bg-dark";
  document.getElementById("switchModal2").className = "list-group-item text-light bg-dark";
  document.getElementById("aItemModal3").className = "text-light text-decoration-none";
  document.getElementById("buttonX").className = "close text-light";
  document.getElementById("buttonXRisultati").className = "close text-light";
  document.getElementById("body").className = "bg-secondary";
  document.getElementById("divPrincipale").className = "wrapper bg-secondary";
  document.getElementById("modalContentRisultati").className = "modal-content bg-dark text-primary";
  document.getElementsByTagName("P").className = "text-light";
  document.getElementsByTagName("H5")[0].className = "text-light";

  var x = document.getElementsByTagName("P");
  var i;
  for (i = 0; i < x.length; i++) {
    x[i].className = "text-light";
  }

  x = document.getElementsByTagName("H");
  i = 0;
  for (i = 0; i < x.length; i++) {
    x[i].className = "text-light";
  }

  x = document.getElementsByTagName("LABEL");
  i = 0;
  for (i = 0; i < x.length; i++) {
    x[i].className = "text-light";
  }

  x = document.getElementsByTagName("TR");
  i = 0;
  for (i = 0; i < x.length; i++) {
    x[i].className = "text-light";
  }

  document.getElementById("labelCustomSwitches").className = "custom-control-label";
  document.getElementById("pFooter").className = "text-light";
  document.getElementById("divFooter").className = "bg-dark footer";
  document.getElementById("meteoTesta").className="toast-header bg-dark";
  document.getElementById("btnFeedback").className="btn btn-success";
  document.getElementById("btnRisultati").className="btn btn-info";
}

function whiteMode(){
  document.getElementById("superiore").className = "navbar navbar-expand-sm justify-content-between";
  document.getElementById("superiore").style.backgroundImage = "linear-gradient(to right, rgb(250, 255, 252), rgb(56, 83, 255))";
  document.getElementById("occhio").src="/images/logoVideoVision.png";
  document.getElementById("modalContent").className = "modal-content text-dark bg-light";
  document.getElementById("switchModal1").className = "list-group-item text-dark bg-light";
  document.getElementById("switchModal2").className = "list-group-item text-dark bg-light";
  document.getElementById("aItemModal3").className = "text-dark text-decoration-none";
  document.getElementById("buttonX").className = "close text-dark";
  document.getElementById("buttonXRisultati").className = "close text-dark";
  document.getElementById("body").className = "bg-light";
  document.getElementById("divPrincipale").className = "wrapper bg-light";
  document.getElementById("modalContentRisultati").className = "modal-content bg-light text-dark";
  document.getElementsByTagName("P").className = "text-dark";
  document.getElementsByTagName("H5")[0].className = "text-dark";

  var x = document.getElementsByTagName("P");
  var i;
  for (i = 0; i < x.length; i++) {
    x[i].className = "text-dark";
  }

  x = document.getElementsByTagName("H");
  i = 0;
  for (i = 0; i < x.length; i++) {
    x[i].className = "text-dark";
  }

  x = document.getElementsByTagName("LABEL");
  i = 0;
  for (i = 0; i < x.length; i++) {
    x[i].className = "text-dark";
  }

  x = document.getElementsByTagName("TR");
  i = 0;
  for (i = 0; i < x.length; i++) {
    x[i].className = "text-dark";
  }

  document.getElementById("labelCustomSwitches").className = "custom-control-label";
  document.getElementById("pFooter").className = "text-light";
  document.getElementById("divFooter").className = "bg-secondary footer";
  document.getElementById("meteoTesta").className="toast-header bg-primary";
  document.getElementById("btnFeedback").className="btn btn-outline-success";
  document.getElementById("btnRisultati").className="btn btn-outline-info";
}

var valueSearch = "Arcavacata";
var apiKey = "82bf23096592a81529e80ca308b25ba8";
var url;

window.onload = function(){
    url = `https://api.openweathermap.org/data/2.5/weather?q=${valueSearch}&appid=${apiKey}&units=metric`;
    fetch(url)
    .then(response => response.json())
    .then(data => {
      var { main, name, sys, weather } = data;
      var icon = `https://s3-us-west-2.amazonaws.com/s.cdpn.io/162656/${
        weather[0]["icon"]
      }.svg`;
      
      var imageIcon = document.getElementById("icon");
      imageIcon.src = icon;
      var textGradi = document.getElementById("divTemperatura");
      textGradi.innerHTML = `<h1 id="textGradi">${Math.round(main.temp)}<span>&#8451;</span></h1>`;
      document.getElementById("textGradi").style.color = "black";
    })
    .catch(() => {
        return;
    });
}

$(document).ready(function(){
    $('.toast').toast('show');
  });
  
var grafica = "Grafica";
var theme = "Theme";
var intuitivita = "Intuitivita";
var account = "Account";

function setInputFeedback(element){
  var idElement = element.id;
  var valueElement = element.value;

  if (idElement == grafica){
    document.getElementById("inputGrafica").value = valueElement;
  }
  else if(idElement == theme){
    document.getElementById("inputTheme").value = valueElement;
  }
  else if(idElement == intuitivita){
    document.getElementById("inputIntuitivita").value = valueElement;
  }
  else if(idElement == account){
    document.getElementById("inputAccount").value = valueElement;
  }
}

function submitFormFeedback(){
  addAlertFeedback();
}

function addAlertFeedback(){
  returTopPage();
  document.getElementById("alertFeedback").className = "alert alert-primary";
  document.getElementById("alertFeedback").innerHTML = "<strong>Grazie!</strong> per il tuo feedback.";
  setTimeout(function(){
    document.getElementById("alertFeedback").className="";
    var element = document.getElementById("alertFeedback");
    element.parentNode.removeChild(element);
    document.getElementById("formFeedback").submit();
    }, 5000)
}



