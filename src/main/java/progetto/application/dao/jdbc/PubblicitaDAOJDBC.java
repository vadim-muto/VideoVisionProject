package progetto.application.dao.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import progetto.application.dao.PubblicitaDAO;
import progetto.application.model.Pubblicita;
import progetto.application.persistence.DBSource;

public class PubblicitaDAOJDBC implements PubblicitaDAO{
	private DBSource dataSource;
	
	public PubblicitaDAOJDBC(DBSource dataSource) {
		this.dataSource=dataSource;
	}
	
	@Override
	public void insert(Pubblicita pubblicita) {
		try {
			Connection conn = dataSource.getConnection();
			String query = "INSERT INTO pubblicita values(?, ?, ?, ?)";
			PreparedStatement st = conn.prepareStatement(query);
			st.setString(1, pubblicita.getLink());
			st.setInt(2, pubblicita.getVisualizzazioni());
			st.setString(3, pubblicita.getImage());
			st.setString(4, pubblicita.getLinkEsterno());
			st.execute();	
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public Pubblicita findByPrimaryKey(String link) {
		Pubblicita pubblicita = null;
		try {
			Connection conn = dataSource.getConnection();
			String query = "select * from pubblicita where link_pubblicita=?";
			PreparedStatement st = conn.prepareStatement(query);
			st.setString(1, link);
			ResultSet rs = st.executeQuery();
			if (rs.next()) {
				String linkPubblicita = rs.getString("link_pubblicita");
				Integer visualizzazioni = rs.getInt("visualizzazioni");
				String image = rs.getString("image");
				String linkEsterno = rs.getString("link_esterno");
				pubblicita = new Pubblicita(linkPubblicita, visualizzazioni, image,linkEsterno);
			}
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return pubblicita;
	}

	@Override
	public List<Pubblicita> findAll() {
		ArrayList<Pubblicita> allPubblicita = new ArrayList<Pubblicita>();
		try {
			Connection conn = dataSource.getConnection();
			String query = "select * from pubblicita";
			PreparedStatement st = conn.prepareStatement(query);
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				String linkPubblicita = rs.getString("link_pubblicita");
				Integer visualizzazioni = rs.getInt("visualizzazioni");
				String image = rs.getString("image");
				String linkEsterno = rs.getString("link_esterno");
				allPubblicita.add(new Pubblicita(linkPubblicita, visualizzazioni, image,linkEsterno));
			}
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return allPubblicita;
	}

	@Override
	public void update(Pubblicita pubblicita) {
		try {
			Connection conn=dataSource.getConnection();
			String query = "update pubblicita set visualizzazioni=? where link_pubblicita=?";
			PreparedStatement st = conn.prepareStatement(query);
			st.setInt(1, pubblicita.getVisualizzazioni());
			st.setString(2, pubblicita.getLink());
			st.executeUpdate();
			conn.close();
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
	}
}
