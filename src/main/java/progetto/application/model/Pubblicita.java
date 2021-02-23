package progetto.application.model;

public class Pubblicita {
	
	private String link;
	private Integer visualizzazioni;
	private String image;
	private String linkEsterno;
	
	public Pubblicita(String link, Integer visualizzazioni, String image, String linkEsterno) {
		this.link = link;
		this.visualizzazioni = visualizzazioni;
		this.image = image;
		this.linkEsterno = linkEsterno;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public Integer getVisualizzazioni() {
		return visualizzazioni;
	}

	public void setVisualizzazioni(Integer visualizzazioni) {
		this.visualizzazioni += visualizzazioni;
	}
	
	public void setImage(String image) {
		this.image = image;
	}

	public String getImage() {
		return image;
	}
	
	public void setLinkEsterno(String linkEsterno) {
		this.linkEsterno = linkEsterno;
	}
	
	public String getLinkEsterno() {
		return linkEsterno;
	}
}
