package progetto.application.dao;

import java.util.List;

import progetto.application.model.Pubblicita;

public interface PubblicitaDAO {
	public void insert(Pubblicita pubblicita);
	public Pubblicita findByPrimaryKey(String link);
	public List<Pubblicita> findAll();       
	public void update(Pubblicita pubblicita); 
}
