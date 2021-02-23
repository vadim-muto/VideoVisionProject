<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	<c:if test="${usernameLogged != null}">
		<script>
			setUsername('${usernameLogged}');
			setUsernameLogged(1);
		</script>
	</c:if>

	<nav class="navbar navbar-expand-sm" id="superiore">
		<a class="navbar-brand flex-fill" href="./">
			<img src="/images/logoVideoVision.png" id="occhio">
		</a>
  		<form class="form-inline flex-fill " method="POST" action="doSearch">
        	<input id="searchBar" class="form-control mr-sm-2" type="text" placeholder="Search" name="search" onkeydown="visibilityButton()" onkeyup="visibilityButton()">
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
	<div class="wrapper">
        <div id="content">
        	<c:if test="${pubblicita != null}">
        		<div id="pubb">
	        		<button type="button" class="btn btn-outline-dark" id="btnAnnuncio" onclick="rimuoviAnnuncio()">Chiudi annuncio</button>
	        		<a href="${pubblicita.getLinkEsterno()}" target="_blank"><img src="${pubblicita.getImage()}"  id="imgPubb"></a>
        		</div>
        	</c:if>
        	
        	<form action="paginaCanale" method="POST" id="formCanale">
        		<input type="text" value="" id="nomeCanale" name="usernameCanale">
        	</form>
        	
        	<form method="POST" action="../selezionaVideo" id="formVideo">
        		<input type="text" id="inputVideo" value="" name="videoDaVisualizzare" readonly>
		        <div class="category"><h4>Sport</h4></div> 
		        <c:forEach var="sport" items="${sport}">
		            <div class="responsive">
		                <div class="gallery" >
		                	<div id="divBtnPlaylist">
		                		<c:if test="${usernameLogged == null}">
		                			<button type="button" class="btn btn-dark" id="buttonAddPlaylist" onclick="loginError()" data-toggle="tooltip" data-placement="top" title="Agg. a playlist"><i class="fa fa-plus" aria-hidden="true"></i></button>
		                    	</c:if>
		                    	<c:if test="${usernameLogged != null}">
		                			 <span data-toggle="modal" data-target="#playlistModal">
									    <button type="button" class="btn btn-dark" id="buttonAddPlaylist" data-toggle="tooltip" data-placement="top" title="Agg. a playlist" onclick="settaVideo()" value="${sport.getLinkVideo()}">
									      <i class="fa fa-plus" aria-hidden="true"></i>         
									    </button>
									</span>
		                    	</c:if>
		                    </div>
		                    <video src="" onclick="scegliVideo(this, '${sport.getLinkFoto()}')" onmouseover="playVideo(this, '${sport.getLinkVideo()}')" onmouseout="pauseVideo(this, '${sport.getLinkFoto()}')" poster="${sport.getLinkFoto()}" controls muted></video>
			                <div class="desc"><h5>${sport.getTitolo()}</h5></div>
			            	<div class="desc"><strong>Caricato da: </strong><a class="text-danger text-decoration-none" onclick="submitFormCanale(this)">${sport.getUsername()}</a></div>
			               	<div class="row" id="rigaMipiace" >
				              	<span class="badge badge-pill badge-primary" id="spanVisualizzazioni">Visualizzazioni: <span class="badge badge-light">${sport.getVisualizzazioni()}</span></span>
			                	<div id="divMiPiace">
			                		<i class="fa fa-thumbs-up" aria-hidden="true" id="iconaMiPiace"></i>${sport.getMiPiace()}
		                		</div>
		                		<c:if test="${sport.soggettoALimiti()}">
		                			<div id="divVM">
		                				<i class="fa fa-exclamation-triangle" aria-hidden="true" id="triangoloVM"></i>
		                				<p class="text-dark"><strong> V.M. 18</strong></p>
		                			</div>
		                		</c:if>
		                	</div>
		                	<div id="spanData">
		                		<span class="badge badge-light">${sport.getData_pubblicazione()}</span>
		                	</div>
		                </div>
		            </div>
	            </c:forEach>    
	            
	            <div class="category"><h4>Cinema</h4></div>
	            <c:forEach var="cinema" items="${cinema}">
		            <div class="responsive">
		                <div class="gallery">
		                   <div id="divBtnPlaylist">
		                		<c:if test="${usernameLogged == null}">
		                			<button type="button" class="btn btn-dark" id="buttonAddPlaylist" onclick="loginError()" data-toggle="tooltip" data-placement="top" title="Agg. a playlist"><i class="fa fa-plus" aria-hidden="true"></i></button>
		                    	</c:if>
		                    	<c:if test="${usernameLogged != null}">
		                    		<span data-toggle="modal" data-target="#playlistModal">
									    <button type="button" class="btn btn-dark" id="buttonAddPlaylist" data-toggle="tooltip" data-placement="top" title="Agg. a playlist" onclick="settaVideo()" value="${cinema.getLinkVideo()}">
									      <i class="fa fa-plus" aria-hidden="true"></i>         
									    </button>
									</span>
		                    	</c:if>
		                    </div>
		                  <video src="" onclick="scegliVideo(this, '${cinema.getLinkFoto()}')" onmouseover="playVideo(this, '${cinema.getLinkVideo()}')" onmouseout="pauseVideo(this, '${cinema.getLinkFoto()}')" poster="${cinema.getLinkFoto()}" controls muted></video>  
		                  <div class="desc"><h5>${cinema.getTitolo()}</h5></div>
		                  <div class="desc"><strong>Caricato da: </strong><a class="text-danger text-decoration-none" onclick="submitFormCanale(this)">${cinema.getUsername()}</a></div>
			               	<div class="row" id="rigaMipiace" >
				              	<span class="badge badge-pill badge-primary" id="spanVisualizzazioni">Visualizzazioni: <span class="badge badge-light">${cinema.getVisualizzazioni()}</span></span>
			                	<div id="divMiPiace">
			                		<i class="fa fa-thumbs-up" aria-hidden="true" id="iconaMiPiace"></i>${cinema.getMiPiace()}
		                		</div>
		                		<c:if test="${cinema.soggettoALimiti()}">
			                		<div id="divVM">
			                			<i class="fa fa-exclamation-triangle" aria-hidden="true" id="triangoloVM"></i>
			                			<p class="text-dark"><strong> V.M. 18</strong></p>
			                			</div>
		                		</c:if>
		                	</div>
		                	<div id="spanData">
		                		<span class="badge badge-light">${cinema.getData_pubblicazione()}</span>
		                	</div>
		                </div>
		            </div>
	            </c:forEach>
	            <div class="category"><h4>Intrattenimento</h4></div>
	            <c:forEach var="intrattenimento" items="${intrattenimento}">
		            <div class="responsive">
		                <div class="gallery">
		                    <div id="divBtnPlaylist">
		                		<c:if test="${usernameLogged == null}">
		                			<button type="button" class="btn btn-dark" id="buttonAddPlaylist" onclick="loginError()" data-toggle="tooltip" data-placement="top" title="Agg. a playlist"><i class="fa fa-plus" aria-hidden="true"></i></button>
		                    	</c:if>
		                    	<c:if test="${usernameLogged != null}">
		                    		<span data-toggle="modal" data-target="#playlistModal">
									    <button type="button" class="btn btn-dark" id="buttonAddPlaylist" data-toggle="tooltip" data-placement="top" title="Agg. a playlist" onclick="settaVideo()" value="${intrattenimento.getLinkVideo()}">
									      <i class="fa fa-plus" aria-hidden="true"></i>         
									    </button>
									</span>
		                    	</c:if>
		                    </div>
		                    <video src="" onclick="scegliVideo(this, '${intrattenimento.getLinkFoto()}')" onmouseover="playVideo(this, '${intrattenimento.getLinkVideo()}')" onmouseout="pauseVideo(this, '${intrattenimento.getLinkFoto()}')" poster="${intrattenimento.getLinkFoto()}" controls muted></video>  
		                  <div class="desc"><h5>${intrattenimento.getTitolo()}</h5></div>
		                  <div class="desc"><strong>Caricato da: </strong><a class="text-danger text-decoration-none" onclick="submitFormCanale(this)">${intrattenimento.getUsername()}</a></div>
			               	<div class="row" id="rigaMipiace" >
				              	<span class="badge badge-pill badge-primary" id="spanVisualizzazioni">Visualizzazioni: <span class="badge badge-light">${intrattenimento.getVisualizzazioni()}</span></span>
			                	<div id="divMiPiace">
			                		<i class="fa fa-thumbs-up" aria-hidden="true" id="iconaMiPiace"></i>${intrattenimento.getMiPiace()}
		                		</div>
		                		<c:if test="${intrattenimento.soggettoALimiti()}">
		                		<div id="divVM">
		                				<i class="fa fa-exclamation-triangle" aria-hidden="true" id="triangoloVM"></i>
		                				<p class="text-dark"><strong> V.M. 18</strong></p>
		                			</div>
		                			</c:if>
		                	</div>
		                	<div id="spanData">
		                		<span class="badge badge-light">${intrattenimento.getData_pubblicazione()}</span>
		                	</div>
		                </div>
		            </div>
	            </c:forEach>
	            
	            <div class="category"><h4>Musica</h4></div>
	            <c:forEach var="musica" items="${musica}">
		            <div class="responsive">
		                <div class="gallery">
		                    <div id="divBtnPlaylist">
		                		<c:if test="${usernameLogged == null}">
		                			<button type="button" class="btn btn-dark" id="buttonAddPlaylist" onclick="loginError()" data-toggle="tooltip" data-placement="top" title="Agg. a playlist"><i class="fa fa-plus" aria-hidden="true"></i></button>
		                    	</c:if>
		                    	<c:if test="${usernameLogged != null}">
		                    		<span data-toggle="modal" data-target="#playlistModal">
									    <button type="button" class="btn btn-dark" id="buttonAddPlaylist" data-toggle="tooltip" data-placement="top" title="Agg. a playlist" onclick="settaVideo()" value="${musica.getLinkVideo()}">
									      <i class="fa fa-plus" aria-hidden="true"></i>         
									    </button>
									</span>
		                    	</c:if>
		                    </div>
		                    <video src="" onclick="scegliVideo(this, '${musica.getLinkFoto()}')" onmouseover="playVideo(this,'${musica.getLinkVideo()}')" onmouseout="pauseVideo(this, '${musica.getLinkFoto()}')" poster="${musica.getLinkFoto()}" controls muted></video>
		                  <div class="desc"><h5>${musica.getTitolo()}</h5></div>
		                  <div class="desc"><strong>Caricato da: </strong><a class="text-danger text-decoration-none" onclick="submitFormCanale(this)">${musica.getUsername()}</a></div>
			               	<div class="row" id="rigaMipiace" >
				              	<span class="badge badge-pill badge-primary" id="spanVisualizzazioni">Visualizzazioni: <span class="badge badge-light">${musica.getVisualizzazioni()}</span></span>
			                	<div id="divMiPiace">
			                		<i class="fa fa-thumbs-up" aria-hidden="true" id="iconaMiPiace"></i>${musica.getMiPiace()}
		                		</div>
		                		<c:if test="${musica.soggettoALimiti()}">
			                		<div id="divVM">
			                				<i class="fa fa-exclamation-triangle" aria-hidden="true" id="triangoloVM"></i>
			                				<p class="text-dark"><strong> V.M. 18</strong></p>
			                			</div>
		                		</c:if>
		                	</div>
		                	
		                	<div id="spanData">
		                		<span class="badge badge-light">${musica.getData_pubblicazione()}</span>
		                	</div>
		                </div>
		            </div>
	            </c:forEach>
            </form>
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
						<input class="paginaCorrente" type="text" value="index" name="paginaWebAttuale" readonly>
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
	        
	                <div class="modal-body" id="divModalBody">
	                    <form id="formRegistrazione" method="POST" action="../doLogin">
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
	                        <input type="text" class="paginaCorrente" value="index" name="paginaWebAttuale" readonly>
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
          <button id="setVideo" type="button" class="btn btn-primary" onclick="addInPlaylist()">Aggiungi a playlist</button>
        </div>
        
      </div>
    </div>
  </div>
  
</body>
</html>