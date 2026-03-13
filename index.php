<?php
    session_start();
?>





<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E2C Lib</title>
    <link rel="icon" href="assets/icons/logoE2Clib.png">
    <link rel="stylesheet" href="style/style.css">
    <script src="/connexion.js" defer></script>
    <script src="Javascript/catalogueManager.js" defer></script>

</head>
<body>
    <header>
        <div class="header-title">
            <img src="assets/icons/logoE2Clib.png" alt="Logo du site">
            <h1>E2C Lib - Accueil</h1>
        </div>
<nav>
    <a class="btn btn-dark" href="./Pages/Catalogue.html">Catalogue</a>
    <a class="btn btn-dark" href="./Pages/game.html">Détente</a>
    <a class="btn btn-dark" href="../Pages/inscription.php">Inscription</a>


    <?php if(!isset($_SESSION["userid"])){?>
        <a id="connect-button" class="btn btn-light" href="#">Connexion</a>
    <?php }else{?>
        <p>Bonjour</p>
    <?php } ?>


            </nav>
    </header>

    <main>
        <article>
            <div class="art-text">
                <h2>L'e2C, c'est quoi</h2>
                <p>L’École de la Deuxième Chance (E2C) Grand Lille accompagne les jeunes de 16 à 25 ans sortis du système scolaire sans diplôme ni qualification. Elle leur propose un parcours individualisé pour retrouver confiance en eux, construire un projet professionnel et renouer avec les apprentissages fondamentaux. La lecture y occupe une place centrale, car elle est à la fois un outil d’émancipation, de réflexion et d’ouverture sur le monde.</p>

                <p>Au-delà de l’apprentissage technique, l’E2C valorise la lecture comme un levier de développement personnel. Lire permet aux jeunes de se reconnecter à leur curiosité, de découvrir des univers variés et de mieux comprendre leur environnement. C’est aussi un moyen de reprendre goût à l’apprentissage, dans un cadre bienveillant où chaque progrès est valorisé. La lecture devient ainsi un fil conducteur vers la reconstruction de soi et l’élaboration d’un avenir choisi.</p>
             </div>
             <iframe class="art-illus" src="https://www.youtube.com/embed/q8IXhr6b304?si=gP3tRh2O0AWfAN0W" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
            
        </article>

        <div class="inter-article" id="inter1"></div>

        <article>
            <img class="art-illus" src="./assets/pictures/article-pic1.png" alt="Le groupe prép num">
            <div class="art-text">
                <h2>La Prépa Num à l'E2C</h2>
                <p>Parmi les parcours proposés, la Prépa Numérique se distingue par son orientation vers les métiers du digital. Ce programme permet aux jeunes de découvrir les bases du développement web, du design numérique, de la cybersécurité ou encore de la création de contenus. La lecture y prend une forme nouvelle : lire du code, comprendre des documentations techniques, explorer des articles spécialisés… autant de compétences clés pour évoluer dans un secteur en pleine croissance. Ce site web, conçu par les stagiaires de la Prépa Numérique, en est une belle illustration : un projet concret, collaboratif et formateur.</p>

                <p>Ce parcours allie apprentissage technique et créativité. Les jeunes y développent des projets numériques concrets, en lien avec leurs centres d’intérêt et les besoins du monde professionnel. Ils apprennent à travailler en équipe, à gérer un projet de A à Z, et à valoriser leurs compétences à travers des réalisations visibles et utiles. La Prépa Numérique est ainsi un tremplin vers les métiers du futur, où la lecture, sous toutes ses formesCe parcours allie apprentissage technique et créativité. Les jeunes y développent des projets numériques concrets, en lien avec leurs centres d’intérêt et les besoins du monde professionnel. Ils apprennent à travailler en équipe, à gérer un projet de A à Z, et à valoriser leurs compétences à travers des réalisations visibles et utiles. La Prépa Numérique est ainsi un tremplin vers les métiers du futur, où la lecture, sous toutes ses formes, reste un pilier fondamental de la réussite.</p>
            </div>
        </article>

        <div class="inter-article" id="inter2"></div>

        <article>
            <div class="art-text">
                <h2>Des livres à l'E2C</h2>
                <p>À <a href="https://e2c-grandlille.fr/">l’E2C Grand Lille</a>, la lecture est intégrée dans un parcours pédagogique sur mesure. Elle permet aux jeunes de renforcer leurs compétences en compréhension écrite, d’enrichir leur vocabulaire et de développer leur esprit critique. Qu’il s’agisse de lire un article de presse, un roman, ou un texte professionnel, chaque lecture est une opportunité de progresser et de mieux se préparer à la vie active. Des ateliers de lecture, des rencontres avec des auteurs ou encore des projets autour du livre viennent enrichir cette démarche.</p>

                <p>Cette approche pédagogique favorise également l’expression orale et écrite, essentielle pour réussir dans le monde professionnel. Les jeunes apprennent à argumenter, à structurer leurs idées et à prendre la parole avec assurance. En travaillant sur des supports variés, ils développent leur autonomie et leur capacité à s’adapter à différents contextes de communication. La lecture devient ainsi un outil transversal, au service de l’insertion sociale et professionnelle.</p>
            </div>
            <img class="art-illus" src="./assets/pictures/article-pic2.png" alt="Un temps de lecture">
        </article>
    </main>

    <footer>
        <div class="foot-left">
            <p>Site créé par la Prépa numerique de l'E2C - Grand Lille, Site d'Armentière</p>
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
    <div id="connect-background">
        <div id="connect-form">
            <div class="close-button"></div>
            <form action="./controller/loginController.php" method="post">
                <label for="email">Votre email :</label>
                <input type="email" name="email" id="email" placeholder="name@tonsite.esp" required>
                <label for="password">mot de passe :</label>
                <input type="password" name="password" id="password" placeholder="********" required>
                <input type="submit" value="Let's Read!" class="btn btn-light">
            </form>
        </div>

    </div>
</body>
</html>