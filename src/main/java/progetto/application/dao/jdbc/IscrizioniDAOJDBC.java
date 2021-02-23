package progetto.application.dao.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import progetto.application.dao.IscrizioniDAO;
import progetto.application.model.Iscrizioni;
import progetto.application.model.Utente;
import progetto.application.persistence.DBManager;
import progetto.application.persistence.DBSource;

public class IscrizioniDAOJDBC implements IscrizioniDAO{
	
	private DBSource dataSource;
	
	public IscrizioniDAOJDBC(DBSource dataSource) {
		this.dataSource = dataSource;
	}
	
	@Override
	public void insert(Iscrizioni iscrizioni) {
		try {
			Connection conn = dataSource.getConnection();
			String query = "INSERT INTO iscrizioni values(?,?)";
			PreparedStatement st = conn.prepareStatement(query);
			st.setString(1, iscrizioni.getUtente().getUsername());
			st.setString(2, iscrizioni.getCanale().getUsername());
			st.execute();
			conn.close();
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public ArrayList<Iscrizioni> findAll(String username) {
		ArrayList<Iscrizioni> iscritti = new ArrayList<Iscrizioni>();
		try {
			Connection conn = dataSource.getConnection();
			String query = "select * from iscrizioni where username=?";
			PreparedStatement st = conn.prepareStatement(query);
			st.setString(1, username);
			ResultSet rs = st.executeQuery(); 
			while(rs.next()) {
				String utente= rs.getString("username"); 
				String canale = rs.getString("canale");
				Utente ut = DBManager.getInstance().getUtenteDao().findByPrimaryKey(utente);
				Utente can = DBManager.getInstance().getUtenteDao().findByPrimaryKey(canale);
				iscritti.add(new Iscrizioni(ut, can));
			}
			conn.close();
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return iscritti;
	}

	@Override
	public void delete(Iscrizioni iscrizioni) {
		try {
			Connection conn = dataSource.getConnection();
			String query = "delete from iscrizioni where username=? and canale=?";
			PreparedStatement st = conn.prepareStatement(query);
			st.setString(1, iscrizioni.getUtente().getUsername());
			st.setString(2, iscrizioni.getCanale().getUsername());
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
			String query = "delete from iscrizioni where (canale=?) or (username=?)";
			PreparedStatement st = conn.prepareStatement(query);
			st.setString(1, username);
			st.setString(2, username);
			st.execute();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
