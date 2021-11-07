window.addEventListener("load", async function () {

    let currentUsernames = await fetchUsernames();
    let numUsers = Object.keys(currentUsernames).length;

    let password = document.getElementById("password");
    let confirmPassword = document.getElementById("confirmPassword");

    let usernameValidation = document.getElementById("usernameValidation");
    let passwordValidation = document.getElementById("passwordValidation");

    async function fetchUsernames() {
        const response = await fetch("./getUsernames");
        const users = await response.json();
        return users;
    };

    //Username availability validation
    let usernameInput = document.getElementById("username");
    usernameInput.addEventListener("input", async function () {

        let proposedUsername = usernameInput.value;

        for (let i = 0; i < numUsers; i++) {
            if (proposedUsername.length === 0) {
                usernameValidation.innerText = ""
                break;
            }

            if (proposedUsername === currentUsernames[i].username) {
                usernameValidation.classList.remove("success");
                usernameValidation.classList.add("warn");
                usernameValidation.innerText = "Username Taken";
                break;

            } else {
                usernameValidation.classList.remove("warn");
                usernameValidation.classList.add("success");
                usernameValidation.innerText = "Username Available";
            }
        }
    });

    //Password match validation
    confirmPassword.addEventListener("input", function () {

        if (confirmPassword.value !== password.value) {
            passwordValidation.classList.add("warn");
            passwordValidation.innerText = "Passwords don't match!";

        } else {
            passwordValidation.innerText = "";
            passwordValidation.classList.remove("warn");
        }
    });
});