<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
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
	<script src="/js/profiloCanalePlaylist.js"></script>
	<title>Profilo Canale PlayList</title>
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
		  		<img src="${canale.getFoto_profilo()}" class="image--cover"/>
		  	</li>
		    <li class="nav-item">
		      <a class="nav-link" id="nomeProfilo"><h3>${canale.getUsername()}</h3></a>
		      <h5 class="nav-link" id="iscritti" title="${canale.getNum_iscritti()}"> Numero iscritti: ${canale.getNum_iscritti()}</h5>
		      <div class="col-2">
		      	<c:if test="${isIscritto == true}">
					<button id="iscrizione" type="button" value="${canale.getUsername()}" class="btn btn-primary"> Disiscriviti</button>
			  		<script>
						setIscritto(1);
					</script>
			  	</c:if>
			  	<c:if test="${isIscritto == false}">
					<button id="iscrizione" type="button" value="${canale.getUsername()}" class="btn btn-primary"> Iscriviti</button>
			  		<script>
						setIscritto(0);
					</script>
			  	</c:if>
			  </div>
		    </li>
		  </ul>
		</nav>
		
		<nav class="navbar navbar-expand-sm navbar-dark sticky-top " id="navLink">  
			<form method="POST" action="paginaCanale">
		    	<button value="${canale.getUsername()}" name="usernameCanale" class="noButton" type="submit" id="video"><i class="fa fa-video-camera" aria-hidden="true"></i> Video</button>
		    </form>
		    <div class="navLinks"><a class="nav-link" href="#"><i class="fa fa-book" aria-hidden="true" ></i> Playlist</a></div>
		    
		</nav>
	 
	
		<div id="centrale" class="bg-light text-dark">
			<h4>Queste sono le playlist che ha questo utente:</h4>
			<br>
				<div class="row">
				      <h3><i class="fa fa-play" aria-hidden="true"></i> Titolo</h3>
				</div>
				<c:forEach var="playlist" items="${listaPlaylist}"> 
					<div class="row">
						<c:set var="str1" value="${playlist.key}" />
						<c:set var="str2" value="${fn:replace(str1,' ','_')}" />
						<button type="button" class="btn btn-Quasiprimary" data-toggle="collapse" data-target="#${str2}">${playlist.key} <i class="fa fa-sort-amount-asc" aria-hidden="true"></i></button>
						<button type="button" class="btn btn-Quasidanger" value="${playlist.key} , ${canale.getUsername()}" onclick="prendiPlaylist()"><i class="fa fa-share" aria-hidden="true"></i></button>

					  <div id="${str2}" class="collapse row tabella">
					      <div class="col-2"><i class="fa fa-play" aria-hidden="true"></i> Video</div>
					      <div class="col-2"> Titolo</div>
					      <div class="col-2"> Descrizione</div>
					      <div class="col-2"><i class="fa fa-list-ol" aria-hidden="true"></i> Visualizzazioni</div>
					      <div class="col-2"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i> Mi Piace</div>
					      <c:forEach var="video" items="${playlist.value}">
					      	  <div class="row tabella ${str2}">
								<div class="col-2">
									<form method="POST" action="../selezionaVideo" id="formVideo">
									  <input type="text" id="inputVideo" value="" name="videoDaVisualizzare" readonly>
									  <div class="bg-dark" id="divVideo">
										  <img src="${video.getLinkFoto()}" onclick="scegliVideo('${video.getLink()}')" id="copertinaVideo"/>
									  </div>
									</form>
								</div>
							      <div class="col-2">${video.getTitolo()}</div>
							      <div class="col-2">${video.getDescrizione()}</div>
							      <div class="col-2">${video.getVisualizzazioni()}</div>
							      <div class="col-2">${video.getMi_piace()}</div>
							  </div>
						  </c:forEach>
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
							<form method="GET" action="../getFeedback" id="formFeedback">
							</form>
                        </li>
                      </ul>
                </div>
            </div>
        </div>
    </div>
</body>
</html>