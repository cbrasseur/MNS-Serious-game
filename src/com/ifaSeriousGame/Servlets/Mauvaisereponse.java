package com.ifaSeriousGame.Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ifaSeriousGame.beans.Utilisateur;
import com.ifaSeriousGame.services.AlgoJeu;
import com.ifaSeriousGame.services.CalculStats;


@WebServlet("/mauvaisereponse")
public class Mauvaisereponse extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public Mauvaisereponse() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession(true);
		if(session.getAttribute("connectedUser")==null) {
			response.sendRedirect("/Serious_Game/login");
		} else {
			
			Utilisateur user=(Utilisateur) session.getAttribute("connectedUser");
			int idUtilisateur=user.getIdUtilisateur();
			
			String idJeu= request.getParameter("idJeu");
			Integer id1=Integer.parseInt(idJeu);
			request.setAttribute("idScenario",id1);
			
			String difficult=request.getParameter("difficulte");
			int difficulte=Integer.parseInt(difficult);
			if(difficulte ==2 || difficulte == 3) {
				difficulte--;
			}
			
			AlgoJeu jeu = new AlgoJeu();
			String[] listeJeu=jeu.algoJeu(id1,idUtilisateur,difficulte);
			
			System.out.println("liste[0] contient : "+listeJeu[0]);
			
			if(listeJeu[0] !=("Rendez vous sur le tableau de bord")){
			request.setAttribute("jeu", listeJeu);
		
			int chance= (int) ((Math.random() *10)%2);
			request.setAttribute("chance", chance);
			
			String solution= (String) request.getAttribute("solution");
			request.setAttribute("solution", solution);
						
			CalculStats progression= new CalculStats();
			Double progres=progression.progression(idUtilisateur, id1);
			request.setAttribute("progression", progres);
		
			this.getServletContext().getRequestDispatcher("/WEB-INF/pageJeu.jsp").forward(request,response);
			}else {
				response.sendRedirect("/Serious_Game/pageTableauBord");
			}
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
