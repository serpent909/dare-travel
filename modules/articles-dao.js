const SQL = require("sql-template-strings");
const dbPromise = require("./database.js")

/**
 * Inserts the given article into the database. Then, reads the ID which is auto-generated and assigns it the user object.
 * @param article the article to insert into the database.
 */
async function createArticle(article) {
    const db = await dbPromise;

    const result = await db.run(SQL`INSERT INTO articles (title, region, content, thumbnail, userId, likes, articleDate) VALUES

        (${article.title}, ${article.region}, ${article.content}, ${article.thumbnail}, ${article.userId}, ${article.likes}, datetime('now'))`);

    // Get the auto-generated ID value, and assign it back to the article object.
    article.id = result.lastID;
}


/**
 * Updates the given article in the database.
 * @param article the article to update in the database.
 */
async function updateArticle(article) {
    const db = await dbPromise;

    await db.run(SQL`
        UPDATE articles
        SET title = ${article.title}, region = ${article.region}, content = ${article.content}, thumbnail = ${article.thumbnail}, articleDate = datetime('now')
        WHERE id = ${article.id}`);
}

/**
 * Deletes the article with the given id from the database.
 * @param {number} id 
 */
async function deleteArticle(id) {
    const db = await dbPromise;

    await db.run(SQL`
        DELETE FROM articles
        WHERE id = ${id}`);
}

/**
 * Gets the article with the given id from the database.
 * If there is no such article, undefined will be returned.
 * @param {number} id 
 */
async function retrieveArticleById(id) {
    const db = await dbPromise;

    const article = await db.get(SQL`
    SELECT a.id, a.title, a.region, a.content, a.thumbnail, a.userId, a.likes, a.articleDate, u.username, u.firstName, u.lastName, u.profilePicture 
    FROM articles a, users u
    WHERE a.userId = u.id AND a.id = ${id}`);

    return article;
}

/**
 * Gets the article with the given id from the database.
 * If there is no such article, undefined will be returned.
 * 
 * @param {string} region the region that the article is based on.
 */
async function retrieveArticlesByRegion(region) {
    const db = await dbPromise;

    const articles = await db.all(SQL`
    SELECT a.id, a.title, a.region, a.content, a.thumbnail, a.userId, a.likes, a.articleDate, u.username, u.firstName, u.lastName, u.profilePicture 
    FROM articles a, users u
    WHERE a.userId = u.id AND a.region = ${region}`);

    return articles;
}

/**
 * Gets an array of articles with the given userId from the database.
 * If there is no such user, undefined will be returned.
 * 
 * @param {number} userId the id of the user who created the article.
 */
async function retrieveArticlesByUserId(userId) {
    const db = await dbPromise;

    const articles = await db.all(SQL`
        SELECT * FROM articles
        WHERE userId = ${userId}`);

    return articles;
}

async function retrieveArticalSearch(searchQuery) {
    const db = await dbPromise;

    const articles = await db.all(SQL`
        SELECT a.id, a.title, a.region, a.thumbnail, a.userId, a.likes, a.articleDate, u.username, u.firstName, u.lastName, u.profilePicture
        FROM articles a, users u
        WHERE a.userId = u.id AND (a.region LIKE ${searchQuery} OR a.title LIKE ${searchQuery} OR u.username LIKE ${searchQuery})
        GROUP BY a.id`);

    return articles;
}

async function addLike(articleId, userId) {
    const db = await dbPromise;

    await db.run(SQL`
        UPDATE articles
        SET likes = likes + 1
        WHERE id = ${articleId}`)

    await db.run(SQL`
    INSERT INTO articleLikes (articleId, userId)
    VALUES (${articleId}, ${userId})`);
}

async function removeLike(articleId, userId) {
    const db = await dbPromise;

    await db.run(SQL`
        UPDATE articles
        SET likes = likes - 1
        WHERE id = ${articleId}`);

    await db.run(SQL`
        DELETE FROM articleLikes
        WHERE articleId = ${articleId} AND userId = ${userId}`);
}

async function retrieveArticleLikesById(id) {
    const db = await dbPromise;

    const articleLikes = await db.all(SQL`
    SELECT * FROM articleLikes
    WHERE articleId = ${id}`);

    return articleLikes;
}

// Export functions.
module.exports = {
    createArticle,
    updateArticle,
    deleteArticle,
    retrieveArticleById,
    retrieveArticlesByRegion,
    retrieveArticlesByUserId,
    retrieveArticalSearch,
    addLike,
    removeLike,
    retrieveArticleLikesById
};