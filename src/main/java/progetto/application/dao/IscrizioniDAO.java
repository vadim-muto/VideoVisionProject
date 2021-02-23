package progetto.application.dao;

import java.util.ArrayList;

import progetto.application.model.Iscrizioni;

public interface IscrizioniDAO {
	public void insert(Iscrizioni iscrizioni);
	public ArrayList<Iscrizioni> findAll(String username);  
	public void delete(Iscrizioni iscrizioni);
	public void deleteByUsername(String username);
}
