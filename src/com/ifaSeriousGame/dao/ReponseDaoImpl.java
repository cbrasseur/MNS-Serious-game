package com.ifaSeriousGame.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ifaSeriousGame.beans.Question;
import com.ifaSeriousGame.beans.Reponse;

public class ReponseDaoImpl implements ReponseDao{
	
	private DaoFactory daoFactory;
	
	public ReponseDaoImpl(DaoFactory daoFactory) {
		super();
		this.daoFactory = daoFactory;
	}




	@Override
	public List<Reponse> lister(int idScenario) {
		Connection connexion = null;
		PreparedStatement statement = null;
		// on crée la liste de questions qu'on va renvoyer
		List<Reponse> reponses = new ArrayList<>();
				
		try {
			connexion = daoFactory.getConnection();
			// on fait une requete select * from nomdelatable pour sélectionner l'ensemble
			// des éléments de la table
			String strSql = "SELECT * FROM reponse inner join question on reponse.Id_Questions=question.Id_Questions where Id_SCENARIO=?";
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
				Reponse reponse = new Reponse(rs.getInt("id_REPONSE"),rs.getString("reponse"), rs.getInt("valeur"),rs.getInt("id_Questions"));
				// chaque scenario récupéré est ajouté à la liste scenarios
				reponses.add(reponse);
			}

		} catch (Exception exception) {
			throw new RuntimeException(exception);
		}
		
		// on n'oublie pas de renvoyer la liste de scenarios
		return reponses;

	}




	@Override
	public List<Integer> listePointsJeu(int idScenario) {
		Connection connexion = null;
		PreparedStatement statement = null;
		
		List<Integer> listePointsJeu= new ArrayList<>();
				
		try {
			connexion = daoFactory.getConnection();
			String strSql = "SELECT valeur FROM reponse inner join question on reponse.Id_Questions=question.Id_Questions where Id_SCENARIO=?";
			statement = connexion.prepareStatement(strSql);
			
			statement.setInt(1, idScenario);
			
			ResultSet rs = statement.executeQuery();

			while (rs.next()) {
				
				Integer points = rs.getInt("valeur");
				
				listePointsJeu.add(points);
			}

		} catch (Exception exception) {
			throw new RuntimeException(exception);
		}
		
		return listePointsJeu;

	}




	@Override
	public void ajouterReponse(String reponse, int valeur, int id_Questions) {
		Connection connexion = null;
		PreparedStatement statement = null;

		try {
			connexion = daoFactory.getConnection();
			
			String strSql = "INSERT INTO reponse (reponse,valeur,id_Questions) values (?,?,?)";
			statement = connexion.prepareStatement(strSql);

			statement.setString(1, reponse);
			statement.setInt(2, valeur);
			statement.setInt(3, id_Questions);

			statement.executeUpdate();

		} catch (Exception exception) {
			throw new RuntimeException(exception);
		}
		
	}




	@Override
	public void supprimerReponsesParScenario(List<Integer> listQuestions) {
		Connection connexion = null;
		PreparedStatement statement = null;
				
		try {
			connexion = daoFactory.getConnection();
			String strSql = "DELETE FROM `serious_game`.`reponse` WHERE (`Id_Questions` = ?)";
			
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
