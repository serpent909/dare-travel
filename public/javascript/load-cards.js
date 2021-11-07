window.addEventListener("load", function () {

    //Select all the card elements
    let cards = document.querySelectorAll(".regionMenu__card");

    //Loop through card elements with a time delay and add the visible class
    for (let i = 0; i < cards.length; i++) {
        setTimeout(function () {
            cards[i].classList.add("visible")
        }, 300 * (i + 1));
    }

});