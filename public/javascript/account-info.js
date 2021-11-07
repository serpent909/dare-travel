window.addEventListener("load", async function () {

    document.querySelectorAll(".manage-account input, textarea").forEach(function (element) {
        element.disabled = "true";
    })

    const avatar_button = document.getElementById("avatarBtn");

    //Select buttons
    const edit_button = document.getElementById("editButton");
    const save_button = document.getElementById("saveButton");
    const discard_button = document.getElementById("discardButton");


    //Select input inputFields
    const inputFields = document.querySelectorAll("input, textarea");

    edit_button.addEventListener("click", function () {
        inputFields.forEach(element => element.disabled = false);
        avatar_button.disabled = false;
        save_button.disabled = false;
        edit_button.disabled = true;
        discard_button.disabled = false;
    });

    save_button.addEventListener("click", function () {
        edit_button.disabled = false;
    })

    discard_button.addEventListener("click", function () {
        location.reload();
    })

});