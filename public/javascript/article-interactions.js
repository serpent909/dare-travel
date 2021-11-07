window.addEventListener("load", function () {

    const commentForm = document.getElementById("comment-form");
    const likeBtn = document.getElementsByClassName("article-like")[0];
    const likesCounter = document.getElementById("likesCounter");

    // Update Article Comments
    commentForm.addEventListener("submit", async function (event) {
        event.preventDefault();

        let articleId = document.getElementById("articleIdComments").value;
        let userId = document.getElementById("userId").value;
        let comment = document.getElementById("comment").value;

        await fetch("/updateComments", {
            method: "POST",
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ "articleId": articleId, "userId": userId, "comment": comment })
        });
    });

    // Update Article Likes
    likeBtn.addEventListener("click", async function (event) {
        let articleId = event.target.value;
        let currentLikes = parseInt(likesCounter.getAttribute("value"));
        let likeStatus = likeBtn.getAttribute("id");

        if (likeStatus == "unliked") {
            likesCounter.innerHTML = "Likes " + (currentLikes + 1);
            await updateLikes(articleId, likeStatus);
        }

        else if (likeStatus == "liked") {
            likesCounter.innerHTML = "Likes " + (currentLikes - 1);
            await updateLikes(articleId, likeStatus);
        }

        async function updateLikes(articleId, likeStatus) {
            await fetch(`/updateLikes?articleId=${articleId}&likeStatus=${likeStatus}`);
        }
    });
});