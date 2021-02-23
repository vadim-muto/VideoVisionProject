package progetto.application.dao.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import progetto.application.dao.UtenteDAO;
import progetto.application.model.Utente;
import progetto.application.persistence.DBSource;
import progetto.application.utilities.EncryptPassword;

public class UtenteDAOJDBC implements UtenteDAO{
	
	private DBSource dataSource;
	
	public UtenteDAOJDBC(DBSource dataSource) {
		this.dataSource = dataSource;
	}
	
	@Override
	public void insert(Utente utente) {
		Connection conn;
		try {
			conn = dataSource.getConnection();
			String queryUpdate = "INSERT INTO utente values(?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement st = conn.prepareStatement(queryUpdate);
			st.setString(1, utente.getNome());
			st.setString(2, utente.getCognome());
			st.setString(3, utente.getDataNascita());
			st.setString(4, utente.getUsername());
			st.setString(5, utente.getEmail());
			st.setString(6, utente.getPassword());
			st.setInt(7, utente.getNum_iscritti());
			st.setString(8, utente.getFoto_profilo());
			st.execute();	
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public Utente findByPrimaryKey(String user) {
		Utente utente = null;
		try {
			Connection conn = dataSource.getConnection();
			String query = "select * from utente where username=?";
			PreparedStatement st = conn.prepareStatement(query);
			st.setString(1, user);
			ResultSet rs = st.executeQuery();
			if (rs.next()) {
				String nome = rs.getString("nome");
				String cognome = rs.getString("cognome");
				String data = rs.getString("dataNascita");
				String username= rs.getString("username");
				String email = rs.getString("email");
				String pass = rs.getString("password");
				Integer iscritti = rs.getInt("num_iscritti");
				String foto_profilo = rs.getString("foto_profilo");
				utente = new Utente(nome,cognome,data,username,email,pass,iscritti,foto_profilo);
			}
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return utente;
	}

	@Override
	public ArrayList<Utente> findAll() {
		ArrayList<Utente> tuttiUtenti=new ArrayList<Utente>();
		Utente utente = null;
		try {
			Connection conn=dataSource.getConnection();
			String query="select * from utente";
			PreparedStatement st=conn.prepareStatement(query);
			ResultSet rs=st.executeQuery();
			while(rs.next()) {
				String nome = rs.getString("nome");
				String cognome = rs.getString("cognome");
				String data = rs.getString("dataNascita");
				String username= rs.getString("username");
				String email = rs.getString("email");
				String pass = rs.getString("password");
				Integer iscritti = rs.getInt("num_iscritti");
				String foto_profilo = rs.getString("foto_profilo");
				utente = new Utente(nome,cognome,data,username,email,pass,iscritti,foto_profilo);
				tuttiUtenti.add(utente);
			}
			conn.close();
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return tuttiUtenti;
	}
	
	
	@Override
	public void update(Utente utente) {
		try {
			Connection conn = dataSource.getConnection();
			String queryPsw = "update utente set nome=?,cognome=?,num_iscritti=?,password=?,foto_profilo=? where username=?";
			PreparedStatement st = conn.prepareStatement(queryPsw);
			st.setString(1, utente.getNome());
			st.setString(2, utente.getCognome());
			st.setInt(3, utente.getNum_iscritti());
			st.setString(4, utente.getPassword());
			st.setString(5, utente.getFoto_profilo());
			st.setString(6, utente.getUsername());
			st.executeUpdate();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void delete(Utente utente) {
		try {
			Connection conn = dataSource.getConnection();
			String query = "delete from utente where username=?";
			PreparedStatement st = conn.prepareStatement(query);
			st.setString(1, utente.getUsername());
			st.execute();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public boolean esisteUtente(String username, String password) {
		try {
			Connection conn=dataSource.getConnection();
			String queryUpdate = "select password from utente where username=?";
			PreparedStatement st = conn.prepareStatement(queryUpdate);
			st.setString(1, username);
			ResultSet rs = st.executeQuery();
			if(rs.next()) {
				String pswCrypted = rs.getString("password");
				return EncryptPassword.getInstance().checkPassword(password, pswCrypted);
			}
			
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Sono in eccezione nell'utente DAOJDBC");
		}
		return false;
	}

	@Override
	public Utente findByEmail(String email) {
		Utente utente = null;
		try {
			Connection conn = dataSource.getConnection();
			String query = "select * from utente where email=?";
			PreparedStatement st = conn.prepareStatement(query);
			st.setString(1, email);
			ResultSet rs = st.executeQuery();
			if (rs.next()) {
				String nome = rs.getString("nome");
				String cognome = rs.getString("cognome");
				String data = rs.getString("dataNascita");
				String username= rs.getString("username");
				String em = rs.getString("email");
				String pass = rs.getString("password");
				Integer iscritti = rs.getInt("num_iscritti");
				String foto_profilo = rs.getString("foto_profilo");
				utente = new Utente(nome,cognome,data,username,em,pass,iscritti,foto_profilo);
			}
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return utente;
	}

	@Override
	public Integer countUtenti() {
		Integer cont=0;
		try {
			Connection conn=dataSource.getConnection();
			String query="select count (*) as count_utenti from utente";
			PreparedStatement st=conn.prepareStatement(query);
			ResultSet rs=st.executeQuery();
			if(rs.next()) {
				cont=rs.getInt("count_utenti");
			}
			conn.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return cont;
	}
}
