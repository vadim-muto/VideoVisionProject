package progetto.application.persistence;

import progetto.application.dao.FeedbackDao;
import progetto.application.dao.IscrizioniDAO;
import progetto.application.dao.PlaylistDAO;
import progetto.application.dao.PubblicitaDAO;
import progetto.application.dao.RecensioniDAO;
import progetto.application.dao.UtenteDAO;
import progetto.application.dao.VideoDAO;
import progetto.application.dao.jdbc.FeedbackDAOJDBC;
import progetto.application.dao.jdbc.IscrizioniDAOJDBC;
import progetto.application.dao.jdbc.PlaylistDAOJBDC;
import progetto.application.dao.jdbc.PubblicitaDAOJDBC;
import progetto.application.dao.jdbc.RecensioniDAOJDBC;
import progetto.application.dao.jdbc.UtenteDAOJDBC;
import progetto.application.dao.jdbc.VideoDAOJDBC;

public class DBManager {
	
	private static DBManager instance = null;
	private static DBSource dataSource;
	
	private DBManager() {}
	
	static {
		try {
			Class.forName("org.postgresql.Driver");
			dataSource=new DBSource("jdbc:postgresql://localhost:5432/VideoVisionDB","postgres","postgres");
			System.out.println("Connessione riuscita");
		} 
		catch (Exception e) {
			System.err.println("PostgresDAOFactory.class: failed to load MySQL JDBC driver\n"+e);
			e.printStackTrace();
		}
	}
	
	public static DBManager getInstance() {
		if (instance == null) {
			instance = new DBManager();
		}
		return instance;
	}
		
	public UtenteDAO getUtenteDao(){
		return new UtenteDAOJDBC(dataSource);
	}
	
	public VideoDAO getVideoDao() {
		return new VideoDAOJDBC(dataSource);
	}
	
	public PubblicitaDAO getPubblicitaDao() {
		return new PubblicitaDAOJDBC(dataSource);
	}
	
	public RecensioniDAO getRecensioneDao() {
		return new RecensioniDAOJDBC(dataSource);
	}
	
	public PlaylistDAO getPlaylistDao() {
		return new PlaylistDAOJBDC(dataSource);
	}
	
	public IscrizioniDAO getIscrizioneDao() {
		return new IscrizioniDAOJDBC(dataSource);
	}
	
	public FeedbackDao getFeedbackDao() {
		return new FeedbackDAOJDBC(dataSource);
	}
}
