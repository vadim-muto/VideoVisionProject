<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="it">
<head>
  <title>Visualizza Video</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="/css/video.css" type="text/css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <script src="/js/video.js"></script>
</head>
<body class="bg-light" id="body">
	<c:if test="${usernameLogged != null}">
		<script>
			setUsernameLogged(1);
			setUsername('${usernameLogged}');
			setLastIdComment('${lastId}');
		</script>
	</c:if>
	
	<nav class="navbar navbar-expand-sm justify-content-between" id="superiore">
		<a class="navbar-brand flex-fill" href="../">
			<img src="/images/logoVideoVision.png" id="occhio">
		</a>
  		<form class="form-inline flex-fill " action="../doSearch" method="POST">
        	<input id="searchBar" class="form-control mr-sm-2" type="text" placeholder="Search" value="${search}" name="search" onkeydown="visibilityButton()" onkeyup="visibilityButton()">
        	<button id="searchButton" class="btn btn-danger" type="submit"><i class="fa fa-search"></i></button>
       	</form>
  		
  		<ul class="navbar-nav flex-fill justify-content-end">
  		  	<li class="nav-item">
  				<c:if test="${usernameLogged != null}">
					<img id="imgProfilo" src="${utente.getFoto_profilo()}" class="image--cover" />
				</c:if>
  			</li>
    		<li class="nav-item">
				<c:if test="${usernameLogged == null}">
					<button type="button" class="btn btn-light" data-toggle="modal" data-target="#myModal" id="loginBtn" onclick="removeWarningFromLogin()">Login <i class="fa fa-user"></i></button>
				</c:if>
				<c:if test="${usernameLogged != null}">
					<button type="button" class="btn btn-light" value="${usernameLogged}" id="loginBtn">${usernameLogged} <i class="fa fa-user"></i></button>
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
	
	
	<div class="wrapper">
        <div id="content">
            <div class="responsive">
            	<div class="alert alert-dark" id="bannerPubblicitario">
            		<strong>Video Pubblicitario!</strong>
            		<button type="button" class="btn btn-sm btn-outline-dark" id="buttonSkipBupplicita" onclick="skipPubblicita()">Salta annuncio <i class="fa fa-step-forward" aria-hidden="true"></i></button>
				</div>
            	<script>
            		setLinkPubbAndVideo('${pubblicita.getLink()}', '${videoSelezionato.getLink()}');
            	</script>
            	<c:choose>
	            	<c:when test="${videoSelezionato.getLimiti_eta() == true}">
	            		<c:if test="${usernameLogged == null}">
	            			<video poster="/images/contenutiSensibili.png"></video>
		            	</c:if>
		            	
		            	<c:if test="${usernameLogged != null}">
		            		<c:if test="${utente.calcolaEta() < 18}">
		            			<video poster="/images/contenutiSensibili.png"></video>
		            		</c:if>
		            		<c:if test="${utente.calcolaEta() >= 18}">
		            			<c:if test="${videoSelezionato.getDownload() == false}">
				               		<video id="videoSelezionato" src="${videoSelezionato.getLink()}" autoplay controls controlsList="nodownload"></video>
				                </c:if>
				                 <c:if test="${videoSelezionato.getDownload() == true}">
				                	<video id="videoSelezionato" src="${videoSelezionato.getLink()}" autoplay controls></video>
				                </c:if>
		            		</c:if>
		            	</c:if>
	            	</c:when>
	            	
	            	<c:when test="${videoSelezionato.getDownload() == false}">
	               		<video id="videoSelezionato" src="${videoSelezionato.getLink()}#t=0" controls autoplay="autoplay" controlsList="nodownload"></video>
	                </c:when>
	                
	                <c:when test="${videoSelezionato.getDownload() == true}">
	                	<video id="videoSelezionato" src="${videoSelezionato.getLink()}#t=0" autoplay="autoplay" controls></video>
	                </c:when>
	            </c:choose>
           	</div>
			<div>
	           	<nav class="navbar navbar-expand-sm bg-light text-dark navInfo" id="navTitolo">
				
				  <h4>${videoSelezionato.getTitolo()}</h4>
				  <ul class="navbar-nav justify-content-end" id="infoVideo">
				    <li class="nav-item space">
				   		<c:if test="${usernameLogged == null}">
				   			<button type="button" class="btn btn-danger nav-link noButtonPlaylist" onclick="loginError()" value="${videoSelezionato.getLink()}"><i class="fa fa-play-circle" aria-hidden="true"></i> Salva nella playlist</button>
				   		</c:if>
				   		<c:if test="${usernameLogged != null}">
				      		<button type="button" class="btn btn-danger nav-link noButtonPlaylist" data-toggle="modal" data-target="#playlistModal"><i class="fa fa-play-circle" aria-hidden="true"></i> Salva nella playlist</button>
				    	</c:if>
				    </li>
				    <li class="nav-item space">
				      	<button id="btnLike" type="button" class="nav-link noButton noButtonLike" onclick="addLike()" value="${videoSelezionato.getMi_piace()}"><i class="fa fa-thumbs-o-up" aria-hidden="true" ></i></button><label id="numLike">${videoSelezionato.getMi_piace()}</label>
				    </li>
				    <li class="nav-item space">
				      	<button id="btnDislike" type="button" class="nav-link noButton noButtonDislike" onclick="addDislike()" value="${videoSelezionato.getNon_mi_piace()}"><i class="fa fa-thumbs-o-down"  aria-hidden="true"></i></button><label id="numDislike">${videoSelezionato.getNon_mi_piace()}</label>
				    </li>
				  </ul>
				</nav>
				
				<nav class="navbar navbar-expand-sm bg-light text-dark navInfo" id="navUsername">
					<form action="paginaCanale" method="POST" id="visual">
						<ul class="navbar-nav justify-content-between" id="infoCanale">
							<li class="nav-item">
								<input type="text" id="usernameVideo" value="" name="usernameCanale">
								<label><strong>Caricato da: </strong></label><a class="text-danger text-decoration-none" onclick="submitFormCanale(this)">${videoSelezionato.getUtente().getUsername()}</a>
							
							</li>
							<li class="nav-item">
								<span class="badge badge-pill badge-primary">Visualizzazioni: <span class="badge badge-light">${videoSelezionato.getVisualizzazioni()}</span></span>
						    </li>
						</ul>
					</form>
				</nav>
				
				<nav class="navbar navbar-expand-sm bg-light text-dark navInfo" id="navDescrizione1">
				  <div id="fb-root"></div>
					<script async defer crossorigin="anonymous" src="https://connect.facebook.net/it_IT/sdk.js#xfbml=1&version=v9.0" nonce="bQ0dC26X"></script>
						<div class="fb-share-button" data-href="${videoSelezionato.getLinkFoto()}" data-layout="button" data-size="small"><a target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Fdevelopers.facebook.com%2Fdocs%2Fplugins%2F&amp;src=sdkpreparse" class="fb-xfbml-parse-ignore">Condividi</a></div>
				</nav>
				<nav class="navbar navbar-expand-sm bg-light text-dark navInfo" id="navDescrizione2">
				  <h6>Descrizione: <br>${videoSelezionato.getDescrizione()}</h6>
				</nav> 
				
				
				<div class="navInfo bg-light text-dark" id="newCommentNav">
					<p>   Inserisci un nuovo commento: <i class="fa fa-comment" aria-hidden="true"></i></p>
						<textarea id="comment" rows="2" placeholder="Inserisci testo commento" onkeydown="enableButton(this, 'newComment')" onkeyup="enableButton(this, 'newComment')" ></textarea><br>
						<div class="d-flex justify-content-end">
							<button class="btn btn-danger" type="button" onclick="clearArea()" id="pulisci">Pulisci</button>
							<c:if test="${usernameLogged == null}">
								<button id="newComment" onclick="loginError()" class="btn btn-primary" type="button" value="${videoSelezionato.getLink()}">Commenta!</button>
							</c:if>
							<c:if test="${usernameLogged != null}">
								<button id="newComment" onclick="addComment()" class="btn btn-primary" type="button" value="${videoSelezionato.getLink()}" disabled>Commenta!</button>
							</c:if>
						</div>
				</div>

				<div class="navInfo text-dark bg-light" id="divCommenti">
					<p id="pCommento"> Commenti: </p>
					<c:forEach var="commento" items="${listaCommenti}">
					  <div class="media border" id="div${commento.getId()}">
					    <img id="imgCommento" src="${commento.getUtente().getFoto_profilo()}" alt="${commento.getUtente().getUsername()}" class="rounded-circle">
					    <div class="media-body" id="divBody">
					      <h4>${commento.getUtente().getUsername()}</h4>
					      <p id="${commento.getId()}">${commento.getTesto()}</p>      
					    </div>
						<c:if test="${usernameLogged != null}">
							<button id="btnElimina${commento.getId()}" value="${commento.getId()}" class="btn btn-danger" type="button" onclick="deleteComment(null)"><i class="fa fa-trash-o" aria-hidden="true"></i></button>
							<button id="btnModifica${commento.getId()}" value="${commento.getId()}" class="btn btn-primary" type="button" onclick="modifyComment('${commento.getId()}', this)"><i class="fa fa-pencil" aria-hidden="true"></i></button>
							<script>
								checkComment('${commento.getUtente().getUsername()}', 'btnElimina${commento.getId()}','btnModifica${commento.getId()}');
							</script>
						</c:if>
					  </div>
					</c:forEach>
				</div>
			</div>
        </div>
                       
		<div id="sidebar" class="collapse">
		    <div id="list" class="list-group">
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

			  <form action="../doLogout" method="POST">
			 	<c:if test="${usernameLogged == null }">
					<button type="submit" class="noButton text-dark" id="logoutButton" disabled></button>
				</c:if>	
			 	<c:if test="${usernameLogged != null }">
					<button type="submit" class="noButton text-dark" id="logoutButton"><i class="fa fa-sign-out"></i>Logout</button>
					<input class="searchBarNotVisible" type="text" name="search" value="${search}" readonly>
				</c:if>	
				<input type="text" class="paginaCorrente" value="video" name="paginaWebAttuale" readonly>
				<input type="text" id="inputVideo" value="${videoSelezionato.getLink()}" name="videoDaVisualizzare" readonly>		 
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
        
                <div class="modal-body" id="divModalBody">
                    <form id="formRegistrazione" action="../doLogin" method="POST">
                        <div class="form-group">
                          <label for="username">Username:</label>
                          <input type="text" class="form-control" placeholder="Inserisci username" id="username" name="username" required>
                        </div>
                        <div class="form-group">
                          <label for="pwd">Password:</label>
                          <input type="password" class="form-control" placeholder="Inserisci password" id="pwd" name="password" required>
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
                        <input type="text" class="paginaCorrente" value="video" name="paginaWebAttuale" readonly>
                        <input class="searchBarNotVisible" type="text" name="search" value="${search}" readonly>
                        <input type="text" id="inputVideo" value="${videoSelezionato.getLink()}" name="videoDaVisualizzare" readonly>	
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
	          <button type="button" class="btn btn-primary" onclick="addInPlaylist()" value="${videoSelezionato.getLink()}">Aggiungi a playlist</button>
	        </div>
	        
	      </div>
	    </div>
  </div>
  
</body>
</html>
  
