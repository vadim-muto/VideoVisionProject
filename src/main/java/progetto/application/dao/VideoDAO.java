package progetto.application.dao;

import java.util.ArrayList;

import progetto.application.model.Video;

public interface VideoDAO {
	public void insert(Video video);
	public Video findByPrimaryKey(String link);
	public ArrayList<Video> findAll();  
	public Integer countVideo();
	public void update(Video video); 
	public void delete(Video video); 
	public void deleteByUsername(String username);
	public ArrayList<Video> findVideoByUsername(String username); 
	public Integer totVideoPerUtente(String username);
}
