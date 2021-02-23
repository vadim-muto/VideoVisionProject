package progetto.application.controller;

import java.util.ArrayList;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import progetto.application.model.Iscrizioni;
import progetto.application.model.Playlist;
import progetto.application.model.Utente;
import progetto.application.model.Video;
import progetto.application.persistence.DBManager;

@Controller
public class PlaylistController {
	
	private static final String PAGINA_VIDEO = "video";
	private static final String PAGINA_PROFILO_PLAYLIST = "profiloPlaylist";
	private static final String PAGINA_PLAYLIST_CANALE = "profiloCanalePlaylist";
	
	@PostMapping("condividiPlaylist")
	public String condividiPlaylist(HttpSession session, @RequestParam String titoloPlaylist, @RequestParam String usernameCanale) {
		String username = (String) session.getAttribute("usernameLogged");
		Utente u = DBManager.getInstance().getUtenteDao().findByPrimaryKey(username);
		ArrayList<Video> video = DBManager.getInstance().getPlaylistDao().findAllVideo(titoloPlaylist, usernameCanale);
		for(Video v : video) {
			Playlist playlist = new Playlist(u, v, titoloPlaylist);
			if(!DBManager.getInstance().getPlaylistDao().insert(playlist))
				return null;
		}
		return PAGINA_VIDEO;
	}
	
	@PostMapping("addVideoPlaylist")
	public String addVideoPlaylist(HttpSession session, @RequestParam String linkVideo, @RequestParam String titolo) {
		String username = (String) session.getAttribute("usernameLogged");
		Video v = DBManager.getInstance().getVideoDao().findByPrimaryKey(linkVideo);
		Utente u = DBManager.getInstance().getUtenteDao().findByPrimaryKey(username);
		Playlist playlist = new Playlist(u, v, titolo);
		if(DBManager.getInstance().getPlaylistDao().insert(playlist))	
			return PAGINA_VIDEO;
		return null;
	}
	
	@PostMapping("deletePlaylist")
	public String deletePlaylist(HttpSession session, @RequestParam String titoloPlaylist) {
		String username = (String) session.getAttribute("usernameLogged");
		Utente u = DBManager.getInstance().getUtenteDao().findByPrimaryKey(username);
		DBManager.getInstance().getPlaylistDao().deleteCompletePlaylist(u,titoloPlaylist);
		return PAGINA_PROFILO_PLAYLIST;
	}
	
	@PostMapping("deleteVideoPlaylist")
	public String deleteVideoPlaylist(HttpSession session, @RequestParam String linkVideo, @RequestParam String titoloPlaylist) {
		String username = (String) session.getAttribute("usernameLogged");
		Video v = DBManager.getInstance().getVideoDao().findByPrimaryKey(linkVideo);
		Utente u = DBManager.getInstance().getUtenteDao().findByPrimaryKey(username);
		Playlist p = new Playlist(u,v,titoloPlaylist);
		DBManager.getInstance().getPlaylistDao().delete(p);
		return PAGINA_PROFILO_PLAYLIST;
	}
	
	@PostMapping("visualizzaPlaylist")
	public static String visualizzaPlaylist(HttpSession session, Model model) {
		ArrayList<String> nomePlaylist = null;
		Map<String, ArrayList<Video>> listaPlaylist = new HashMap<String, ArrayList<Video>>();
		String username = (String) session.getAttribute("usernameLogged");
		
		if (username != null) {
			nomePlaylist = DBManager.getInstance().getPlaylistDao().findAllTitle(username);
			for (String p : nomePlaylist) {
				ArrayList<Video> video = DBManager.getInstance().getPlaylistDao().findAllVideo(p,username);
				listaPlaylist.put(p, video);
			}
			Utente u = DBManager.getInstance().getUtenteDao().findByPrimaryKey(username);
			model.addAttribute("utente", u);
			model.addAttribute("listaPlaylist", listaPlaylist);
		}
		return PAGINA_PROFILO_PLAYLIST;
	}
	
	@PostMapping("visualizzaPlaylistCanale")
	public String visualizzaPlaylistCanale(HttpSession session, Model model, @RequestParam String usernameCanale){
		ArrayList<String> nomePlaylist = null;
		Map<String, ArrayList<Video>> listaPlaylist = new HashMap<String, ArrayList<Video>>();
		String username = (String) session.getAttribute("usernameLogged");
		nomePlaylist = DBManager.getInstance().getPlaylistDao().findAllTitle(usernameCanale);
		for (String p : nomePlaylist) {
			ArrayList<Video> video = DBManager.getInstance().getPlaylistDao().findAllVideo(p,usernameCanale);
			listaPlaylist.put(p, video);
		}
		
		Utente canale = DBManager.getInstance().getUtenteDao().findByPrimaryKey(usernameCanale);
		Boolean b = sonoIscritto(username,usernameCanale);
		model.addAttribute("isIscritto", b);
		model.addAttribute("canale", canale);
		model.addAttribute("listaPlaylist",listaPlaylist);	
		return PAGINA_PLAYLIST_CANALE;
	}
	
	public boolean sonoIscritto(String username,String canale) {
		ArrayList<Iscrizioni> iscrizioni = DBManager.getInstance().getIscrizioneDao().findAll(username);
		for(Iscrizioni i : iscrizioni) {
			if(i.getCanale().getUsername().equals(canale))
				return true;
		}
		return false;
	}
}
