window.addEventListener("load", function () {

    const cancelDeleteBtn = document.getElementById("cancelDeleteBtn");
    const confirmDeleteBtn = document.getElementById("confirmDeleteBtn");

    // Get the Modal
    const deleteModal = document.getElementById("deleteModal");

    // Get the open modal button
    const deleteModalBtn = document.getElementById("deleteAccountModalBtn");

    // Get the close modal <span> element
    let span = document.getElementById("closeDelete");

    // Open modal when user clicks button
    deleteModalBtn.onclick = function () {
        deleteModal.style.display = "block";
    };

    // When user clicks on the close button (<span> element), close the modal
    span.onclick = function () {
        deleteModal.style.display = "none";
    };

    // When the user clicks outside the modal window, close the modal.
    this.document.onclick = function (event) {
        if (event.target === deleteModal) {
            deleteModal.style.display = "none";
        }
    };

    cancelDeleteBtn.addEventListener("click", function () {
        deleteModal.style.display = "none";
    });

    confirmDeleteBtn.addEventListener("click", async function () {
        await fetch("/deleteAccount", {
            method: "POST",
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
        });
    })
});