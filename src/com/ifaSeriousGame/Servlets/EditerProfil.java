package com.ifaSeriousGame.Servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

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
import com.ifaSeriousGame.dao.RepondDaoImpl;
import com.ifaSeriousGame.dao.ScenarioDao;
import com.ifaSeriousGame.dao.ScenarioDaoImpl;
import com.ifaSeriousGame.dao.UtilisateurDao;
import com.ifaSeriousGame.dao.UtilisateurDaoFactory;


@WebServlet("/editerProfil")
public class EditerProfil extends HttpServlet {
	private static final long serialVersionUID = 1L;
    UtilisateurDao utilisateurDao;   
    ScenarioDao scenarioDao;
    InscrireDao inscrireDao;
    public EditerProfil() {
        super();
        
    }

    @Override
    public void init() throws ServletException {
    	DaoFactory daoFactory=DaoFactory.getInstance();    
    	utilisateurDao=new UtilisateurDaoFactory(daoFactory);
    	scenarioDao= new ScenarioDaoImpl(daoFactory);
    	inscrireDao=new InscrireDaoImpl(daoFactory);
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession(true);
		Utilisateur user = (Utilisateur) session.getAttribute("connectedUser");
		if(session.getAttribute("connectedUser")==null || user.getProfil()!=2){
			response.sendRedirect("/Serious_Game/login");
		} else {
		int idUtilisateur=(int) request.getAttribute("idUtilisateur");
		request.setAttribute("idUtilisateur", idUtilisateur);
		
		this.getServletContext().getRequestDispatcher("/WEB-INF/editerProfil.jsp").forward(request, response);
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession(true);
		Utilisateur user = (Utilisateur) session.getAttribute("connectedUser");
		if(session.getAttribute("connectedUser")==null || user.getProfil()!=2){
			response.sendRedirect("/Serious_Game/login");
		} else {
			int idJoueurToUpDate= Integer.parseInt(request.getParameter("idjoueur"));
			if(request.getParameter("action").equals("update")) {
				Utilisateur joueur= new Utilisateur();
				joueur.setIdUtilisateur(idJoueurToUpDate);
				joueur.setNom(request.getParameter("nom"));
				joueur.setPrenom(request.getParameter("prenom"));
				joueur.setEmail(request.getParameter("email"));
				joueur.setPassword(request.getParameter("password"));
				System.out.println(joueur.toString());
				utilisateurDao.updateUtilisateur(joueur);
				response.sendRedirect("/Serious_Game/pageParticipants");
				
			}else if(request.getParameter("action").equals("ajouter")){
				String idJeuAajouterTxt = request.getParameter("idAAjouter");
				int idJeuAajouter = Integer.parseInt(idJeuAajouterTxt);
				inscrireDao.inscrireJoueur(idJoueurToUpDate, idJeuAajouter);
				response.sendRedirect("/Serious_Game/pageParticipants");				
			}else if(request.getParameter("action").equals("radier")){
				String idScenarioTxt = request.getParameter("idScenario");
				int idScenario= Integer.parseInt(idScenarioTxt);
				inscrireDao.radierJoueur(idJoueurToUpDate, idScenario);
				response.sendRedirect("/Serious_Game/pageParticipants");
			}
		}
	}

}
