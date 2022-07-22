<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
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
    
    	<div class="row">
        	<div class="col-lg-3"></div>
        	<div class="col-lg-6 m-3">
    			<h2>Formulaire d'inscription pour un nouveau participant</h2>
    			<c:if test="${ dejaInscrit.equals('true') }"><h2 style="background-color:red;color:white;">Cet utilisateur est déja inscrit. Saisir un nouvel email</h2></c:if>
    		</div>
        	<div class="col-lg-3"></div>
    	</div>
  <form class="needs-validation "  novalidate action="pageParticipants" method="post" >
  	<div class="row">
            <div class="col-lg-3"></div>
            <div class="form-group col-lg-6 m-3">
      		<label for="validationCustom01">Nom</label>
      		<input name= "nom" type="text" class="form-control" id="validationCustom01"  required>
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
	 		<input name= "prenom" type="text" class="form-control" id="validationCustom02"  required>
	  		<div class="valid-feedback">
       			Très bien!
     		</div>
		</div>
            <div class="col-lg-3"></div>
        </div>
	   <div class="row">
            <div class="col-lg-3"></div>
            <div class="form-group col-lg-6 m-3">
		  <label for="validationCustom03">Adresse mail <span style="font-size:x-small;color:red;">(champ obligatoire)</span></label>
		  <input name= "email" type="text" class="form-control" id="validationCustom03"  required="required" <c:if test="${ emailVierge.equals('vide') }">style="background-color:orangered;" placeholder="Saisir un email"</c:if>>
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
		  <input name= "password" type="password" class="form-control"  id="validationCustom04"  required>
		  <div class="valid-feedback">
	       Très bien!
	     </div>
		</div>
            <div class="col-lg-3"></div>
        </div>  
        
        <div class="row">
            <div class="col-lg-3"></div>
            <div class="col-lg-6 m-3 form-group">
                <label class="labeltext">Type de profil : </label>
                <div class="form-check-inline">
                    <label class="customradio" style="padding: 10px;">Joueur<input type="radio" checked="checked" name="radio" value="1"></label>    
                    <label class="customradio" style="padding: 10px;">Administrateur<input type="radio" name="radio" value="2"></label>    
                </div>
            </div>
            <div class="col-lg-3"></div>
        </div>
        
	  <div class="row">
            <div class="col-lg-3"></div>
            <div class="form-group col-lg-6 m-3">
	      <label for="validationCustom05">Choix du Serious Game <span style="font-size:x-small;color:red;">(champ obligatoire)</span></label>
	      <c:if test="${choixJeuVide.equals('vide') }"><p style="background-color:orangered;color:white;">Vous devez inscrire un joueur sur un jeu</p></c:if>
	      <select name="jeu" class="custom-select" id="validationCustom05"  required="required">
	        <option selected disabled value="">Sélectionner...</option>
	        <c:forEach items="${scenarios}" var="scenario">
	        	<option value="${scenario.idScenario}"><c:out value="${scenario.nom}"></c:out></option>
	        </c:forEach>
	      </select>
		   <div class="valid-feedback">
	       Très bien!
	     </div>
	      <div class="invalid-feedback">
	        Veuillez choisir un Serious Game !
	      </div>
	    </div>
            <div class="col-lg-3"></div>
        </div>
  <div class="row">
            <div class="col-lg-5 "></div>
  <button class="btn btn-dark col-lg-2 m-3" name="action" value="inscrire" style="color: orangered;" type="submit">Envoyer inscription</button>
  <div class="col-lg-5"></div>
        </div>
</form>

<div class="h-divider"></div>
<style type="text/css">
        .h-divider {
            margin-top: 5px;
            margin-bottom: 5px;
            height: 10px;
            width: 100%;
            border-top: 1px solid orangered;
        }
    </style>

    <div class="row">
        <div class="col-lg-3"></div>
        <div class="col-lg-6 m-3">
            <p></p>
            <h2 style="text-align: center;">Liste des Participants</h2>
        </div>
        <div class="col-lg-3"></div>
    </div>
    <div class="row">
        <div class="col-lg-3"></div>
        <div class="col-lg-6 m-3">
    		<form action = "pageParticipants" method = "post">
				<select name="jeu" class="custom-select" id="validationCustom06" required>
	        		<option selected disabled >Selectionner ...</option>
	        		<c:forEach items="${scenarios}" var="scenario">
	        			<option value="${scenario.idScenario}"><c:out value="${scenario.nom}"></c:out></option>	
	        		</c:forEach>
	      		</select>
 				<div class="row">
            		<div class="col-lg-5 "></div>
  					<button class="btn btn-dark col-lg-2 m-3" name="action" value="lister" style="color: orangered;" type="submit">Afficher Participants</button>
  					<div class="col-lg-5"></div>
        		</div>
        	</form>
    </div>
        <div class="col-lg-3"></div>
    </div>
    <h3 style="text-align:center;">Voici les participants au jeu intitulé : <c:out value="${ titre }"></c:out></h3>
    <div class="row">
        <div class="col-lg-3 m-2"></div>
        <table class="table table-striped table-dark col-lg-6">
			<thead>
				<tr>
					<!-- th les colonnes -->
					<th scope="col" style="width: 25%">Nom</th>
					<th scope="col" style="width: 20%">Prenom</th>
					<th scope="col" style="width: 20%">Email</th>
					<th scope="col" style="width: 20%">Gestion profil</th>
				</tr>
			</thead>
			<tbody>
			
			
				<c:forEach items="${participants}" var="participant">
					<form action="pageParticipants" method="post">
						<tr>
							<td><c:out value="${participant.nom}"></c:out></td>
							<td><c:out value="${participant.prenom}"/></td>
							<td><c:out value="${participant.email}"></c:out></td>
							<td>
							<input type="hidden" name="idparticipant" value="${ participant.idUtilisateur }" />
								
								<button type="submit" name="action" value="modifier" class="btn btn-danger">Modifier Profil</button>
							</td>
						</tr>
					</form> 
						
					
				</c:forEach>

			</tbody>
		</table>
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