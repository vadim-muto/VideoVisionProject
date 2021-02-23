package progetto.application.utilities;

import java.util.Comparator;

public class SortCanali implements Comparator<UtentiSimilarity>{

	@Override
	public int compare(UtentiSimilarity o1, UtentiSimilarity o2) {
		return o1.getValue().compareTo(o2.getValue()) * -1;
	}
}
