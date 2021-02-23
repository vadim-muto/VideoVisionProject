<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="it">
<head>
  <title>Informazioni</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="/css/info.css" type="text/css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <script src="/js/info.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCK40s8SqtgsqWrD5mLy3E8K9vLWoHYXxc&callback=initMap&libraries=&v=weekly" defer></script>
 
 </head>
<body class="bg-light" id="body">
	
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
	
	<div class="container">
	
		<div class="card my-4 text-center" id="divFrase">
		  <div class="card-body" id="divFrase1">
		    <h4 class="" ><strong>Informazioni VideoVision</strong></h4>
		  </div>
		</div>

		  <div class="row">
		    <div class="col-md-4 mb-4">
		      <div class="card h-100">
		        <h4 class="card-header" id="head1">Perchè il sito?</h4>
		        <div class="card-body" id="corpo1">
		          <p class="card-text">Questo sito è stato realizzato per un progetto che ci è stato assegnato in ambito universitario, in particolare il tutto è stato realizzato in collabborazione con due esami del terzo anno della facoltà di Informatica (Ingegneria del software e Web Computing) </p>
		        </div>
		       
		      </div>
		    </div>

		    <div class="col-md-4 mb-4">
		      <div class="card h-100">
		        <h4 class="card-header" id="head2">L'idea</h4>
		        <div class="card-body" id="corpo2">
		          <p class="card-text">Come detto il progetto nasce a scopo didattico, con esso si vuole consentire la condivisione e visualizzazione in rete di contenuti multimediali. </p>
		        </div>
		      </div>
		    </div>

		    <div class="col-md-4 mb-4">
		      <div class="card h-100">
		        <h4 class="card-header" id="head3">Chi siamo?</h4>
		        <div class="card-body" id="corpo3">
		          <p class="card-text">Siamo quattro sviluppatori calabresi, appassionati di informatica che frequentano l'università della Calabria, in particolare il Dipartimento di Matematica e informatica</p>
		        </div>
		      </div>
		    </div>
		   </div>
		    <div class="row">
			    <div class="col-md-4 mb-4">
			      <div class="card h-100">
			        <h4 class="card-header" id="head4">La nostra Università..</h4>
			        <div class="card-body" id="corpo4">
			          <p class="card-text">L'Università della Calabria (in breve UniCal) è un'università statale italiana fondata nel 1972 e situata sulle colline di Arcavacata, frazione del comune di Rende, in provincia di Cosenza. Secondo la classifica stilata dal Censis nel 2018 e con conferma nel 2019 l'Università seconda tra i grandi atenei statali italiani.</p>
			        </div>
			        <div class="card-footer" id="foot1">
				        <form action="https://www.unical.it/portale/">
				           <button type="submit" class="btn btn-primary" id="btnUniversita">
				    			<span class="spinner-grow spinner-grow-sm"></span>
				   				 UNIVERSITA'
				   				 <img src="/images/logoUnical.png" width="8%" />
				 			 </button>
				 		</form>
			        </div>
			      </div>
		   		 </div>

			    <div class="col-md-4 mb-4">
			      <div class="card h-100">
			        <h4 class="card-header" id="head5">Il nostro Dipartimento..</h4>
			        <div class="card-body" id="corpo5">
			          <h5>(Dipartimento di Infromatica)</h5>
			          <p class="card-text">Il corso di Laurea in Informatica si pone come obiettivo primario quello di rispondere alla crescente domanda di figure professionali nel settore della ICT. La preparazione tecnico-scientifica fornita dal corso di Laurea consente ai laureati un rapido inserimento nel mondo del lavoro. Come elemento distintivo, nei percorsi formativi, la comprensione della tecnologia informatica e il suo utilizzo nella risoluzione di problemi sono sinergicamente integrati con una solida preparazione scientifica-metodologica.</p>
			        </div>
			        <div class="card-footer" id="foot2">
				        <form action="https://informatica.unical.it/home-page">
				           <button class="btn btn-primary" id="btnDipartimento">
				    			<span class="spinner-grow spinner-grow-sm"></span>
				   				 DIPARTIMENTO 
				   				 <img src="/images/logoDemacs.png" width="50%" />
				 			 </button>
				 		</form>
			        </div>
			      </div>
			    </div>

			    <div class="col-md-4 mb-4">
			      <div class="card h-100">
			        <h4 class="card-header" id="head6">Alcune Statistiche</h4>
			        <div class="card-body" id="corpo6">
			          <label class="col-md-9" ><strong>Totale Utenti: </strong><i class="fa fa-plus-circle" aria-hidden="true"></i></label>
			          <input class="col-md-2" type="text" id="iscritti" value="${numUtenti}" disabled >
			          <label class="col-md-9" ><strong>Totale Commenti: </strong><i class="fa fa-comments-o" aria-hidden="true"></i></label>
			          <input class="col-md-2" type="text" id="iscritti" value="${numRecensioni}" disabled >
			          <label class="col-md-9" ><strong>Totale Video Caricati: </strong><i class="fa fa-video-camera" aria-hidden="true"></i></label>
			          <input class="col-md-2" type="text" id="iscritti" value="${numVideo}" disabled >
			          <label class="col-md-6" ><strong>Data di oggi: </strong><i class="fa fa-calendar" aria-hidden="true"></i></label>
			          <input class="col-md-5" type="text" id="data" value="" disabled >
			          <label class="col-md-6" ><strong>Sono le ore: </strong><i class="fa fa-clock-o" aria-hidden="true"></i></label>
			          <input class="col-md-5" type="text" id="orario" value="" disabled >
			          <label class="col-md-5" ><strong>Il tuo IP: </strong><i class="fa fa-desktop" aria-hidden="true"></i></label>
			          <input class="col-md-6" type="text" id="ip" value="" disabled >
			        </div>
			      </div>
			    </div>
 			 </div>
  
		   <div class="row" id="headDip">
		    <div class="col-md-12 mb-12" id="headDip1">
		      <div class="card h-100" id="headDip2">
		        <h4 class="card-header" id="head7">Dove puoi trovarci?</h4>
		        <div class="card-body" id="corpo7">
		         <div id="map"></div>
		        </div>
		        <div class="card-footer" id="foot7">
					<h6><strong>Università della Calabria - 87036 Arcavacata di Rende - Italia </strong><i class="fa fa-building-o" aria-hidden="true"></i></h6>
					<h6><strong>Dipartimento di Matematica e Informatica - Cubi 30A-30B-31A-31B</strong> <i class="fa fa-building-o" aria-hidden="true"></i></h6>
					<h6><strong>Contattaci all' email: </strong> videovision2021@gmail.com <i class="fa fa-envelope-o" aria-hidden="true"></i></h6>
		        </div>
		      </div>
		    </div>
		  </div>

		  <div class="row mb-4" id="sotto">
			    <div class="col-md-8">
			      <strong>Copyright© 2020 VideoVision. Rotondaro Giovanni-Muto Vadim-Locanto Santo-Iorio Massimo Pio</strong>
			    </div>
			    <div class="col-md-4">
			    	<form action="home" method="POST">
			           <button type="submit" class="btn btn-primary" id="btnContinua">
			    			<span class="spinner-grow spinner-grow-sm"></span>
			   				 CONTINUA LA NAVIGAZIONE
			   				 <img src="/images/prova.gif" alt="this slowpoke moves"  width="8%" />
			 			 </button>
				 	</form>
			  	</div>
		   </div>
	</div>
    
    <div class="modal fade" id="myModal">
        <div class="modal-dialog modal-sm">
            <div class="modal-content text-dark bg-light" id="modalContentLogin">
                <div class="modal-header">
                	<h4 class="modal-title">Accedi/Registrati</h4>
               		<button type="button" class="close" data-dismiss="modal" id="buttonXLogin">&times;</button>
                </div>
                <div class="modal-body">
                    <form id="formRegistrazione" action="/action_page.php">
                        <div class="form-group">
                          <label for="email">Email:</label>
                          <input type="email" class="form-control" placeholder="Enter email" id="email">
                        </div>
                        <div class="form-group">
                          <label for="pwd">Password:</label>
                          <input type="password" class="form-control" placeholder="Enter password" id="pwd">
                        </div>
                        <div class="form-group form-check">
                          <label class="form-check-label">
                            <input class="form-check-input" type="checkbox"> Ricordati
                          </label>
                        </div>
                        <button type="submit" class="btn btn-primary">Accedi</button>
                      </form>
                </div>
                <div class="modal-footer">
                    <a href="/html/recuperoPassword.html" id="passdim" >Password dimenticata?</a>
                    <a href="/html/registrazione.html" id="registrati">Sei nuovo? Registrati</a>
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