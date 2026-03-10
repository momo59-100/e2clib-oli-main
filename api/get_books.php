<?php
// 🔹 Activer l’affichage des erreurs (utile en dev)
// comment out en prod
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

// ✨ CORS — autorise les requêtes du front
header('Content-Type: application/json; charset=utf-8');
header('Access-Control-Allow-Origin: http://localhost'); 
header('Access-Control-Allow-Methods: GET, POST, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type, Authorization');

// Répondre aux requêtes pré‑flight OPTIONS
if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit();
}

// Connexion à MySQL
$dbhost = 'localhost';
$dbuser = 'root';    // utilisateur Windows
$dbpass = '';        // mot de passe vide
$dbname = 'e2clib_oli';
$conn = new mysqli($dbhost, $dbuser, $dbpass, $dbname);
if ($conn->connect_error) {
    http_response_code(500);
    echo json_encode(['success' => false, 'error' => $conn->connect_error]);
    exit;
}

$conn->set_charset("utf8mb4");

// Récupération des filtres GET
$genre_filter    = $_GET['genre']   ?? '';
$format_filter   = $_GET['format']  ?? '';
$language_filter = $_GET['language']?? '';
$search_filter   = $_GET['search']  ?? '';

try {
    // 🔹 Requête de base avec les bonnes jointures
    $query = "SELECT 
        books.id,
        books.title,
        books.auteur,
        COALESCE(books.synopsis,'') AS synopsis,
        books.year,
        books.pages,
        COALESCE(books.cover,'') AS cover,
        COALESCE(g.name,'Non classé') AS genre,
        COALESCE(f.name,'Roman') AS format,
        COALESCE(l.name,'Français') AS langue
    FROM books
    LEFT JOIN `format` f ON books.format_id = f.id
    LEFT JOIN languages l ON books.language_id = l.id
    LEFT JOIN genres g ON books.genre_id = g.id

    WHERE 1=1";

    $params = [];
    $types  = '';

    if ($genre_filter) {
        $query .= " AND g.name = ?";
        $params[] = $genre_filter;
        $types   .= 's';
    }
    if ($format_filter) {
        $query .= " AND f.name = ?";
        $params[] = $format_filter;
        $types   .= 's';
    }
    if ($language_filter) {
        $query .= " AND l.name = ?";
        $params[] = $language_filter;
        $types   .= 's';
    }
    if ($search_filter) {
        $query .= " AND (books.title LIKE ? OR books.auteur LIKE ?)";
        $params[] = "%$search_filter%";
        $params[] = "%$search_filter%";
        $types   .= 'ss';
    }

    $query .= " ORDER BY books.title ASC LIMIT 500";

    $stmt = $conn->prepare($query);
    if ($params) {
        $stmt->bind_param($types, ...$params);
    }

    $stmt->execute();
    $result = $stmt->get_result();

    $books = [];
    while ($row = $result->fetch_assoc()) {
        $books[] = $row;
    }

    echo json_encode([
        'success' => true,
        'data'    => $books,
        'count'   => count($books)
    ], JSON_UNESCAPED_UNICODE);

    $stmt->close();
    $conn->close();

} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(['success' => false, 'error' => $e->getMessage()]);
}