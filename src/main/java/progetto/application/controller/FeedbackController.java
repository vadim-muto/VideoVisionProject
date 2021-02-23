package progetto.application.controller;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import progetto.application.model.Feedback;
import progetto.application.persistence.DBManager;


@Controller
public class FeedbackController {

    private static final String PAGINA_FEEDBACK = "inviaFeedback";
    private static final int PRMO_ELEMENTO = 0;
    private static final int SECONDO_ELEMENTO = 1;
    private static final int TERZO_ELEMENTO = 2;
    private static final int QUARTO_ELEMENTO = 3;
    private static final int QUINTO_ELEMENTO = 4;
    
    @GetMapping("getFeedback")
    public static String tuttiIFeedback(Model model){
    	
    	ArrayList<Integer> arrayGrafica = DBManager.getInstance().getFeedbackDao().countGrafica();
    	model.addAttribute("miPiace", arrayGrafica.get(FeedbackController.PRMO_ELEMENTO));
    	model.addAttribute("nonMiPiace", arrayGrafica.get(FeedbackController.SECONDO_ELEMENTO));
    	model.addAttribute("nonMiEsprimo", arrayGrafica.get(FeedbackController.TERZO_ELEMENTO));
    	
    	ArrayList<Integer> arrayTema = DBManager.getInstance().getFeedbackDao().countAspetto();
    	model.addAttribute("temaDark", arrayTema.get(FeedbackController.PRMO_ELEMENTO));
    	model.addAttribute("temaWhite", arrayTema.get(FeedbackController.SECONDO_ELEMENTO));
    	model.addAttribute("temaIndifferente", arrayTema.get(FeedbackController.TERZO_ELEMENTO));
    	
    	
    	ArrayList<Integer> arrayDifficolta = DBManager.getInstance().getFeedbackDao().countDifficolta();
    	model.addAttribute("intuitivaSi", arrayDifficolta.get(FeedbackController.PRMO_ELEMENTO));
    	model.addAttribute("intuitivaNo", arrayDifficolta.get(FeedbackController.SECONDO_ELEMENTO));
    	model.addAttribute("intuitivaIndifferente", arrayDifficolta.get(FeedbackController.TERZO_ELEMENTO));
    	
    	ArrayList<Integer> arrayAccount = DBManager.getInstance().getFeedbackDao().countAccount();
    	model.addAttribute("accountSi", arrayAccount.get(FeedbackController.PRMO_ELEMENTO));
    	model.addAttribute("accountNo", arrayAccount.get(FeedbackController.SECONDO_ELEMENTO));
    	model.addAttribute("accountABreve", arrayAccount.get(FeedbackController.TERZO_ELEMENTO));
    	
    	
    	ArrayList<Integer> arrayStelle = DBManager.getInstance().getFeedbackDao().countStelle();
    	model.addAttribute("stelleUna", arrayStelle.get(FeedbackController.PRMO_ELEMENTO));
    	model.addAttribute("stelleDue", arrayStelle.get(FeedbackController.SECONDO_ELEMENTO));
    	model.addAttribute("stelleTre", arrayStelle.get(FeedbackController.TERZO_ELEMENTO));
    	model.addAttribute("stelleQuattro", arrayStelle.get(FeedbackController.QUARTO_ELEMENTO));
    	model.addAttribute("stelleCinque", arrayStelle.get(FeedbackController.QUINTO_ELEMENTO));
    	
    	ArrayList<String> arrayCommenti=DBManager.getInstance().getFeedbackDao().ottienicommenti();
    	int casuale1=0;
    	int casuale2=0;
    	int casuale3=0;
    	
    	while(casuale1 == casuale2 || casuale2 == casuale3) {
    		casuale1 = (int)(Math.random()*arrayCommenti.size());
    		casuale2 = (int)(Math.random()*arrayCommenti.size());
    		casuale3 = (int)(Math.random()*arrayCommenti.size());
    	}
    	
    	model.addAttribute("commentoUno",arrayCommenti.get(casuale1));
    	model.addAttribute("commentoDue",arrayCommenti.get(casuale2));
    	model.addAttribute("commentoTre",arrayCommenti.get(casuale3));

    	return FeedbackController.PAGINA_FEEDBACK;
    }

    @PostMapping("inviaFeedback")
    public String sendFeedback(Model model, @RequestParam String grafica, @RequestParam String tema, @RequestParam String intuitivita, @RequestParam String account, @RequestParam String stelle, @RequestParam String commento){

    	Integer nStelle = Integer.parseInt(stelle);
    	Feedback f = new Feedback(grafica, tema, intuitivita, account, nStelle, commento);
    	DBManager.getInstance().getFeedbackDao().insert(f);
    	
        return FeedbackController.tuttiIFeedback(model);
    }
}
