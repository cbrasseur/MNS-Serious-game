package com.ifaSeriousGame.dao;

import java.util.List;

import com.ifaSeriousGame.beans.Scenario;
import com.ifaSeriousGame.beans.Utilisateur;


public interface ScenarioDao {
	List<Scenario> lister(int idUtilisateur);
	public List<Utilisateur> listerParicipants(int idScenario);
	public String titreScenarioParId(int idScenario);
	public List<Scenario> listerParUtilisateur(int idUtilisateur);
	public void ajouter(Scenario scenario);
	public int dernierAjout();
	public void supprimer(int idScenario);

}
