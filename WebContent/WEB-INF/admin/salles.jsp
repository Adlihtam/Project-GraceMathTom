<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="Ressources/css/bootstrap.min.css" />
<link rel="stylesheet" href="Ressources/css/style.css" />
<title>Salles</title>
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
				<a href="ajoutSalle"><button class="btn">Ajouter une
						salle</button></a>
			</div>
				<table class="table table-bordered table-striped">
					<thead>
						<tr>
							<th style="width: 10%">Nom</th>
							<th style="width: 10%">Capacité</th>
							<th style="width:5%"></th>

						</tr>
					</thead>

					<tbody>
						<c:forEach items="${listSalles}" var="salle">
							<tr>
								<td><c:out value="${salle.nom}" /></td>
								<td><c:out value="${salle.capacite}" /></td>
								<td>
								<!-- Modification d'une salle --> 
									<a
								href="modifSalle?type=Edit&id=${salle.id}"><button
										class="btn">Edit</button></a> 
								<form action="salles" method="POST">
									<input type="hidden" name="user" value="${salle.id}" /> 
									<input
										type="hidden" name="type" value="Delete" /> 
										<input
										class="btn " type="submit" value="Supprimer" />
								 </form>
							</td>
							</tr>

						</c:forEach>

					</tbody>
				</table>
			</div>
		</div>
</body>
</html>