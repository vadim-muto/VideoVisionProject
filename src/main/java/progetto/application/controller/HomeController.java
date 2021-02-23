package progetto.application.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import Model.VVMatching;
import progetto.application.model.Pubblicita;
import progetto.application.model.Utente;
import progetto.application.model.Video;
import progetto.application.persistence.DBManager;
import progetto.application.utilities.SortTitolo;
import progetto.application.utilities.VideoSimilarity;

@Controller
public class HomeController {
	
	private static final String PAGINA_INDEX = "index";
	private static final int PUBBLICITA_ON = 0;
	
	@GetMapping("")
	public static String home(Model model, HttpSession session) {
		ArrayList<Video> allVideo = DBManager.getInstance().getVideoDao().findAll();
		
		ArrayList<VideoSimilarity> sport = new ArrayList<VideoSimilarity>();
		ArrayList<VideoSimilarity> cinema = new ArrayList<VideoSimilarity>();
		ArrayList<VideoSimilarity> intrattenimento = new ArrayList<VideoSimilarity>();
		ArrayList<VideoSimilarity> musica = new ArrayList<VideoSimilarity>();
		
		for(Video v : allVideo) {
			
			String tag = v.getTag();
			Integer similaritySport = new VVMatching().apply(tag, "sport");
			Integer similarityCinema = new VVMatching().apply(tag, "cinema");
			Integer similarityIntrattenimento = new VVMatching().apply(tag, "intrattenimento");
			Integer similarityMusica = new VVMatching().apply(tag, "musica");
			
			sport.add(new VideoSimilarity(v.getLink(), v.getTitolo(), v.getVisualizzazioni(), v.getData_pubblicazione(), v.getMi_piace(), v.getNon_mi_piace(), v.getTag(), v.getUtente().getUsername(),v.getLinkFoto(),similaritySport));
			cinema.add(new VideoSimilarity(v.getLink(), v.getTitolo(), v.getVisualizzazioni(), v.getData_pubblicazione(),v.getMi_piace(),v.getNon_mi_piace(), v.getTag(), v.getUtente().getUsername(),v.getLinkFoto(),similarityCinema));
			intrattenimento.add(new VideoSimilarity(v.getLink(), v.getTitolo(), v.getVisualizzazioni(), v.getData_pubblicazione(),  v.getMi_piace(), v.getNon_mi_piace(), v.getTag(), v.getUtente().getUsername(), v.getLinkFoto(), similarityIntrattenimento));
			musica.add(new VideoSimilarity(v.getLink(), v.getTitolo(), v.getVisualizzazioni(), v.getData_pubblicazione(),  v.getMi_piace(), v.getNon_mi_piace(), v.getTag(), v.getUtente().getUsername(), v.getLinkFoto(), similarityMusica));
		}
		
		Collections.sort(sport, new SortTitolo());
		Collections.sort(cinema, new SortTitolo());
		Collections.sort(intrattenimento, new SortTitolo());
		Collections.sort(musica, new SortTitolo());

		for(int i=4; i<sport.size();) 
			sport.remove(i);
		for(int i=4; i<cinema.size();) 
			cinema.remove(i);
		for(int i=4; i<intrattenimento.size();) 
			intrattenimento.remove(i);
		for(int i=4; i<musica.size();) 
			musica.remove(i);
		
		model.addAttribute("sport", sport);
		model.addAttribute("cinema", cinema);
		model.addAttribute("intrattenimento", intrattenimento);
		model.addAttribute("musica", musica);
		
		Utente user = (Utente) session.getAttribute("utente");
		if (user != null) {
			model.addAttribute("utente", user);
			ArrayList<String> playlist = DBManager.getInstance().getPlaylistDao().findAllTitle(user.getUsername());
			model.addAttribute("listaPlaylist", playlist);
		}
		session.setAttribute("sport", sport);
		session.setAttribute("cinema", cinema);
		session.setAttribute("intrattenimento", intrattenimento);
		session.setAttribute("musica", musica);
		
		// pubblicità random
		if (pubblicitaSiNO() == HomeController.PUBBLICITA_ON) {
			List<Pubblicita> allPubblicita = DBManager.getInstance().getPubblicitaDao().findAll();
			Pubblicita pubb = pubblicitaRandom(allPubblicita);
			pubb.setVisualizzazioni(1);
			DBManager.getInstance().getPubblicitaDao().update(pubb);
			model.addAttribute("pubblicita", pubb);
		}
		
		return HomeController.PAGINA_INDEX;
	}
	
	@PostMapping("home")
	public String backHome(Model model, HttpSession session) {
		return HomeController.home(model, session);
	}
	
	private static int pubblicitaSiNO() {
		return 0;
	}
	
	private static Pubblicita pubblicitaRandom(List<Pubblicita> allPubblicita) {
		int index = new Random().nextInt(allPubblicita.size());
		return allPubblicita.get(index);
	}
}
