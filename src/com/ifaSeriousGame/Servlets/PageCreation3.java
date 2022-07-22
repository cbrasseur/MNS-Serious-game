package com.ifaSeriousGame.Servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ifaSeriousGame.beans.Question;
import com.ifaSeriousGame.beans.Reponse;
import com.ifaSeriousGame.beans.Utilisateur;
import com.ifaSeriousGame.dao.DaoFactory;
import com.ifaSeriousGame.dao.QuestionDao;
import com.ifaSeriousGame.dao.QuestionDaoImpl;
import com.ifaSeriousGame.dao.ReponseDao;
import com.ifaSeriousGame.dao.ReponseDaoImpl;
import com.ifaSeriousGame.dao.ScenarioDaoImpl;

/**
 * Servlet implementation class PageCreation3
 */
@WebServlet("/pageCreation3")
public class PageCreation3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private QuestionDao questionDao;
    private ReponseDao reponseDao;
    
    public PageCreation3() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    @Override
    public void init() throws ServletException {
    	DaoFactory daoFactory = DaoFactory.getInstance();
    	questionDao = new QuestionDaoImpl(daoFactory);
    	reponseDao = new ReponseDaoImpl(daoFactory);
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession(true);
		Utilisateur user = (Utilisateur) session.getAttribute("connectedUser");
		
		if(session.getAttribute("connectedUser")==null || user.getProfil()!=2) {
			response.sendRedirect("/Serious_Game/login");
		} else {
		
		this.getServletContext().getRequestDispatcher("/WEB-INF/pageCreation3.jsp").forward(request,response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession(true);
		Utilisateur user = (Utilisateur) session.getAttribute("connectedUser");
		
		if(session.getAttribute("connectedUser")==null || user.getProfil()!=2) {
			response.sendRedirect("/Serious_Game/login");
		} else {
		String idScenarioTxt= request.getParameter("idaRecup");
		Integer idScenario = Integer.parseInt(idScenarioTxt);
		String question = request.getParameter("inputQuestion");
		String reponse1 = request.getParameter("inputReponse1");
		String reponse0 = request.getParameter("inputReponse0");
		String image = request.getParameter("inputImg");
		String difficulteTxt = request.getParameter("radio");
		Integer difficulte = Integer.parseInt(difficulteTxt);
		
		questionDao.ajouterQuestion(question, image, difficulte, idScenario);
		int i=questionDao.dernierIdEnregistre();	
		reponseDao.ajouterReponse(reponse1,difficulte,i);
		reponseDao.ajouterReponse(reponse0,0,i);
		
		request.setAttribute("idaRecup", idScenario);
		
		String nomScenar = request.getParameter("scenarioNom");
		request.setAttribute("scenarioComplet", nomScenar);
		
		List<Question> listQuestions = questionDao.lister(idScenario);
		List<Reponse> listReponses= reponseDao.lister(idScenario);
		
		request.setAttribute("listeQuestions", listQuestions);
		request.setAttribute("listeReponses", listReponses);
		
		this.getServletContext().getRequestDispatcher("/WEB-INF/pageCreation3.jsp").forward(request,response);
		}
	}

}
