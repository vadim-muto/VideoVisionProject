package progetto.application.dao.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import progetto.application.dao.FeedbackDao;
import progetto.application.model.Feedback;
import progetto.application.persistence.DBSource;

public class FeedbackDAOJDBC implements FeedbackDao {
	
	private DBSource dataSource;
	
	public FeedbackDAOJDBC(DBSource dataSource) {
		this.dataSource=dataSource;
	}
	
	@Override
	public void insert(Feedback feedback) {
		try {
			Connection conn = dataSource.getConnection();
			String query="INSERT INTO feedback values(?,?,?,?,?,?)";  //query da fare
			PreparedStatement st = conn.prepareStatement(query);
			st.setString(1, feedback.getGrafica());
			st.setString(2, feedback.getAspetto());
			st.setString(3, feedback.getDifficolta());
			st.setString(4, feedback.getAccount());
			st.setInt(5, feedback.getnStelle());
			st.setString(6,feedback.getCommento());
			st.execute();
			conn.close();
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public ArrayList<Integer> countGrafica() {
		ArrayList<Integer> daRestituire=new ArrayList<Integer>();
		ArrayList<String> daCercare=new ArrayList<String>();
		String s1="Mi piace";
		String s2="Non mi piace";
		String s3="Non mi esprimo";
		daCercare.add(s1);
		daCercare.add(s2);
		daCercare.add(s3);
		
		int cont=0;
		try {
			for(int i=0;i<daCercare.size();i++) {
				cont=0;
				Connection conn=dataSource.getConnection();
				String query="select count(*) AS count_temporaneo from feedback where grafica=?";
				PreparedStatement st=conn.prepareStatement(query);
				st.setString(1, daCercare.get(i));
				ResultSet rs=st.executeQuery();
				if(rs.next()) {
					cont=rs.getInt("count_temporaneo");
					daRestituire.add(cont);
					
				}
				conn.close();
			}
		}
		
		catch (SQLException e) {
			e.printStackTrace();
		}
		return daRestituire;
	}
	
	
	
	@Override
	public ArrayList<Integer> countAspetto() {
		ArrayList<Integer> daRestituire=new ArrayList<Integer>();
		ArrayList<String> daCercare=new ArrayList<String>();
		String s1="Dark Mode";
		String s2="White Mode";
		String s3="Indifferente";
		daCercare.add(s1);
		daCercare.add(s2);
		daCercare.add(s3);
		
		int cont=0;
		try {
			for(int i=0;i<daCercare.size();i++) {
				cont=0;
				Connection conn=dataSource.getConnection();
				String query="select count(*) AS count_temporaneo from feedback where aspetto=?";
				PreparedStatement st=conn.prepareStatement(query);
				st.setString(1, daCercare.get(i));
				ResultSet rs=st.executeQuery();
				if(rs.next()) {
					cont=rs.getInt("count_temporaneo");
					daRestituire.add(cont);
					
				}
				conn.close();
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return daRestituire;
	}
	
	
	@Override
	public ArrayList<Integer> countDifficolta() {
		ArrayList<Integer> daRestituire=new ArrayList<Integer>();
		ArrayList<String> daCercare=new ArrayList<String>();
		String s1="Si";
		String s2="No";
		String s3="Indifferente";
		daCercare.add(s1);
		daCercare.add(s2);
		daCercare.add(s3);
		
		int cont=0;
		try {
			for(int i=0;i<daCercare.size();i++) {
				cont=0;
				Connection conn=dataSource.getConnection();
				String query="select count(*) AS count_temporaneo from feedback where difficolta=?";
				PreparedStatement st=conn.prepareStatement(query);
				st.setString(1, daCercare.get(i));
				ResultSet rs=st.executeQuery();
				if(rs.next()) {
					cont=rs.getInt("count_temporaneo");
					daRestituire.add(cont);
					
				}
				conn.close();
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return daRestituire;
	}
	
	@Override
	public ArrayList<Integer> countAccount() {
		ArrayList<Integer> daRestituire=new ArrayList<Integer>();
		ArrayList<String> daCercare=new ArrayList<String>();
		String s1="Si";
		String s2="No";
		String s3="Penso di crearlo a breve";
		daCercare.add(s1);
		daCercare.add(s2);
		daCercare.add(s3);
		
		int cont=0;
		try {
			for(int i=0;i<daCercare.size();i++) {
				cont=0;
				Connection conn=dataSource.getConnection();
				String query="select count(*) AS count_temporaneo from feedback where account=?";
				PreparedStatement st=conn.prepareStatement(query);
				st.setString(1, daCercare.get(i));
				ResultSet rs=st.executeQuery();
				if(rs.next()) {
					cont=rs.getInt("count_temporaneo");
					daRestituire.add(cont);
					
				}
				conn.close();
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return daRestituire;
	}
	
	
	@Override
	public ArrayList<Integer> countStelle() {
		ArrayList<Integer> daRestituire=new ArrayList<Integer>();
	
		int cont=0;
		try {
			for(int i=1;i<=5;i++) {
				cont=0;
				Connection conn=dataSource.getConnection();
				String query="select count(*) AS count_temporaneo from feedback where nstelle=?";
				PreparedStatement st=conn.prepareStatement(query);
				st.setInt(1,i);
				ResultSet rs=st.executeQuery();
				if(rs.next()) {
					cont=rs.getInt("count_temporaneo");
					daRestituire.add(cont);
					
				}
				conn.close();
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return daRestituire;
	}
	
	
	@Override
	public ArrayList<String> ottienicommenti() {
		ArrayList<String> tuttiCommenti=new ArrayList<String>();
		try {
			Connection conn=dataSource.getConnection();
			String query="select commento from feedback";
			PreparedStatement st=conn.prepareStatement(query);
			ResultSet rs=st.executeQuery();
			while(rs.next()) {
				tuttiCommenti.add(rs.getString("commento"));
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return tuttiCommenti;
	}
	
}
