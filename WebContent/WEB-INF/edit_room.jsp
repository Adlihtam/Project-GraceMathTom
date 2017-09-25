<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Mood of the month</title>

    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../css/style.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"
          type="text/css">

</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top container-fluid" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index">Meeting Rooms Agenda</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
                <li class="dropdown">
                    <a class="dropdown-toggle navlink" data-toggle="dropdown" href="#">
                        <i class="fa fa-gear fa-fw"></i> Gestion <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="add_event.html"><i class="fa fa-edit fa-fw"></i> Ajouter un �v�nement</a>
                        </li>
                        <li><a href="add_member.html"><i class="fa fa-user fa-fw"></i> Ajouter un membre</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </nav>

        <div id="page-wrapper" class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Editer une salle</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1 col-sm-12 col-xs-12">
                    <!-- /.panel -->
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-xs-12">
                                    <form action="" method="post" class="">
                                <div class="col-xs-12 col-md-10 col-md-offset-1">
                                    <div class="form-group">
                                        <label for="name">Nom</label>
                                        <input type="text" class="input-lg form-control" name="name"
                                               placeholder="Nom de la salle de r�union" value="${salle.nom}"/>
                                               </br>
                                        <label for="people">Capacit� (X personnes)</label>
                                        <select class="input-lg form-control" id="people" name="people"
                                                placeholder="Nombre de participants" value="${salle.capacite}">
                                            <option ${salle.capacite == 2 ? 'selected="selected"' : ''}>2</option>
                                            <option ${salle.capacite == 3 ? 'selected="selected"' : ''}>3</option>
                                            <option ${salle.capacite == 4 ? 'selected="selected"' : ''}>4</option>
                                            <option ${salle.capacite == 5 ? 'selected="selected"' : ''}>5</option>
                                            <option ${salle.capacite == 6 ? 'selected="selected"' : ''}>6</option>
                                            <option ${salle.capacite == 7 ? 'selected="selected"' : ''}>7</option>
                                            <option ${salle.capacite == 8 ? 'selected="selected"' : ''}>8</option>
                                            <option ${salle.capacite == 9 ? 'selected="selected"' : ''}>9</option>
                                            <option ${salle.capacite == 10 ? 'selected="selected"' : ''}>10</option>
                                            <option ${salle.capacite == 15 ? 'selected="selected"' : ''}>15</option>
                                            <option ${salle.capacite == 20 ? 'selected="selected"' : ''}>20</option>
                                            <option ${salle.capacite == 25 ? 'selected="selected"' : ''}>25</option>
                                            <option ${salle.capacite == 30 ? 'selected="selected"' : ''}>30</option>
                                            <option ${salle.capacite == 35 ? 'selected="selected"' : ''}>35</option>
                                            <option ${salle.capacite == 40 ? 'selected="selected"' : ''}>40</option>
                                            <option ${salle.capacite == 45 ? 'selected="selected"' : ''}>45</option>
                                            <option ${salle.capacite == 50 ? 'selected="selected"' : ''}>50</option>
                                        </select>
                                        </br>
                                        <label>Mat�riel disponible</label>
                                        <div class="form-group">
                                        <c:forEach items="${listEquip}" var="equipement">
                                            <label>
                                            <input type="checkbox" name="matos" value="${equipement.materiel}" />
                                            	<c:out value="${equipement.materiel}"></c:out>
                                            	</label><br>
                                        </c:forEach>
                                        </div>
                                    </div>
                                    <div class="text-right">
                                        <button type="submit" class="btn btn-lg btn-primary">Enregistrer</button>
                                    </div>
                                </div>
                            </form>
                                </div>
                            </div>
                            <!-- /.row -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->
    <footer class="footer">
        <div class="container">
            <div class="row text-center">
                Resourcepool &bullet; 2017
            </div>
        </div>
    </footer>

    <!-- jQuery -->
    <script src='http://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</body>

</html>
