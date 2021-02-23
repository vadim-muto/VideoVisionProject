package progetto.application.dao;

import java.util.ArrayList;
import progetto.application.model.Playlist;
import progetto.application.model.Utente;
import progetto.application.model.Video;

public interface PlaylistDAO {
	public boolean insert(Playlist playlist);
	public ArrayList<String> findAllTitle(String username);  
	public ArrayList<Video> findAllVideo(String titolo,String username);
	public void delete(Playlist playlist);
	public void deleteByVideo(String linkVideo);
	public void deleteCompletePlaylist(Utente u, String titoloPlaylist); 
}