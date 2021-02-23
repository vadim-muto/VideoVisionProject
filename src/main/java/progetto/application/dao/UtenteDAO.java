package progetto.application.dao;

import java.util.ArrayList;

import progetto.application.model.Utente;

public interface UtenteDAO {
	public void insert(Utente utente); 
	public Utente findByPrimaryKey(String username);
	public Utente findByEmail(String email);
	public ArrayList<Utente> findAll();    
	public Integer countUtenti();
	public void update(Utente utente); 
	public void delete(Utente utente); 
	public boolean esisteUtente(String username, String password);
	
}
