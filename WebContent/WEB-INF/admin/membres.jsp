<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="Ressources/css/bootstrap.min.css" />
<link rel="stylesheet" href="Ressources/css/style.css" />
<link rel="stylesheet" href="Ressources/css/font-awesome.min.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.5.1/fullcalendar.min.js"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.5.1/fullcalendar.min.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.5.1/fullcalendar.print.css"/>

<title>Membres</title>
</head>
<body>
	<div class="row">
		<!-- Menu -->
		<div class="col-md-2 no-float" id="menu">
			<a href="dashboard">
				<div class="onglet">Dashboard</div>
			</a> <a href="membres">
				<div class="onglet">Membres</div>
			</a> <a href="salles">
				<div class="onglet">Salles</div>
			</a> <a href="reunions">
				<div class="onglet">Réunions</div>
			</a>
		</div>
		<!-- Contenu -->
		<div class="col-md-10 no-float" style="margin-top: 15px">
			<div style="text-align: right; margin-bottom: 20px">
				<a href="ajoutMembre">
					<button class="btn">Ajouter un Membre</button>
				</a>
			</div>
			<table class="table table-bordered table-striped">
				<thead>
					<tr>
						<th style="width: 5%">Nom</th>
						<th style="width: 5%">Prénom</th>
						<th style="width: 5%">Date de naissance</th>
						<th style="width: 5%">Email</th>
						<th style="width: 10%"></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${listMembres}" var="membre">
						<tr>
							<td><c:out value="${membre.nom }"></c:out></td>
							<td><c:out value="${membre.prenom }"></c:out></td>
							<td><c:out value="${membre.date_naissance }"></c:out></td>
							<td><c:out value="${membre.email}"></c:out></td>
							<td>
								<!-- Modification d'un membre --> 
								<a href="modifMembre?type=Edit&id=${membre.id}">
								<button class="btn">Edit</button></a> 
								
								<!-- Suppression d'un membre -->
								<form action="membres" method="POST">
									<input type="hidden" name="user" value="${membre.id}" /> 
									<input type="hidden" name="type" value="Delete" /> 
									<input class="btn " type="submit" value="Supprimer" />
								 </form>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	
	<div id='calendar'>
		
	</div>
	
</body>
</html>