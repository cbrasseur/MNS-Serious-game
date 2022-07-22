<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                                <button type="input" class="btn btn-dark"  name="action" value="inscrire">Participants</button>
                            </li>
                            <li class="nav-item">
                                <button type="input" class="btn btn-dark" style="color:orangered;" name="action" value="editer">Editeur Serious Game</button>
                            </li>
                            <li class="nav-item">
                                <button type="input" class="btn btn-dark" name="action" value="jeux">Mes Serious Games</button>
                            </li>
                        </ul>
                    </div>
                
                
            <div class="text-right">
            	
                <button type="submit" class="btn btn-light" style="color: orangered;background-color:white;" name="action" value="deco">Déconnecter</button>
            </div>
            </nav>
            </form>
            

        </div>

    </div>

    <div class="row m-3">
        <div class="col-lg-3"></div>
        <div class="col-lg-6" style="text-align: center;">
            <h2>Voici votre éditeur de questions</h2>
            <p>Choissisez de créer un Serious Game ou reprendre la création d'un scénario existant</p>
        </div>
        <div class="col-lg-3"></div>
    </div>

 <form action="pageCreation1" method="post">
        <div class="row">
        
            <div class="col-lg-3 "></div>
            
                <div class="col-lg-6 ">
               
                    <button type="submit" class="btn-lg btn-dark " style="color: orangered; width: 100%;" name="action" value="nouveauScenario">Créer un
                        nouveau Serious Game</button>
                
                </div>
            <div class="col-lg-3"></div>
            
        </div>
</form>
        
<c:forEach items = "${ scenarios }" var = "scenario">
<form action="pageCreation1" method="post">
		<div class="row m-3">
            
                <div class="col-lg-3"></div>
                
                <div class="card col-lg-6" style="box-shadow: 5px 5px 5px gray;">
	                <input type="hidden" name="scenarioComplet" value="${ scenario.nom }" />
	            	<input type="hidden" name="idaChoper" value="${ scenario.idScenario }" />
                    <div class="card-body " style="text-align: center;">
                        <p><c:out value="${ scenario.nom }"></c:out></p>
                        
                        <button type="submit" class="btn btn-warning col-lg-4" name="action" value="editerscenario">Editer</button>
                        <button type="submit" class="btn btn-danger col-lg-4" name = "action" value="supprimerscenario">Supprimer</button>
                    </div>
               
                </div>
                
                <div class="col-lg-3"></div>
                
        </div>
</form> 
</c:forEach>

        



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