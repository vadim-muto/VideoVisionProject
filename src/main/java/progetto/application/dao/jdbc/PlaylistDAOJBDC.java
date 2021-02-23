package progetto.application.dao.jdbc;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashSet;

import progetto.application.dao.PlaylistDAO;
import progetto.application.model.Playlist;
import progetto.application.model.Utente;
import progetto.application.model.Video;
import progetto.application.persistence.DBManager;
import progetto.application.persistence.DBSource;

public class PlaylistDAOJBDC implements PlaylistDAO{
	
	private DBSource dataSource;
	
	public PlaylistDAOJBDC(DBSource dataSource) {
		this.dataSource = dataSource;
	}
	
	@Override
	public boolean insert(Playlist playlist) {
		try {
			Connection conn = dataSource.getConnection();
			String query = "INSERT INTO playlist values(?,?,?)";
			PreparedStatement st = conn.prepareStatement(query);
			st.setString(1, playlist.getUtente().getUsername());
			st.setString(2, playlist.getVideo().getLink());
			st.setString(3, playlist.getTitolo());
			st.execute();
			conn.close();
		}
		catch(SQLException e) {
			return false;
		}
		
		return true;
	}

	@Override
	public ArrayList<String> findAllTitle(String user) {
		ArrayList<String> playlist = new ArrayList<String>();
		try {
			Connection conn = dataSource.getConnection();
			String query = "select * from playlist where username=?";
			PreparedStatement st = conn.prepareStatement(query);
			st.setString(1, user);
			ResultSet rs = st.executeQuery(); 
			while(rs.next()) {
				String titolo = rs.getString("titolo");
				playlist.add(titolo);
			}
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
        LinkedHashSet<String> hashSet = new LinkedHashSet<String>(playlist);
        ArrayList<String> listWithoutDuplicates = new ArrayList<String>(hashSet);
		return listWithoutDuplicates;
	}
	
	@Override
	public ArrayList<Video> findAllVideo(String titolo, String username) {
		ArrayList<Video> video = new ArrayList<Video>();
		try {
			Connection conn = dataSource.getConnection();
			String query = "select * from playlist where username=? and titolo=?";
			PreparedStatement st = conn.prepareStatement(query);
			st.setString(1, username);
			st.setString(2, titolo);
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				String link = rs.getString("link_video");
				Video v = DBManager.getInstance().getVideoDao().findByPrimaryKey(link);
				video.add(v);
			}
			conn.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return video;
	}
	
	@Override
	public void delete(Playlist playlist) {
		try {
			Connection conn = dataSource.getConnection();
			String query = "delete from playlist where username=? and link_video=? and titolo=?";
			PreparedStatement st = conn.prepareStatement(query);
			st.setString(1, playlist.getUtente().getUsername());
			st.setString(2, playlist.getVideo().getLink());
			st.setString(3, playlist.getTitolo());
			st.execute();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteCompletePlaylist(Utente u, String titoloPlaylist) {
		try {
			Connection conn = dataSource.getConnection();
			String query = "delete from playlist where username=? and titolo=?";
			PreparedStatement st = conn.prepareStatement(query);
			st.setString(1, u.getUsername());
			st.setString(2, titoloPlaylist);
			st.execute();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public void deleteByVideo(String linkVideo) {
		try {
			Connection conn = dataSource.getConnection();
			String query = "delete from playlist where link_video=?";
			PreparedStatement st = conn.prepareStatement(query);
			st.setString(1, linkVideo);
			st.execute();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}