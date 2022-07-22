package com.ifaSeriousGame.dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.Duration;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import com.ifaSeriousGame.beans.Repond;
import com.ifaSeriousGame.beans.Scenario;
import com.ifaSeriousGame.services.ExceptionPerso;

public class RepondDaoImpl implements RepondDao{
	
	private DaoFactory daoFactory;
	
	public RepondDaoImpl(DaoFactory daoFactory) {
		super();
		this.daoFactory = daoFactory;
	}
	

	@Override
	public List<Repond> lister(int id_UTILISATEUR) {
		Connection connexion = null;
		PreparedStatement statement = null;
		
		List<Repond> dejaRepondues = new ArrayList<>();
				
		try {
			connexion = daoFactory.getConnection();
			String strSql = "SELECT * FROM repond where id_UTILISATEUR=?";
			statement = connexion.prepareStatement(strSql);
			
			statement.setInt(1, id_UTILISATEUR);
			
			ResultSet rs = statement.executeQuery();

			while (rs.next()) {
				
				Repond repond = new Repond(rs.getInt("Id_UTILISATEUR"), rs.getInt("Id_Questions"), rs.getInt("Id_REPONSE"));
				
				dejaRepondues.add(repond);
			}

		} catch (Exception exception) {
			throw new RuntimeException(exception);
		}
		
		return dejaRepondues;

	}


	

	@Override
	public void enregistrerReponse(int idUtilisateur, int idQuestion, int idReponse)throws ExceptionPerso {
		Connection connexion = null;
		PreparedStatement statement = null;
		try {
			connexion = daoFactory.getConnection();
			String strSql = "INSERT INTO repond (id_UTILISATEUR,Id_Questions,id_REPONSE) VALUES(?,?,?)";
			statement = connexion.prepareStatement(strSql);
			
			statement.setInt(1, idUtilisateur);
			statement.setInt(2, idQuestion);
			statement.setInt(3, idReponse);
			
			int enregistrements = statement.executeUpdate();
			System.out.println(enregistrements);
			
		} catch (Exception exception) {
			throw new RuntimeException("On ne triche pas !");
			
		}
	}
	
		@Override
		public void enregistrerHeureReponse(int idUtilisateur, int idQuestion, int idReponse)  {
			Connection connexion = null;
			PreparedStatement statement = null;
			try {
				connexion = daoFactory.getConnection();
				String strSql = "UPDATE repond SET dateTime= now() WHERE id_UTILISATEUR=? AND Id_Questions=?  AND id_REPONSE=?";
				statement = connexion.prepareStatement(strSql);
				
				statement.setInt(1, idUtilisateur);
				statement.setInt(2, idQuestion);
				statement.setInt(3, idReponse);
				
				int enregistrements = statement.executeUpdate();
				System.out.println(enregistrements);
				
			} catch (Exception exception) {
				throw new RuntimeException(exception);
			}
	}

	@Override
	public List<Integer> listePointsJoueurParScenario(int idUtilisateur, int idScenario) {
		Connection connexion = null;
		PreparedStatement statement = null;
		
		List<Integer> listePointsJoueur = new ArrayList<>();
				
		try {
			connexion = daoFactory.getConnection();
			String strSql = "SELECT * FROM serious_game.repond\r\n"
					+ "inner join reponse on repond.Id_REPONSE=reponse.Id_REPONSE\r\n"
					+ "inner join question on question.Id_Questions=reponse.Id_Questions\r\n"
					+ "where Id_UTILISATEUR=? and Id_SCENARIO=?";
			statement = connexion.prepareStatement(strSql);
			
			statement.setInt(1, idUtilisateur);
			statement.setInt(2,idScenario);
			
			ResultSet rs = statement.executeQuery();

			while (rs.next()) {
				
				Integer points = rs.getInt("valeur");
				
				listePointsJoueur.add(points);
			}

		} catch (Exception exception) {
			throw new RuntimeException(exception);
		}
		
		return listePointsJoueur;

	}


	@Override
	public List<Scenario> listeJeuxJoues(int idUtilisateur) {
		Connection connexion = null;
		PreparedStatement statement = null;
		
		List<Scenario> listeJeuxJoues = new ArrayList<>();
				
		try {
			connexion = daoFactory.getConnection();
			String strSql = "SELECT distinct scenario.id_SCENARIO , nom , date_crea, date_modif, scenario.id_utilisateur,description,illustration FROM serious_game.repond inner join reponse on repond.Id_REPONSE=reponse.Id_REPONSE inner join question on question.Id_Questions=reponse.Id_Questions inner join scenario on question.Id_SCENARIO=scenario.Id_SCENARIO \r\n"
					+ " where repond.Id_UTILISATEUR=?";
			statement = connexion.prepareStatement(strSql);
			
			statement.setInt(1, idUtilisateur);
			
			ResultSet rs = statement.executeQuery();

			while (rs.next()) {
				
				Scenario jeuJoue = new Scenario(rs.getInt("Id_Scenario"),rs.getString("nom"),rs.getDate("date_crea"),rs.getDate("date_modif"),rs.getInt("id_Utilisateur"),rs.getString("description"),rs.getString("illustration"));
				
				listeJeuxJoues.add(jeuJoue);
			}

		} catch (Exception exception) {
			throw new RuntimeException(exception);
		}
		
		return listeJeuxJoues;
	}
	
	@Override
	public boolean toutJuste(int idUtilisateur, int idScenario) {
		
		Connection connexion = null;
		PreparedStatement statement = null;
		
		try {
			connexion = daoFactory.getConnection();
			
			String strSql0="SELECT * FROM serious_game.reponse\r\n"
					+ "inner join question on question.Id_Questions=reponse.Id_Questions\r\n"
					+ "where valeur=3 and Id_SCENARIO=?";
			statement = connexion.prepareStatement(strSql0);
			statement.setInt(1,idScenario);
			ResultSet rs0 = statement.executeQuery();
			int nbDe3=1;
			while (rs0.next()) {
				nbDe3++;
			}
			
			String strSql = "SELECT * FROM serious_game.repond\r\n"
					+ "inner join reponse on repond.Id_REPONSE=reponse.Id_REPONSE\r\n"
					+ "inner join question on question.Id_Questions=reponse.Id_Questions\r\n"
					+ "where Id_UTILISATEUR=? and Id_SCENARIO=?";
			statement = connexion.prepareStatement(strSql);
			
			statement.setInt(1, idUtilisateur);
			statement.setInt(2,idScenario);
			
			ResultSet rs = statement.executeQuery();
			Integer total=0; 
			while (rs.next()) {
				
				Integer valeur = rs.getInt("valeur");
				total+=valeur;
				if(valeur ==0) {
					return false;
				}
				
			}	
		} catch (Exception exception) {
			throw new RuntimeException(exception);
		}
		
		return true;
		}


	@Override
	public int totalPointsTousScenariosJoues(int idUtilisateur) {
		
		int totalPointsTousScenariosJoues=0;
		
		Connection connexion = null;
		PreparedStatement statement = null;
			
		try {
			connexion = daoFactory.getConnection();
			String strSql = "SELECT valeur FROM serious_game.repond\r\n"
					+ "inner join reponse on repond.Id_REPONSE=reponse.Id_REPONSE\r\n"
					+ "inner join question on question.Id_Questions=reponse.Id_Questions\r\n"
					+ "where Id_UTILISATEUR=?";
			statement = connexion.prepareStatement(strSql);
			
			statement.setInt(1, idUtilisateur);
			
			ResultSet rs = statement.executeQuery();

			while (rs.next()) {
				
				totalPointsTousScenariosJoues+=rs.getInt("valeur");
				
			}

		} catch (Exception exception) {
			throw new RuntimeException(exception);
		}
		
		return totalPointsTousScenariosJoues;

	}


	@Override
	public int totalPointsTousScenariosInscrit(int idUtilisateur) {
		
		int totalPointsTousScenariosInscrit=0;
		
		Connection connexion = null;
		PreparedStatement statement = null;
				
		try {
			connexion = daoFactory.getConnection();
			String strSql = "SELECT valeur FROM reponse \r\n"
					+ "inner join question on reponse.Id_Questions=question.Id_Questions\r\n"
					+ "inner join inscrire on inscrire.Id_SCENARIO=question.Id_SCENARIO\r\n"
					+ "where Id_UTILISATEUR=?";
			
			statement = connexion.prepareStatement(strSql);
			
			statement.setInt(1, idUtilisateur);
			
			ResultSet rs = statement.executeQuery();

			while (rs.next()) {
				
				totalPointsTousScenariosInscrit+=rs.getInt("valeur");
			}

		} catch (Exception exception) {
			throw new RuntimeException(exception);
		}
		
		return totalPointsTousScenariosInscrit;
		
	}


	@Override
	public boolean checkDejaJoue(int idUtilisateur,int idScenario) {
		Connection connexion = null;
		PreparedStatement statement = null;
				
		try {
			connexion = daoFactory.getConnection();
			String strSql = "SELECT repond.Id_REPONSE FROM serious_game.repond\r\n"
					+ "inner join reponse on repond.Id_REPONSE=reponse.Id_REPONSE\r\n"
					+ "inner join question on question.Id_Questions=reponse.Id_Questions\r\n"
					+ "where Id_UTILISATEUR=? and Id_SCENARIO=?";
			
			statement = connexion.prepareStatement(strSql);
			
			statement.setInt(1, idUtilisateur);
			statement.setInt(2, idScenario);
			
			ResultSet rs = statement.executeQuery();

			while (rs.next()) {
				
				Integer i=rs.getInt("id_REPONSE");
				if(i != null) {
					return true;
				}
				
			}
			

		} catch (Exception exception) {
			throw new RuntimeException(exception);
		}
		return false;	
	}


	@Override
	public int nbDeReponsesDonnees(int idUtilisateur, int idScenario) {
		Connection connexion = null;
		PreparedStatement statement = null;
				
		try {
			connexion = daoFactory.getConnection();
			String strSql = "SELECT * FROM repond\r\n"
					+ "inner join question on repond.Id_Questions=question.Id_Questions\r\n"
					+ "where repond.Id_UTILISATEUR=? and question.Id_SCENARIO=?;";
			
			statement = connexion.prepareStatement(strSql);
			
			statement.setInt(1, idUtilisateur);
			statement.setInt(2, idScenario);
			
			ResultSet rs = statement.executeQuery();
			
			int nbDeReponsesDonnees=0;

			while (rs.next()) {
				nbDeReponsesDonnees++;
				}
			return nbDeReponsesDonnees;	
		} catch (Exception exception) {
			throw new RuntimeException(exception);
		}
		
	}


	@Override
	public void effacerReponsesJoueur(int idUtilisateur) {
		Connection connexion = null;
		PreparedStatement statement = null;
				
		try {
			connexion = daoFactory.getConnection();
			String strSql = "Delete from repond\r\n"
					+ "where Id_UTILISATEUR=?;";
			
			statement = connexion.prepareStatement(strSql);
			
			statement.setInt(1, idUtilisateur);
						
			statement.executeUpdate();
						
		} catch (Exception exception) {
			throw new RuntimeException(exception);
		}
		
	}


	@Override
	public LocalDateTime debutJoueur(int idUtilisateur, int idScenario) {
		Connection connexion = null;
		PreparedStatement statement = null;
		LocalDateTime debut=null;		
		try {
			connexion = daoFactory.getConnection();
			String strSql = "SELECT dateTime FROM serious_game.repond \r\n"
					+ "inner join question on repond.Id_Questions=question.Id_Questions\r\n"
					+ "where Id_UTILISATEUR=? and Id_SCENARIO=?\r\n"
					+ "order by dateTime asc LIMIT 1";
			
			statement = connexion.prepareStatement(strSql);
			
			statement.setInt(1, idUtilisateur);
			statement.setInt(2, idScenario);
			
			ResultSet rs = statement.executeQuery();

			while (rs.next()) {
				debut=rs.getTimestamp("dateTime").toLocalDateTime();		
			}
			

		} catch (Exception exception) {
			throw new RuntimeException(exception);
		}
		return debut;	
	}
	@Override
	public LocalDateTime finJoueur(int idUtilisateur, int idScenario) {
		Connection connexion = null;
		PreparedStatement statement = null;
		LocalDateTime fin=null;		
		try {
			connexion = daoFactory.getConnection();
			String strSql = "SELECT dateTime FROM serious_game.repond \r\n"
					+ "inner join question on repond.Id_Questions=question.Id_Questions\r\n"
					+ "where Id_UTILISATEUR=? and Id_SCENARIO=?\r\n"
					+ "order by dateTime desc LIMIT 1";
			
			statement = connexion.prepareStatement(strSql);
			
			statement.setInt(1, idUtilisateur);
			statement.setInt(2, idScenario);
			
			ResultSet rs = statement.executeQuery();

			while (rs.next()) {
				fin=rs.getTimestamp("dateTime").toLocalDateTime();		
			}
			

		} catch (Exception exception) {
			throw new RuntimeException(exception);
		}
		return fin;	
	}


	@Override
	public Duration tempsJeu(int idUtilisateur, int idScenario) {
		Connection connexion = null;
		PreparedStatement statement = null;
		
		LocalDateTime max=null;
		LocalDateTime min=null;
		Duration duration;
		
		try {
			connexion = daoFactory.getConnection();
			String strSql = "SELECT max(dateTime) as max, min(dateTime) as min FROM serious_game.repond \r\n"
					+ "inner join question on repond.Id_Questions=question.Id_Questions\r\n"
					+ "where Id_UTILISATEUR=? and Id_SCENARIO=?\r\n"
					+ "order by dateTime;";
			
			statement = connexion.prepareStatement(strSql);
			
			statement.setInt(1, idUtilisateur);
			statement.setInt(2, idScenario);
			
			ResultSet rs = statement.executeQuery();

			while (rs.next()) {
				max = rs.getTimestamp("max").toLocalDateTime();
				min = rs.getTimestamp("min").toLocalDateTime();
				
			}
			duration = Duration.between(min, max);

		} catch (Exception exception) {
			throw new RuntimeException(exception);
		}
		return duration;	
	}


	@Override
	public void supprimerReponsesJoueurParScenario(List<Integer> listQuestions) {
		Connection connexion = null;
		PreparedStatement statement = null;
				
		try {
			connexion = daoFactory.getConnection();
			String strSql = "DELETE FROM `serious_game`.`repond` WHERE (`Id_Questions` = ?)";
			
			statement = connexion.prepareStatement(strSql);
			
			for (Integer integer : listQuestions) {
				statement.setInt(1, integer);
				int rs = statement.executeUpdate();
			}
			
		} catch (Exception exception) {
			throw new RuntimeException(exception);
		}
		
	}
}
