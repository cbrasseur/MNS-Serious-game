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

<input type="hidden" name="scenarioNom" value="${ scenarioComplet }" />
    <form action="pageCreation3" method = "post">
        <div class="row">
            <div class="col-lg-3"></div>
            <div class="col-lg-6 m-3">
                <h2>Questions/réponses</h2>
                <h5>Renseignez les questions du jeu intitulé : <span style="color:orangered;"><c:out value ="${ scenarioComplet }" ></c:out></span></h5>
            </div>
            <div class="col-lg-3"></div>
        </div>

        <div class="row">
            <div class="col-lg-3"></div>
            <div class="form-group col-lg-6">
                <label for="exampleInputQuestion">Question</label>
                <input type="text" class="form-control" name="inputQuestion" aria-describedby="QuestionHelp"
                    placeholder="Insérer votre question" required="required">
            </div>
            <div class="col-lg-3"></div>
        </div>
        <div class="row">
            <div class="col-lg-3"></div>
            <div class="form-group col-lg-6">
                <label for="inputReponse1">Réponse attendue</label>
                <input type="text" class="form-control" name="inputReponse1" aria-describedby="Reponse1Help"
                    placeholder="Insérer la réponse attendue" required="required">
            </div>
            <div class="col-lg-3"></div>
        </div>
        <div class="row">
            <div class="col-lg-3"></div>
            <div class="form-group col-lg-6">
                <label for="inputReponse2">Réponse érronée</label>
                <input type="text" class="form-control" name="inputReponse0" aria-describedby="Reponse2Help"
                    placeholder="Insérer la réponse fausse" required="required">
            </div>
            <div class="col-lg-3"></div>
        </div>
        <div class="row">
            <div class="col-lg-3"></div>
            <div class="form-group col-lg-6">
                <label for="inputReponse2">Image</label>
                <input type="text" class="form-control" name="inputImg" aria-describedby="Reponse2Help"
                    placeholder="Copier un lien vers une image">
            </div>
            <div class="col-lg-3"></div>
        </div>

        <div class="row">
            <div class="col-lg-3"></div>
            <div class="col-lg-6 m-3 form-group">
                <label class="labeltext">Difficulté : </label>
                <div class="form-check-inline">
                    <label class="customradio" style="padding: 10px;"><span class="radiotextsty">Niveau 1</span><input type="radio" checked="checked" name="radio" value="1"></label>    
                    <label class="customradio" style="padding: 10px;"><span class="radiotextsty">Niveau 2</span><input type="radio" name="radio" value="2"></label>    
                    <label class="customradio" style="padding: 10px;"><span class="radiotextsty">Niveau 3</span><input type="radio" name="radio" value="3"></label>   
                </div>
            </div>
            <div class="col-lg-3"></div>
        </div>

        <div class="row">
            <div class="col-lg-5 "></div>
            <button type="submit" class="btn btn-dark col-lg-2 m-3" style="color: orangered;">Enregister question</button>
            <div class="col-lg-5"></div>
        </div>
        <input type="hidden" name="idaRecup" value="${ idaRecup }" />
        <input type="hidden" name="scenarioNom" value="${ scenarioComplet }" />
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
            <h2>Voici la liste de vos questions enregistrées</h2>
        </div>
        <div class="col-lg-3"></div>
    </div>

    <div class="row">
        <div class="col-lg-3 m-2"></div>
        <table class="table table-striped table-dark col-lg-6">
            <thead>
                <tr>
                    <th scope="col">Numero de la question</th>
                    <th scope="col">Questions</th>
                    <th scope="col">Difficulté</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${listeQuestions}" var="question">
				<tr>
							<td><c:out value="${question.idQuestion}"></c:out></td>
							<td><c:out value="${question.question}"></c:out></td>
							<td><c:out value="${question.difficulte}"></c:out></td>
				</tr>
				</c:forEach>
            </tbody>
        </table>
        <div class="col-lg-2"></div>
    </div>
    
    <div class="row">
        <div class="col-lg-3"></div>
        <div class="col-lg-6 m-3">
            <h2>Voici la liste des réponses Correspondantes</h2>
        </div>
        <div class="col-lg-3"></div>
    </div>

    <div class="row">
        <div class="col-lg-3 m-2"></div>
        <table class="table table-striped table-dark col-lg-6">
            <thead>
                <tr>
                    <th scope="col">Numero de la question</th>
                    <th scope="col">Reponse</th>
                    <th scope="col">Valeur (0 si mauvaise réponse)</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${listeReponses}" var="reponse">
				<tr>
							<td><c:out value="${reponse.idQuestion}"></c:out></td>
							<td><c:out value="${reponse.reponse}"></c:out></td>
							<td><c:if test="${reponse.valeur == 0}">Mauvaise réponse</c:if><c:if test="${reponse.valeur != 0}">Bonne réponse</c:if> <c:out value="${reponse.valeur}"></c:out> point(s)</td>
							<input type="hidden" name="idReponse" value="${reponse.idReponse }" />
							
				</tr>
				</c:forEach>
            </tbody>
        </table>
        <div class="col-lg-2"></div>
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