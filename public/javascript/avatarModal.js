window.addEventListener("load", function () {

    //Get the images
    const avatarArray = document.querySelectorAll(".avatar-icon");
    let avatarLinkInput = document.querySelector("#profilePicture");
    let selectedAvatar = null;

    avatarArray.forEach(function (avatar) {
        avatar.addEventListener("click", function (event) {
            avatar.classList.add("avatar-icon--selected");
            selectedAvatar = avatar;
            avatarLinkInput.setAttribute("value", avatar.getAttribute("src"));

            avatarArray.forEach(function (index) {
                if (event.target.getAttribute("src") !== index.getAttribute("src")) {
                    index.classList.remove("avatar-icon--selected");
                }
            });
        });
    });

    let avatarSpan = document.querySelector("#avatarSpan");

    const chooseAvatarBtn = document.querySelector("#chooseAvatar");
    chooseAvatarBtn.addEventListener("click", function () {
        avatarSpan.innerHTML = `<img class="avatar-icon" src="${selectedAvatar.getAttribute("src")}">`
        avatarModal.style.display = "none";
    });

    // Get the Modal
    const avatarModal = document.getElementById("avatarModal");

    // Get the open modal button
    const modalBtn = document.getElementById("avatarBtn");

    // Get the close modal <span> element
    let span = document.getElementById("closeAvatar");

    // Open modal when user clicks button
    modalBtn.onclick = function () {
        avatarModal.style.display = "block";
    };

    // When user clicks on the close button (<span> element), close the modal
    span.onclick = function () {
        avatarModal.style.display = "none";
    };

    // When the user clicks outside the modal window, close the modal.
    this.document.onclick = function (event) {
        if (event.target === avatarModal) {
            avatarModal.style.display = "none";
        }
    };
});