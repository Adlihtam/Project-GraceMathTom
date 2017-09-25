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

    <title>Meeting Rooms Agenda</title>

    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../css/style.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"
          type="text/css">

    <!-- FullCalendar.io -->
    <link href="http://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.3.0/fullcalendar.min.css" rel="stylesheet">
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
                    <li><a href="add_event"><i class="fa fa-edit fa-fw"></i> Ajouter un évènement</a>
                    </li>
                    <li><a href="add_member"><i class="fa fa-user fa-fw"></i> Ajouter un membre</a>
                    </li>
                </ul>
            </li>
        </ul>
    </nav>

    <div id="page-wrapper" class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Panneau d'administration</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>

        <!-- /.row -->
        <div class="row">
            <div class="col-lg-4">
                <!-- /.panel -->
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <i class="fa fa-user fa-fw"></i> Gestion des membres
                    </div>
                    <div class="text-right">
                    	</br>
                        <a id="bouton-ajout" href="add_member" class="btn btn-lg btn-success"><i class="fa fa-plus"></i>Ajouter un nouveau membre</a>
                        </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="table-responsive">
                                    <table class="table table-hover table-striped">
                                        <thead>
                                        <tr>
                                            <th>Nom</th>
                                            <th>Prénom</th>
                                            <th>Email</th>
                                            <th>Birthdate</th>
                                            <th class="text-right">Action</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${listMembres}" var="membre">
                                        <tr>
                                            <td><c:out value="${membre.nom }"></c:out></td>
                                            <td><c:out value="${membre.prenom }"></c:out></td>
                                            <td><c:out value="${membre.email}"></c:out></td>
                                            <td><c:out value="${membre.date_naissance }"></c:out></td>
                                            <td class="text-right">
                                                <a href="edit_membre?type=Edit&id=${membre.membre_id}" class="btn btn-xs btn-warning"><i class="fa fa-pencil"></i>
                                                </a>
                                                <a href="edit_membre?type=Delete&id=${membre.membre_id}" class="btn btn-xs btn-danger"><i class="fa fa-trash"></i>
                                                </a>
                                            </td>
                                        </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                    <div class="text-center">
                                        <ul class="pagination">
                                            <li><a href="#">1</a></li>
                                            <li><a href="#">2</a></li>
                                            <li><a href="#">3</a></li>
                                        </ul>
                                    </div>
                                </div>
                                <!-- /.table-responsive -->
                            </div>
                        </div>
                        <!-- /.row -->
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-8 -->
            <div class="col-lg-8">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <i class="fa fa-calendar fa-fw"></i> Calendar
                    </div>
                    <div class="panel-body" id="agendas">

                        <div class="text-right">
                            <a href="add_booking" class="btn btn-lg btn-success"><i class="fa fa-plus"></i> Add new event</a>
                        </div>

                        <!-- Nav tabs -->
                        <ul class="nav nav-tabs" role="tablist" id="nav-calendar">
                        	<c:forEach items="${listSalles}" var="salle" varStatus = "status">
                        		<li role="presentation" class="liSalle ${status.first ? 'active' : ''}" id="liSalle${salle.salle_id}"><a href="#room${salle.salle_id}" aria-controls="room${salle.salle_id}" role="tab" data-toggle="tab"><c:out value="${salle.nom}"></c:out></a>
                        	</c:forEach>
                        </ul>
                        <div class="tab-content">
	                        <c:forEach items="${listSalles}" var="salle">
	                        		<div role="tabpanel" class="tab-pane calendar-panel" id="room${salle.salle_id }">
	                                <div id="calendar${salle.salle_id }"></div>
	                            </div>
	                        </c:forEach>
                        </div>
                    </div>
                    <!-- /.panel-body -->
                </div>
            </div>
            <!-- /.col-lg-4 -->
        </div>
        <!-- /.row -->
    </div>
    
                    <div class="panel panel-default col-lg-4">
                    <div class="panel-heading">
                        <i class="fa fa-user fa-fw"></i> Gestion des salles
                    </div>
                    <div class="text-right">
                    	</br>
                        <a id="bouton-ajout" href="add_room" class="btn btn-lg btn-success"><i class="fa fa-plus"></i>Ajouter une nouvelle salle</a>
                        </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="table-responsive">
                                    <table class="table table-hover table-striped">
                                        <thead>
                                        <tr>
                                            <th>Nom</th>
                                            <th>Capacité</th>
                                            <th>Matériel</th>
                                            <th class="text-right">Action</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${listSalles}" var="salle">
                                        <tr>
                                            <td><c:out value="${salle.nom}"></c:out></td>
                                            <td><c:out value="${salle.capacite}"></c:out></td>
                                            <td>
	                                            <c:forEach items="${salle.equipements }" var ="equip">
	                                            		<c:out value="${equip.materiel}"></c:out>
	                                            </c:forEach>    
                                            </td>
                                            <td class="text-right">
                                                <a href="edit_room?type=Edit&id=${salle.salle_id}" class="btn btn-xs btn-warning"><i class="fa fa-pencil"></i>
                                                </a>
                                                <a href="edit_room?type=Delete&id=${salle.salle_id}" class="btn btn-xs btn-danger"><i class="fa fa-trash"></i>
                                                </a>
                                            </td>
                                        </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                    <div class="text-center">
                                        <ul class="pagination">
                                            <li><a href="#">1</a></li>
                                            <li><a href="#">2</a></li>
                                            <li><a href="#">3</a></li>
                                        </ul>
                                    </div>
                                </div>
                                <!-- /.table-responsive -->
                            </div>
                        </div>
                        <!-- /.row -->
                    </div>
                    <!-- /.panel-body -->
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

<!-- FullCalendar.io -->
<script src='http://cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment.min.js'></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.3.0/fullcalendar.min.js"></script>

<script>
    $(document).ready(function () {
    	
    		var id=$(".liSalle,.active").attr('id').replace('liSalle',"");
    		$('#calendar'+id).fullCalendar({
                header: {
                      left: 'prev,next',
                      center: 'title',
                      right: 'agendaWeek,listWeek,listDay'
                  },
                  businessHours: {
                      dow: [1, 2, 3, 4, 5], // Monday - Friday
                      start: '08:00',
                      end: '20:00'
                  },
                  views: {
                      agendaWeek: {buttonText: 'Agenda semaine'},
                      listDay: {buttonText: 'Liste jour'},
                      listWeek: {buttonText: 'Liste semaine'}
                  },
                  
                  defaultView: 'listWeek',
                  navLinks: true, // can click day/week names to navigate views
                  weekends: false,
                  locale: 'fr',
                  defaultDate: Date.now(),
                  weekNumberCalculation: 'ISO',
                  minTime: "08:00:00",
                  maxTime: "20:00:00",
                  height: 400,
                  render:true,
                  editable: false,
                  events: "calendar?id="+id,
                  eventRender: function (event, element) {
                      if (event.membre) {
                          element.children(".fc-content").append("<div><small>" + event.intitule + "</small></div>");
                          element.children(".fc-content").append("<div><small>" + event.membre + "</small></div>");
                          element.children(".fc-widget-content").last().append(" <small>" + event.intitule + "</small>");
                          element.children(".fc-widget-content").last().append(" <small>" + event.membre + "</small>");
                      }
                  }
              });
    	// For the example
        var day = new Date(Date.now());
        day.setHours(12);
        day.setMinutes(0);
        // End example

        moment.locale('fr');
        
	   $(".liSalle").on("click",function(){
		   var id = $(this).attr('id').replace("liSalle",""); 
		   $('#calendar'+id).fullCalendar({
			   defaultView: 'agendaWeek',
               header: {
                     left: 'prev,next',
                     center: 'title',
                     right: 'agendaWeek,listWeek,listDay'
                 },
                 
                 businessHours: {
                     dow: [1, 2, 3, 4, 5], // Monday - Friday
                     start: '08:00',
                     end: '20:00'
                 },
                 views: {
                     agendaWeek: {buttonText: 'Agenda semaine'},
                     listDay: {buttonText: 'Liste jour'},
                     listWeek: {buttonText: 'Liste semaine'}
                 },
                 navLinks: true, // can click day/week names to navigate views
                 weekends: false,
                 locale: 'fr',
                 defaultDate: Date.now(),
                 weekNumberCalculation: 'ISO',
                 minTime: "08:00:00",
                 maxTime: "20:00:00",
                 height: 400,
                 editable: false,
                 events: "calendar?id="+id,
                 eventRender: function (event, element) {
                     if (event.membre) {
                         element.children(".fc-content").append("<div><small>" + event.intitule + "</small></div>");
                         element.children(".fc-content").append("<div><small>" + event.membre + "</small></div>");
                         element.children(".fc-widget-content").last().append(" <small>" + event.intitule + "</small>");
                         element.children(".fc-widget-content").last().append(" <small>" + event.membre + "</small>");
                     }
                 }
             });
	   });
	   
	                
    });
</script>

</body>

</html>
