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
import com.ifaSeriousGame.dao.ScenarioDaoImpl;
import com.ifaSeriousGame.services.CalculStats;


@WebServlet("/pageTableauBord")
public class PageTableauBord extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private RepondDao repondDao;
    
    public PageTableauBord() {
        super();
        
    }

    @Override
    public void init() throws ServletException {
    	DaoFactory daoFactory=DaoFactory.getInstance();    
    	
    	repondDao=new RepondDaoImpl(daoFactory);
    	
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession(true);
		if(session.getAttribute("connectedUser")==null) {
			response.sendRedirect("/Serious_Game/login");
		} else {
			Utilisateur user=(Utilisateur) session.getAttribute("connectedUser");
			int id=user.getIdUtilisateur();
			List<Scenario> listeJeuxJoues=repondDao.listeJeuxJoues(id);
			request.setAttribute("listeJeuxJoues", listeJeuxJoues);
			
			List<String> listScoreParJeu = new ArrayList<String>();
			List<String> listeTempsParJeu= new ArrayList<String>();
			for (Scenario scenario : listeJeuxJoues) {
				CalculStats points= new CalculStats();
				String score="Votre score pour le jeu "+scenario.getNom()+" est de "+(points.calculPoints(id,scenario.getIdScenario()));
				listScoreParJeu.add(score);
				CalculStats temps= new CalculStats();
				String tempsParjeu=scenario.getNom().toUpperCase()+temps.tempsDeJeu(id, scenario.getIdScenario());
				listeTempsParJeu.add(tempsParjeu);
			}
			request.setAttribute("listScoreParJeu", listScoreParJeu);
			request.setAttribute("listTempsParJeu", listeTempsParJeu);
			
			int valeur1=0;
			CalculStats pointsTotauxJoueur= new CalculStats();
			for (Scenario scenario : listeJeuxJoues) {
				int temp=pointsTotauxJoueur.calculTotalJoueur(id,scenario.getIdScenario());
				valeur1+=temp;
			}
			
			request.setAttribute("pointsTotauxJoueur", valeur1);
			
			CalculStats pointsTotalPossible= new CalculStats();
			int valeur2=pointsTotalPossible.calculTotalPossible(id);
			request.setAttribute("pointsTotalPossible", valeur2);
			
			double f1=valeur1;
			double f2=valeur2;
			double trophe=(f1/f2);
			String image;
			
			if(trophe < 0.25) {
				image="trophe";
				request.setAttribute("trophe", image);
			}else if(trophe>=0.25 && trophe <0.5) {
				image="bronze";
				request.setAttribute("trophe", image);
			}else if(trophe >=0.5 && trophe<0.75) {
				image="argent";
				request.setAttribute("trophe", image);
			}else if(trophe>=0.75 && trophe <=1) {
				image="or";
				request.setAttribute("trophe", image);
			}
			this.getServletContext().getRequestDispatcher("/WEB-INF/pageTableauBord.jsp").forward(request,response);
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
