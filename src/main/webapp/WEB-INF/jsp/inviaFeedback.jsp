<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="it">
<head>
  <title>Invia Feedback</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="/css/inviaFeedback.css" type="text/css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <script src="/js/inviaFeedback.js"></script>
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
	
	<div class="wrapper bg-light" id="divPrincipale">
		<div class="row">
			<div class="col-md-5 form text-light" id="divColForm">
				<div class="container">
					<div class="row text-light">
						<div class="neons col-12">
							<h6><em>VideoVision Feedback</em></h6>
						</div>
					</div>
				</div>
			<br>
	  			<h5 class="text-dark">Gentile utente, per noi conta molto il tuo parere!</h5>
	  			<h6>
	  			<p class="text-dark">Rispondi a 4 semplici domande e darai il contributo allo sviluppo della piattaforma</p>
	  			</h6>
	  			<form method="POST" action="../inviaFeedback" id="formFeedback">
	  				<input type="text" id="inputGrafica" name="grafica" value="Mi piace molto">
	  				<input type="text" id="inputTheme" name="tema" value="Dark Mode">
	  				<input type="text" id="inputIntuitivita" name="intuitivita" value="Si">
	  				<input type="text" id="inputAccount" name="account" value="Si">
	  				<input type="text" id="inputStelle" name="stelle" value="0">
					<div class="row">
						<div class="col-md-6">
							<label for="Grafica" class="text-dark">Quanto ti piace la grafica della piattaforma?</label>
						</div>
						<div class="col-md-4">
							<select id="Grafica" onclick="setInputFeedback(this)">
							<option value="Mi piace" class="text-dark">Mi piace</option>
							<option value="Non mi piace" class="text-dark">Non mi piace</option>
							<option value="Non mi esprimo" class="text-dark">Non mi esprimo</option>
							</select>
						</div>
					</div>
				
					<div class="row">
						<div class="col-md-6">
							<label for="Theme" class="text-dark">Preferisci la navigare in white o dark mode?</label>
						</div>
						<div class="col-md-4">
							<select id="Theme" onclick="setInputFeedback(this)">
							<option value="Dark Mode" class="text-dark">Dark Mode</option>
							<option value="White Mode" class="text-dark">White Mode</option>
							<option value="Indifferente" class="text-dark">Indifferente</option>
							</select>
						</div>
					</div>
				
				
					<div class="row">
						<div class="col-md-6">
							<label for="Intuitivita" class="text-dark">Trovi la piattaforma facile e intuitiva? </label>
						</div>
						<div class="col-md-4">
							<select id="Intuitivita" onclick="setInputFeedback(this)">
							<option value="Si">Si</option>
							<option value="No" class="text-dark">No</option>
							<option value="Indifferente" class="text-dark">Indifferente</option>
							</select>
						</div>
					</div>
				
					<div class="row">
						<div class="col-md-6">
							<label for="Account" class="text-dark">Hai un account su VideoVision?</label>
						</div>
						<div class="col-md-4">
							<select id="Account" onclick="setInputFeedback(this)">
							<option value="Si" class="text-dark">Si</option>
							<option value="No" class="text-dark">No</option>
							<option value="Penso di crearlo a breve" class="text-dark">Penso di crearlo a breve</option>
							</select>
						</div>
					</div>
				
					<header class='header text-center'>
						<p class="text-dark">Inserisci da 1 - 3 stelle se pensi che il sito sia <b>inutile</b> e 4 - 5 stelle se pensi che il sito sia<b> utile</b></p>
					</header>

					<section class='rating-widget'>
						<div class='rating-stars text-center'>
							<ul id='stars'>
							<li class='star' title='Poor' data-value='1'>
								<i class='fa fa-star fa-fw' id="s1"></i>
							</li>
							<li class='star' title='Fair' data-value='2' >
								<i class='fa fa-star fa-fw' id="s2"></i>
							</li>
							<li class='star' title='Good' data-value='3'>
								<i class='fa fa-star fa-fw' id="s3"></i>
							</li>
							<li class='star' title='Excellent' data-value='4'>
								<i class='fa fa-star fa-fw' id="s4"></i>
							</li>
							<li class='star' title='WOW!!!' data-value='5'>
								<i class='fa fa-star fa-fw' id="s5"></i>
							</li>
							</ul>
						</div>
						
					</section>

					<div class="affiliate-container" style="justify-content: center;">
						<a href="https://wordpress.com/alp/?aff=17623&cid=1874995" target="_blank" class="wp-overlay-link"></a>
					</div>
  
					<div class="form-group">
						<label for="comment" class="text-dark">Risultati Stelle: <i class="fa fa-star-o" aria-hidden="true"></i></label>
						<input type="text" id="risStelle" disabled>		
						 <div class="form-group">
							<label for="comment" class="text-dark">Commenti: <i class="fa fa-comments-o" aria-hidden="true"></i></label>
							<textarea class="form-control" rows="5" id="comment" name="commento" data-value="ciao"></textarea>
						</div>
					</div>
				  	  
					<button type="button" class="btn btn-outline-success" id="btnFeedback" onclick="submitFormFeedback()">Inserisci Feedback <i class="fa fa-pencil-square-o" aria-hidden="true"></i></button>
					<button type="button" class="btn btn-outline-info" data-toggle="modal" data-target="#modalEliminaAccount" id="btnRisultati">Visualizza i Risultati <i class="fa fa-bar-chart" aria-hidden="true"></i></button>
				</form>
				
				<div class="toast" data-autohide="false">
			        <div class="toast-header bg-primary" id="meteoTesta">
			          <strong class="mr-auto text-white">Unical - Arcavacata(CS)</strong>
			          <small class="text-white">In tempo reale</small>
			          <button type="button bg-light text-light" class="ml-2 mb-1 close" data-dismiss="toast">&times;</button>
			        </div>
			        <div class="toast-body bg-secondary">
			            <div class="row">
			                <div class="col-md-6">
			                    <img src="" id="icon">
			                </div>
			                <div class="col-md-6" id="divTemperatura">
			                    
			                </div>
			            </div>
			        </div>
			    </div>
			    
	  		</div>
	  		<div class="col-md-5" id="foto">
				  <div id="alertFeedback">

				  </div>
	  			<img src="/images/ComputerFeed.png" id="fotoDestra">
	  			<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
				  <div class="carousel-inner">
				    <div class="carousel-item active">
				      <div class="carousel-caption">
				        <h3>Commenti.. <i class="fa fa-commenting-o" aria-hidden="true"></i></h3> 
				        <p><strong>${commentoUno}</strong></p>
				      </div>
				    </div>
				    <div class="carousel-item">
				      <div class="carousel-caption">
				        <h3>Commenti.. <i class="fa fa-commenting-o" aria-hidden="true"></i></h3>
				        <p><strong>${commentoDue}</strong></p>
				      </div>
				    </div>
				    <div class="carousel-item">
				      <div class="carousel-caption">
				        <h3>Commenti.. <i class="fa fa-commenting-o" aria-hidden="true"></i></h3>
				        <p><strong>${commentoTre}</strong></p>
				      </div>
				    </div>
				  </div>
				  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
				    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
				    <span class="sr-only">Previous</span>
				  </a>
				  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
				    <span class="carousel-control-next-icon" aria-hidden="true"></span>
				    <span class="sr-only">Next</span>
				  </a>
				</div>
	  		</div>
	   </div>
    </div>

    <div class="bg-dark footer" id="divFooter">
		<p id="pFooter"> <strong> Copyright ï¿½ 2020 VideoVision.</strong> Rotondaro Giovanni - Muto Vadim - Locanto Santo - Iorio Massimo Pio</p>
	</div>  
	
    <div class="modal fade" id="myModalSettings">
        <div class="modal-dialog modal-sm">
            <div class="modal-content text-dark bg-light" id="modalContent">
        
                <div class="modal-header" id="modalHeader">
                    <h4 class="modal-title">Impostazioni</h4>
                    <button type="button" class="close" data-dismiss="modal" id="buttonX">&times;</button>
                </div>
        
                <div class="modal-body">
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item text-dark bg-light" id="switchModal1">
                            <div class="custom-control custom-switch">
                                <input type="checkbox" class="custom-control-input" id="customSwitches" onclick="changeColor()">
                                <label class="custom-control-label" for="customSwitches" id="labelCustomSwitches">Aspetto</label>
                            </div>
                        </li>
                        <li class="list-group-item text-dark bg-light" id="switchModal2">
                            <a href="/images/GuidaUtenteVideoVision.pdf" class="text-dark text-decoration-none" id="aItemModal3" download>Guida utente</a>
                        </li>
                     </ul>
                </div>
            </div>
        </div>
    </div>
    
    <div class="modal fade" id="modalEliminaAccount" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
				  <div class="modal-dialog modal-dialog-centered" role="document" id="modalDialogElimina">
				    <div class="modal-content bg-light text-dark" id="modalContentRisultati">
				      <div class="modal-header">
				        <h5 class="modal-title" id="exampleModalLongTitle"><strong>Statistiche delle risposte ottenute <i class="fa fa-bar-chart" aria-hidden="true"></i> <i class="fa fa-pie-chart" aria-hidden="true"></i></strong></h5>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true" id="buttonXRisultati">&times;</span>
				        </button>
				      </div>
				      <div class="modal-body">
				        	 <div class="container">
						     
						      <div class="text">
						        <h6><i class="fa fa-paint-brush" aria-hidden="true"></i>Grafica Piattaforma:</h6>
						        	
						        <table class="table">
								  <thead>
								    <tr>
								      <th scope="col">Mi Piace</th>
								      <th scope="col">Non Mi Piace</th>
								      <th scope="col">Non Mi esprimo</th>
								    </tr>
								  </thead>
								  <tbody>
								    <tr>
							    	  <td>${miPiace}</td>
								      <td>${nonMiPiace}</td>
								      <td>${nonMiEsprimo}</td>
								    </tr>
								  </tbody>
								  </table>
								   <h6><i class="fa fa-globe" aria-hidden="true"></i> Quanti per la white-dark Mode?</h6>
						         <table class="table">
								  <thead>
								    <tr>
								      <th scope="col">White</th>
								      <th scope="col">Dark</th>
								      <th scope="col">Indifferente</th>
								    </tr>
								  </thead>
								  <tbody>
								    <tr>
								      <td>${temaDark}</td>
								      <td>${temaWhite}</td>
								      <td>${temaIndifferente}</td>
								    </tr>
								  </tbody>
								  </table>
								  
								 <h6><i class="fa fa-window-restore" aria-hidden="true"></i> Interfaccia intuitiva?</h6>
						         <table class="table">
								  <thead>
								    <tr>
								      <th scope="col">Si</th>
								      <th scope="col">No</th>
								      <th scope="col">Indifferente</th>
								    </tr>
								  </thead>
								  <tbody>
								    <tr>
								      <td>${intuitivaSi}</td>
								      <td>${intuitivaNo}</td>
								      <td>${intuitivaIndifferente}</td>
								    </tr>
								  </tbody>
								  </table>
								  
								  <h6><i class="fa fa-user" aria-hidden="true"></i> Account?</h6>
						         <table class="table">
								  <thead>
								    <tr>
								      <th scope="col">Si</th>
								      <th scope="col">No</th>
								      <th scope="col">A breve lo farò</th>
								    </tr>
								  </thead>
								  <tbody>
								    <tr>
								      <td>${accountSi}</td>
								      <td>${accountNo}</td>
								      <td>${accountABreve}</td>
								    </tr>
								  </tbody>
								  </table>
								  
								  <h6><i class="fa fa-star" aria-hidden="true"></i> Numero di stelle negative/neutrali ricevute</h6>
						         <table class="table">
								  <thead>
								    <tr>
								      <th scope="col" id="unaStella">Una <i class="fa fa-star" aria-hidden="true"></i></th>
								      <th scope="col" id="dueStelle">Due <i class="fa fa-star" aria-hidden="true"></i></th>
								      <th scope="col" id="treStelle">Tre <i class="fa fa-star" aria-hidden="true"></i></th>
								    </tr>
								  </thead>
								  <tbody>
								    <tr>
								      <td>${stelleUna}</td>
								      <td>${stelleDue}</td>
								      <td>${stelleTre}</td>
								    </tr>
								  </tbody>
								  </table>
								    <h6><i class="fa fa-star" aria-hidden="true"></i> Numero di stelle positive ricevute</h6>
						         <table class="table">
								  <thead>
								    <tr>
								      <th scope="col" id="quattroStelle">Quattro <i class="fa fa-star" aria-hidden="true"></i></th>
								      <th scope="col" id="cinqueStelle">Cinque <i class="fa fa-star" aria-hidden="true"></i></th>
								    </tr>
								  </thead>
								  <tbody>
								    <tr>
								      <td>${stelleQuattro}</td>
								      <td>${stelleCinque}</td>
								    </tr>
								  </tbody>
								  </table>
								  
						      </div>
						    </div>
				      </div>
				      <div class="modal-footer">
				        <p id="ciao"><strong>Copyright© 2020 VideoVision.</strong></p>
				      </div>
				    </div>
				  </div>
				</div>
</body>
</html>



