<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<link rel="stylesheet" href="/css/profilo.css" type="text/css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script src="/js/profiloIscrizioni.js"></script>
	<title>Profilo Iscrizioni</title>
</head>
<body id="body">
	
		<nav class="navbar navbar-expand-sm justify-content-between" id="superiore">
			<a class="navbar-brand flex-fill" href="../">
				<img src="/images/logoVideoVision.png" id="occhio">
			</a>
	  		<ul class="navbar-nav flex-fill justify-content-end">
	    		<li class="nav-item">
	      			<button type="button" class="btn btn-light" data-toggle="modal" data-target="#myModalSettings" id="settingsBtn"><i class="fa fa-cog"></i></button>
	    		</li>
	  		</ul>
		</nav>
	
		
		<nav class="navbar navbar-expand-sm " id="navProfilo">
		  <ul class="navbar-nav">
		  	<li class="nav-item">
		  		<img src="${utente.getFoto_profilo()}" class="image--cover" />
		  	</li>
		    <li class="nav-item">
		      <a class="nav-link" href="#" id="nomeProfilo"><h3>${utente.getUsername()}</h3></a>
		      <h5 class="nav-link" id="iscritti"> Numero iscritti: ${utente.getNum_iscritti()}</h5>
		    </li>
		  </ul>
		</nav>
		
		<nav class="navbar navbar-expand-sm navbar-dark sticky-top " id="navLink">  
		    <form method="POST" action="visualizzaVideoUtente">
		    	<button class="noButton" type="submit" id="video"><i class="fa fa-video-camera" aria-hidden="true"></i> Video</button>
		    </form>
		     <form method="POST" action="visualizzaPlaylist">
		    	<button class="noButton" type="submit" id="playlist"><i class="fa fa-book" aria-hidden="true"></i> Playlist</button>
		    </form>
		    <div class="navLinks"><a class="nav-link" href="#" id="iscrizioni"><i class="fa fa-user-circle" aria-hidden="true"></i> Iscrizioni</a></div>
		    <form method="POST" action="visualizzaDati">
		    	<button class="noButton" type="submit" id="informazioni"><i class="fa fa-info" aria-hidden="true"></i> Informazioni</button>
		    </form>	  
		</nav>
	 
	
		<div id="centrale" class="bg-light text-dark">
			<h4>Questi sono i canali a cui sei iscritto:</h4>
			<br>
				<div class="row tabella">
				      <div class="col-2"><i class="fa fa-play" aria-hidden="true"></i> Immagine</div>
				      <div class="col-2"> Nome Canale</div>
				      <div class="col-2"><i class="fa fa-list-ol" aria-hidden="true"></i> Numero Iscritti</div>
				</div>
				<c:forEach var="iscrizione" items="${listaIscrizioni}">
					<div class="row tabella">
					      <div class="col-2">
							<form method="POST" action="paginaCanale" id="formCanale">
	        					<input type="text" id="inputImg" value="${iscrizione.getCanale().getUsername()}" name="usernameCanale" readonly>
								<img src="${iscrizione.getCanale().getFoto_profilo()}" id="imgP" onclick="scegliCanale()"></img> 
						  	</form> 
					      </div>
					      <div class="col-2">${iscrizione.getCanale().getUsername()}</div>
					      <div class="col-2">${iscrizione.getCanale().getNum_iscritti()}</div>
						  <div class="col-2">
						  	<button type="button" value="${iscrizione.getCanale().getUsername()}" class="btn btn-danger" onclick="annullaIscrizione()"><i class="fa fa-times" aria-hidden="true"></i> Annulla iscrizione</button>
						  </div>
					</div>
				</c:forEach>  					
			</div>
		
			<div class="modal fade" id="myModalSettings">
		        <div class="modal-dialog modal-sm">
		            <div class="modal-content" id="modalContentSettings">
		        
		                <div class="modal-header">
		                    <h4 class="modal-title">Impostazioni</h4>
		                    <button type="button" class="close" data-dismiss="modal" id="buttonXSettings">&times;</button>
		                </div>
		        
		                <div class="modal-body">
		                    <ul class="list-group list-group-flush">
		                        <li class="list-group-item" id="switchModal1">
		                            <div class="custom-control custom-switch">
		                                <input type="checkbox" class="custom-control-input" id="customSwitches" onclick="changeColor()">
		                                <label class="custom-control-label" for="customSwitches">Aspetto</label>
		                            </div>
		                        </li>
		                        <li class="list-group-item" id="switchModal2">
		                            <a href="/images/GuidaUtenteVideoVision.pdf" class="text-dark text-decoration-none" id="aItemModal3" download>Guida utente</a>
		                        </li>
								<li id="switchModal3" class="list-group-item text-dark bg-light">
		                            <a class="text-dark text-decoration-none" id="aItemModal4" onclick="submitFormFeedback()">Invia Feedback</a>
									<form method="GET" action="getFeedback" id="formFeedback">
									</form>
		                        </li>
		                      </ul>
		                </div>
		            </div>
		        </div>
	    	</div>
</body>
</html>