package progetto.application.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import progetto.application.model.Iscrizioni;
import progetto.application.model.Utente;
import progetto.application.persistence.DBManager;

@Controller
public class IscrizioniController {
	
	private static final String PAGINA_PROFILO_ISCRIZIONI = "profiloIscrizioni";
	private static final String PAGINA_PROFILO_CANALE = "profiloCanale";
	
	@PostMapping("annullaIscrizione")
	public String annullaIscrizione(HttpSession session, Model model, @RequestParam String usernameCanale) {
		String username = (String) session.getAttribute("usernameLogged");
		Utente user = DBManager.getInstance().getUtenteDao().findByPrimaryKey(username);
		Utente canale = DBManager.getInstance().getUtenteDao().findByPrimaryKey(usernameCanale);
		Iscrizioni isc = new Iscrizioni(user,canale);
		DBManager.getInstance().getIscrizioneDao().delete(isc);
		canale.setNum_iscritti(-1);
		DBManager.getInstance().getUtenteDao().update(canale);
		return PAGINA_PROFILO_CANALE;
	}
	
	@PostMapping("iscriviCanale")
	public String effettuaIscrizione(HttpSession session, Model model, @RequestParam String usernameCanale) {
		String username = (String) session.getAttribute("usernameLogged");
		Utente user = DBManager.getInstance().getUtenteDao().findByPrimaryKey(username);
		Utente canale = DBManager.getInstance().getUtenteDao().findByPrimaryKey(usernameCanale);
		Iscrizioni isc = new Iscrizioni(user,canale);
		DBManager.getInstance().getIscrizioneDao().insert(isc);
		canale.setNum_iscritti(1);
		DBManager.getInstance().getUtenteDao().update(canale);
		return PAGINA_PROFILO_CANALE;
	}
	
	@PostMapping("visualizzaIscrizioni")
	public static String visualizzaIscrizioni(HttpSession session, Model model) {
		ArrayList<Iscrizioni> iscrizioni = null;
		String username = (String) session.getAttribute("usernameLogged");
		
		if(username != null) {
			iscrizioni = DBManager.getInstance().getIscrizioneDao().findAll(username);
			Utente u = DBManager.getInstance().getUtenteDao().findByPrimaryKey(username);
			model.addAttribute("utente", u);
			model.addAttribute("listaIscrizioni", iscrizioni);
		}
		return PAGINA_PROFILO_ISCRIZIONI;
	}
}
