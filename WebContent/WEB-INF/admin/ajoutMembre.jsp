<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="Ressources/css/bootstrap.min.css" />
<link rel="stylesheet" href="Ressources/css/style.css" />
<script src="Ressources/js/bootstrap.min.css">
	
</script>
<title>Ajout Membre</title>
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
		<div class="col-md-10 no-float">
			<form action="ajoutMembre" method="POST">
				<label>Nom</label> <input name="Nom"> <br>
				<label>Prenom</label> <input name="Prenom"> <br>
				<label>Email</label> <input name="Email"> <br> 
				<label>Date de naissance</label> <input type="date" name="date"> <br> <input type="submit" class="btn"
					value="Enregister"> <br>
			</form>
		</div>
	</div>
</body>
</html>