package progetto.application.controller;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import progetto.application.model.Utente;
import progetto.application.persistence.DBManager;
import progetto.application.utilities.EncryptPassword;
import progetto.dropbox.DropboxManager;

@RestController
public class InformazioniController {
	
	@PostMapping("updateFoto")
	public String updateFoto(HttpSession session, @RequestParam String foto_profilo) {
		String linkFoto = DropboxManager.getInstance().getLinkVideo(foto_profilo);
		Utente utente= null;
		String username = (String) session.getAttribute("usernameLogged");
		
		if (username != null) {
			utente= DBManager.getInstance().getUtenteDao().findByPrimaryKey(username);
			utente.setFoto_profilo(linkFoto);
			DBManager.getInstance().getUtenteDao().update(utente);
			session.setAttribute("utente", utente);
			return utente.getFoto_profilo();
		}
		return null;
	}
	
	@PostMapping("updateInformazioni")
	public String updateInformazioni(HttpSession session, @RequestParam String nome,@RequestParam String cognome){//,@RequestParam String password) {
		Utente utenteVecchio= null;
		String username = (String) session.getAttribute("usernameLogged");
		
		if (username != null) {
				utenteVecchio= DBManager.getInstance().getUtenteDao().findByPrimaryKey(username);
				Utente utenteNuovo=new Utente(nome, cognome,utenteVecchio.getDataNascita(), username, utenteVecchio.getEmail(),utenteVecchio.getPassword(),utenteVecchio.getNum_iscritti(),utenteVecchio.getFoto_profilo());
				DBManager.getInstance().getUtenteDao().update(utenteNuovo);
		}
		return "SUCCESS";
	}
	
	@PostMapping("updateInformazioniPass")
	public String updateInformazioniPass(HttpSession session, @RequestParam String password) {
		Utente utenteVecchio= null;
		String username = (String) session.getAttribute("usernameLogged");
		
		if (username != null) {
				utenteVecchio= DBManager.getInstance().getUtenteDao().findByPrimaryKey(username);
				String passCr=EncryptPassword.getInstance().generatePasswordCrypted(password);
				Utente utenteNuovo=new Utente(utenteVecchio.getNome(), utenteVecchio.getCognome(),utenteVecchio.getDataNascita(), username, utenteVecchio.getEmail(),passCr,utenteVecchio.getNum_iscritti(),utenteVecchio.getFoto_profilo());
				DBManager.getInstance().getUtenteDao().update(utenteNuovo);
		}
		return "SUCCESS";
	}
}
