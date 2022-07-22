
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
        integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">
    <title>MNS SeriousGame</title>
</head>

<body>
    <div class="bg-dark">
        <div class="container">
            <div class="row">
                <nav class="col navbar navbar-expand-lg navbar-dark">
                    <div class="navbar-brand">
                        <img src="./img/logo.png" width="50" height="50" alt="Site logo" style="border-radius:100%">
                        MNS SeriousGame
                    </div>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div id="navbarContent" class="collapse navbar-collapse">
                        <ul class="navbar-nav">
                            <li class="nav-item active">
                                <div class="nav-link" style="color:orangered;">Accueil</div>
                            </li>
                        </ul>    
                    </div>
                    <form class="text-right" action="login" method="get">
                            <button type="submit" class="btn btn-light" style="color: orangered;background-color:white;">Se connecter</button>
                    </form>
                </nav>
            </div>
        </div>
    </div>
    
    <div class="container">
        <div class="row m-3">
          <div class="col">          
            <div id="carouselControls" class="carousel slide" data-ride="carousel">
              <div class="carousel-inner shadow-lg ">
                <div class="carousel-item active">
                  <img src="./img/apprenant0.jpg" class="d-block w-100 " alt="Image Ifa">
                </div>
                <div class="carousel-item">
                    <img src="./img/apprenant.jpg" class="d-block w-100 " alt="Metz Cathédrale">
                  </div>
                <div class="carousel-item">
                  <img src="./img/apprenant2.jpg" class="d-block w-100 " alt="Metz Coislin">
                </div>
              </div>
              <a class="carousel-control-prev" href="#carouselControls" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
              </a>
              <a class="carousel-control-next" href="#carouselControls" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
              </a>          
            </div>        
          </div>
        </div>

        <form class="row m-3" action="login" method="get">
           
            <button type="submit"  name="action" value="login" class="col-12 col-lg-4" style="padding:0;border-radius:5px;box-shadow: 5px 5px 5px grey;">
                <div class="card border-dark">
                    <img class="card-img-top" src="./img/test.png" alt="image">
                    <div class="card-body ">
                        <h5 class="card-title">Testez vos compétences</h5>
                        <p class="card-text">Sur des sujets utiles à votre vie quotidienne et/ou professionelle.</p>
                    </div>
                </div>
            </button>
            <button type="submit"  name="action" value="login" class="col-12 col-lg-4" style="padding:0;border-radius:5px;box-shadow: 5px 5px 5px grey;">
                <div class="card border-dark">
                    <img class="card-img-top" src="./img/learn.png" alt="image">
                    <div class="card-body pt-5">
                        <h5 class="card-title">Apprenez de facon ludique</h5>
                        <p class="card-text">Chacune de vos réponses vous permettent de progresser.</p>
                    </div>
                </div>
            </button>
            <button type="submit"  name="action" value="login" class="col-12 col-lg-4" style="padding:0;border-radius:5px;box-shadow: 5px 5px 5px grey;">
                <div class="card border-dark">
                    <img class="card-img-top" src="./img/Challenge.png" alt="image">
                    <div class="card-body">
                        <h5 class="card-title">Défiez votre entourage</h5>
                        <p class="card-text">Le systeme d'évaluation vous permet d'enregistrer votre progression.</p>
                    </div>
                </div>
            </button>
            
        </form>
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