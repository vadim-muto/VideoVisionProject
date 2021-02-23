package progetto.application.dao.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import progetto.application.dao.VideoDAO;
import progetto.application.model.Utente;
import progetto.application.model.Video;
import progetto.application.persistence.DBManager;
import progetto.application.persistence.DBSource;

public class VideoDAOJDBC implements VideoDAO{
	
	private DBSource dataSource;
	
	public VideoDAOJDBC(DBSource dataSource) {
		this.dataSource = dataSource;
	}

	@Override
	public void insert(Video video) {
		try {
			Connection conn = dataSource.getConnection();
			String query = "INSERT INTO video values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement st = conn.prepareStatement(query);
			st.setString(1, video.getLink());
			st.setString(2, video.getTitolo());
			st.setString(3, video.getDescrizione());
			st.setString(4, video.getTag());
			st.setInt(5, video.getVisualizzazioni());
			st.setInt(6, video.getMi_piace());
			st.setInt(7, video.getNon_mi_piace());
			st.setString(8, video.getData_pubblicazione());
			st.setString(9, video.getUtente().getUsername());
			st.setBoolean(10, video.getLimiti_eta());
			st.setBoolean(11, video.getDownload());
			st.setString(12, video.getLinkFoto());
			st.execute();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public Video findByPrimaryKey(String link) {
		Video video = null;
		try {
			Connection conn = dataSource.getConnection();
			String query = "select * from video where link_dropbox=?";
			PreparedStatement st = conn.prepareStatement(query);
			st.setString(1, link);
			ResultSet rs = st.executeQuery();
			if (rs.next()) {
				String linkVideo = rs.getString("link_dropbox");
				String titolo = rs.getString("titolo");
				String descrizione = rs.getString("descrizione");
				String tag= rs.getString("tag");
				Integer visualizzazioni = rs.getInt("visualizzazioni");
				Integer mi_piace = rs.getInt("mi_piace");
				Integer non_mi_piace = rs.getInt("non_mi_piace");
				String data_pubblicazione = rs.getString("data_pubblicazione");
				String username = rs.getString("username");
				Boolean limiti = rs.getBoolean("limiti_eta");
				Boolean download = rs.getBoolean("download");
				String linkFoto=rs.getString("link_foto");
				Utente utente = DBManager.getInstance().getUtenteDao().findByPrimaryKey(username);
				video = new Video(linkVideo, titolo, descrizione, tag, visualizzazioni, mi_piace, non_mi_piace, data_pubblicazione, utente,limiti, download, linkFoto);
			}
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return video;
	}

	@Override
	public ArrayList<Video> findAll() {
		ArrayList<Video> allVideo = new ArrayList<Video>();
		try {
			Connection conn = dataSource.getConnection();
			String query = "select * from video";
			PreparedStatement st = conn.prepareStatement(query);
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				String link = rs.getString("link_dropbox");
				String titolo = rs.getString("titolo");
				String descr = rs.getString("descrizione");
				String tag = rs.getString("tag");			
				Integer vis = rs.getInt("visualizzazioni");
				Integer mi_piace = rs.getInt("mi_piace");
				Integer non_mi_piace = rs.getInt("non_mi_piace");
				String data = rs.getString("data_pubblicazione");
				String username = rs.getString("username");
				Boolean limiti = rs.getBoolean("limiti_eta");
				Boolean download = rs.getBoolean("download");
				String  linkFoto = rs.getString("link_foto");
				Utente user = DBManager.getInstance().getUtenteDao().findByPrimaryKey(username);
				Video video = new Video(link,titolo,descr,tag,vis,mi_piace,non_mi_piace,data,user,limiti,download,linkFoto);
				allVideo.add(video);
			}
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return allVideo;
	}

	@Override
	public void update(Video video) {
		try {
			Connection conn=dataSource.getConnection();
			String query = "update video set titolo=?,descrizione=?,tag=?,visualizzazioni=?,mi_piace=?,non_mi_piace=? where link_dropbox=?";
			PreparedStatement st = conn.prepareStatement(query);
			st.setString(1, video.getTitolo());
			st.setString(2, video.getDescrizione());
			st.setString(3, video.getTag());
			st.setInt(4, video.getVisualizzazioni());
			st.setInt(5, video.getMi_piace());
			st.setInt(6, video.getNon_mi_piace());
			st.setString(7, video.getLink());
			st.executeUpdate();
			conn.close();
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void delete(Video video) {
		try {
			Connection conn = dataSource.getConnection();
			String query = "delete from video where link_dropbox=?";
			PreparedStatement st = conn.prepareStatement(query);
			st.setString(1, video.getLink());
			st.execute();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public void deleteByUsername(String username) {
		try {
			Connection conn = dataSource.getConnection();
			String query = "delete from video where username=?";
			PreparedStatement st = conn.prepareStatement(query);
			st.setString(1, username);
			st.execute();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public ArrayList<Video> findVideoByUsername(String username){
		ArrayList<Video> allUserVideo = new ArrayList<Video>();
		try {
			Connection conn = dataSource.getConnection();
			String query = "select * from video where username=?";
			PreparedStatement st = conn.prepareStatement(query);
			st.setString(1, username);
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				String link = rs.getString("link_dropbox");
				String titolo = rs.getString("titolo");
				String descr = rs.getString("descrizione");
				String tag = rs.getString("tag");			
				Integer vis = rs.getInt("visualizzazioni");
				Integer mi_piace = rs.getInt("mi_piace");
				Integer non_mi_piace = rs.getInt("non_mi_piace");
				String data = rs.getString("data_pubblicazione");
				Boolean limiti = rs.getBoolean("limiti_eta");
				Boolean download = rs.getBoolean("download");
				String linkFoto=rs.getString("link_foto");
				Utente user = DBManager.getInstance().getUtenteDao().findByPrimaryKey(username);
				Video video = new Video(link,titolo,descr,tag,vis,mi_piace,non_mi_piace,data,user,limiti,download,linkFoto);
				allUserVideo.add(video);
			}
			conn.close();
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return allUserVideo;
	}

	@Override
	public Integer countVideo() {
		Integer cont = 0;
		try {
			Connection conn = dataSource.getConnection();
			String query = "select count(*) AS count_video from video";
			PreparedStatement st = conn.prepareStatement(query);
			ResultSet rs = st.executeQuery();
			if(rs.next()) {
				cont = rs.getInt("count_video");
			}
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cont;
	}
	
	@Override
	public Integer totVideoPerUtente(String username) {
		Integer cont=0;
		try {
			Connection conn=dataSource.getConnection();
			String query="select count(*) AS count_video_per_username from video where username=?"; 
			PreparedStatement st= conn.prepareStatement(query);
			st.setString(1, username);
			ResultSet rs=st.executeQuery();
			if(rs.next()) {
				cont=rs.getInt("count_video_per_username");
			}
			conn.close();
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return cont;
	}
}
