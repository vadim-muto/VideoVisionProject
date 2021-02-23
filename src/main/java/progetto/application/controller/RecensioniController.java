package progetto.application.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import progetto.application.persistence.DBManager;

@Controller
public class RecensioniController {

    private static final String PAGINA_VIDEO = "video";

    @PostMapping("eliminaCommento")
    public String eliminaCommento(@RequestParam Integer idComment){
        DBManager.getInstance().getRecensioneDao().deleteById(idComment);

        return RecensioniController.PAGINA_VIDEO;
    }

    @PostMapping("modificaCommento")
    public String modificaCommento(@RequestParam String testo, @RequestParam Integer idComment){
        DBManager.getInstance().getRecensioneDao().modificaRecensione(testo, idComment);

        return RecensioniController.PAGINA_VIDEO;
    }
}
