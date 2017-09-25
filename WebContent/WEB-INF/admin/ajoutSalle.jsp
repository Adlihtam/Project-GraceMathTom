<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="Ressources/css/bootstrap.min.css" />
<link rel="stylesheet" href="Ressources/css/style.css" />
<title>Ajouter Salle</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<!-- Menu -->
			<div class="col-md-3 no-float" id="menu">
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
			<div class="col-md-9 no-float">
				<p>Contenu Ajouter Salle</p>
				<div id="login-container">
					<h1>Ajouter une salle</h1>
			<form action="ajoutSalle" method="POST">
				Nom de la salle: <br><input type="text" name="nom" placeholder="Nom"/>
				<br/>
				Capacité:<br><input type="number" name="capacite" placeholder="capacite"/>
				<br/>
				<input type="submit" class="btn btn-info" value="Valider"/>
			</form>
		</div>
			</div>
		</div>
	</div>
</body>
</html>