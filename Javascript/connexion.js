// ----------- POPUP CONNEXION -----------
document.addEventListener("DOMContentLoaded", () => {
    const connectButton = document.querySelector("#connect-button");
    const connectBox = document.querySelector("#connect-background");
    const closeButton = document.querySelector(".close-button");
    const formBox = document.querySelector("#connect-form");

    if (connectButton && connectBox && closeButton && formBox) {
        function openPopup() {
            connectBox.style.display = "flex";
            setTimeout(() => { connectBox.style.opacity = "1"; }, 10);
        }

        function closePopup() {
            connectBox.style.opacity = "0";
            setTimeout(() => { connectBox.style.display = "none"; }, 500);
        }

        connectButton.addEventListener("click", (e) => {
            e.preventDefault();
            openPopup();
        });

        closeButton.addEventListener("click", closePopup);

        formBox.addEventListener("click", e => e.stopPropagation());

        connectBox.addEventListener("click", closePopup);
    }
});
