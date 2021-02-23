package progetto.application.dao;

import java.util.ArrayList;

import progetto.application.model.Recensioni;

public interface RecensioniDAO {
	public void insert(Recensioni recensione);
	public ArrayList<Recensioni> findAll(String video);  
	public Integer countRecensioni();
	public void deleteByUsername(String username);
	public void deleteById(Integer id);
	public ArrayList<Recensioni> findRecensioniByUsername(String username); 
	public void modificaRecensione(String testo, Integer id);
}
