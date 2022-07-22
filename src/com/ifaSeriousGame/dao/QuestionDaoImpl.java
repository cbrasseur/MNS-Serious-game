package com.ifaSeriousGame.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.ifaSeriousGame.beans.Question;
import com.ifaSeriousGame.beans.Scenario;

public class QuestionDaoImpl implements QuestionDao {
	
	private DaoFactory daoFactory;
	
	public QuestionDaoImpl(DaoFactory daoFactory) {
		super();
		this.daoFactory = daoFactory;
	}

	@Override
	public List<Question> lister(int idScenario) {
		Connection connexion = null;
		PreparedStatement statement = null;
		// on crée la liste de questions qu'on va renvoyer
		List<Question> questions = new ArrayList<>();
				
		try {
			connexion = daoFactory.getConnection();
			// on fait une requete select * from nomdelatable pour sélectionner l'ensemble
			// des éléments de la table
			String strSql = "SELECT * FROM question where id_scenario=?";
			statement = connexion.prepareStatement(strSql);
			
			statement.setInt(1, idScenario);
			
			// on récupère le résultat de la requete dans la variable rs et on fait un
			// executeQuery(car on touche pas à la table, juste un select!!)
			ResultSet rs = statement.executeQuery();

			// on va parcourir tant qu'il y a des lignes dans la table le résultat de la
			// requete ligne par ligne
			while (rs.next()) {
				
				// on récupere les données de chaque ligne de la bdd et on les sauvegarde
				// dans un objet scenario
				Question question = new Question(rs.getInt("id_Questions"), rs.getString("Question"), rs.getInt("difficulté"),rs.getString("image"),rs.getInt("Id_SCENARIO"));
				// chaque scenario récupéré est ajouté à la liste scenarios
				questions.add(question);
			}

		} catch (Exception exception) {
			throw new RuntimeException(exception);
		}
		
		// on n'oublie pas de renvoyer la liste de scenarios
		return questions; 
	}
	
	@Override
	public List<Question> listerParDifficulte(int idScenario, int difficulte) {
		Connection connexion = null;
		PreparedStatement statement = null;
		List<Question> questions = new ArrayList<>();
				
		try {
			connexion = daoFactory.getConnection();
			String strSql = "SELECT * FROM question where id_scenario=? and Difficulté=?";
			statement = connexion.prepareStatement(strSql);
			
			statement.setInt(1, idScenario);
			statement.setInt(2, difficulte);
			
			ResultSet rs = statement.executeQuery();

			while (rs.next()) {
				
				Question question = new Question(rs.getInt("id_Questions"), rs.getString("Question"), rs.getInt("difficulté"),rs.getString("image"),rs.getInt("Id_SCENARIO"));
				questions.add(question);
			}

		} catch (Exception exception) {
			throw new RuntimeException(exception);
		}
		return questions; 
	}

	@Override
	public List<Question> listerDejaJouees(int idUtilisateur) {
		Connection connexion = null;
		PreparedStatement statement = null;
		
		List<Question> questions = new ArrayList<>();
				
		try {
			connexion = daoFactory.getConnection();
			
			String strSql = "SELECT * FROM question inner join repond on question.Id_Questions=repond.Id_Questions where repond.Id_UTILISATEUR=?";
			statement = connexion.prepareStatement(strSql);
			
			statement.setInt(1, idUtilisateur);
			
			ResultSet rs = statement.executeQuery();

			
			while (rs.next()) {
		
				Question question = new Question(rs.getInt("id_Questions"), rs.getString("Question"), rs.getInt("difficulté"),rs.getString("image"),rs.getInt("Id_SCENARIO"));
			
				questions.add(question);
			}

		} catch (Exception exception) {
			throw new RuntimeException(exception);
		}
		return questions;
	}

	@Override
	public void ajouterQuestion(String question, String image, int difficulte, int idScenario) {
		Connection connexion = null;
		PreparedStatement statement = null;

		try {
			connexion = daoFactory.getConnection();
			
			String strSql = "INSERT INTO question(question,difficulté,image,id_SCENARIO) values (?,?,?,?)";
			statement = connexion.prepareStatement(strSql);

			statement.setString(1, question);
			statement.setInt(2, difficulte);
			statement.setString(3, image);
			statement.setInt(4, idScenario);

			statement.executeUpdate();

		} catch (Exception exception) {
			throw new RuntimeException(exception);
		}
		
	}

	@Override
	public int dernierIdEnregistre() {
		Connection connexion = null;
		Statement statement = null;
		
		int idQuestion=0;
				
		try {
			connexion = daoFactory.getConnection();
			
			statement = connexion.createStatement();
			
			ResultSet rs = statement.executeQuery("SELECT Id_Questions FROM serious_game.question order by Id_Questions desc limit 1");

			
			if (rs.next()) {
		
				idQuestion= rs.getInt("id_Questions");
			}

		} catch (Exception exception) {
			throw new RuntimeException(exception);
		}
		return idQuestion;
	}

	@Override
	public List<Integer> listeIdParScenario(int idScenario) {
		Connection connexion = null;
		PreparedStatement statement = null;
		
		List<Integer> listId= new ArrayList<Integer>();
		
		try {
			connexion = daoFactory.getConnection();
			String strSql = "SELECT id_Questions FROM serious_game.question where id_SCENARIO=?";
			statement = connexion.prepareStatement(strSql);
			
			statement.setInt(1, idScenario);
			
			ResultSet rs = statement.executeQuery();

			
			while (rs.next()) {
				listId.add(rs.getInt("id_Questions"));
			}
		} catch (Exception exception) {
			throw new RuntimeException(exception);
		}
		return listId;
	}

	@Override
	public void supprimerQuestionsParScenario(List<Integer> listQuestions) {
		Connection connexion = null;
		PreparedStatement statement = null;
				
		try {
			connexion = daoFactory.getConnection();
			String strSql = "DELETE FROM `serious_game`.`question` WHERE (`Id_Questions` = ?)";
			
			statement = connexion.prepareStatement(strSql);
			
			for (Integer integer : listQuestions) {
				statement.setInt(1, integer);
				int rs = statement.executeUpdate();
			}
			
		} catch (Exception exception) {
			throw new RuntimeException(exception);
		}
		
	}

	@Override
	public int nbQuestionsPrevues(int idScenario) {
		Connection connexion = null;
		PreparedStatement statement = null;
		
		int nbQuestionsPrevues=0;
				
		try {
			connexion = daoFactory.getConnection();
			
			String strSql = "SELECT nbQuestions FROM scenario where Id_Scenario=?";
			statement = connexion.prepareStatement(strSql);
			
			statement.setInt(1, idScenario);
			
			ResultSet rs = statement.executeQuery();

			
			if (rs.next()) {
				nbQuestionsPrevues=rs.getInt("nbQuestions");
			}

		} catch (Exception exception) {
			throw new RuntimeException(exception);
		}
		return nbQuestionsPrevues;
	}

	
	
}
