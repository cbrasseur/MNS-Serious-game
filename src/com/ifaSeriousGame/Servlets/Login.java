package com.ifaSeriousGame.Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ifaSeriousGame.beans.Utilisateur;
import com.ifaSeriousGame.dao.DaoFactory;
import com.ifaSeriousGame.dao.UtilisateurDaoFactory;



@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private UtilisateurDaoFactory utilisateurDaoFactory;
	
    public Login() {
        super();
        
    }
    
    @Override
    public void init() throws ServletException {
    	
    	DaoFactory daoFactory=DaoFactory.getInstance();
    	utilisateurDaoFactory = new UtilisateurDaoFactory(daoFactory);
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("login")) {
                    request.setAttribute("login", cookie.getValue());
                }
            }
        }
		this.getServletContext().getRequestDispatcher("/WEB-INF/login.jsp").forward(request,response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String login=request.getParameter("txtLogin");
		String password=request.getParameter("txtPassword");

		Utilisateur connectedUser=utilisateurDaoFactory.isValidLogin(login, password);
		
		Cookie cookie = new Cookie("login", login);
		cookie.setMaxAge(60*60*24*30);
		response.addCookie(cookie);
		
		if(connectedUser !=null) {
			
			HttpSession session=request.getSession(true);
			session.setAttribute("connectedUser", connectedUser);
			
			//on choisit la page à  afficher après s'être logué en fonction du profil 1(utilisateur) 2(Admin)
			if(connectedUser.getProfil() == 1) {
				response.sendRedirect("/Serious_Game/page2");
			}else if(connectedUser.getProfil() == 2) {
				response.sendRedirect("/Serious_Game/pageParticipants");
			}
		} else {
			//Echec de la tentative de log, on redirige vers la jsp login
			this.getServletContext().getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
		}
		
		
		
	}
		
	

}
