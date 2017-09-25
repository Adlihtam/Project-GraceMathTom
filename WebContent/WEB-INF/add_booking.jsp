<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="fr">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Meeting rooms agenda</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet">


    <!-- Custom CSS -->
    <link href="Ressources/css/style.css" rel="stylesheet">

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
            <a class="navbar-brand" href="index">Meeting rooms agenda</a>
        </div>
        <!-- /.navbar-header -->

        <ul class="nav navbar-top-links navbar-right">
            <li class="dropdown">
                <a class="dropdown-toggle navlink" data-toggle="dropdown" href="#">
                    <i class="fa fa-gear fa-fw"></i> Gestion <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-user">
                    <li><a href="add_event.html"><i class="fa fa-edit fa-fw"></i> Ajouter un évènement</a>
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
                <h1 class="page-header">Ajouter une réservation</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="row">
            <div class="col-xs-12 col-lg-10 col-lg-offset-1">
                <!-- /.panel -->
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="row">
                            <form action="add_booking" method="post" class="">
                            <input type="hidden" name="status" id="status" value="admin">
                                <div class="col-xs-12"><h3>Réservation manuelle</h3></div>
                                <div class="col-xs-12 col-md-6">
                                    <div class="form-group">
                                        <label for="title">Objet de la réservation</label>
                                        <input type="text" class="input-lg form-control" id="title" name="titre"
                                               placeholder="Objet de la réservation">
                                    </div>
                                    <div class="form-group">
                                        <label for="member">Organisateur</label>
                                        <select class="input-lg form-control" id="member" placeholder="Membre" name="membre">
                                            <c:forEach items="${listMembres}" var="membre">
                                            	<option value="${membre.membre_id }">${membre.nom} ${membre.prenom }</option>
                                            	</c:forEach>
                                        </select>
                                    </div>

                                    <div class="form-group">
                                        <label for="member">Salle</label>
                                        <select class="input-lg form-control" id="room" placeholder="Salle" name="salle">
                                            <option class="capacite0" value="0">Sans préférence</option>
                                            <c:forEach items="${listSalles}" var="salle">
                                            	<option class="capacite${salle.capacite}" value="${salle.salle_id }">${salle.nom} (capacité : ${salle.capacite})</option>
                                            	</c:forEach>
                                        </select>
                                    </div>

                                    <div class="form-group">
                                        <label for="datepicker">Horaire</label>
                                        <div class="ia-widget">
                                            <select class="input-lg form-control" id="select-widget" name="horaire">
                                                <option value="1">Le plus tôt possible</option>
                                                <option value="2">La semaine prochaine</option>
                                                <option value="3">Le mois prochain</option>
                                                <option value="4">Choisir date/horaire</option>
                                            </select>
                                        </div>

                                        <div class="hour-widget hidden">
                                            <input class="input-lg form-control flex-2" type="text" id="datepicker"
                                                   placeholder="JJ/MM/AAAA"/ name="date">
                                            <select class="input-lg form-control flex-1" placeholder="Heure" name="heure">
                                                <option value="8">8</option>
                                                <option value="9">9</option>
                                                <option value="10">10</option>
                                                <option value="11">11</option>
                                                <option value="12">12</option>
                                                <option value="13">13</option>
                                                <option value="14">14</option>
                                                <option value="15">15</option>
                                                <option value="16">16</option>
                                                <option value="17">17</option>
                                                <option value="18">18</option>
                                                <option value="19">19</option>
                                            </select>
                                            <select class="input-lg form-control flex-1" placeholder="Minute" name="minute">
                                                <option value="0">00</option>
                                                <option value="15">15</option>
                                                <option value="30">30</option>
                                                <option value="45">45</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-md-6">
                                    <div class="form-group">
                                        <label for="duree">Durée</label>
                                        <select class="input-lg form-control" id="duree" placeholder="Durée" name="duree">
                                            <option value="30">0h30</option>
                                            <option value="60">1h00</option>
                                            <option value="90">1h30</option>
                                            <option value="120">2h00</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="people">Nombre de participants</label>
                                        <select class="input-lg form-control" id="people" name="people"
                                                placeholder="Nombre de participants">
                                            <option class="capacite" value="2">2</option>
                                            <option class="capacite" value="3">3</option>
                                            <option class="capacite" value="4">4</option>
                                            <option class="capacite" value="5">5</option>
                                            <option class="capacite" value="6">6</option>
                                            <option class="capacite" value="7">7</option>
                                            <option class="capacite" value="8">8</option>
                                            <option class="capacite" value="9">9</option>
                                            <option class="capacite" value="10">10</option>
                                            <option class="capacite" value="15">15</option>
                                            <option class="capacite" value="20">20</option>
                                            <option class="capacite" value="25">25</option>
                                            <option class="capacite" value="30">30</option>
                                            <option class="capacite" value="35">35</option>
                                            <option class="capacite" value="40">40</option>
                                            <option class="capacite" value="45">45</option>
                                            <option class="capacite" value="50">50</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>Besoins supplémentaires</label>
                                        <div class="form-group">
                                        <c:forEach items="${listEquip}" var="equipement">
                                            <label><input type="checkbox" name="matos" value="${equipement.materiel}"><c:out value="${equipement.materiel}"></c:out></label><br>
                                        </c:forEach>
                                        </div>
                                    </div>
                                    <div class="text-right">
                                        <button type="submit" class="btn btn-lg btn-primary">Enregistrer</button>
                                    </div>
                                </div>
                            </form>
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

<!-- JQUERY UI -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"
        integrity="sha256-VazP97ZCwtekAsvgPBSUwPFKdrwD3unUfSGVYrahUqU="
        crossorigin="anonymous"></script>

<script>
    $(function () {
        $("#datepicker").datepicker({
        	dateFormat: 'dd/mm/yy',
        	minDate: 0,
        });

        $("#select-widget").on("change", function () {
            if ($(this).val() == 4) {
                $(".hour-widget").removeClass("hidden");
            } else {
                $(".hour-widget").addClass("hidden");
            }
        });
        
        $('#room').on("change",function(){
        		var capacite = $('select[name="salle"] :selected').attr('class').replace("capacite","");
        		$("#people").html("");
        		if(capacite == 0){
        			capacite = 50;
        		}
        		for( var i=2;i<=capacite;i++){
        			$("#people").append('<option value="' + i + '">' + i + '</option>');
        		}
        	
        });

    });
</script>

</body>

</html>
