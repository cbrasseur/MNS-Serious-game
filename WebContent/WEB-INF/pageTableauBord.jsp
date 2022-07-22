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
                    <button type="input" class="navbar-brand, btn btn-dark" name="action" value="accueil">
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
                                <button type="input" class="btn btn-dark" style="color:orangered;" name="action" value="tableauBord">Mon Tableau De Bord</button>
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
        <div class="row m-3">
            <div class=" col-12 col-lg-3"></div>
            	<div class=" col-12 col-lg-6 card" style="width: 18rem;box-shadow: 5px 5px 5px gray;">
            		<img class="card-img-top" src="img/${trophe}.png" alt="trophe">
                <div class="card-body">
                    <H1>STATISTIQUES</H1>
                   
                     <div class="h-divider" style="margin-top:15px;margin-bottom:5px;height:1px;width:100%;border-top:1px solid gray;"></div>
                    <h2>Vos serious games</h2>
                   
                    <c:forEach items="${listeJeuxJoues}" var="listeJeuxJoues">
	                    	<div style="color:orangered;background-color:#F5F5DC;margin:5px;padding:5px;border-radius:5px;box-shadow: 5px 5px 5px gray;">
	                    		<h5><c:out value="${ listeJeuxJoues.nom}"></c:out></h5>
	                    		<p><c:out value="${ listeJeuxJoues.description}"></c:out></p>
	                    	</div>
                    </c:forEach>
                    
                    <div class="h-divider" style="margin-top:15px;margin-bottom:5px;height:1px;width:100%;border-top:1px solid gray;"></div>

                    <h2>Vos points</h2>
                    <c:forEach items="${listScoreParJeu}" var="listScoreParJeu">
                    	<div style="color:orangered;background-color:#F5F5DC;margin:5px;padding:5px;border-radius:5px;box-shadow: 5px 5px 5px gray;">
                    		<p class="card-text"><c:out value="${ listScoreParJeu}"></c:out></p>
                    	</div>
                    </c:forEach>
              
                     <div class="h-divider" style="margin-top:15px;margin-bottom:5px;height:1px;width:100%;border-top:1px solid gray;"></div>
                     <h2>Vos temps</h2>
                     <c:forEach items="${listTempsParJeu}" var="listTempsParJeu">
                    	<div style="color:orangered;background-color:#F5F5DC;margin:5px;padding:5px;border-radius:5px;box-shadow: 5px 5px 5px gray;">
                    		<p class="card-text"><c:out value="${ listTempsParJeu}"></c:out></p>
                    	</div>
                    </c:forEach>
                    
                    <div class="h-divider" style="margin-top:15px;margin-bottom:5px;height:1px;width:100%;border-top:1px solid gray;"></div>
                    
                    <h2>Votre niveau</h2>
                    <div style="color:orangered;background-color:#F5F5DC;margin:5px;padding:5px;border-radius:5px;box-shadow: 5px 5px 5px gray;">
                    	<p class="card-text">Le score global sur l'ensemble des jeux auxquels vous êtes inscrit est de : <c:out value="${ pointsTotauxJoueur}"></c:out> sur <c:out value="${ pointsTotalPossible}"></c:out></p>
                	</div>
                </div>
                </div>
            </div>
            <div class=" col-12 col-lg-3"></div>
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
