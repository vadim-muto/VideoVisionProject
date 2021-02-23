<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Risultati Video</title>
<link rel="stylesheet" href="/css/risultatiVideo.css" type="text/css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="/js/risultatiVideo.js"></script>
</head>
<body class="bg-light" id="body">
	<c:if test="${usernameLogged != null}">
		<script>
			setUsernameLogged(1);
		</script>
		<script>
			setUsername('${usernameLogged}');
		</script>
	</c:if>

	
	<nav class="navbar navbar-expand-sm" id="superiore">
		<a class="navbar-brand flex-fill" href="../">
			<img src="/images/logoVideoVision.png" id="occhio">
		</a>
		
  		<form class="form-inline flex-fill " method="POST" action="../doSearch">
        	<input id="searchBar" class="form-control mr-sm-2" type="text" placeholder="Search" name="search" value="${search}" onkeydown="visibilityButton()" onkeyup="visibilityButton()">
        	<button id="searchButton" class="btn btn-danger" type="submit"><i class="fa fa-search"></i></button>
       	</form>
  		
  		<ul class="navbar-nav flex-fill justify-content-end">
  			<li class="nav-item">
  				<c:if test="${usernameLogged != null}">
					<img id="imgPr" src="${utente.getFoto_profilo()}" class="image--cover" />
				</c:if>
  			</li>
    		<li class="nav-item">
				<c:if test="${usernameLogged == null}">
					<button type="button" class="btn btn-light" data-toggle="modal" data-target="#myModal" id="loginBtn" onclick="removeWarningFromLogin()">Login <i class="fa fa-user"></i></button>
				</c:if>
				<c:if test="${usernameLogged != null}">
					<button type="button" class="btn btn-light" id="loginBtn">${usernameLogged} <i class="fa fa-user"></i></button>
				</c:if>
    		</li>
    		<li class="nav-item">
      			<button type="button" class="btn btn-light" data-toggle="modal" data-target="#myModalSettings" id="settingsBtn"><i class="fa fa-cog"></i></button>
    		</li>
	  		<li class="nav-item">
      			<button type="button" class="btn btn-light" data-toggle="collapse" data-target="#sidebar" id="sidebarCollapse" onclick="clickButton()"><i id="iconBtn" class="fa fa-bars"></i></button>
    		</li>
  		</ul>
	</nav>

	
	<div id="divPrincipale">
		<div class="spinner-border text-light" id="divSpinner"></div> 

        <div id="divVideo" class="container">
	        <form action="filtri" method="POST">
	        	<div class="collapse" id="divCollapse">
		        	<nav class="navbar navbar-expand-sm bg-light navbar-light" id="navFilterCollapse">
					  <ul class="navbar-nav text-danger">
					    <li class="nav-item active text-danger">
					    	<button class="noButton nav-link text-dark" type="submit" id="primoFiltro" value="ultimiInseriti" onclick="disactiveFocus(this)"><i class="fa fa-calendar" aria-hidden="true"></i> Ultimi inseriti</button>
					    </li>
					    <li class="nav-item">
					    	<button class="noButton nav-link text-dark" type="submit" id="secondoFiltro" value="inEvidenza" onclick="disactiveFocus(this)"><i class="fa fa-thumbs-up" aria-hidden="true"></i> In evidenza</button>
					      	
					    </li>
					    <li class="nav-item">
					    	<button class="noButton nav-link text-dark" type="button" id="terzoFiltro" onclick="setCategory()"><i class="fa fa-stack-exchange" aria-hidden="true"></i> Categoria</button>
					    </li>
					    <ul class="nav flex-column" id="listCategory">
						    <li class="nav-item">
						    	<button class="noButton nav-link text-dark" type="submit" id="categoriaUno" value="sport" onclick="disactiveFocus(this)">Sport</button>
						    </li>
						    <li class="nav-item">
						    	<button class="noButton nav-link text-dark" type="submit" id="categoriaDue" value="intrattenimento" onclick="disactiveFocus(this)">Intrattenimento</button> 
						    </li>
						    <li class="nav-item">
						    	<button class="noButton nav-link text-dark" type="submit" id="categoriaTre" value="cinema" onclick="disactiveFocus(this)">Cinema</button>
						    </li>
						</ul>
					  </ul>
					</nav>
				</div>
				<input type="text" name="filtro" id="textFiltro" value="" readonly>
	       	</form>
        	
        	<nav class="navbar navbar-expand-sm bg-light navbar-light" id="navFilter">
        		<div data-toggle="tooltip" data-placement="bottom" title="Apri filtri di ricerca" id="divTooltip">
        			<a href="#divCollapse" id="aFilter" class="text-primary text-decoration-none" data-toggle="collapse" onclick="disableTooltip()"><i class="fa fa-filter" aria-hidden="true"></i> Filtra</a>
				</div>
			</nav>
			
			<hr class="my-4">

			<c:if test="${resultEmpty != null}">
				<strong><i class="fa fa-frown-o justify-content-center" aria-hidden="true" id="nessuRisultato"></i> ${resultEmpty}</strong>
			</c:if>

			<c:forEach var="video" items="${video}">
				<form method="POST" action="../selezionaVideo" id="formVideo">
					<input type="text" id="inputVideo" value="" name="videoDaVisualizzare" readonly>
		        	<div class="container p-3 my-3 row">
						<video class="bg-dark" src="" onclick="scegliVideo(this, '${video.getLinkFoto()}')" onmouseover="playVideo(this, '${video.getLinkVideo()}')" onmouseout="pauseVideo(this, '${video.getLinkFoto()}')" poster="${video.getLinkFoto()}" controls muted></video>
							<div class="col">
								<h4>${video.getTitolo()}</h4>
									<div class="col">	
										<h6><span class="badge badge-primary">${video.getVisualizzazioni()}</span> visualizzazioni</h6>
									</div>
									<div class="col">
										<h6>Data di pubblicazione <span class="badge badge-light" id="spanData">${video.getData_pubblicazione()}</span></h6>
									</div>
									
									<div class="col">
										<strong>Caricato da: </strong><a class="text-danger text-decoration-none" onclick="submitFormCanale(this)">${video.getUsername()}</a>
									</div>
									
									<br>
									
									<div class="col">
										<c:if test="${usernameLogged == null}">
											<button class="btn btn-primary" type="button" onclick="controlloPermessi()">Salva in Playlist</button>
										</c:if>
										<c:if test="${usernameLogged != null}">
											<button type="button" class="btn btn-primary" id="buttonAddPlaylist" data-toggle="modal" data-target="#playlistModal" onclick="settaVideo()" value="${video.getLinkVideo()}"> Aggiungi in playlist </button>
										</c:if>
									</div>
									
								<br>
								<c:if test="${video.isNew()}">
									<h6><span class="badge badge-dark">Nuovo</span></h6>
								</c:if>
							</div>
					</div>
				</form>
			</c:forEach>
			
			<form action="paginaCanale" method="POST" id="formCanale">
        		<input type="text" value="" id="nomeCanale" name="usernameCanale">
        	</form>
			
			<c:forEach var="canali" items="${canali}">
				<div class="container p-3 my-3 row">
					<img id="imgProfilo" src="${canali.getFotoProfilo()}" class="image--cover" />
						<div class="col">
							<h4><a onclick="submitFormCanale(this)">${canali.getUsername()}</a></h4>
								<div class="col-12">	
									<h6><span class="badge badge-light" id="span${canali.getUsername()}">${canali.getNumIscritti()}</span> iscritti - <span class="badge badge-light">${canali.getVideoTotali()}</span> video caricati</h6>
								</div>
								<div class="col">
									<c:if test="${usernameLogged == null}">
										<button type="button" class="btn btn-primary" onclick="controlloPermessi()">Iscriviti</button>
									</c:if>
									<c:if test="${usernameLogged != null}">
										<c:if test="${canali.getIscritto() == true}">
											<button id="${canali.getUsername()}" type="button" value="${canali.getUsername()}" class="btn btn-primary">Disiscriviti</button>
									  		<script>
												setIscritto(1, '${canali.getUsername()}');
												checkIscriviti('${canali.getUsername()}');
											</script>
									  	</c:if>
									  	<c:if test="${canali.getIscritto() == false}">
											<button id="${canali.getUsername()}" type="button" value="${canali.getUsername()}" class="btn btn-primary">Iscriviti</button>
									  		<script>
												setIscritto(0, '${canali.getUsername()}');
												checkIscriviti('${canali.getUsername()}');
											</script>
									  	</c:if>
									  	<!-- 
										<button type="button" class="btn btn-primary btn-sm" id="${canali.getUsername()}">Iscriviti</button>
										<script>
											checkIscriviti('${canali.getUsername()}');
										</script>
										 -->
									</c:if>
								</div>
							<br>
						</div>
				</div>
			</c:forEach>
		</div>
			
   		
		<span id="sidebar" class="collapse">
		    <span id="list" class="list-group">
			  <a href="../" class="list-group-item list-group-item-action active"><i class="fa fa-home"></i> HOME</a>
			  <c:if test="${usernameLogged == null}">
			  	<a href="#" class="list-group-item list-group-item-action" onclick="controlloPermessi()"><i class="fa fa-user" aria-hidden="true"></i> Area personale</a>
			  	<a href="#" class="list-group-item list-group-item-action" onclick="controlloPermessi()"><i class="fa fa-upload" aria-hidden="true"></i> Carica video</a>
				<a href="#" class="list-group-item list-group-item-action" onclick="controlloPermessi()"><i class="fa fa-play-circle" aria-hidden="true"></i> PlayList</a>
				<a href="#" class="list-group-item list-group-item-action" onclick="controlloPermessi()"><i class="fa fa-check-square" aria-hidden="true"></i> Iscrizioni</a>
			  </c:if>	
			  
			  <c:if test="${usernameLogged != null}">
			  	<form id="formAreaPersonale" action="../visualizzaVideoUtente" method="POST" class="list-group-item list-group-item-action">
			  		<button type="submit" class="noButton text-dark" id="areaPersonale"><i class="fa fa-user" aria-hidden="true"></i> Area personale</button>
			  	</form>
			  	<form action="../caricaVideo" method="POST" class="list-group-item list-group-item-action">
			  		<button type="submit" class="noButton text-dark" id="caricaVideo"><i class="fa fa-upload" aria-hidden="true"></i> Carica video</button>
			  	</form>
			  	<form action="../playlist" method="POST" class="list-group-item list-group-item-action">
					<button type="submit" class="noButton text-dark" id="playlist"><i class="fa fa-play-circle" aria-hidden="true"></i> Playlist</button>
				</form>
				<form action="../iscrizioni" method="POST" class="list-group-item list-group-item-action">
					<button type="submit" class="noButton text-dark" id="iscrizioni"><i class="fa fa-check-square" aria-hidden="true"></i> Iscrizioni</button>
				</form>
			  </c:if>
			  
			 <form action="../informazioni" method="POST" id="formInformazioni"></form>
				
			 <a href="#" class="noButton text-dark" id="informazioni" onclick="submitFormInformazioni()"><i class="fa fa-info" aria-hidden="true"></i> Informazioni</a>

			  <c:if test="${usernameLogged == null }">
					<button type="submit" class="noButton text-dark" id="logoutButton" disabled></button>
				</c:if>
			 	<c:if test="${usernameLogged != null }">
			 		<form action="../doLogout" method="POST">
						<button type="submit" class="noButton text-dark" id="logoutButton"><i class="fa fa-sign-out"></i>Logout</button>
						<input class="paginaCorrente" type="text" value="risultatiVideo" name="paginaWebAttuale" readonly>
						<input class="searchBarNotVisible" type="text" name="search" value="${search}" readonly>
						<input type="text" id="inputVideo" value="" name="videoDaVisualizzare" readonly>
					</form>
				</c:if>
			</span>
 		</span>
    </div>
    
    
    
    <div class="modal fade" id="myModal">
        <div class="modal-dialog modal-sm">
            <div class="modal-content text-dark bg-light" id="modalContentLogin">
                <div class="modal-header">
                	<h4 class="modal-title">Accedi/Registrati</h4>
               		<button type="button" class="close" data-dismiss="modal" id="buttonXLogin">&times;</button>
                </div>
        
                <div class="modal-body">
                    <form id="formRegistrazione" method="POST" action="doLogin">
                        <div class="form-group">
                          <label for="username">Username:</label>
                          <input type="text" class="form-control" name="username" placeholder="Inserisci username" id="username" required>
                        </div>
                        <div class="form-group">
                          <label for="pwd">Password:</label>
                          <input type="password" class="form-control" name="password" placeholder="Inserisci password" id="pwd" required>
                        </div>
                        
							<label class="text-warning text-decoration-none" id="commentWarning"></label>
	                        <label class="text-danger text-decoration-none" id="loginWarning">${notFound}</label>
	                        
	                        <c:if test="${notFound != null}">
	                        	<script>
	                        		$('#myModal').modal('show');
	                        	</script>
	                        </c:if>
	                        
							<br>
							
	                        <button type="submit" class="btn btn-primary">Accedi</button>
	                        <input type="text" class="paginaCorrente" value="risultatiVideo" name="paginaWebAttuale" readonly>
	                        <input class="searchBarNotVisible" type="text" name="search" value="${search}" readonly>
	                        <input type="text" id="inputVideo" value="" name="videoDaVisualizzare" readonly>
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
            <div class="modal-content text-dark bg-light" id="modalContentSettings">
                <div class="modal-header">
                    <h4 class="modal-title">Impostazioni</h4>
                    <button type="button" class="close" data-dismiss="modal" id="buttonXSettings">&times;</button>
                </div>
        
                
                <div class="modal-body">
                    <ul class="list-group list-group-flush">
                        <li id="switchModal1" class="list-group-item text-dark bg-light">
                            <div class="custom-control custom-switch">
                                <input type="checkbox" class="custom-control-input" id="customSwitches" onclick="changeColor()">
                                <label class="custom-control-label" for="customSwitches">Aspetto</label>
                            </div>
                        </li>
                        <li id="switchModal2" class="list-group-item text-dark bg-light">
                            <a href="/images/GuidaUtenteVideoVision.pdf" class="text-dark text-decoration-none" id="aItemModal3" download >Guida utente</a>
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
    
    <div class="modal fade" id="playlistModal">
	    <div class="modal-dialog">
	      <div class="modal-content bg-light text-dark" id="modalContentPlaylist">
	        <div class="modal-header">
	          <h4 class="modal-title">Le tue playlist</h4>
	          <button type="button" class="close text-dark" data-dismiss="modal" id="buttonXPlaylist">&times;</button>
	        </div>
	        
	        <div id="elencoPlaylist" class="modal-body bg-light text-dark">
	          
	          <c:forEach var="nomePlaylist" items="${listaPlaylist}">
	          	  <input onclick="disableNewPlaylist()" type="radio" id="${nomePlaylist}" name="p"> ${nomePlaylist}<br>
	          </c:forEach>
	          <input type="radio" id="checkNewPlaylist" onclick="createNewPlaylist()" name="p"><input id="titleNewPlaylist" type="text" placeholder="Crea nuova playlist" disabled><br>
	        </div>
	        
	        <div class="modal-footer">
	         <p id="messageSuccess"></p>
          	 <button id="setVideo" type="button" class="btn btn-primary" onclick="addInPlaylist()">Salva in playlist</button>
	        </div>
	        
	      </div>
	    </div>
  </div>
	
</body>
</html>