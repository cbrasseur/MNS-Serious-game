<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<!-- bibliotheque JSTL : il faut aussi ajouter la librairie JSTL.jar dans WEB-INF lib -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>

    <!-- Required meta tags ------------------------------------------------------------------------------------------------------------>
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
                                <button type="input" class="btn btn-dark" style="color:orangered;" name="action" value="inscrire">Participants</button>
                            </li>
                            <li class="nav-item">
                                <button type="input" class="btn btn-dark" name="action" value="editer">Editeur Serious Game</button>
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

<h1 style="text-align:center;">Gestion du joueur</h1>
<form class="needs-validation "  novalidate action="editerProfil" method="post" >

<input type="hidden" name="idjoueur" value="${ idUtilisateur }" />

  	<div class="row">
            <div class="col-lg-3"></div>
            <div class="form-group col-lg-6 m-3">
      		<label for="validationCustom01">Nom</label>
      		<input name= "nom" type="text" class="form-control" value="${ joueur.nom }"  required>
		  	<div class="valid-feedback">
        		Très bien!
      		</div>
    	</div>
            <div class="col-lg-3"></div>
        </div>
  	<div class="row">
            <div class="col-lg-3"></div>
            <div class="form-group col-lg-6 m-3">
	  		<label for="validationCustom02">Prénom</label>
	 		<input name= "prenom" type="text" class="form-control" value="${ joueur.prenom }"  required>
	  		<div class="valid-feedback">
       			Très bien!
     		</div>
		</div>
            <div class="col-lg-3"></div>
        </div>
	   <div class="row">
            <div class="col-lg-3"></div>
            <div class="form-group col-lg-6 m-3">
		  <label for="validationCustom03">Adresse mail</label>
		  <input name= "email" type="text" class="form-control" value="${ joueur.email }"  required>
		  <div class="valid-feedback">
	       Très bien!
	     </div>
		</div>
            <div class="col-lg-3"></div>
        </div>
	   <div class="row">
            <div class="col-lg-3"></div>
            <div class="form-group col-lg-6 m-3">
		  <label for="validationCustom04">Mot de passe</label>
		  <input name= "password" type="text" class="form-control"  value="${ joueur.password }"  required>
		  <div class="valid-feedback">
	       Très bien!
	     </div>
		</div>
            <div class="col-lg-3"></div>
        </div>  
        
        
<div class="row">
  <div class="col-lg-5 "></div>
  <button class="btn btn-dark col-lg-2 m-3" name="action" value="update" style="color: orangered;" type="submit">Mettre à jour</button>
  <div class="col-lg-5"></div>
</div>

<div class="h-divider" style="margin-top:15px;margin-bottom:5px;height:1px;width:100%;border-top:1px solid gray;"></div>
<!-- ------------------------------------------------------------------------------------------------------------------------------------------ -->
<h1 style="text-align:center;">Gestion des inscriptions</h1>
<p style="text-align:center;">Pour inscrire <c:out value="${ joueur.email }"></c:out> à un nouveau jeu, selectionnez un item dans la liste ci-dessous:</p>
 <div class="row">
        <div class="col-lg-3"></div>
        <div class="col-lg-6 m-3">
    		
				<select name="idAAjouter" class="custom-select" id="validationCustom06" required>
	        		<option selected disabled >Selectionner ...</option>
	        		<c:forEach items="${scenarios}" var="scenario">
	        			<option value="${scenario.idScenario}"><c:out value="${scenario.nom}"></c:out></option>	
	        		</c:forEach>
	      		</select>
 				<div class="row">
            		<div class="col-lg-5 "></div>
  					<button class="btn btn-dark col-lg-2 m-3" name="action" value="ajouter" style="color: orangered;" type="submit">Ajouter</button>
  					<div class="col-lg-5"></div>
        		</div>
        	
    </div>
        <div class="col-lg-3"></div>
    </div>
 <div class="row">
        <div class="col-lg-3 m-2"></div>
        <table class="table table-striped table-dark col-lg-6">
			<thead>
				<tr>
					<!-- th les colonnes -->
					<th scope="col" style="width: 25%">Numéro</th>
					<th scope="col" style="width: 20%">Nom du jeu</th>
					<th scope="col" style="width: 20%">Description</th>
					<th scope="col" style="width: 20%">Gestion du jeu</th>
				</tr>
			</thead>
			<tbody>
			
			
				<c:forEach items="${listeJeux}" var="jeu">
					<form action="editerProfil" method="post">
						<tr>
							<input type="hidden" name="idScenario" value="${ jeu.idScenario }" />
							<td><c:out value="${jeu.idScenario}"></c:out></td>
							<td><c:out value="${jeu.nom}"></c:out></td>
							<td><c:out value="${jeu.description}"/></td>
							
							<td>
								<button type="submit" name="action" value="radier" class="btn btn-danger">Supprimer</button>
							</td>
						</tr>
					</form> 
						
					
				</c:forEach>

			</tbody>
		</table>
		</div>
</form>
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