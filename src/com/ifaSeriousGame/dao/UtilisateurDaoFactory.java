package com.ifaSeriousGame.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ifaSeriousGame.beans.Utilisateur;
import com.ifaSeriousGame.services.HashClass;

public class UtilisateurDaoFactory implements UtilisateurDao{
	private DaoFactory daoFactory;

    public UtilisateurDaoFactory(DaoFactory daoFactory) {
        this.daoFactory = daoFactory;
       
    }
    
    
	public  Utilisateur isValidLogin( String login, String password ) {
		 Connection connexion = null;
	     PreparedStatement statement = null;
	     password=HashClass.sha1(password);
	     System.out.println(login+" "+password);
		try{
			connexion = daoFactory.getConnection();
			String strSql = "SELECT * FROM utilisateur WHERE email=? AND password=?";
			statement  = connexion.prepareStatement( strSql );
				statement.setString( 1, login );
				statement.setString( 2, password );
				
				
					ResultSet rs= statement.executeQuery();
					//si il n'y a pas de login ni de password correspondant dans la base, rs.next() sera false car vide donc on entre dans le else		
					if ( rs.next() ) {
						//on encapsule cet utilisateur dans java pour pouvoir utiliser les données
						return new Utilisateur(
								rs.getInt( "id_Utilisateur" ),
								rs.getString( "nom" ),
								rs.getString( "prenom" ),
								rs.getString( "Email" ),
								rs.getString( "password" ),
								rs.getString( "niveau" ),
								rs.getInt( "profil" )
						);
					} else {
						return null;
					}
				
			}
		 catch ( Exception exception ) {
			throw new RuntimeException( exception );
		}
	}

	@Override
	public void ajouterUtilisateur(Utilisateur utilisateur) {
		Connection connexion = null;
		PreparedStatement statement = null;

		try {
			connexion = daoFactory.getConnection();
			String strSql = "INSERT INTO `serious_game`.`utilisateur` (`Nom`, `Prenom`, `Email`, `Password`, `Niveau`, `Profil`) VALUES (?,?,?,?,?,?);";
			statement = connexion.prepareStatement(strSql);

			statement.setString(1, utilisateur.getNom());
			statement.setString(2, utilisateur.getPrenom());
			statement.setString(3, utilisateur.getEmail());
			statement.setString(4, utilisateur.getPassword());
			statement.setString(5, utilisateur.getNiveau());
			statement.setInt(6, utilisateur.getProfil());

			statement.execute();

		} catch (Exception exception) {
			throw new RuntimeException(exception);
		}
	}


	@Override
	public int idDernierAjout() {
		Connection connexion = null;
		PreparedStatement statement = null;
		int i=0;
		try {
			connexion = daoFactory.getConnection();
			String strSql = "SELECT * FROM utilisateur ORDER BY Id_UTILISATEUR DESC LIMIT 1";
			statement = connexion.prepareStatement(strSql);
			ResultSet rs = statement.executeQuery();
			while (rs.next()) {
				i=rs.getInt("id_Utilisateur");
			}

		} catch (Exception exception) {
			throw new RuntimeException(exception);
		}
		return i;
	}


	@Override
	public boolean joueurDejaInscrit(String email) {
		Connection connexion = null;
		PreparedStatement statement = null;
		try {
			connexion = daoFactory.getConnection();
			String strSql = "SELECT Email FROM utilisateur";
			statement = connexion.prepareStatement(strSql);
			ResultSet rs = statement.executeQuery();
			while (rs.next()) {
				if(email.equals(rs.getString("Email"))){
					System.out.println("deja inscrit");
					return true;
				}
			}

		} catch (Exception exception) {
			throw new RuntimeException(exception);
		}
		System.out.println("pas encore inscrit");
		return false;
	}


	@Override
	public Utilisateur lecture(int idUtilisateur) {
		Connection connexion = null;
		PreparedStatement statement = null;

		try {
			connexion = daoFactory.getConnection();
			String strSql = "SELECT * FROM utilisateur where Id_UTILISATEUR=?";
			statement = connexion.prepareStatement(strSql);

			statement.setInt(1, idUtilisateur);
			
			ResultSet rs = statement.executeQuery();
			if (rs.next()) {
				return new Utilisateur(
						rs.getInt( "id_Utilisateur" ),
						rs.getString( "nom" ),
						rs.getString( "prenom" ),
						rs.getString( "Email" ),
						rs.getString( "password" ),
						rs.getString( "niveau" ),
						rs.getInt( "profil" ));
			}
			return new Utilisateur(0,"Toto","Molo","toto@molo.fr","1234","nul",1);	

		} catch (Exception exception) {
			throw new RuntimeException(exception);
		}
	}


	@Override
	public void updateUtilisateur(Utilisateur joueur) {
		Connection connexion = null;
		PreparedStatement statement = null;
		try {
			connexion = daoFactory.getConnection();
			
			String strSql = "UPDATE utilisateur SET nom=? , prenom=? , email=?, password=? WHERE id_utilisateur=?";
			
			statement = connexion.prepareStatement(strSql);
			
			System.out.println("le nouveau nom est : "+joueur.getNom());
			statement.setString(1, joueur.getNom());
			statement.setString(2, joueur.getPrenom());
			statement.setString(3, joueur.getEmail());
			statement.setString(4, joueur.getPassword());
			statement.setLong(5, joueur.getIdUtilisateur());
			
			statement.executeUpdate();
			System.out.println("done");
		} catch (Exception exception) {
			throw new RuntimeException(exception);
		}
		
	}

}
