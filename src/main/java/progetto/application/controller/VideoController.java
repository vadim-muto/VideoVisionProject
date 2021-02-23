package progetto.application.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.joda.time.LocalDate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import Model.VVMatching;
import progetto.application.model.Pubblicita;
import progetto.application.model.Recensioni;
import progetto.application.model.Utente;
import progetto.application.model.Video;
import progetto.application.persistence.DBManager;
import progetto.application.utilities.SortCanali;
import progetto.application.utilities.SortCategoria;
import progetto.application.utilities.SortTitolo;
import progetto.application.utilities.UtentiSimilarity;
import progetto.application.utilities.VideoSimilarity;
import progetto.dropbox.DropboxManager;

@Controller
public class VideoController {
	
	private static final String ULTIMI_INSERITI = "ultimiInseriti";
	private static final String IN_EVIDENZA = "inEvidenza";
	private static final String PAGINA_VISUALIZZA_VIDEO = "video";
	private static final String PAGINA_RISULTATI_VIDEO = "risultatiVideo";
	private static final String PAGINA_PROFILO_VIDEO = "profiloVideo";
	private static final String PAGINA_INDEX = "index";
	private static final int PUBBLICITA_ON = 0;
	
	@PostMapping("uploadFile")
	public String uploadVideo(HttpSession session,@RequestParam String nomeVideo, @RequestParam String titolo, @RequestParam String descrizione, @RequestParam String tag, Model model,@RequestParam(defaultValue = "false") Boolean checkbox, @RequestParam(defaultValue = "false") Boolean download, @RequestParam String linkFoto) {
		String linkVideo = DropboxManager.getInstance().getLinkVideo(nomeVideo);
		String linkCopertina = DropboxManager.getInstance().getLinkVideo(linkFoto);
		LocalDate data = LocalDate.now();
		String username = (String) session.getAttribute("usernameLogged");
		Utente user = DBManager.getInstance().getUtenteDao().findByPrimaryKey(username);
		DBManager.getInstance().getVideoDao().insert(new Video(linkVideo,titolo,descrizione,tag, 0, 0, 0, data.toString(), user, checkbox,download,linkCopertina));
		
		return HomeController.home(model, session);
	}
	
	@PostMapping("doSearch")
	public static String effettuaRicerca(@RequestParam String search, HttpSession session, Model model) {

		session.setAttribute("search", search);
		
		boolean resultVideo = sezioneVideo(search, session, model);
		boolean resultCanali = sezioneCanali(search, session, model);

		if(resultVideo && resultCanali) {
			model.addAttribute("resultEmpty", "La ricerca non ha restituito nessun risultato.");
			session.setAttribute("resultEmpty", "La ricerca non ha restituito nessun risultato.");
		}
		else
			session.removeAttribute("resultEmpty");
		
		Utente user = (Utente) session.getAttribute("utente");
		if( user != null) {
			ArrayList<String> listaPlaylist = DBManager.getInstance().getPlaylistDao().findAllTitle(user.getUsername());
			model.addAttribute("utente", user);
			model.addAttribute("listaPlaylist", listaPlaylist);
		}
		
		model.addAttribute("isIscritto", session.getAttribute("isIscritto"));
		
		return VideoController.PAGINA_RISULTATI_VIDEO;
	}
	
	private static boolean sezioneCanali(String search, HttpSession session, Model model) {
		ArrayList<Utente> allCanali = DBManager.getInstance().getUtenteDao().findAll();
		ArrayList<UtentiSimilarity> canaliMatch = new ArrayList<UtentiSimilarity>();
		ArrayList<UtentiSimilarity> canaliHtml = new ArrayList<UtentiSimilarity>();
		
		for(Utente u : allCanali) {
			String username = u.getUsername();
			//piu è alto piu è vicino al risultato cercato
			Integer value = new VVMatching().apply(username, search);
			Integer numVideo = DBManager.getInstance().getVideoDao().totVideoPerUtente(username);
			canaliMatch.add(new UtentiSimilarity(u.getUsername(), u.getFoto_profilo(), u.getNum_iscritti(), numVideo, value, false));
		}
			
		Collections.sort(canaliMatch, new SortCanali());
		for (UtentiSimilarity us : canaliMatch) {
			if (us.getValue() == 0)
				continue;
			
			canaliHtml.add(us);
		}
		
		String usernameLogged = (String) session.getAttribute("usernameLogged");
		for(UtentiSimilarity us : canaliHtml) {
			boolean isIscritto = UtentiController.sonoIscritto(usernameLogged, us.getUsername());
			us.setIscritto(isIscritto);
		}
		
		model.addAttribute("canali", canaliHtml);
		session.setAttribute("canali", canaliHtml);
		
		return canaliHtml.isEmpty();
	}

	private static boolean sezioneVideo(String search, HttpSession session, Model model) {
		ArrayList<Video> allVideo = DBManager.getInstance().getVideoDao().findAll();
		ArrayList<VideoSimilarity> videoMatch = new ArrayList<VideoSimilarity>();
		ArrayList<VideoSimilarity> videoHtml = new ArrayList<VideoSimilarity>();
		
		for(Video v : allVideo) {
			String titolo = v.getTitolo();
			//piu è alto piu è vicino al risultato cercato
			Integer similarity = new VVMatching().apply(titolo, search);
			videoMatch.add(new VideoSimilarity(v.getLink(), v.getTitolo(), v.getVisualizzazioni(), v.getData_pubblicazione(),  v.getMi_piace(), v.getNon_mi_piace(), v.getTag(), v.getUtente().getUsername(), v.getLinkFoto(), similarity));
		}
			
		Collections.sort(videoMatch, new SortTitolo());
		for (VideoSimilarity vs : videoMatch) {
			if (vs.getValue() == 0)
				continue;
			
			videoHtml.add(vs);
		}
		
		model.addAttribute("video", videoHtml);
		session.setAttribute("filtriVideo", videoHtml);
				
		return videoHtml.isEmpty();
	}

	@PostMapping("filtri")
	public String setFilter(@RequestParam String filtro, HttpSession session, Model model) {
		
		ArrayList<VideoSimilarity> videoHtml = (ArrayList<VideoSimilarity>) session.getAttribute("filtriVideo");
		ArrayList<VideoSimilarity> videoMatch = new ArrayList<VideoSimilarity>();
		
		switch (filtro) {
			case VideoController.ULTIMI_INSERITI:
				Collections.sort(videoHtml, new SortCategoria(SortCategoria.DATA_PUBBLICAZIONE));
				break;
			case VideoController.IN_EVIDENZA:
				Collections.sort(videoHtml, new SortCategoria(SortCategoria.IN_EVIDENZA));
				break;
			default:
				for(VideoSimilarity v : videoHtml) {
					String tag = v.getTag();
					Integer similarity = new VVMatching().apply(tag, filtro);
					videoMatch.add(new VideoSimilarity(v.getLinkVideo(), v.getTitolo(), v.getVisualizzazioni(), v.getData_pubblicazione(), v.getMiPiace(), v.getNonMiPiace(), v.getTag(), v.getUsername(), v.getLinkFoto(), similarity));
				}
				
				videoHtml.clear();
				Collections.sort(videoMatch, new SortTitolo());
				videoHtml.addAll(videoMatch);
				break;
		}
		
		ArrayList<UtentiSimilarity> canaliHtml = (ArrayList<UtentiSimilarity>) session.getAttribute("canali");
		model.addAttribute("canali", canaliHtml);
		model.addAttribute("video", videoHtml);
		model.addAttribute("resultEmpty", session.getAttribute("resultEmpty"));
		
		return VideoController.PAGINA_RISULTATI_VIDEO;
	}
	
	@PostMapping("doComment")
	public String insertComment(HttpSession session, Model model, @RequestParam String commento, @RequestParam String linkVideo) {
		
		String username = (String) session.getAttribute("usernameLogged");
		Utente u = DBManager.getInstance().getUtenteDao().findByPrimaryKey(username);
		Recensioni recensione = new Recensioni(commento, u, linkVideo, null);
		DBManager.getInstance().getRecensioneDao().insert(recensione);
		
		ArrayList<Recensioni> recensioni = DBManager.getInstance().getRecensioneDao().findAll(linkVideo);
		model.addAttribute("listaCommenti", recensioni);
		
		return VideoController.PAGINA_VISUALIZZA_VIDEO;
	}
	
	@PostMapping("like")
	public String like(@RequestParam String linkVideo) {
		Video v=DBManager.getInstance().getVideoDao().findByPrimaryKey(linkVideo);
		int miPiace=v.getMi_piace();
		miPiace+=1;
		v.setMi_piace(miPiace);
		DBManager.getInstance().getVideoDao().update(v);
		return VideoController.PAGINA_VISUALIZZA_VIDEO;
	}
	
	@PostMapping("disLike")
	public String disLike(@RequestParam String linkVideo) {
		Video v=DBManager.getInstance().getVideoDao().findByPrimaryKey(linkVideo);
		int nonMiPiace=v.getNon_mi_piace();
		nonMiPiace+=1;
		v.setNon_mi_piace(nonMiPiace);
		DBManager.getInstance().getVideoDao().update(v);
		return VideoController.PAGINA_VISUALIZZA_VIDEO;
	}
	
	@PostMapping("selezionaVideo")
	public static String chooseVideo(@RequestParam String videoDaVisualizzare, HttpSession session, Model model) {	
		Video video = DBManager.getInstance().getVideoDao().findByPrimaryKey(videoDaVisualizzare);
		model.addAttribute("videoSelezionato", video);
		video.setVisualizzazioni(1);
		DBManager.getInstance().getVideoDao().update(video);
		
		// pubblicità random
		if (pubblicitaSiNO() == VideoController.PUBBLICITA_ON) {
			List<Pubblicita> allPubblicita = DBManager.getInstance().getPubblicitaDao().findAll();
			Pubblicita pubb = pubblicitaRandom(allPubblicita);
			pubb.setVisualizzazioni(1);
			DBManager.getInstance().getPubblicitaDao().update(pubb);
			model.addAttribute("pubblicita", pubb);
		}
		
		ArrayList<Recensioni> recensioni = DBManager.getInstance().getRecensioneDao().findAll(videoDaVisualizzare);
		model.addAttribute("listaCommenti", recensioni);
		if(!recensioni.isEmpty()){
			Integer lastId = recensioni.get(recensioni.size() - 1).getId();
			model.addAttribute("lastId", lastId);
		}
		
		Utente user = (Utente) session.getAttribute("utente");
		if(user != null) {
			ArrayList<String> playlist = DBManager.getInstance().getPlaylistDao().findAllTitle(user.getUsername());
			model.addAttribute("listaPlaylist", playlist);
			model.addAttribute("utente", user);
		}
	
		return VideoController.PAGINA_VISUALIZZA_VIDEO;
	}
	
	@PostMapping("eliminaVideo")
	public static String removeVideo(HttpSession session, @RequestParam String linkVideo) {	
		DBManager.getInstance().getPlaylistDao().deleteByVideo(linkVideo);
		Video videoDaCancellare = DBManager.getInstance().getVideoDao().findByPrimaryKey(linkVideo);
		DBManager.getInstance().getVideoDao().delete(videoDaCancellare);
		return VideoController.PAGINA_PROFILO_VIDEO;
	}
	
	private static int pubblicitaSiNO() {
		return 0;
	}
	
	private static Pubblicita pubblicitaRandom(List<Pubblicita> allPubblicita) {
		int index = new Random().nextInt(allPubblicita.size());
		return allPubblicita.get(index);
	}
}
