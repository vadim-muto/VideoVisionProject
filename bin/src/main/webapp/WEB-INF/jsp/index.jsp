<!DOCTYPE html>
<html lang="it">
<head>
  <title>VideoVision</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="/css/index.css" type="text/css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <script src="/js/index.js"></script>
</head>
<body class="bg-light" id="body">
	
	<nav class="navbar navbar-expand-sm justify-content-between" id="superiore">
  		<!-- Brand/logo -->
		<a class="navbar-brand flex-fill" href="./">
			<img src="/images/logoVideoVision.png" id="occhio">
		</a>
		<!-- Search bar -->
  		<form class="form-inline flex-fill " action="/action_page.php">
        	<input id="searchBar" class="form-control mr-sm-2" type="text" placeholder="Search">
        	<button id="searchButton" class="btn btn-danger" type="submit"><i class="fa fa-search"></i></button>
       	</form>
  		<!-- Links -->
  		<ul class="navbar-nav flex-fill justify-content-end">
    		<li class="nav-item">
				<button type="button" class="btn btn-light" data-toggle="modal" data-target="#myModal" id="loginBtn">Login <i class="fa fa-user"></i></button>
    		</li>
    		<li class="nav-item">
      			<button type="button" class="btn btn-light" data-toggle="modal" data-target="#myModalSettings" id="settingsBtn"><i class="fa fa-cog"></i></button>
    		</li>
	  		<li class="nav-item">
      			<button type="button" class="btn btn-light" data-toggle="collapse" data-target="#sidebar" id="sidebarCollapse" onclick="clickButton()"><i id="iconBtn" class="fa fa-bars"></i></button>
    		</li>
  		</ul>
	</nav>
	
	<!-- parte video -->
	<div class="wrapper">
        <div id="content">
            
              <div class="responsive">
                <div class="gallery">
                  <a target="_blank" href="html/video.html">
                    <video class="video"><source src="/images/prova.mkv"></video>  
                  </a>
                  <div class="desc">Add a description of the image here</div>
                </div>
              </div>
			
				
            <div class="responsive">
                <div class="gallery">
                  <a target="_blank" href="img_5terre.jpg">
                    <video class="video"><source src="/images/prova.mkv"></video>  
                  </a>
                  <div class="desc">Add a description of the image here</div>
                </div>
              </div>
			
            <div class="responsive">
                <div class="gallery">
                  <a target="_blank" href="img_5terre.jpg">
                    <video class="video"><source src="/images/prova.mkv"></video>  
                  </a>
                  <div class="desc">Add a description of the image here</div>
                </div>
              </div>
				
            <div class="responsive">
                <div class="gallery">
                  <a target="_blank" href="img_5terre.jpg">
                    <video class="video"><source src="/images/prova.mkv"></video>  
                  </a>
                  <div class="desc">Add a description of the image here</div>
                </div>
              </div>
				
				
            <div class="responsive">
                <div class="gallery">
                  <a target="_blank" href="img_5terre.jpg">
                    <video class="video"><source src="/images/prova.mkv"></video>  
                  </a>
                  <div class="desc">Add a description of the image here</div>
                </div>
              </div>
				
				
            <div class="responsive">
                <div class="gallery">
                  <a target="_blank" href="img_5terre.jpg">
                    <video class="video"><source src="/images/prova.mkv"></video>  
                  </a>
                  <div class="desc">Add a description of the image here</div>
                </div>
              </div>
				
				
            <div class="responsive">
                <div class="gallery">
                  <a target="_blank" href="img_5terre.jpg">
                    <video class="video"><source src="/images/prova.mkv"></video>  
                  </a>
                  <div class="desc">Add a description of the image here</div>
                </div>
              </div>
				
				
            <div class="responsive">
                <div class="gallery">
                  <a target="_blank" href="img_5terre.jpg">
                    <video class="video"><source src="/images/prova.mkv"></video>  
                  </a>
                  <div class="desc">Add a description of the image here</div>
                </div>
              </div>
				
				
            <div class="responsive">
                <div class="gallery">
                  <a target="_blank" href="img_5terre.jpg">
                    <video class="video"><source src="/images/prova.mkv"></video>  
                  </a>
                  <div class="desc">Add a description of the image here</div>
                </div>
              </div>
        </div>

  
      <!-- Sidebar -->
		<div id="sidebar" class="collapse">
		    <div id="list" class="list-group">
			  <a href="#" class="list-group-item list-group-item-action active"><i class="fa fa-home"></i> HOME</a>
			  <a href="#" class="list-group-item list-group-item-action"> Area personale</a>
			  <a href="/html/caricamento.html" class="list-group-item list-group-item-action"> Carica video</a>
			  <a href="#" class="list-group-item list-group-item-action"> PlayList</a>
			  <a href="#" class="list-group-item list-group-item-action"> Preferiti</a>
			  <a href="#" class="list-group-item list-group-item-action"> Iscrizioni</a>
			  <a href="#" class="list-group-item list-group-item-action"> Help</a>
			  <a href="#" class="list-group-item list-group-item-action"> Iscrizioni</a>
			  <a href="#" class="list-group-item list-group-item-action"> Giovanni</a>
			  <a href="#" class="list-group-item list-group-item-action"> a</a>
			  <a href="#" class="list-group-item list-group-item-action"> b</a>
			  <a href="#" class="list-group-item list-group-item-action" id="ultimoLista"> c</a>
			</div>
  		</div>
    </div>  
    
    <!--  Modal login -->
    <div class="modal fade" id="myModal">
        <div class="modal-dialog modal-sm">
            <div class="modal-content text-dark bg-light" id="modalContentLogin">
        
                <!-- Modal Header -->
                <div class="modal-header">
                	<h4 class="modal-title">Accedi/Registrati</h4>
               		<button type="button" class="close" data-dismiss="modal" id="buttonXLogin">&times;</button>
                </div>
        
                <!-- Modal body -->
                <div class="modal-body">
                    <!-- Form del modal-->
                    <form id="formRegistrazione" method="POST" action="doLogin">
                        <div class="form-group">
                          <label for="username">Username:</label>
                          <input type="text" class="form-control" name="username" placeholder="Inserisci username" id="username" required>
                        </div>
                        <div class="form-group">
                          <label for="pwd">Password:</label>
                          <input type="password" class="form-control" name="password" placeholder="Inserisci password" id="pwd" required>
                        </div>
                        <div class="form-group form-check">
                          <label class="form-check-label">
                            <input class="form-check-input" type="checkbox"> Ricordati
                          </label>
                        </div>
                        <button type="submit" class="btn btn-primary">Accedi</button>
                      </form>
                </div>
                <!-- Modal footer -->
                <div class="modal-footer">
                    <a href="/html/recuperoPassword.html" id="passdim" >Password dimenticata?</a>
                    <a href="/html/registrazione.html" id="registrati">Sei nuovo? Registrati</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Model Settings-->
    <div class="modal fade" id="myModalSettings">
        <div class="modal-dialog modal-sm">
            <div class="modal-content" id="modalContentSettings">
        
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">Impostazioni</h4>
                    <button type="button" class="close" data-dismiss="modal" id="buttonXSettings">&times;</button>
                </div>
        
                <!-- Modal body -->
                <div class="modal-body">
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item" id="switchModal1">
                            <div class="custom-control custom-switch">
                                <input type="checkbox" class="custom-control-input" id="customSwitches" onclick="changeColor()">
                                <label class="custom-control-label" for="customSwitches">Aspetto</label>
                            </div>
                        </li>
                        <li class="list-group-item" id="switchModal2">
                            <a href="#" class="text-dark text-decoration-none" id="aItemModal1">Guida utente</a>
                        </li>
                        <li class="list-group-item" id="switchModal3">
                            <a href="#" class="text-dark text-decoration-none" id="aItemModal2">Invia feedback</a>
                        </li>
                        <li class="list-group-item" id="switchModal4">
                         <a href="#" class="text-dark text-decoration-none" id="aItemModal3">Fourth item</a>
                         </li>
                      </ul>
                </div>
            </div>
        </div>
    </div>
	
</body>
</html>