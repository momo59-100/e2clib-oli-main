CREATE USER 'e2clib_admin'@'localhost' IDENTIFIED BY 'Aviva1605@';
GRANT ALL PRIVILEGES ON e2clib_oli.* To 'e2clib_admin'@'localhost';

CREATE TABLE if not exists users  (
id smallint UNSIGNED not null auto_increment primary key,    
email varchar(255) not null unique,
password varchar(255) not null,
pseudo varchar(15) not null unique,
biography TINYTEXT,
age TINYINT UNSIGNED not null,
is_admin boolean not null default 0    
)engine=InnoDB;


insert into users (password,  email, pseudo, age, is_admin)
values("Aviva1605@", "ennasrimohammed212@gmail.com", "Momo59100", 25, 1) 


insert into users (password,  email, pseudo, age)
values ("Aviva1605", "ennasrimohammed59100@gmail.com", "Momo59", 25), 
("Aviva1", "ennasrimohammed5@gmail.com", "Momo5911", 25), 
("Aviva16", "ennasrimohammed591@gmail.com", "Momo59966", 25);

CREATE TABLE if not exists genres (
id TINYINT UNSIGNED not null auto_increment primary key,
name varchar(50) not null unique
)ENGINE=InnoDB;

CREATE TABLE if not exists languages (
id TINYTEXT UNSIGNED not null auto_increment primary key,
name varchar(10) not null unique
)ENGINE=InnoDB;

CREATE TABLE if not exists format (
id TINYINT UNSIGNED not null auto_increment primary key,
name varchar(20) not null unique
)ENGINE=InnoDB;

insert into languages (name)
values('français'), ('anglais'), ('portugais'), ('arabe'); 

insert into format (name)
values('Poche'), ('roman'), ('Bande déssiné'), ('manga'), ('magazine'); 

insert into genres (name)
values('non classé'), ('policier'), ('drame'), ('action'), ('thriller'); 

CREATE TABLE if not exists books(
ID smallint UNSIGNED not null auto_increment primary key;
title varchar(255) not null,
auteur varchar(255) not null default 'inconnu',
synopsis TINYTEXT not null default 'en attente',
year smallint,
editor varchar(255), 
cover varchar(255),
pages smallint,
genre_id TINYINT UNSIGNED not null default 1,
languages_ID TINYINT UNSIGNED not null default 1,
format_id TINYINT UNSIGNED,
constraint fk_genres
    foreign key (genre_id),
    references genres(id)
constraint fk_languages
    foreign key (languages_id),
    references languages(id)
constraint fk_format
    foreign key (format_id),
    references format(id)
)ENGINE=InnoDB;

SELECT  books.title AS titre, books.auteur AS auteur, books.pages AS 'nombre de page', genres.name AS genres, format.name AS format, languages.name AS langue FROM books
INNER JOIN genres ON books.genre_id = genres.id
INNER JOIN format ON books.format_id = format.id
INNER JOIN languages ON books.language_ID = language.id;

INSERT INTO books (title, auteur, year, pages, genre_id, format_id) VALUES
('Le monde s''effondre', 'Chinua Achebe', 1958, 596, (SELECT id FROM genres WHERE name="Action"), (SELECT id FROM format WHERE name="Poche")),
('Contes', 'Hans Christian Andersen', 1835, 871, (SELECT id FROM genres WHERE name="Science-fiction"), (SELECT id FROM format WHERE name="Roman")),
('Orgueil et Préjugés', 'Jane Austen', 1813, 918, (SELECT id FROM genres WHERE name="Educatif"), (SELECT id FROM format WHERE name="Roman")),
('Le Père Goriot', 'Honoré de Balzac', 1835, 324, (SELECT id FROM genres WHERE name="Bande-déssinée"), (SELECT id FROM format WHERE name="Roman")),
('Molloy', 'Samuel Beckett', 1951, 453, (SELECT id FROM genres WHERE name="Thriller"), (SELECT id FROM format WHERE name="Roman")),
('Le Décaméron', 'Boccace', 1349, 406, (SELECT id FROM genres WHERE name="Bande-déssinée"), (SELECT id FROM format WHERE name="Poche")),
('Fictions', 'Jorge Luis Borges', 1944, 781, (SELECT id FROM genres WHERE name="Politique"), (SELECT id FROM format WHERE name="Poche")),
('Les Hauts de Hurle-Vent', 'Emily Brontë', 1847, 879, (SELECT id FROM genres WHERE name="Bande-déssinée"), (SELECT id FROM format WHERE name="Roman")),
('L''Étranger', 'Albert Camus', 1942, 935, (SELECT id FROM genres WHERE name="Drame"), (SELECT id FROM format WHERE name="Poche")),
('Voyage au bout de la nuit', 'Louis-Ferdinand Céline', 1932, 541, (SELECT id FROM genres WHERE name="Drame"), (SELECT id FROM format WHERE name="Poche")),
('Don Quichotte', 'Miguel de Cervantes', 1605, 905, (SELECT id FROM genres WHERE name="Bande-déssinée"), (SELECT id FROM format WHERE name="Grand Format")),
('Les Contes de Canterbury', 'Geoffrey Chaucer', 1400, 735, (SELECT id FROM genres WHERE name="Fantasy"), (SELECT id FROM format WHERE name="Roman")),
('Nostromo', 'Joseph Conrad', 1904, 126, (SELECT id FROM genres WHERE name="Bande-déssinée"), (SELECT id FROM format WHERE name="Poche")),
('La Divine Comédie', 'Dante Alighieri', 1300, 475, (SELECT id FROM genres WHERE name="Fantasy"), (SELECT id FROM format WHERE name="Roman")),
('De grandes espérances', 'Charles Dickens', 1861, 812, (SELECT id FROM genres WHERE name="Educatif"), (SELECT id FROM format WHERE name="Roman")),
('Jacques le Fataliste', 'Denis Diderot', 1796, 469, (SELECT id FROM genres WHERE name="Fantasy"), (SELECT id FROM format WHERE name="Grand Format")),
('Berlin Alexanderplatz', 'Alfred Döblin', 1929, 243, (SELECT id FROM genres WHERE name="Science-fiction"), (SELECT id FROM format WHERE name="Poche")),
('Crime et Châtiment', 'Fiodor Dostoïevski', 1866, 351, (SELECT id FROM genres WHERE name="Action"), (SELECT id FROM format WHERE name="Roman")),
('L''Idiot', 'Fiodor Dostoïevski', 1869, 939, (SELECT id FROM genres WHERE name="Science-fiction"), (SELECT id FROM format WHERE name="Roman")),
('Les Frères Karamazov', 'Fiodor Dostoïevski', 1880, 160, (SELECT id FROM genres WHERE name="Drame"), (SELECT id FROM format WHERE name="Poche")),
('Middlemarch', 'George Eliot', 1871, 913, (SELECT id FROM genres WHERE name="Bande-déssinée"), (SELECT id FROM format WHERE name="Poche")),
('Homme invisible, pour qui chantes-tu ?', 'Ralph Ellison', 1952, 160, (SELECT id FROM genres WHERE name="Non classé"), (SELECT id FROM format WHERE name="Poche")),
('Médée', 'Euripide', -431, 738, (SELECT id FROM genres WHERE name="Drame"), (SELECT id FROM format WHERE name="Poche")),
('Absalon, Absalon !', 'William Faulkner', 1936, 443, (SELECT id FROM genres WHERE name="Drame"), (SELECT id FROM format WHERE name="Roman")),
('Le Bruit et la Fureur', 'William Faulkner', 1929, 694, (SELECT id FROM genres WHERE name="Non classé"), (SELECT id FROM format WHERE name="Poche")),
('Madame Bovary', 'Gustave Flaubert', 1857, 323, (SELECT id FROM genres WHERE name="Thriller"), (SELECT id FROM format WHERE name="Poche")),
('L''éducation sentimentale', 'Gustave Flaubert', 1869, 952, (SELECT id FROM genres WHERE name="Policier"), (SELECT id FROM format WHERE name="Poche")),
('Dramero Gitano', 'Federico Garcia Lorca', 1928, 182, (SELECT id FROM genres WHERE name="Science-fiction"), (SELECT id FROM format WHERE name="Poche")),
('Cent ans de solitude', 'Gabriel Garcia Marquez', 1967, 526, (SELECT id FROM genres WHERE name="Non classé"), (SELECT id FROM format WHERE name="Grand Format")),
('L''Amour aux temps du choléra', 'Gabriel Garcia Marquez', 1985, 415, (SELECT id FROM genres WHERE name="Fantasy"), (SELECT id FROM format WHERE name="Roman")),
('Faust', 'Johann Wolfgang von Goethe', 1808, 602, (SELECT id FROM genres WHERE name="Action"), (SELECT id FROM format WHERE name="Grand Format")),
('Les Âmes mortes', 'Nicolas Gogol', 1842, 309, (SELECT id FROM genres WHERE name="Drame"), (SELECT id FROM format WHERE name="Poche")),
('Le Tambour', 'Günter Grass', 1959, 780, (SELECT id FROM genres WHERE name="Action"), (SELECT id FROM format WHERE name="Poche")),
('La Faim', 'Knut Hamsun', 1890, 123, (SELECT id FROM genres WHERE name="Politique"), (SELECT id FROM format WHERE name="Roman")),
('Le Vieil Homme et la Mer', 'Ernest Hemingway', 1952, 798, (SELECT id FROM genres WHERE name="Thriller"), (SELECT id FROM format WHERE name="Grand Format")),
('Iliade', 'Homère', -850, 454, (SELECT id FROM genres WHERE name="Action"), (SELECT id FROM format WHERE name="Poche")),
('Odyssée', 'Homère', -750, 411, (SELECT id FROM genres WHERE name="Politique"), (SELECT id FROM format WHERE name="Roman")),
('Une maison de poupée', 'Henrik Ibsen', 1879, 234, (SELECT id FROM genres WHERE name="Fantasy"), (SELECT id FROM format WHERE name="Grand Format")),
('Ulysse', 'James Joyce', 1922, 747, (SELECT id FROM genres WHERE name="Policier"), (SELECT id FROM format WHERE name="Roman")),
('Le Procès', 'Franz Kafka', 1925, 661, (SELECT id FROM genres WHERE name="Policier"), (SELECT id FROM format WHERE name="Poche")),
('Le Château', 'Franz Kafka', 1926, 319, (SELECT id FROM genres WHERE name="Drame"), (SELECT id FROM format WHERE name="Roman")),
('Les Misérables', 'Victor Hugo', 1862, 203, (SELECT id FROM genres WHERE name="Educatif"), (SELECT id FROM format WHERE name="Poche")),
('Notre-Dame de Paris', 'Victor Hugo', 1831, 435, (SELECT id FROM genres WHERE name="Action"), (SELECT id FROM format WHERE name="Roman")),
('Le Petit Prince', 'Antoine de Saint-Exupéry', 1943, 846, (SELECT id FROM genres WHERE name="Drame"), (SELECT id FROM format WHERE name="Roman")),
('La Peste', 'Albert Camus', 1947, 672, (SELECT id FROM genres WHERE name="Science-fiction"), (SELECT id FROM format WHERE name="Roman")),
('L''Écume des jours', 'Boris Vian', 1947, 129, (SELECT id FROM genres WHERE name="Bande-déssinée"), (SELECT id FROM format WHERE name="Poche")),
('Bel-Ami', 'Guy de Maupassant', 1885, 599, (SELECT id FROM genres WHERE name="Fantasy"), (SELECT id FROM format WHERE name="Grand Format")),
('Le Rouge et le Noir', 'Stendhal', 1830, 139, (SELECT id FROM genres WHERE name="Drame"), (SELECT id FROM format WHERE name="Roman")),
('La Chartreuse de Parme', 'Stendhal', 1839, 632, (SELECT id FROM genres WHERE name="Educatif"), (SELECT id FROM format WHERE name="Roman")),
('Les Fleurs du mal', 'Charles Baudelaire', 1857, 273, (SELECT id FROM genres WHERE name="Educatif"), (SELECT id FROM format WHERE name="Roman")),
('Le Horla', 'Guy de Maupassant', 1887, 408, (SELECT id FROM genres WHERE name="Bande-déssinée"), (SELECT id FROM format WHERE name="Grand Format")),
('L''Assommoir', 'Émile Zola', 1877, 361, (SELECT id FROM genres WHERE name="Thriller"), (SELECT id FROM format WHERE name="Roman")),
('Germinal', 'Émile Zola', 1885, 676, (SELECT id FROM genres WHERE name="Thriller"), (SELECT id FROM format WHERE name="Poche")),
('Thérèse Raquin', 'Émile Zola', 1867, 459, (SELECT id FROM genres WHERE name="Politique"), (SELECT id FROM format WHERE name="Poche")),
('L''Œuvre', 'Émile Zola', 1886, 912, (SELECT id FROM genres WHERE name="Action"), (SELECT id FROM format WHERE name="Poche")),
('La Fortune des Rougon', 'Émile Zola', 1871, 390, (SELECT id FROM genres WHERE name="Drame"), (SELECT id FROM format WHERE name="Roman")),
('La Curée', 'Émile Zola', 1872, 924, (SELECT id FROM genres WHERE name="Bande-déssinée"), (SELECT id FROM format WHERE name="Grand Format")),
('Nana', 'Émile Zola', 1880, 189, (SELECT id FROM genres WHERE name="Bande-déssinée"), (SELECT id FROM format WHERE name="Roman")),
('Pot-Bouille', 'Émile Zola', 1882, 734, (SELECT id FROM genres WHERE name="Action"), (SELECT id FROM format WHERE name="Poche")),
('Au Bonheur des Dames', 'Émile Zola', 1883, 577, (SELECT id FROM genres WHERE name="Non classé"), (SELECT id FROM format WHERE name="Poche")),
('La Joie de vivre', 'Émile Zola', 1884, 378, (SELECT id FROM genres WHERE name="Science-fiction"), (SELECT id FROM format WHERE name="Grand Format")),
('Le Rêve', 'Émile Zola', 1888, 645, (SELECT id FROM genres WHERE name="Bande-déssinée"), (SELECT id FROM format WHERE name="Grand Format")),
('La Bête humaine', 'Émile Zola', 1890, 790, (SELECT id FROM genres WHERE name="Non classé"), (SELECT id FROM format WHERE name="Poche")),
('L''Argent', 'Émile Zola', 1891, 808, (SELECT id FROM genres WHERE name="Bande-déssinée"), (SELECT id FROM format WHERE name="Poche")),
('La Débâcle', 'Émile Zola', 1892, 792, (SELECT id FROM genres WHERE name="Non classé"), (SELECT id FROM format WHERE name="Roman")),
('Le Docteur Pascal', 'Émile Zola', 1893, 767, (SELECT id FROM genres WHERE name="Drame"), (SELECT id FROM format WHERE name="Poche")),
('Les Thibault', 'Roger Martin du Gard', 1922, 242, (SELECT id FROM genres WHERE name="Bande-déssinée"), (SELECT id FROM format WHERE name="Grand Format")),
('La Condition humaine', 'André Malraux', 1933, 111, (SELECT id FROM genres WHERE name="Thriller"), (SELECT id FROM format WHERE name="Poche")),
('Le Silence de la mer', 'Vercors', 1942, 189, (SELECT id FROM genres WHERE name="Policier"), (SELECT id FROM format WHERE name="Poche")),
('La Promesse de l''aube', 'Romain Gary', 1960, 929, (SELECT id FROM genres WHERE name="Drame"), (SELECT id FROM format WHERE name="Roman")),
('Éducation européenne', 'Romain Gary', 1945, 154, (SELECT id FROM genres WHERE name="Non classé"), (SELECT id FROM format WHERE name="Roman")),
('Les Racines du ciel', 'Romain Gary', 1956, 455, (SELECT id FROM genres WHERE name="Policier"), (SELECT id FROM format WHERE name="Poche")),
('La Vie devant soi', 'Romain Gary', 1975, 316, (SELECT id FROM genres WHERE name="Politique"), (SELECT id FROM format WHERE name="Poche")),
('L''Élégance du hérisson', 'Muriel Barbery', 2006, 861, (SELECT id FROM genres WHERE name="Drame"), (SELECT id FROM format WHERE name="Poche")),
('Ensemble, c''est tout', 'Anna Gavalda', 2004, 101, (SELECT id FROM genres WHERE name="Drame"), (SELECT id FROM format WHERE name="Poche")),
('Je l''aimais', 'Anna Gavalda', 2002, 678, (SELECT id FROM genres WHERE name="Drame"), (SELECT id FROM format WHERE name="Poche")),
('La Consolante', 'Anna Gavalda', 2008, 269, (SELECT id FROM genres WHERE name="Non classé"), (SELECT id FROM format WHERE name="Poche")),
('L''Île des oubliés', 'Victoria Hislop', 2010, 692, (SELECT id FROM genres WHERE name="Science-fiction"), (SELECT id FROM format WHERE name="Poche")),
('Le Chardonneret', 'Donna Tartt', 2013, 808, (SELECT id FROM genres WHERE name="Non classé"), (SELECT id FROM format WHERE name="Poche")),
('La Vérité sur l''affaire Harry Quebert', 'Joël Dicker', 2012, 370, (SELECT id FROM genres WHERE name="Thriller"), (SELECT id FROM format WHERE name="Poche")),
('L''énigme du retour', 'Dany Laferrière', 2009, 302, (SELECT id FROM genres WHERE name="Drame"), (SELECT id FROM format WHERE name="Grand Format")),
('Le Livre des Baltimore', 'Joël Dicker', 2015, 788, (SELECT id FROM genres WHERE name="Thriller"), (SELECT id FROM format WHERE name="Poche")),
('La disparition de Stephanie Mailer', 'Joël Dicker', 2018, 343, (SELECT id FROM genres WHERE name="Bande-déssinée"), (SELECT id FROM format WHERE name="Grand Format")),
('Le Mystère Henri Pick', 'David Foenkinos', 2016, 247, (SELECT id FROM genres WHERE name="Drame"), (SELECT id FROM format WHERE name="Roman")),
('Charlotte', 'David Foenkinos', 2014, 535, (SELECT id FROM genres WHERE name="Science-fiction"), (SELECT id FROM format WHERE name="Roman")),
('Vers la beauté', 'David Foenkinos', 2018, 176, (SELECT id FROM genres WHERE name="Fantasy"), (SELECT id FROM format WHERE name="Roman")),
('Le Bureau des Jardins et des Étangs', 'Didier Decoin', 2017, 757, (SELECT id FROM genres WHERE name="Action"), (SELECT id FROM format WHERE name="Roman")),
('La Tresse', 'Laetitia Colombani', 2017, 106, (SELECT id FROM genres WHERE name="Drame"), (SELECT id FROM format WHERE name="Poche")),
('Changer l''eau des fleurs', 'Valérie Perrin', 2018, 434, (SELECT id FROM genres WHERE name="Non classé"), (SELECT id FROM format WHERE name="Poche")),
('Les Oubliés du dimanche', 'Valérie Perrin', 2015, 732, (SELECT id FROM genres WHERE name="Bande-déssinée"), (SELECT id FROM format WHERE name="Roman")),
('Trois', 'Valérie Perrin', 2021, 492, (SELECT id FROM genres WHERE name="Thriller"), (SELECT id FROM format WHERE name="Grand Format")),
('Le Bal des folles', 'Victoria Mas', 2019, 820, (SELECT id FROM genres WHERE name="Bande-déssinée"), (SELECT id FROM format WHERE name="Grand Format")),
('Le Cerf-volant', 'Laetitia Colombani', 2021, 462, (SELECT id FROM genres WHERE name="Bande-déssinée"), (SELECT id FROM format WHERE name="Poche")),
('Le Parfum', 'Patrick Süskind', 1985, 972, (SELECT id FROM genres WHERE name="Educatif"), (SELECT id FROM format WHERE name="Grand Format")),
('L''Homme qui voulait être heureux', 'Laurent Gounelle', 2008, 315, (SELECT id FROM genres WHERE name="Policier"), (SELECT id FROM format WHERE name="Grand Format")),
('Le Jour où j''ai appris à vivre', 'Laurent Gounelle', 2014, 473, (SELECT id FROM genres WHERE name="Thriller"), (SELECT id FROM format WHERE name="Poche")),
('Les Dieux voyagent toujours incognito', 'Laurent Gounelle', 2011, 984, (SELECT id FROM genres WHERE name="Thriller"), (SELECT id FROM format WHERE name="Poche")),
('Et tu trouveras le trésor qui dort en toi', 'Laurent Gounelle', 2016, 819, (SELECT id FROM genres WHERE name="Politique"), (SELECT id FROM format WHERE name="Roman")),
('La Vie est facile, ne t''inquiète pas', 'Agnès Martin-Lugand', 2015, 942, (SELECT id FROM genres WHERE name="Drame"), (SELECT id FROM format WHERE name="Grand Format")),
('Les gens heureux lisent et boivent du café', 'Agnès Martin-Lugand', 2013, 426, (SELECT id FROM genres WHERE name="Bande-déssinée"), (SELECT id FROM format WHERE name="Grand Format"));

alter table books
ADD column user_id smallint UNSIGNED;
alter TABLE books
ADD constraint fk_users foreign key (user_id) references (user_id); 

SELECT books.title, users.email FROM books
INNER JOIN users ON books.users_id = user_id;


SELECT books.title, users.email FROM books
LEFT JOIN users ON books.users_id = user_id;

CREATE TABLE IF not exists users_books(
    user_id smallint UNSIGNED not null,
    book_id smallint UNSIGNED not null,
    commentary smalltext not null,
    primary key(user_id, book_id),
constraint fk_com_users
    foreign key(user_id)
    references users(id),
constraint fk_com_books
    foreign key (book_id)
    references books(id)
)ENGINE=InnoDB;

CREATE VIEW COMMENT_VW AS (
SELECT books.title as titre, users.pseudo as lecteur, commentaries.commentary AS message from books
INNER JOIN commentaries on books.id = commentaries.book_id
INNER JOIN users on .user_id = user.id
)


COUNT()
AVG()