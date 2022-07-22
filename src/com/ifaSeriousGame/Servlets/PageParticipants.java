package com.ifaSeriousGame.Servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ifaSeriousGame.beans.Scenario;
import com.ifaSeriousGame.beans.Utilisateur;
import com.ifaSeriousGame.dao.DaoFactory;
import com.ifaSeriousGame.dao.InscrireDao;
import com.ifaSeriousGame.dao.InscrireDaoImpl;
import com.ifaSeriousGame.dao.ScenarioDao;
import com.ifaSeriousGame.dao.ScenarioDaoImpl;
import com.ifaSeriousGame.dao.UtilisateurDao;
import com.ifaSeriousGame.dao.UtilisateurDaoFactory;
import com.ifaSeriousGame.services.EnvoyerMail;
import com.ifaSeriousGame.services.HashClass;
import com.ifaSeriousGame.services.ScenarioJouable;


@WebServlet("/pageParticipants")
public class PageParticipants extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private DaoFactory daoFactory;
    private ScenarioDao scenarioDao;
    private UtilisateurDao utilisateurDao;
    private InscrireDao inscrireDao;
    public PageParticipants() {
        super();   
    }
    
    @Override
    public void init() throws ServletException {
    	daoFactory = DaoFactory.getInstance();    
    	scenarioDao = new ScenarioDaoImpl(daoFactory);
    	utilisateurDao= new UtilisateurDaoFactory(daoFactory);
    	inscrireDao=new InscrireDaoImpl(daoFactory);
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession(true);
		Utilisateur user = (Utilisateur) session.getAttribute("connectedUser");
		if(session.getAttribute("connectedUser")==null || user.getProfil()!=2){
			response.sendRedirect("/Serious_Game/login");
		} else {
			int idUtilisateur=user.getIdUtilisateur();
			
			List<Scenario> listScenarios = scenarioDao.lister(idUtilisateur);
			List<Scenario> listValide = new ArrayList<>();
			ScenarioJouable sj = new ScenarioJouable();
			for (Scenario scenario : listScenarios) {
				if(sj.scenarioIsValid(scenario.getIdScenario())){
					listValide.add(scenario);
				}
			}
			request.setAttribute("scenarios", listValide);		
			/*request.setAttribute("scenarios", scenarioDao.lister(idUtilisateur));*/
		this.getServletContext().getRequestDispatcher("/WEB-INF/pageParticipants.jsp").forward(request, response);
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession(true);
		Utilisateur user = (Utilisateur) session.getAttribute("connectedUser");
		if(session.getAttribute("connectedUser")==null || user.getProfil()!=2) {
			response.sendRedirect("/Serious_Game/login");
		} else {
			String s=(String) request.getAttribute("dejaJoue");
			request.setAttribute("dejaJoue", s);
//AFFICHAGE LISTE DES PARTICIPANTS	
			
			if(request.getParameter("action").equals("lister")) {
				Utilisateur utilisateur=(Utilisateur) session.getAttribute("connectedUser");
				int idUtilisateur=utilisateur.getIdUtilisateur();
				List<Scenario> listScenarios = scenarioDao.lister(idUtilisateur);
				List<Scenario> listValide = new ArrayList<>();
				ScenarioJouable sj = new ScenarioJouable();
				for (Scenario scenario : listScenarios) {
					if(sj.scenarioIsValid(scenario.getIdScenario())){
						listValide.add(scenario);
					}
				}
				request.setAttribute("scenarios", listValide);
				/*request.setAttribute("scenarios", scenarioDao.lister(idUtilisateur));*/
				String idScenarioTxt ="1";
				if(request.getParameter("jeu") != null) {idScenarioTxt = request.getParameter("jeu");}
				Integer idScenario = Integer.parseInt(idScenarioTxt);
				System.out.println("id Scenario"+idScenarioTxt);
				if (idScenario!=null) {
	
					String titre=scenarioDao.titreScenarioParId(idScenario);
					request.setAttribute("titre", titre);
					request.setAttribute("participants", scenarioDao.listerParicipants(idScenario));
				}
			this.getServletContext().getRequestDispatcher("/WEB-INF/pageParticipants.jsp").forward(request, response);	
//GESTION DE L'ENREGISTREMENT D UN UTILISATEUR ET SON INSCRIPTION A UN JEU				
			}else if(request.getParameter("action").equals("inscrire")) {
				Utilisateur utilisateur=new Utilisateur();
				String nom=request.getParameter("nom");
				String prenom=request.getParameter("prenom");
				String email=request.getParameter("email");
				String motDePasseClair=request.getParameter("password");
				String password= HashClass.sha1(request.getParameter("password"));
				int profil= Integer.parseInt(request.getParameter("radio"));
				String choixDuJeu=request.getParameter("jeu");
				
				utilisateur.setNom(nom);
				utilisateur.setPrenom(prenom);
				utilisateur.setEmail(email);
				utilisateur.setPassword(password);
				utilisateur.setProfil(profil);
				utilisateur.setNiveau("Débutant");
				
				String dejaInscrit;
				String emailVierge;
				System.out.println("le choix du jeu est : "+choixDuJeu);
				if(utilisateurDao.joueurDejaInscrit(email)) {
					dejaInscrit="true";
					request.setAttribute("dejaInscrit", dejaInscrit);
				}else if(email == null || email.equals("")) {
					emailVierge="vide";
					request.setAttribute("emailVierge", emailVierge);
				}else if(choixDuJeu == null) {
					choixDuJeu="vide";
					request.setAttribute("choixJeuVide", choixDuJeu);
				}
				else{
					
				int idScenario = Integer.parseInt(choixDuJeu);
					
				utilisateurDao.ajouterUtilisateur(utilisateur);
				int idUtilisateur = utilisateurDao.idDernierAjout();
				
				inscrireDao.inscrireJoueur(idUtilisateur, idScenario);
				EnvoyerMail invit = new EnvoyerMail();
				invit.envoiInvit(email,motDePasseClair);
				}
				this.getServletContext().getRequestDispatcher("/WEB-INF/pageParticipants.jsp").forward(request, response);
			}
//FAIRE GESTION PROFIL JOUEUR
		else if(request.getParameter("action").equals("modifier")) {
			String idUtilisateur0 = request.getParameter("idparticipant");
			int idUtilisateur = Integer.parseInt(idUtilisateur0);
			
			Utilisateur joueur=new Utilisateur();
			joueur=utilisateurDao.lecture(idUtilisateur);
			
			request.setAttribute("joueur", joueur);
			request.setAttribute("idUtilisateur", idUtilisateur);
			
			List<Scenario> jeuxDuJoueur= scenarioDao.listerParUtilisateur(idUtilisateur);
			System.out.println(jeuxDuJoueur);
			request.setAttribute("listeJeux", jeuxDuJoueur);
			
			int idAdmin=user.getIdUtilisateur();
			List<Scenario> listScenarios = scenarioDao.lister(idAdmin);
			List<Scenario> listValide = new ArrayList<>();
			ScenarioJouable sj = new ScenarioJouable();
			for (Scenario scenario : listScenarios) {
				if(sj.scenarioIsValid(scenario.getIdScenario())){
					listValide.add(scenario);
				}
			}
			request.setAttribute("scenarios", listValide);
			/*request.setAttribute("scenarios", scenarioDao.lister(idAdmin));*/
			
			this.getServletContext().getRequestDispatcher("/WEB-INF/editerProfil.jsp").forward(request, response);
		}
			
		}
	}

}
