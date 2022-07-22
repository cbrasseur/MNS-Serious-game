<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
        integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">
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
                                <button type="input" class="btn btn-dark"  name="action" value="jeux">Mes Serious Games</button>
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
    
    <form action="pageJeu" method="post">
    <div class="container">
        <div class="row">
            <div class="col">
                <h1>Jouons</h1>
            </div>
        </div>
        <div class="row m-3">
            <div class="col-12 col-lg-4">
                <div class="card" style="height:566px;background-color: beige;box-shadow: 5px 5px 5px gray;">
                	<c:if test="${ jeu[8] == 'null' }">
                    	<img src="img/question.png" alt="Question" class="card-img-top" style="margin-top:15px;">
                    </c:if>
                    <c:if test="${ jeu[8] != 'null' }">
                    	<img src="${ jeu[8] }" alt="illustration non disponible" class="card-img-top" style="margin-top:15px;">
                    </c:if>
                    <div class="card-body">
                        <h5 class="card-title">Question</h5>
                        <p class="card-text" >
                        	<c:out value="${jeu[0]}"></c:out>
                        </p>
                        <input type="hidden" name="idJeu" value="${ idScenario }" />
                        <input type="hidden" name="idQuestion" value="${ jeu[3] }" />
                        <input type="hidden" name="difficulte" value="${jeu[6] }" />
                    </div>
                </div>
            </div>

            <c:if test="${chance == 0 }">
            <button type="submit" name="action" value="MauvaiseReponse" class="col-12 col-lg-4 btn btn-outline-dark " style="color: orangered;height:566px;">
                <div class="card" style="height:98%;background-color: beige;">
                    <img src="img/crayon1.png" alt="crayon" class="card-img-top">
                    <div class="card-body" >
                        <h5 class="card-title">Première Proposition</h5>
                        
                        <p class="card-text" style="color:black;">
                        		<c:out value="${jeu[1]}"></c:out>
                        </p>
                        <input type="hidden" name="valeurFausse" value="${ jeu[4] }" />
                        
                    </div>
                </div>
            </button>
			</c:if>
			<c:if test="${chance != 0 }">
			<button type="submit" name="action" value="BonneReponse" class="col-12 col-lg-4 btn btn-outline-dark " style="color: orangered;height:566px;">
                <div class="card" style="height:98%;background-color: beige;">
                    <img src="img/crayon1.png" alt="crayon" class="card-img-top">
                    <div class="card-body" >
                        <h5 class="card-title">Première Proposition</h5>
                        
                        <p class="card-text" style="color:black;">
                        		<c:out value="${jeu[2]}"></c:out>
                        		<input type="hidden" name="solution" value="${ jeu[2] }" />
                        </p>
                        <input type="hidden" name="valeurVraie" value="${ jeu[5] }" />
                        
                    </div>
                </div>
            </button>
			</c:if>
			<c:if test="${chance != 0 }">
            <button type="submit" name="action" value="MauvaiseReponse" class="col-12 col-lg-4 btn btn-outline-dark " style="color: orangered;height:566px;">
                <div class="card" style="height:98%;background-color: beige;">
                    <img src="img/crayon2.png" alt="crayon" class="card-img-top">
                    <div class="card-body" >
                        <h5 class="card-title">Deuxième Proposition</h5>
                        
                        <p class="card-text" style="color:black;">
                        		<c:out value="${jeu[1]}"></c:out>
                        </p>
                        <input type="hidden" name="valeurFausse" value="${ jeu[4] }" />
                        
                    </div>
                </div>
            </button>
			</c:if>
			<c:if test="${chance == 0 }">
			<button type="submit" name="action" value="BonneReponse"class="col-12 col-lg-4 btn btn-outline-dark " style="color: orangered;height:566px;">
                <div class="card" style="height:98%;background-color: beige;">
                    <img src="img/crayon2.png" alt="crayon" class="card-img-top">
                    <div class="card-body" >
                        <h5 class="card-title">Deuxième Proposition</h5>
                        
                        <p class="card-text" style="color:black;">
                        		<c:out value="${jeu[2]}"></c:out>
                        		<input type="hidden" name="solution" value="${ jeu[2] }" />
                        </p>
                        <input type="hidden" name="valeurVraie" value="${ jeu[5] }" />
                        
                    </div>
                </div>
            </button>
			</c:if>
			
        </div>
    </div>
    </form>
  	
    <div class="container" style="margin-bottom: 20px;">
        <div class="row " >
            <div class=" col-12 col-lg-4"></div>
            <c:if test="${ jeu[6]==1 }">
            <div class=" col-12 col-lg-4 card" style="width: 18rem;background-color:#228B22">
                <img class="card-img-top" src="img/progres.jpg" alt="progression" style="margin-top: 20px;">
                <div class="card-body" style="text-align:center;">
                    <p class="card-text" style="font-weight: bold;color:white;">Question de niveau de difficulté <c:out value="${jeu[6]}"></c:out> sur 3</p>
                    <p class="card-text" style="font-weight: bold;color:white;">Vous avez répondu à  <c:out value="${ progression }"></c:out>% des questions de ce jeu.<br>Sortez vainqueur plus rapidement sans commettre d'erreur. Un bonus de points vous attend contre un sans faute</p>
                </div>
            </div>
            </c:if>
            <c:if test="${ jeu[6] ==2}">
            <div class=" col-12 col-lg-4 card" style="width: 18rem;background-color:#DAA520">
                <img class="card-img-top" src="img/progres.jpg" alt="progression" style="margin-top: 20px;">
                <div class="card-body" style="text-align:center;">
                    <p class="card-text" style="font-weight: bold;color:white;">Question de niveau de difficulté <c:out value="${jeu[6]}"></c:out> sur 3</p>
                    <p class="card-text" style="font-weight: bold;color:white;">Vous avez répondu à  <c:out value="${ progression }"></c:out>% des questions de ce jeu.<br>Sortez vainqueur plus rapidement sans commettre d'erreur. Un bonus de points vous attend contre un sans faute</p>
                </div>
            </div>
            </c:if><c:if test="${ jeu[6]==3 }">
            <div class=" col-12 col-lg-4 card" style="width: 18rem;background-color:#FF6347">
                <img class="card-img-top" src="img/progres.jpg" alt="progression" style="margin-top: 20px;">
                <div class="card-body" style="text-align:center;">
                    <p class="card-text" style="font-weight: bold;color:white;">Question de niveau de difficulté <c:out value="${jeu[6]}"></c:out> sur 3</p>
                    <p class="card-text" style="font-weight: bold;color:white;">Vous avez répondu à  <c:out value="${ progression }"></c:out>% des questions de ce jeu.<br>Sortez vainqueur plus rapidement sans commettre d'erreur. Un bonus de points vous attend contre un sans faute</p>
                </div>
            </div>
            </c:if>
            <div class=" col-12 col-lg-4"></div>
        </div>
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