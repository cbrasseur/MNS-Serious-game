package com.ifaSeriousGame.Servlets;

import java.io.IOException;
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

@WebServlet("/pageCreation2")
public class PageCreation2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    private ScenarioDao scenarioDao;
    private InscrireDao inscrireDao;
    public PageCreation2() {
        super();
        // TODO Auto-generated constructor stub
    }

    @Override
    public void init() throws ServletException {
    	DaoFactory daoFactory = DaoFactory.getInstance();
    	scenarioDao = new ScenarioDaoImpl(daoFactory);
    	inscrireDao = new InscrireDaoImpl(daoFactory);
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession(true);
		Utilisateur user = (Utilisateur) session.getAttribute("connectedUser");
		
		if(session.getAttribute("connectedUser")==null || user.getProfil()!=2) {
			response.sendRedirect("/Serious_Game/login");
		} else {
			int id=user.getIdUtilisateur();
		this.getServletContext().getRequestDispatcher("/WEB-INF/pageCreation2.jsp").forward(request,response);
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession(true);
		Utilisateur user = (Utilisateur) session.getAttribute("connectedUser");
		
		if(session.getAttribute("connectedUser")==null || user.getProfil()!=2) {
			response.sendRedirect("/Serious_Game/login");
		} else {
		
			if (request.getParameter("action").equals("valider")) {
				
				
				Scenario scenario =new Scenario();
				scenario.setNom(request.getParameter("inputNom"));
				scenario.setIdUtilisateur(user.getIdUtilisateur());
				scenario.setDescription(request.getParameter("inputDescription"));
				String img =request.getParameter("inputImg");
				if(img.equals("")) {img=null;}
				scenario.setIllustration(img);
				scenario.setNbQuestions(Integer.parseInt(request.getParameter("choixNombre")));
				
				scenarioDao.ajouter(scenario);
				
				int idJeu = scenarioDao.dernierAjout();
				
				inscrireDao.inscrireJoueur(user.getIdUtilisateur(), idJeu);
				
				response.sendRedirect("/Serious_Game/pageCreation1");
				}
				
			}
			
		}
	

}
