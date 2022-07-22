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
import com.ifaSeriousGame.dao.RepondDao;
import com.ifaSeriousGame.dao.RepondDaoImpl;
import com.ifaSeriousGame.dao.ScenarioDao;
import com.ifaSeriousGame.dao.ScenarioDaoImpl;



@WebServlet("/page2")
public class Page2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private ScenarioDao scenarioDao;
    private RepondDao repondDao;
    
    public Page2() {
        super(); 
    }
    
    @Override
    public void init() throws ServletException {
    	DaoFactory daoFactory=DaoFactory.getInstance();    
    	//pour pouvoir accéder à la méthode lister
    	scenarioDao=new ScenarioDaoImpl(daoFactory);
    	repondDao=new RepondDaoImpl(daoFactory);
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession(true);
		if(session.getAttribute("connectedUser")==null) {
			response.sendRedirect("/Serious_Game/login");
		} else {
		Utilisateur user=(Utilisateur) session.getAttribute("connectedUser");
		int id=user.getIdUtilisateur();
		
		List<Scenario> listeJeux = scenarioDao.lister(id);
	
		for (Scenario scenario : listeJeux) {
			boolean bool =repondDao.checkDejaJoue(id, scenario.getIdScenario());
			scenario.setDejaJoue(bool);
		}
		
		request.setAttribute("nbJeu", listeJeux.size());
		request.setAttribute("scenarios",listeJeux );

		this.getServletContext().getRequestDispatcher("/WEB-INF/page2.jsp").forward(request,response);
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession(true);
		if(session.getAttribute("connectedUser")==null) {
			response.sendRedirect("/Serious_Game/login");
		}
		Utilisateur user=(Utilisateur) session.getAttribute("connectedUser");
		if(user.getProfil() == 2) {
			repondDao.effacerReponsesJoueur(user.getIdUtilisateur());
			response.sendRedirect("/Serious_Game/page2");
		}
	}

}
