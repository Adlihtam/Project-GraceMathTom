<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="Ressources/css/bootstrap.min.css" />
<link rel="stylesheet" href="Ressources/css/style.css" />
<title>Modifier Salle</title>
</head>
<body>
	<div class="container">
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
			<div class="col-md-10 no-float">
				<!-- Modification d'une salle -->
				<h1>Modifier une salle</h1>
				<form action="modifSalle" method="POST">
					<input type="hidden" value="${salle.id}" name="id"> 
					<label>Nom</label>
					<input name="Nom" value="${salle.nom}"> <br> 
					<label>Capacité</label>
					<input name="Capacite" value="${salle.capacite}"> <br>
					<input type="submit" class="btn" value="Modifier">

				</form>
				<!-- Suppression d'une salle -->
				<form action="salles" method="POST">
					<input type="hidden" name="user" value="${salle.id}" /> 
					<input type="hidden" name="type" value="Delete" /> 
					<input class="btn " type="submit" value="Supprimer" />
				</form>
			</div>
		</div>

	</div>

</body>
</html>