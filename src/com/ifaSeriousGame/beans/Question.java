package com.ifaSeriousGame.beans;

public class Question {
	private  int idQuestion;
	private String Question;
	private int Difficulte;
	private String image;
	private int idScenario;
	
	public Question() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Question(int idQuestion, String question, int difficulte, String image, int idScenario) {
		super();
		this.idQuestion = idQuestion;
		Question = question;
		Difficulte = difficulte;
		this.image = image;
		this.idScenario = idScenario;
	}

	public int getIdQuestion() {
		return idQuestion;
	}

	public void setIdQuestion(int idQuestion) {
		this.idQuestion = idQuestion;
	}

	public String getQuestion() {
		return Question;
	}

	public void setQuestion(String question) {
		Question = question;
	}

	public int getDifficulte() {
		return Difficulte;
	}

	public void setDifficulte(int difficulte) {
		Difficulte = difficulte;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public int getIdScenario() {
		return idScenario;
	}

	public void setIdScenario(int idScenario) {
		this.idScenario = idScenario;
	}
	
	@Override
	public String toString() {
		return "Question [idQuestion=" + idQuestion + ", Question=" + Question + ", Difficulte=" + Difficulte
				+ ", image=" + image + ", idScenario=" + idScenario + "]";
	}	
}
