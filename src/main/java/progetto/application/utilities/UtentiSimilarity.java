package progetto.application.utilities;

public class UtentiSimilarity {
	
	private String username;
	private String fotoProfilo;
	private Integer numIscritti;
	private Integer videoTotali;
	private Integer value;
	private boolean isIscritto;
	
	public UtentiSimilarity(String username, String fotoProfilo, Integer numIscritti, Integer videoTotali, Integer value, boolean isIscritto){
		this.username = username;
		this.fotoProfilo = fotoProfilo;
		this.numIscritti = numIscritti;
		this.videoTotali = videoTotali;
		this.value = value;
		this.isIscritto = isIscritto;
	}
	
	public String getUsername() {
		return username;
	}
	
	public String getFotoProfilo() {
		return fotoProfilo;
	}
	
	public Integer getNumIscritti() {
		return numIscritti;
	}
	
	public Integer getVideoTotali() {
		return videoTotali;
	}
	
	public Integer getValue() {
		return value;
	}
	
	public boolean getIscritto(){
		return isIscritto;
	}

	public void setIscritto(boolean isIscritto) {
		this.isIscritto = isIscritto;
	}
	
}
