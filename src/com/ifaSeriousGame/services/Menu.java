package com.ifaSeriousGame.services;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/menu")
public class Menu extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public Menu() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session=request.getSession(true);
		if(session.getAttribute("connectedUser")==null) {
			response.sendRedirect("/Serious_Game/login");
		} else {
			
				if(request.getParameter("action").equals("accueil")) {
					
					response.sendRedirect("/Serious_Game/index");
					
				}else if(request.getParameter("action").equals("jeux")){
					
					response.sendRedirect("/Serious_Game/page2");
					
				}else if(request.getParameter("action").equals("tableauBord")){
					
					response.sendRedirect("/Serious_Game/pageTableauBord");
					
				}else if(request.getParameter("action").equals("retourAdmin")){
					
					response.sendRedirect("/Serious_Game/pageParticipants");
					
				}else if(request.getParameter("action").equals("inscrire")){
					
					response.sendRedirect("/Serious_Game/pageParticipants");
					
				}else if(request.getParameter("action").equals("editer")){
					
					response.sendRedirect("/Serious_Game/pageCreation1");
					
				}else if(request.getParameter("action").equals("deco")){
					session.invalidate();
					this.getServletContext().getRequestDispatcher("/WEB-INF/index.jsp").forward(request, response);	
				}
		}
	};

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
