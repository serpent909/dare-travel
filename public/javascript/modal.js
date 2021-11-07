window.addEventListener("load", async function () {

    const toggleCollapse = document.querySelector('.toggle-collapse span');
    const nav = document.querySelector('.nav');

    // onclick event on toggle Collapse span tag
    toggleCollapse.onclick = (e) => {
        nav.classList.toggle("collapse");
        e.target.classList.toggle("toggle-click");
    }

    // Get the Modal
    const modal = document.getElementById("loginModal");

    // Get the open modal button
    const modalBtn = document.getElementsByClassName("logBtn")[0];

    // Get the close modal <span> element
    const span = document.getElementById("closeLogin");

    // Open modal when user clicks button
    modalBtn.onclick = function () {
        if (modalBtn.id == "loginBtn") {
            modal.style.display = "block";
        }
        else {
            window.location.href = "/logout";
        }
    };

    // When user clicks on the close button (<span> element), close the modal
    span.onclick = function () {
        modal.style.display = "none";
    };

    // When the user clicks outside the modal window, close the modal.
    window.onclick = function (event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    };
});