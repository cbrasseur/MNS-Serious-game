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
import com.ifaSeriousGame.beans.Scenario;
import com.ifaSeriousGame.beans.Utilisateur;
import com.ifaSeriousGame.dao.DaoFactory;
import com.ifaSeriousGame.dao.QuestionDao;
import com.ifaSeriousGame.dao.QuestionDaoImpl;
import com.ifaSeriousGame.dao.ReponseDao;
import com.ifaSeriousGame.dao.ReponseDaoImpl;
import com.ifaSeriousGame.dao.ScenarioDao;
import com.ifaSeriousGame.dao.ScenarioDaoImpl;

/**
 * Servlet implementation class PageCreation1
 */
@WebServlet("/pageCreation1")
public class PageCreation1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private ScenarioDao scenarioDao;
	private QuestionDao questionDao;
    private ReponseDao reponseDao;
     
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PageCreation1() {
        super();
    }
    
    @Override
    public void init() throws ServletException {
    	DaoFactory daoFactory = DaoFactory.getInstance();
    	scenarioDao = new ScenarioDaoImpl(daoFactory);
    	questionDao = new QuestionDaoImpl(daoFactory);
    	reponseDao= new ReponseDaoImpl(daoFactory);
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession(true);
		Utilisateur user = (Utilisateur) session.getAttribute("connectedUser");
		
		if(session.getAttribute("connectedUser")==null || user.getProfil()!=2) {
			response.sendRedirect("/Serious_Game/login");
		} else {
			int id=user.getIdUtilisateur();
			request.setAttribute("scenarios", scenarioDao.lister(id));
		this.getServletContext().getRequestDispatcher("/WEB-INF/pageCreation1.jsp").forward(request,response);
		
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession(true);
		Utilisateur user = (Utilisateur) session.getAttribute("connectedUser");
		
		if(session.getAttribute("connectedUser")==null || user.getProfil()!=2) {
			response.sendRedirect("/Serious_Game/login");
		} else {
			
			
			if(request.getParameter("action").equals("nouveauScenario")) {
				this.getServletContext().getRequestDispatcher("/WEB-INF/pageCreation2.jsp").forward(request,response);
				
			}else if(request.getParameter("action").equals("editerscenario")) {
				
				String idARecup = request.getParameter("idaChoper");
				Integer idScenario = Integer.parseInt(idARecup);
				System.out.println("l'id a recup est : "+idARecup);
				
				String nomScenar = request.getParameter("scenarioComplet");
				request.setAttribute("scenarioComplet", nomScenar);
				
				request.setAttribute("idaRecup", idARecup);
				
				List<Question> listQuestions = questionDao.lister(idScenario);
				List<Reponse> listReponses= reponseDao.lister(idScenario);
				
				request.setAttribute("listeQuestions", listQuestions);
				request.setAttribute("listeReponses", listReponses);
				
				this.getServletContext().getRequestDispatcher("/WEB-INF/pageCreation3.jsp").forward(request,response);
				
			}else if(request.getParameter("action").equals("supprimerscenario")) {
				String idARecup = request.getParameter("idaChoper");
				Integer idScenario = Integer.parseInt(idARecup);
				request.setAttribute("idaRecup", idARecup);
				
				this.getServletContext().getRequestDispatcher("/WEB-INF/supprimerJeu.jsp").forward(request,response);
			}
		}
		
	}

}
