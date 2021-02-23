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
	<script src="/js/profiloInformazioni.js"></script>
	<title>Profilo Informazioni</title>
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
		<input type="file" onchange="setImage()" id="chooseImage" accept=".jpg, .jpeg, .png">
		<nav class="navbar navbar-expand-sm " id="navProfilo">
		  <ul class="navbar-nav">
		  	<li class="nav-item">
		  		<img id="imgProfilo" src="${lista.getFoto_profilo()}" class="image--cover" />
		  	</li>
		  	<li id="cambio">
		  		<a class="navbar-brand" onclick="openFile()">
		  			<i class="fa fa-camera" aria-hidden="true" id="cambiaFoto"></i> 			
	      		</a>
	      	</li>
		    <li class="nav-item">
		      <a class="nav-link" href="#" id="nomeProfilo"><h3>${lista.getUsername()}</h3></a>
		      <h5 class="nav-link" id="iscritti"> Numero iscritti: ${lista.getNum_iscritti()}</h5>
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
		   	<form method="POST" action="visualizzaIscrizioni">
		   		<button class="noButton" type="submit" id="iscrizioni"><i class="fa fa-user-circle" aria-hidden="true"></i> Iscrizioni</button>
		    </form>
		    <div class="navLinks" id="navLinksInf"><a class="nav-link" href="#" id="informazioni"><i class="fa fa-info" aria-hidden="true"></i> Informazioni</a></div>	  
		</nav>
	 
	
		<div id="centrale" class="bg-light text-dark">
			<div class="row">
				<div class="col-md-6">
					<h6><strong>Dati Anagrafici/Personali:</strong></h6>	
				</div>
				<div class="col-md-6">
					<p href="#" id="modifica"><i class="fa fa-pencil" aria-hidden="true"></i> Modifica Dati anagrafici/personali</p>
				</div>
			</div>		
			<div class="row">
				<div class="info col-md-6">
					<label class="col-md-5">Nome: </label><input class="col-md-6" value="${lista.getNome()}" type="text" id="nome" name="nome" disabled>
				</div>
			</div>
			<div class="row">
				<div class="info col-md-6">
					<label class="col-md-5">Cognome: </label><input class="col-md-6" type="text" value="${lista.getCognome()}"  id="cognome" name="cognome" disabled>		
				</div>
			</div>
			<div class="row">
				<div class="info col-md-6">
					<label class="col-md-5">Data nascita: </label><input class="col-md-6" type="text"  value="${lista.getDataNascita()}" id="dataNasc" disabled>		
				</div>
			</div>
			<div class="row">
				<div class="info col-md-6">
					<label class="col-md-5">Email: </label><input class="col-md-6" type="text"  value="${lista.getEmail()}" id="email" disabled>		
				</div>
			</div>
	
			<div>
				<button type="button" class="btn btn-outline-success" id="conferma" onclick="cambioDati()" disabled><i class="fa fa-refresh" aria-hidden="true"></i> Invia Modifica</button>
			</div>
			
			<div class="row">
				<div class=" col-md-6">
					<br>
					<h6><strong>Dati di Accesso:</strong></h6>	
				</div>
				<div class=" col-md-6">
					<p id="modificaPassword"><i class="fa fa-pencil" aria-hidden="true"></i> Modifica Password</p>
				</div>
			</div>	
			<div class="row">
				<div class="info col-md-6">
					<label class="col-md-5">Nome utente: </label><input class="col-md-6" type="text" value="${lista.getUsername()}" id="nomeUtente" disabled>		
				</div>
			</div>
			<div class="row">
				<div class="info col-md-6" id="rowPassword">
					<label class="col-md-5" id="pas">Password:</label><input class="col-md-6" type="password" value="noPassword" id="password" name="password" placeholder="Inserisci nuova password" disabled>	
				</div>
			</div> 
		
			<div>
				<button type="button" class="btn btn-outline-success" id ="cambiaPsw" onclick="cambioPassword()" disabled><i class="fa fa-refresh" aria-hidden="true"></i> Cambia Password</button>
			</div>
				
			<div>
				<p href="" id="eliminaAccount" data-toggle="modal" data-target="#modalEliminaAccount"><i class="fa fa-times" aria-hidden="true" ></i> Elimina questo account</p>

				<div class="modal fade" id="modalEliminaAccount" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
				  <div class="modal-dialog modal-dialog-centered" role="document" id="modalDialogElimina">
				    <div class="modal-content bg-light text-dark" id="modalContentInformazioni">
				      <div class="modal-header">
				        <h5 class="modal-title" id="exampleModalLongTitle"><strong>Sei sicuro voler cancellare questo account?</strong></h5>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true" id="buttonXInformazioni" class="text-dark">&times;</span>
				        </button>
				      </div>
				      <div class="modal-body">
				        	 <div class="container">
						      <div class="image">
						        <img src="/images/logoElimina.png">
						      </div>
						      <div class="text">
						        <h6>Siamo spiacenti di sapere che desideri eliminare il tuo account! Procedendo tutti i tuoi dati, il tuo canale e i contenuti caricati verranno rimossi.</h6>
						      </div>
						    </div>
				      </div>
				      <div class="modal-footer bg-light text-dark" id="modalFooterInformazioni">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">Annulla</button>
						<form action="../accountCancella" method="POST">
							<button type="submit" class="btn btn-danger">S&igrave;, voglio eliminare questo account</button>
						</form>
				      </div>
				    </div>
				  </div>
				</div>
			</div>
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
