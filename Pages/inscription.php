<?php

// Connexion à la base de données
try {
    $pdo = new PDO("mysql:host=localhost;dbname=e2clib;charset=utf8", "root", "");
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch(PDOException $e){
    echo "Erreur de connexion : " . $e->getMessage();
}

$message = "";

if($_SERVER["REQUEST_METHOD"] == "POST"){

    $nom = htmlspecialchars($_POST["nom"]);
    $prenom = htmlspecialchars($_POST["prenom"]);
    $email = htmlspecialchars($_POST["email"]);
    $password = password_hash($_POST["password"], PASSWORD_DEFAULT);

    $sql = "INSERT INTO utilisateurs (nom, prenom, email, password) VALUES (?, ?, ?, ?)";
    $stmt = $pdo->prepare($sql);
    
    if($stmt->execute([$nom, $prenom, $email, $password])){
        $message = "<p style='color:green;'>Inscription réussie pour $prenom $nom</p>";
    } else {
        $message = "<p style='color:red;'>Erreur lors de l'inscription</p>";
    }
}

?>

<!DOCTYPE html>
<html lang="fr">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Inscription - E2C Lib</title>
<link rel="stylesheet" href="../style/style.css">
<script src="../Javascript/morpion.js" defer></script>
<script src="../Javascript/connexion.js" defer></script>
</head>

<body>

<a class="btn btn-dark" href="../index.php">Accueil</a>
<a class="btn btn-dark" href="../Pages/Catalogue.html">Catalogue</a>
<a class="btn btn-dark" href="../Pages/game.html">Détente</a>
<a class="btn btn-light" id="connect-button" href="../Javascript/connexion.js">Connexion</a>

<section class="form-container">

<h2>Créer un compte</h2>

<?php echo $message; ?>

<form method="POST" action="">

<div class="form-group">
<label>Nom</label>
<input type="text" name="nom" required>
</div>

<div class="form-group">
<label>Prénom</label>
<input type="text" name="prenom" required>
</div>

<div class="form-group">
<label>Email</label>
<input type="email" name="email" required>
</div>

<div class="form-group">
<label>Mot de passe</label>
<input type="password" name="password" required>
</div>

<button type="submit" class="btn-register">S'inscrire</button>

</form>

</section>

 <footer>
        <div class="foot-left">
            <p>Site créé par la Prépa numérique de l'E2C - Grand Lille, Site d'Armentières</p>
            <a class="btn btn-light" href="https://e2c-grandlille.fr/">Nous Contacter</a>
        </div>
        <div class="foot-right">
            <div class="site">
                <h3>Site d'Armentières</h3>
                <p>8 rue Philippe de Girard</p>
                <p>59 280 Armentières</p>
                <p>03 28 52 90 50</p>
            </div>
            <div class="site">
                <h3>Site de Lille</h3>
                <p>48 rue des canonniers</p>
                <p>59 000 Lille</p>
                <p>03 20 63 30 80</p>
            </div>
            <div class="site">
                <h3>Site de Roubaix</h3>
                <p>45 boulevard du général Leclerc</p>
                <p>59 100 Roubaix</p>
                <p>03 28 07 59 80</p>
            </div>
            <div class="site">
                <h3>Site de Saint-Omer</h3>
                <p>17 rue Allent</p>
                <p>62 500 Saint-Omer</p>
                <p>03 28 52 90 60</p>
            </div>
        </div>
    </footer>


    <div id="connect-background" class="modal">
        <div id="connect-form" class="modal-content">
            <button type="button" class="close-button">&times;</button>

            <form action="#" method="post">
                <label for="email">Votre email :</label>
                <input type="email" name="email" id="email" placeholder="name@tonsite.com" required>

                <label for="password">Mot de passe :</label>
                <input type="password" name="password" id="password" placeholder="********" required>

                <button type="submit" class="btn btn-light">Let's Read!</button>
            </form>
        </div>
    </div>

</body>
</html>