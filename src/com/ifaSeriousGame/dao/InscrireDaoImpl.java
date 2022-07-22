package com.ifaSeriousGame.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class InscrireDaoImpl implements InscrireDao{
	private DaoFactory daoFactory;
			
	public InscrireDaoImpl(DaoFactory daoFactory) {
		
		this.daoFactory = daoFactory;
	}		
			
			
	@Override
	public void inscrireJoueur(int idJoueur, int idScenario) {
		Connection connexion = null;
		PreparedStatement statement = null;

		try {
			connexion = daoFactory.getConnection();
			String strSql = "INSERT INTO `serious_game`.`inscrire` (`id_UTILISATEUR`, `id_SCENARIO`) VALUES (?,?);";
			statement = connexion.prepareStatement(strSql);

			statement.setInt(1, idJoueur);
			statement.setInt(2, idScenario);

			statement.execute();

		} catch (Exception exception) {
			throw new RuntimeException(exception);
		}
		
	}


	@Override
	public void radierJoueur(int idJoueur, int idScenario) {
		Connection connexion = null;
		PreparedStatement statement = null;

		try {
			connexion = daoFactory.getConnection();
			String strSql = "DELETE FROM `serious_game`.`inscrire` WHERE (`Id_UTILISATEUR` = ?) and (`Id_SCENARIO` = ?)";
			statement = connexion.prepareStatement(strSql);

			statement.setInt(1, idJoueur);
			statement.setInt(2, idScenario);

			statement.execute();

		} catch (Exception exception) {
			throw new RuntimeException(exception);
		}
		
	}


	@Override
	public void supprimerInscriptionsJeu(int idScenario) {
		Connection connexion = null;
		PreparedStatement statement = null;

		try {
			connexion = daoFactory.getConnection();
			String strSql = "DELETE FROM `serious_game`.`inscrire` WHERE (`Id_SCENARIO` = ?)";
			statement = connexion.prepareStatement(strSql);

			statement.setInt(1, idScenario);

			statement.execute();

		} catch (Exception exception) {
			throw new RuntimeException(exception);
		}
		
		
	}

}
