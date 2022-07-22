<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<!-- bibliotheque JSTL : il faut aussi ajouter la librairie JSTL.jar dans WEB-INF lib -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
        integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="animatedBook.css">
    
    <title>Ifa SeriousGame</title>
</head>

<body>

    <div class="bg-dark">
        <div class="container">
            <form class="row" action="menu" method="get">
                <nav class="col navbar navbar-expand-lg navbar-dark">
                    <button type="input" class="navbar-brand, btn btn-dark" name="action" value="accueil" >
                        <img src="img/logo.png" width="50" height="50" alt="Site logo">
                        Ifa SeriousGame
                    </button>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div id="navbarContent" class="collapse navbar-collapse">
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <button type="input" class="btn btn-dark" name="action" value="accueil">Accueil</button>
                            </li>
                            <li class="nav-item">
                                <button type="input" class="btn btn-dark" style="color:orangered;" name="action" value="jeux">Mes Serious Games</button>
                            </li>
                            <li class="nav-item">
                                <button type="input" class="btn btn-dark" name="action" value="tableauBord">Mon Tableau De Bord</button>
                            </li>
                            <c:if test="${ connectedUser.profil ==2 }">
                            	<li class="nav-item">
	                                <button type="input" class="btn btn-dark" name="action" value="retourAdmin">Retour à l'administration</button>
	                            </li>
                            </c:if>
                        </ul>
                    </div>
                
                
            <div class="text-right">
            	
                <button type="submit" class="btn btn-light" style="color: orangered;background-color:white;" name="action" value="deco">Déconnecter</button>
            </div>
            </nav>
            </form>
            

        </div>

    </div>
    
    <div class="container">
        <div class="row">
            <div class="col-lg-6">
                <h1 style="margin-top:15%;">Vos Serious-Game</h1>
            </div>
            <div class="col-lg-6">
<%-- Livre animé ---------------------------------------------------------------------------------------------------------------------------------------%>
            	<div class="component" style="witdh:50%;">
        <ul class="align">
          <li>
            <figure class='book'>

              <!-- Front -->

              <ul class='hardcover_front'>
                <li>
                  <div class="coverDesign blue">
                    <h1>JOUONS</h1>
                    
                  </div>
                </li>
                <li></li>
              </ul>

              <!-- Pages -->

              <ul class='page'>
                <li></li>
                <li>
                  <p >BIENVENUE </p>
                  <p><c:out value="${ connectedUser.nom } ${ connectedUser.prenom }" /></p>
                  <c:if test="${nbJeu ==0 }">
	                  <p>Vous n'êtes inscrit à aucun jeu. Contactez le maitre du jeu qui vous a invité.</p>
                  </c:if>
                  <c:if test="${nbJeu ==1 }">
	                  <p>Voici le seul jeu auquel vous êtes inscrit.</p>
                  </c:if>
                  <c:if test="${nbJeu >1 }">
	                  <p>Voici la liste des <c:out value="${ nbJeu }" /> serious-games auxquels vous êtes inscrits.</p>
                  </c:if>
                </li>
                <li></li>
                <li></li>
                <li></li>
              </ul>

              <!-- Back -->

              <ul class='hardcover_back'>
                <li></li>
                <li></li>
              </ul>
              <ul class='book_spine'>
                <li></li>
                <li></li>
              </ul>
              
            </figure>
          </li>
        </ul>
      </div>
            	
            </div>
        </div>
        <div class="col-lg-12">
        	
        	<c:if test="${ connectedUser.profil ==1 }">
        		<p style="text-align:center;background-color:rgb(53,58,64);color:white;">SI VOUS QUITTEZ LE JEU AVANT DE L'AVOIR TERMINÉ VOUS NE POURREZ PLUS Y REVENIR ET DEVREZ DEMANDER UN NOUVEL ACCES</p>
        	</c:if>
        	
            <c:if test="${ connectedUser.profil ==2 }">
            	<div class=" text-right" style="text-align:center;background-color:rgb(53,58,64);color:white;padding:3px;">
                	<form action="page2" method="post" >
                    	<p style="display:inline-block;">Remettre à zéro tous les jeux de la liste ---------------------------------------------></p>
	                    <button type="submit" class="btn btn-danger stretched-link btn-lg" name="action" value="clear" style="width:20%">Clear</button>
                    </form>
                </div> 
           </c:if>
       	  
        </div>
 
        
       
        <c:forEach items="${scenarios}" var="scenario">
        
         <form action="pageJeu" method="get"> 
        
        <div class="row m-3" >
            <div class="col-12 col-lg-12" >
                <div class="card" style="background-color: beige;box-shadow: 5px 5px 5px gray;" >
                	<div style="display: inline-block;" >
                	<c:if test="${scenario.illustration == null }">
                    	<img src="img/orange.png" alt="orange" class="card-img-top" style="width:20%;margin-left:30px;">
                    </c:if>
                    <c:if test="${scenario.illustration != null }">
                    		<img id="imgJeu" src="${scenario.illustration}" alt="Image illustration du theme non disponible" class="card-img-top" style="width:20%;margin-left:30px;">
                    </c:if>
                    <c:if test="${scenario.dejaJoue == true }">
                    	<img src="img/dejaJoue.png" alt="orange" class="card-img-top" style="width:20%;margin-left:15%;padding-top:4%;">
                    	
                    </c:if>
                    </div>
                     
                    <div class="card-body">
                   
                        <h3 class="card-title"><c:out value="${scenario.nom}"></c:out></h3>
                        <p class="card-text"><c:out value="${scenario.description}"></c:out></p>
                        <div class=" text-right">
                        
	                       
	                        	<input type="hidden" name="idJeu" value="${ scenario.idScenario }" />
	                        	<c:if test="${scenario.dejaJoue == false }">   
		                        	<button type="submit" name="action" value="jouer" class="btn btn-dark stretched-link btn-lg" style="color: orange;width:20%;"
		                            role="button">Go<span class="spinner-grow spinner-grow-sm" role="status" aria-hidden="true"></span><span class="spinner-grow spinner-grow-sm" role="status" aria-hidden="true"></span><span class="spinner-grow spinner-grow-sm" role="status" aria-hidden="true"></span></button>
	                        	</c:if>
	                        	<c:if test="${scenario.dejaJoue == true }">
	                        		<button type="submit" class="btn btn-warning stretched-link btn-lg" name="action" value="reset" style="width:20%">Reinitialiser?</button>
	            				</c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </form>
        </c:forEach>
       
    </div>

    <%@ include file="footer.jsp" %>

    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
        integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous">
    </script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous">
    </script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
        integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous">
    </script>
</body>

</html>