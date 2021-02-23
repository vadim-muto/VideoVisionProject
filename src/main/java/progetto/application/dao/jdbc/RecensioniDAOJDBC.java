package progetto.application.dao.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import progetto.application.dao.RecensioniDAO;
import progetto.application.model.Recensioni;
import progetto.application.model.Utente;
import progetto.application.persistence.DBManager;
import progetto.application.persistence.DBSource;

public class RecensioniDAOJDBC implements RecensioniDAO {

	private DBSource dataSource;
	
	public RecensioniDAOJDBC(DBSource dataSource) {
		this.dataSource=dataSource;
	}
	
	@Override
	public void insert(Recensioni recensione) {
		try {
			Connection conn=dataSource.getConnection();
			String query="INSERT INTO recensioni values(?,?,?)";
			PreparedStatement st=conn.prepareStatement(query);
			st.setString(1, recensione.getTesto());
			st.setString(2, recensione.getUtente().getUsername());
			st.setString(3, recensione.getLink());
			st.execute();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
    
	@Override
	public ArrayList<Recensioni> findAll(String link){
		ArrayList<Recensioni> recensioni = new ArrayList<Recensioni>();
		try {
			Connection conn = dataSource.getConnection();
			String query = "select * from recensioni where link_video=?";
			PreparedStatement st = conn.prepareStatement(query);
			st.setString(1, link);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				String testo = rs.getString("testo");
				String username = rs.getString("username");
				Utente utente = DBManager.getInstance().getUtenteDao().findByPrimaryKey(username);
				Integer id = rs.getInt("id");
				recensioni.add(new Recensioni(testo,utente,link,id));
			}
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return recensioni;
	}

	@Override
	public void deleteByUsername(String username) {
		try {
			Connection conn = dataSource.getConnection();
			String query = "delete\r\n"
					+ "from recensioni r\r\n"
					+ "using video v\r\n"
					+ "where (r.link_video=v.link_dropbox and v.username=?) or r.username=?;";
			PreparedStatement st = conn.prepareStatement(query);
			st.setString(1, username);
			st.setString(2, username);
			st.execute();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteById(Integer id) {
		try {
			Connection conn = dataSource.getConnection();
			String query = "delete from recensioni where id=?";
			PreparedStatement st = conn.prepareStatement(query);
			st.setInt(1, id);
			st.execute();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public Integer countRecensioni() {
		Integer cont = 0;
		try {
			Connection conn = dataSource.getConnection();
			String query = "select count(*) AS count_recensioni from recensioni";
			PreparedStatement st = conn.prepareStatement(query);
			ResultSet rs = st.executeQuery();
			if(rs.next()) {
				cont = rs.getInt("count_recensioni");
			}
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cont;
	}

	@Override
	public ArrayList<Recensioni> findRecensioniByUsername(String username) {
		ArrayList<Recensioni> allUserRecensioni = new ArrayList<Recensioni>();
		try {
			Connection conn = dataSource.getConnection();
			String query = "select * from recensioni where username=?";
			PreparedStatement st = conn.prepareStatement(query);
			st.setString(1,username);
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				String testo = rs.getString("testo");
				String link = rs.getString("link_video");
				Utente utente = DBManager.getInstance().getUtenteDao().findByPrimaryKey(username);
				Recensioni r = new Recensioni(testo, utente, link, null);
				allUserRecensioni.add(r);
			}
			conn.close();
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return allUserRecensioni;
	}

	@Override
	public void modificaRecensione(String testo, Integer id) {
		try {
			Connection conn = dataSource.getConnection();
			String query = "update recensioni set testo=? where id=?";
			PreparedStatement st = conn.prepareStatement(query);
			st.setString(1, testo);
			st.setInt(2, id);
			st.execute();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
