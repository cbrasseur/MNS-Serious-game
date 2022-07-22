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

  <link
  rel="stylesheet"
  href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
  integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
  crossorigin="anonymous"
  >
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
    <div class="card col-lg-6">
        <div class="card-body " style="text-align: center;">
            <p>Afin de vous permettre d'evaluer les compétences de vos participants
                nous allons vous permettre de créer votre propre jeu de questions.
                Tout d'abord vous devez choisir la taille de la partie.
                Vous allez créer vos questions en 3 catégories: Facile , Normal ,
                Difficile.
                Chacune de ces catégories rapportera plus ou moins de points.
                Quand un paricipants répond correctement, il obtient une question du
                niveau supérieur. S'il se trompe il obtient une question à la difficulté
                moindre ( donc moins de points en fin de partie.)</p>
        </div>
    </div>
    <div class="col-lg-3"></div>
</div>

<form action="pageCreation2" method="post">
    <div class="row">
        <div class="col-lg-3"></div>
        <div class="form-group col-lg-6">
            <label for="inputNom">Titre de votre Serious Game</label>
            <input name="inputNom" type="text" class="form-control" id="inputNom" aria-describedby="nom1Help"
                placeholder="Titre..." required="required">
        </div>
        <div class="col-lg-3"></div>
    </div>
    
    <div class="row">
        <div class="col-lg-3"></div>
        <div class="form-group col-lg-6">
            <label for="inputDescription">Décrivez rapidement le theme de voter Serious Game</label>
            <input name="inputDescription" type="text" class="form-control" id="inputNom" aria-describedby="nom1Help"
                placeholder="Description..." required="required">
        </div>
        <div class="col-lg-3"></div>
    </div>
    
    <div class="row">
        <div class="col-lg-3"></div>
        <div class="form-group col-lg-6">
            <label for="inputImg">Copier un lien vers une image d'illustration trouvée sur le web</label>
            <input name="inputImg" type="text" class="form-control" id="inputNom" aria-describedby="nom1Help"
                placeholder="Copier l'adresse de l'image de votre choix">
        </div>
        <div class="col-lg-3"></div>
    </div>

    <div class="row">
        <div class="col-lg-3"></div>
        <div class="form-group col-lg-6">
            <label for="exampleInputChoix">Choissisez le nombre d'étapes de votre Serious Game</label><br>
            <select name="choixNombre"  style="width: 100%;height: 50px;">
                <optgroup>
                    <option value="12" selected>12 questions</option>
                    <option value="15">15 questions</option>
                    <option value="18">18 questions</option>
                    <option value="21">21 questions</option>
                    <option value="24">24 questions</option>
                    <option value="27">27 questions</option>
                    <option value="30">30 questions</option>
                    <option value="33">33 questions</option>
                    <option value="36">36 questions</option>
                </optgroup>
            </select>
        </div>
        <div class="col-lg-3 m-3"></div>
    </div>

    <div class="row">
        <div class="col-lg-5 "></div>
        <button type="submit" class="btn btn-dark col-lg-2 m-3" style="color: orangered;" name = "action" value = "valider">Valider</button>
        <div class="col-lg-5"></div>
    </div>

</form>

  <%@ include file="footer.jsp" %>
  <!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
</html>