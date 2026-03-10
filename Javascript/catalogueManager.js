document.addEventListener("DOMContentLoaded", () => {
    const booksContainer = document.getElementById("books-container");
    const searchInput = document.getElementById("search-input");
    const searchBtn = document.getElementById("search-btn");
    const filterGenre = document.getElementById("filter-genre");
    const filterFormat = document.getElementById("filter-format");
    const filterLanguage = document.getElementById("filter-language");
    const resetBtn = document.getElementById("reset-filters");

    let allBooks = [];

    function createBookCard(book) {
        const div = document.createElement('div');
        div.className = 'book-card';
        div.innerHTML = `
            <img src="${book.cover || '../assets/icons/logoE2Clib.png'}" alt="${book.title}" class="book-cover">
            <h3>${book.title}</h3>
            <p><strong>Auteur :</strong> ${book.auteur}</p>
            <p><strong>Année :</strong> ${book.year}</p>
            <p><strong>Genre :</strong> ${book.genre || 'N/A'}</p>
            <p><strong>Format :</strong> ${book.format || 'N/A'}</p>
            <p><strong>Langue :</strong> ${book.langue || 'N/A'}</p>
        `;
        return div;
    }

    function displayBooks() {
        const searchText = searchInput.value.toLowerCase();
        const genre = filterGenre.value;
        const format = filterFormat.value;
        const language = filterLanguage.value;

        const filtered = allBooks.filter(book => {
            const matchesSearch = book.title.toLowerCase().includes(searchText) || book.auteur.toLowerCase().includes(searchText);
            const matchesGenre = !genre || book.genre === genre;
            const matchesFormat = !format || book.format === format;
            const matchesLanguage = !language || book.langue === language;
            return matchesSearch && matchesGenre && matchesFormat && matchesLanguage;
        });

        booksContainer.innerHTML = '';
        if (filtered.length === 0) {
            booksContainer.innerHTML = '<p>Aucun livre trouvé.</p>';
            return;
        }

        filtered.forEach(book => {
            booksContainer.appendChild(createBookCard(book));
        });
    }

    function loadBooksFromServer() {
        booksContainer.innerHTML = '<p class="loading">📚 Chargement des livres...</p>';
        fetch("../api/get_books.php")
            .then(res => res.json())
            .then(data => {
                if (!data.success || !data.data) throw new Error('Erreur serveur');
                allBooks = data.data;
                displayBooks();
            })
            .catch(err => {
                console.error('Erreur fetch:', err);
                booksContainer.innerHTML = '<p>Impossible de charger les livres.</p>';
            });
    }

    searchBtn.addEventListener('click', displayBooks);
    filterGenre.addEventListener('change', displayBooks);
    filterFormat.addEventListener('change', displayBooks);
    filterLanguage.addEventListener('change', displayBooks);
    resetBtn.addEventListener('click', () => {
        searchInput.value = '';
        filterGenre.value = '';
        filterFormat.value = '';
        filterLanguage.value = '';
        displayBooks();
    });

    loadBooksFromServer();
});