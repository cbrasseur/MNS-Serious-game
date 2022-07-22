package com.ifaSeriousGame.dao;
import com.ifaSeriousGame.beans.Scenario;
import com.ifaSeriousGame.beans.Utilisateur;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

public class ScenarioDaoImpl implements ScenarioDao{
	
	private DaoFactory daoFactory;
	private Statement statement;
	
	public ScenarioDaoImpl(DaoFactory daoFactory) {

		this.daoFactory = daoFactory;
	}

	@Override
	public List<Scenario> lister(int idUtilisateur) {
		Connection connexion = null;
		PreparedStatement statement = null;
		// on crée la liste de scenario qu'on va renvoyer
		List<Scenario> scenarios = new ArrayList<>();
				
		try {
			connexion = daoFactory.getConnection();
			// on fait une requete select * from nomdelatable pour sélectionner l'ensemble
			// des éléments de la table
			String strSql = "SELECT * FROM serious_game.scenario inner join inscrire on scenario.Id_SCENARIO=inscrire.Id_SCENARIO inner join utilisateur on inscrire.Id_UTILISATEUR=utilisateur.Id_UTILISATEUR where utilisateur.Id_UTILISATEUR=?;";
			statement = connexion.prepareStatement(strSql);
			
			statement.setInt(1, idUtilisateur);
			
			// on récupère le résultat de la requete dans la variable rs et on fait un
			// executeQuery(car on touche pas à la table, juste un select!!)
			ResultSet rs = statement.executeQuery();
			
			
			
			// on va parcourir tant qu'il y a des lignes dans la table le résultat de la
			// requete ligne par ligne
			while (rs.next()) {
				
				// on récupere les données de chaque ligne de la bdd et on les sauvegarde
				// dans un objet scenario
				Scenario scenario = new Scenario(rs.getInt("id_SCENARIO"), rs.getString("nom"), rs.getDate("date_crea"),rs.getDate("date_modif"),rs.getInt("id_UTILISATEUR"),rs.getString("description"),rs.getString("illustration"));
				// chaque scenario récupéré est ajouté à la liste scenarios
				scenarios.add(scenario);
			}

		} catch (Exception exception) {
			throw new RuntimeException(exception);
		}
		
		// on n'oublie pas de renvoyer la liste de scenarios
		return scenarios;

	}
	
	@Override
	public List<Utilisateur> listerParicipants(int idScenario) {
		Connection connexion = null;
		PreparedStatement statement = null;
		
		List<Utilisateur> participants = new ArrayList<>();
				
		try {
			connexion = daoFactory.getConnection();
			
			String strSql = "SELECT * FROM utilisateur\r\n"
					+ "INNER JOIN inscrire\r\n"
					+ "ON utilisateur.Id_UTILISATEUR = inscrire.Id_UTILISATEUR\r\n"
					+ "AND Id_SCENARIO=? ORDER BY nom";
			statement = connexion.prepareStatement(strSql);
			
			statement.setInt(1, idScenario);
			
			ResultSet rs = statement.executeQuery();

			while (rs.next()) {
				
				Utilisateur participant = new Utilisateur(rs.getInt("Id_UTILISATEUR"), rs.getString("Nom"), rs.getString("Prenom"),rs.getString("Email"), rs.getString("Password"), rs.getString("Niveau"), rs.getInt("Profil"));
				participants.add(participant);
			}

		} catch (Exception exception) {
			throw new RuntimeException(exception);
		}
		
		return participants;

	}

	@Override
	public String titreScenarioParId(int idScenario) {
		Connection connexion = null;
		PreparedStatement statement = null;
		
		String titre=null;
				
		try {
			connexion = daoFactory.getConnection();
			
			String strSql = "SELECT nom FROM scenario where id_scenario=?" ;
			statement = connexion.prepareStatement(strSql);
			
			statement.setInt(1, idScenario);
			
			ResultSet rs = statement.executeQuery();

			while (rs.next()) {
				
				titre= rs.getString("nom");
			}

		} catch (Exception exception) {
			throw new RuntimeException(exception);
		}
		
		return titre;

	}

	@Override
	public List<Scenario> listerParUtilisateur(int idUtilisateur) {
		Connection connexion = null;
		PreparedStatement statement = null;
		
		List<Scenario> jeuxDuJoueur = new ArrayList<>();
			
		try {
			connexion = daoFactory.getConnection();
			
			String strSql = "SELECT * FROM serious_game.inscrire\r\n"
					+ "inner join scenario on scenario.Id_SCENARIO =inscrire.Id_SCENARIO\r\n"
					+ "where inscrire.Id_UTILISATEUR=?";
			
			statement = connexion.prepareStatement(strSql);
			
			statement.setInt(1, idUtilisateur);
			
			ResultSet rs = statement.executeQuery();

			while (rs.next()) {
				
				Scenario scenario= new Scenario(rs.getInt("Id_SCENARIO"),rs.getString("nom"),rs.getString("description"));
				jeuxDuJoueur.add(scenario);
				
			}

		} catch (Exception exception) {
			throw new RuntimeException(exception);
		}
		
		return jeuxDuJoueur;
	}

	@Override
	public void ajouter(Scenario scenario) {
		Connection connexion = null;
		PreparedStatement statement = null;
		
		try {
			connexion = daoFactory.getConnection();
			
			String strSql = "INSERT INTO serious_game.scenario (nom,date_crea,date_modif, Id_UTILISATEUR, description, illustration,nbQuestions) VALUES (?,now(),now(),?,?,?,?)";
			
			statement = connexion.prepareStatement(strSql);
			
			statement.setString(1, scenario.getNom());
			statement.setInt(2, scenario.getIdUtilisateur());
			statement.setString(3, scenario.getDescription());
			statement.setString(4, scenario.getIllustration());
			statement.setInt(5, scenario.getNbQuestions());
			
			
			int enregistrements = statement.executeUpdate();

		} catch (Exception exception) {
			throw new RuntimeException(exception);
		}
			
	}

	@Override
	public int dernierAjout() {
		Connection connexion = null;
		
		int id=0;
			
		try {
			connexion = daoFactory.getConnection();
			Statement statement = connexion.createStatement();
			ResultSet rs = statement.executeQuery("SELECT Id_SCENARIO FROM serious_game.scenario order by Id_SCENARIO desc limit 1");

			if (rs.next()) {
				
				id=rs.getInt("Id_SCENARIO");
				
			}

		} catch (Exception exception) {
			throw new RuntimeException(exception);
		}
		
		return id;
	}

	@Override
	public void supprimer(int idScenario) {
		Connection connexion = null;
		PreparedStatement statement = null;
				
		try {
			connexion = daoFactory.getConnection();
			String strSql = "DELETE FROM `serious_game`.`scenario` WHERE (`Id_SCENARIO` = ?)";
			
			statement = connexion.prepareStatement(strSql);
			
			statement.setInt(1, idScenario);
			int rs = statement.executeUpdate();
			
		} catch (Exception exception) {
			throw new RuntimeException(exception);
		}
		
	}
}
