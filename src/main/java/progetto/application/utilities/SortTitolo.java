package progetto.application.utilities;

import java.util.Comparator;

public class SortTitolo implements Comparator<VideoSimilarity>{
	@Override
	public int compare(VideoSimilarity o1, VideoSimilarity o2) {
		return o1.getValue().compareTo(o2.getValue()) * -1;
	}	
}
