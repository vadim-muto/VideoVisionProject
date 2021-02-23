package progetto.application.dao;

import java.util.ArrayList;

import progetto.application.model.Feedback;

public interface FeedbackDao {
	public void insert(Feedback feedback);
	public ArrayList<Integer> countGrafica();
	public ArrayList<Integer> countAspetto();
	public ArrayList<Integer> countDifficolta();
	public ArrayList<Integer> countAccount();
	public ArrayList<Integer> countStelle();
	public ArrayList<String> ottienicommenti();
}
