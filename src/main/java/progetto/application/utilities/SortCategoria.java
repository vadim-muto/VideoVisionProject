package progetto.application.utilities;

import java.util.Comparator;

import org.joda.time.LocalDate;

public class SortCategoria implements Comparator<VideoSimilarity>{
	
	public static final int DATA_PUBBLICAZIONE = 0;
	public static final int IN_EVIDENZA = 1;
	private int scelta;
	
	public SortCategoria(int scelta) {
		this.scelta = scelta;
	}
	
	@Override
	public int compare(VideoSimilarity o1, VideoSimilarity o2) {
		if (scelta == SortCategoria.DATA_PUBBLICAZIONE)
			return orderByDataPubblicazione(o1, o2);
		else if (scelta == SortCategoria.IN_EVIDENZA)
			return orderByVisualizzazione(o1, o2);
		return 0;
	}
	
	private int orderByVisualizzazione(VideoSimilarity o1, VideoSimilarity o2) {
		return o1.getVisualizzazioni().compareTo(o2.getVisualizzazioni()) * -1;
	}

	private int orderByDataPubblicazione(VideoSimilarity o1, VideoSimilarity o2) {
		String dataLocale = LocalDate.now().toString();
		String dataOggi = "";
		String dataO1 = "";
		String dataO2 = "";
		
		for (int i=0; i<3; i++) {
			dataOggi += dataLocale.split("-")[i];
			dataO1 += o1.getData_pubblicazione().split("-")[i];
			dataO2 += o2.getData_pubblicazione().split("-")[i];
		}
		
		int data1 = Integer.parseInt(dataO1);
		int data2 = Integer.parseInt(dataO2);
		int dataL = Integer.parseInt(dataOggi);
		
		int differenzaRispettoO1 = dataL - data1;
		int differenzaRispettoO2 = dataL - data2;
		
		if (differenzaRispettoO1 < differenzaRispettoO2)
			return -1;
		else if (differenzaRispettoO1 > differenzaRispettoO2)
			return 1;
		
		return 0;
	}
}
