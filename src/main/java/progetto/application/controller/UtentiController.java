package progetto.application.controller;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import progetto.application.model.Iscrizioni;
import progetto.application.model.Utente;
import progetto.application.model.Video;
import progetto.application.persistence.DBManager;
import progetto.application.utilities.EncryptPassword;
import progetto.application.utilities.InvioMail;

@Controller
public class UtentiController {
	
	private static final String RISULTATI_VIDEO = "risultatiVideo";
	private static final String PAGINA_INDEX = "index";
	private static final String PAGINA_VIDEO = "video";
	private static final String PAGINA_PROFILO_INFORMAZIONI = "profiloInformazioni";
	private static final String PAGINA_PROFILO_VIDEO = "profiloVideo";
	private static final String PAGINA_CARICA_VIDEO = "caricamento";
	private static final String PAGINA_PROFILO_CANALE = "profiloCanale";
	private static final String PAGINA_INFORMAZIONI_SITO = "info";
	
	
	@PostMapping("html/registrati")
	public String registraUtente(@RequestParam String nome, HttpSession session, @RequestParam String cognome, @RequestParam String dataNascita, @RequestParam String username, @RequestParam String email, @RequestParam String password, Model model) {
		// psw criptate
		String[] s = email.split(",");
		String oggetto="BENVENUTO IN VIDEOVISION";
		String messaggio="Gentile "+nome+" "+cognome+" benvenuto sulla piattaforma streaming VideoVision. Buona navigazione!";
		InvioMail mail = new InvioMail(email,messaggio,oggetto);
		mail.invia();
		String pswCrypted = EncryptPassword.getInstance().generatePasswordCrypted(password);
		DBManager.getInstance().getUtenteDao().insert(new Utente(nome, cognome, dataNascita, username, s[0], pswCrypted, 0, "https://upload.wikimedia.org/wikipedia/commons/thumb/7/7c/User_font_awesome.svg/1200px-User_font_awesome.svg.png"));
		return HomeController.home(model, session);
	}
	
	@PostMapping("html/recuperoPassword")
	public String recuperaPassword(HttpSession session,@RequestParam String email, Model model) {
		
		ArrayList<Character> generatoreCaratteri = new ArrayList<Character>( 
	            Arrays.asList('0','1','2','3','4','5','6','7','8','9','!','$','%','&','/','(',')','=','?','^',']','[','@',':',';','_','-','#','+','.')
	    );
		
		for(char i='a';i<'z';i++) {
			generatoreCaratteri.add(i);
		}
		
		int lunghezzaGeneratoreCara=generatoreCaratteri.size();
	
		StringBuilder nuovaPassword=new StringBuilder();
		Random r=new Random();
		for(int i=0;i<10;i++) {
			int x=r.nextInt(lunghezzaGeneratoreCara-1);
			nuovaPassword.append(generatoreCaratteri.get(x));
		}
		
		String conversioneNuovaPass = nuovaPassword.toString();
		String passCr=EncryptPassword.getInstance().generatePasswordCrypted(conversioneNuovaPass);
		Utente user = DBManager.getInstance().getUtenteDao().findByEmail(email);
		DBManager.getInstance().getUtenteDao().update(new Utente(user.getNome(), user.getCognome(), user.getDataNascita(), user.getUsername(), user.getEmail(),passCr, user.getNum_iscritti(), user.getFoto_profilo()));
		String oggettoMail = "RECUPERO PASSWORD VIDEOVISION";
		String testoMail = "Gentile utente: "+email+" la tua nuova password è: "+nuovaPassword+"\n"+" Saluti il team VIDEOVISION";
		InvioMail mailRecuperoPassword=new InvioMail(email, testoMail, oggettoMail);
		mailRecuperoPassword.invia();
		return HomeController.home(model, session);
	}
	
	@PostMapping("doLogin")
	public String login(HttpSession session,Model model, @RequestParam String username,@RequestParam String password,@RequestParam String paginaWebAttuale,@RequestParam String search,@RequestParam String videoDaVisualizzare) {		
		boolean esisteUtente = DBManager.getInstance().getUtenteDao().esisteUtente(username,password);
		if (esisteUtente) {
			Utente utente = DBManager.getInstance().getUtenteDao().findByPrimaryKey(username);
			session.setAttribute("usernameLogged", username);
			session.setAttribute("utente", utente);
			model.addAttribute("utente", utente);
		}
		else {
			model.addAttribute("notFound", "Username e/o password errati!");
		}
		
		switch(paginaWebAttuale) {
			case UtentiController.PAGINA_INDEX:
				return HomeController.home(model, session);
			case UtentiController.RISULTATI_VIDEO:
				return VideoController.effettuaRicerca(search, session, model);
			case UtentiController.PAGINA_VIDEO:
				return VideoController.chooseVideo(videoDaVisualizzare, session, model);
			default:
				break;
		}
		
		return paginaWebAttuale;
	}
	
	@PostMapping("doLogout")
	public String logout(@RequestParam String paginaWebAttuale, @RequestParam String search, HttpSession session, @RequestParam String videoDaVisualizzare, Model model) {
		session.removeAttribute("usernameLogged");
		switch(paginaWebAttuale) {
			case UtentiController.PAGINA_INDEX:
				return HomeController.home(model, session);
			case UtentiController.RISULTATI_VIDEO:
				return VideoController.effettuaRicerca(search, session, model);
			case UtentiController.PAGINA_VIDEO:
				return VideoController.chooseVideo(videoDaVisualizzare, session, model);
			default:
				break;
		}
		return paginaWebAttuale;
	}
	
	@PostMapping("visualizzaDati")
	public static String visualizzaDati(HttpSession session, Model model){
		Utente user = null;
		String username = (String) session.getAttribute("usernameLogged");
		
		if (username != null) {
			user = DBManager.getInstance().getUtenteDao().findByPrimaryKey(username);
			model.addAttribute("lista",user);
		}
		return UtentiController.PAGINA_PROFILO_INFORMAZIONI;
	}
	
	@PostMapping("accountCancella")
	public String deleteAccount(HttpSession session, Model model) {
		String username = (String) session.getAttribute("usernameLogged");
		Utente user = DBManager.getInstance().getUtenteDao().findByPrimaryKey(username);
		
		DBManager.getInstance().getRecensioneDao().deleteByUsername(username);
		ArrayList<Video> allVideo = DBManager.getInstance().getVideoDao().findVideoByUsername(username);
		for(Video v: allVideo) {
			DBManager.getInstance().getPlaylistDao().deleteByVideo(v.getLink());
		}
		ArrayList<String> allPlaylist = DBManager.getInstance().getPlaylistDao().findAllTitle(username);
		for(String s: allPlaylist) {
			DBManager.getInstance().getPlaylistDao().deleteCompletePlaylist(user, s);
		}
		DBManager.getInstance().getVideoDao().deleteByUsername(username);
		DBManager.getInstance().getIscrizioneDao().deleteByUsername(username);
		DBManager.getInstance().getUtenteDao().delete(user);
		
		session.removeAttribute("usernameLogged");
		
		return HomeController.home(model, session);
	}
	
	@PostMapping("html/visualizzaVideoUtente")
	public static String visualizzaVideo(HttpSession session, Model model){
		String username = (String) session.getAttribute("usernameLogged");
		if (username != null) {
			ArrayList<Video> video = DBManager.getInstance().getVideoDao().findVideoByUsername(username);
			Utente user = DBManager.getInstance().getUtenteDao().findByPrimaryKey(username);
			model.addAttribute("utente", user);
			model.addAttribute("tuttiVideo",video);	
		}
		return UtentiController.PAGINA_PROFILO_VIDEO;
	}
	
	public static boolean sonoIscritto(String username,String canale) {
		ArrayList<Iscrizioni> iscrizioni = DBManager.getInstance().getIscrizioneDao().findAll(username);
		for(Iscrizioni i : iscrizioni) {
			if(i.getCanale().getUsername().equals(canale))
				return true;
		}
		return false;
	}
	
	@PostMapping("paginaCanale")
	public String visualizzaVideoCanale(HttpSession session, Model model, @RequestParam String usernameCanale){
		String us = (String) session.getAttribute("usernameLogged");
		ArrayList<Video> video = DBManager.getInstance().getVideoDao().findVideoByUsername(usernameCanale);
		Utente user = DBManager.getInstance().getUtenteDao().findByPrimaryKey(usernameCanale);
		Boolean b = sonoIscritto(us,usernameCanale);
		model.addAttribute("isIscritto", b);
		session.setAttribute("isIscritto", b);
		model.addAttribute("canale", user);
		model.addAttribute("tuttiVideo",video);	
		return UtentiController.PAGINA_PROFILO_CANALE;
	}
	
	@PostMapping("visualizzaVideoUtente")
	public String accessoAreaPersonale(HttpSession session, Model model) {
		return UtentiController.visualizzaVideo(session, model);
	}
	
	@PostMapping("caricaVideo")
	public String accessoCaricaVideo() {
		return UtentiController.PAGINA_CARICA_VIDEO;
	}
	
	@PostMapping("playlist")
	public String accessoPlaylist(HttpSession session, Model model) {
		return PlaylistController.visualizzaPlaylist(session, model);
	}
	
	@PostMapping("iscrizioni")
	public String accessoIscrizioni(HttpSession session, Model model) {
		return IscrizioniController.visualizzaIscrizioni(session, model);
	}
	
	@PostMapping("informazioni")
	public String accessoInformazioni(Model model) {
		Integer numUtenti = DBManager.getInstance().getUtenteDao().countUtenti();
		Integer numVideo = DBManager.getInstance().getVideoDao().countVideo();
		Integer numRecensioni = DBManager.getInstance().getRecensioneDao().countRecensioni();
		model.addAttribute("numUtenti", numUtenti);
		model.addAttribute("numVideo",numVideo);
		model.addAttribute("numRecensioni", numRecensioni);
		return UtentiController.PAGINA_INFORMAZIONI_SITO;
	}
}
