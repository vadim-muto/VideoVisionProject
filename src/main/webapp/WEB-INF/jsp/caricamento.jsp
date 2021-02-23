<!DOCTYPE html>
<html lang="it">
<head>
  <title>VideoVision-CaricamentoVideo</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="/css/caricamento.css" type="text/css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <script src="/js/caricamento.js"></script>
  
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
	
	<div class="wrapper">
		<div class="row">
	  		<div class="col-md-5 form text-dark" id="divColForm">
	  			<form id="caricaVideo" method="POST" action="../uploadFile">
                    <div class="container">
                        <h1>Caricamento Video</h1>
                        <p>Gentile utente, per caricare un video compila i seguenti campi</p>
                        
	                    <label><b>Scegli il video che vuoi caricare</b></label>
	                    <input type="file" class="form-control-file" name="a" onchange="setNomeVideo()" value="fileupload" id="fileupload"
	                    accept=".mp4, .mkv, .ogg">
	                    
	                    <br>
	                    
	                    <label><b>Scegli la foto di copertina che vuoi caricare</b></label>
	                    <input type="file" class="form-control-file" name="a" onchange="setFotoVideo()" value="fileupload" id="fotoupload"
	                    accept=".png, .jpg">
	                    
	                    <input type="text" id="infoVideo" name="nomeVideo" class="form-control" type="text" value="">
	                    <input type="text" id="infoFoto" name="linkFoto" class="form-control" type="text" value="">
	                                   
                        <label><b>Inserisci il titolo </b></label>
                        <input type="text" class="form-control" id="titoloVideo" placeholder="Inserisci il titolo" name="titolo">
                        <br>
                        
                        <div class="form-group">
 							 <label><b>Inserisci la descrizione</b></label>
  							 <textarea class="form-control" rows="5" id="descrizione" placeholder="Inserisci la descrizione" name="descrizione"></textarea>
						</div>
						 
						 <div class="form-group">
 							 <label><b>Tag associati</b></label>
  							 <textarea class="form-control" rows="2" id="tag" placeholder="Inserisci i tag" name="tag"></textarea>
						</div>
						
						<div class="custom-control custom-checkbox">
							<input type="checkbox" class="custom-control-input" id="customCheckLimiti" name="checkbox">
							<label class="custom-control-label" for="customCheckLimiti">Dichiaro che � un video soggetto a limiti di et�</label>
						</div> 
						
						<div class="custom-control custom-checkbox">
							<input type="checkbox" class="custom-control-input" id="customCheckDownload" name="download">
							<label class="custom-control-label" for="customCheckDownload">Acconsento al download del video</label>
						</div> 
						 
						<br>
                        <button type="button" class="btn btn-primary" id="uploadBtn" onclick="uploadAll()" disabled>Carica Video</button>
                       
                      </div>
                </form>
	  		</div>
	  		<div class="col-md-5" id="foto">
	  			<div class="" id="divAlert">
	  				
			  	</div>
	  			<img src="/images/logoVideoVision.png" id="fotoDestra">
	  		</div>
	   </div>
    </div>
    
    <div class="bg-secondary footer" id="divFooter">
	  <p> <strong> Copyright� 2020 VideoVision.</strong> Rotondaro Giovanni - Muto Vadim - Locanto Santo - Iorio Massimo Pio</p>
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
                                <label class="custom-control-label" for="customSwitches">Aspetto</label>
                            </div>
                        </li>
                        <li class="list-group-item text-dark bg-light" id="switchModal2">
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