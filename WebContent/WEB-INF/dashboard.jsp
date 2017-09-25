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

<title>Agenda Dashboard</title>

<!-- Bootstrap CSS -->
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="Ressources/css/style.css" rel="stylesheet">

<!-- Custom Fonts -->
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- FullCalendar.io -->
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.3.0/fullcalendar.min.css"
	rel="stylesheet">
</head>

<body>
        
	<div class="container-fluid" id="dashboard">
		<div class="half" id="salle${salle.salle_id}">
			<h1>Calendrier ${salle.nom}</h1>
			<div id="calendar-container" class="flex-1">
				<div id="calendar"></div>
			</div>
		</div>

		<div class="half-2">
			<form action="add_booking" method="post" class="">
				<input type="hidden" name="status" id="status" value="client">
				<div class="col-xs-12">
					<h3>Réservation manuelle</h3>
				</div>
				<div class="col-xs-12 col-md-12">
					<div class="form-group">
						<label for="titre">Objet de la réservation</label> <input
							type="text" class=" form-control" id="titre"
							placeholder="Objet de la réservation" name="titre">
					</div>
					<div class="form-group">
						<label for="membre">Membre</label> <select class=" form-control"
							id="membre" placeholder="Membre" name="membre">
							<c:forEach items="${listMembres}" var="membre">
								<option value="${membre.membre_id }">${membre.nom} ${membre.prenom }</option>
							</c:forEach>
						</select>
					</div>

					<div class="form-group">
						<label for="salle">Salle</label> <select class=" form-control"
							id="room" placeholder="Salle" name="salle">
							<option class="capacite0" value="0">Sans préférence</option>
							<c:forEach items="${listSalles}" var="salle">
								<option class="capacite${salle.capacite}"
									value="${salle.salle_id }">${salle.nom} (capacité : ${salle.capacite})</option>
							</c:forEach>
						</select>
					</div>

					<div class="form-group">
						<label for="datepicker">Horaire</label>

						<div class="ia-widget">
							<select class=" form-control" id="select-widget" name="horaire">
								<option>Le plus tôt possible</option>
								<option>La semaine prochaine</option>
								<option>Le mois prochain</option>
								<option value="4">Choisir date/horaire</option>
							</select>
						</div>

						<div class="hour-widget hidden">
							<input class=" form-control flex-2" type="text" id="datepicker"
								placeholder="JJ/MM/AAAA" name="date"/> <select
								class=" form-control flex-1" placeholder="Heure" name="heure">
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
							</select> <select class=" form-control flex-1" placeholder="Minute" name="minute">
								<option>00</option>
								<option>15</option>
								<option>30</option>
								<option>45</option>
							</select>
						</div>
					</div>
				</div>
				<div class="col-xs-12 col-md-12">
					<div class="form-group">
						<label for="duree">Durée</label> <select class=" form-control"
							id="duree" placeholder="Durée" name="duree">
							<option value="30">0h30</option>
							<option value="60">1h00</option>
							<option value="90">1h30</option>
							<option value="120">2h00</option>
						</select>
					</div>
					<div class="form-group">
						<label for="people">Nombre de participants</label> 
						<select
							class=" form-control" id="people" name="people"
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
						<button type="submit" class="btn btn-lg btn-success">Enregistrer</button>
					</div>
				</div>
			</form>
		</div>
	</div>


	<!-- jQuery -->
	<script
		src='http://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

	<!-- Bootstrap Core JavaScript -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		
	<!-- JQUERY UI -->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"
        integrity="sha256-VazP97ZCwtekAsvgPBSUwPFKdrwD3unUfSGVYrahUqU="
        crossorigin="anonymous"></script>

	<!-- FullCalendar.io -->
	<script
		src='http://cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment.min.js'></script>
	<script
		src="http://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.3.0/fullcalendar.min.js"></script>

	<script>
		$(document).ready(
				function() {

					// For the example
					var day = new Date(Date.now());
					day.setHours(12);
					day.setMinutes(0);
					// End example

					moment.locale('fr');
					var id= $(".half").attr("id").replace('salle',"");
					$('#calendar').fullCalendar(
							{
								header : {
									left : 'prev,next',
									center : 'title',
									right : 'agendaWeek,listWeek,listDay'
								},
								businessHours : {
									dow : [ 1, 2, 3, 4, 5 ], // Monday - Friday
									start : '08:00',
									end : '20:00'
								},
								views : {
									agendaWeek : {
										buttonText : 'Agenda semaine'
									},
									listDay : {
										buttonText : 'Liste jour'
									},
									listWeek : {
										buttonText : 'Liste semaine'
									}
								},

								defaultView : 'agendaWeek',
								navLinks : true, // can click day/week names to navigate views
								weekends : false,
								locale : 'fr',
								defaultDate : Date.now(),
								weekNumberCalculation : 'ISO',
								minTime : "08:00:00",
								maxTime : "20:00:00",
								editable : false,
								height : "parent",
								events :"calendar?id="+id,
								eventRender : function(event, element) {
									 if (event.membre) {
				                          element.children(".fc-content").append("<div><small>" + event.intitule + "</small></div>");
				                          element.children(".fc-content").append("<div><small>" + event.membre + "</small></div>");
				                          element.children(".fc-widget-content").last().append(" <small>" + event.intitule + "</small>");
				                          element.children(".fc-widget-content").last().append(" <small>" + event.membre + "</small>");
				                      }
								}
							});
					
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

					$('#room').on(
							"change",
							function() {
								var capacite = $(
										'select[name="salle"] :selected').attr(
										'class').replace("capacite", "");
								$("#people").html("");
								if (capacite == 0) {
									capacite = 50;
								}
								for (var i = 2; i <= capacite; i++) {
									$("#people").append(
											'<option value="' + i + '">' + i
													+ '</option>');
								}

							});
				});
	</script>

</body>
</html>
