<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
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
    
    <div class="container">
        <div class="row">
            <div class="col-lg-6">
                <h1>Résultat</h1>
            </div>
            <div class="col-lg-6">
            	<p style="margin:20px;text-align:right;"><c:out value="${ connectedUser.nom } ${ connectedUser.prenom }" /></p>
            </div>
        </div>
        
        
        
        
        <form action="bonnereponse" method="get">
        
        <div class="row m-3">
            <div class="col-12 col-lg-12">
                <div class="card" style="background-color: green;box-shadow: 5px 5px 5px gray;">
                    <img src="img/orange.png" alt="orange" class="card-img-top" style="width:20%;">
                    <div class="card-body">
                        <h1 class="card-title" style="color:white;">BONNE REPONSE</h1>
                        <p class="card-text" style="color:white;">Cliquez pour passer à la question suivante</p>
                        <p class="card-text" style="color:white;">-----------------------------------------></p>
                        <input type="hidden" name="difficulte" value="${difficulte }" />
                        <div class=" text-right">
                        	<input type="hidden" name="idJeu" value="${idJeu }" />
                        	<button type="submit" name="action" value="jouer" class="btn stretched-link btn-lg" style="color: orange;width:20%;background-color:white;"
                            role="button">Go</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        </form>  
    </div>
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