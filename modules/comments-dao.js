const SQL = require("sql-template-strings");
const dbPromise = require("./database.js");

/**
 * Inserts the given comment into the database. Then, reads the ID which is auto-generated and assigns it the user object.
 * 
 * @param comment the comment to insert into the database.
 */
async function createComment(comment) {
    const db = await dbPromise;

    const result = await db.run(SQL`INSERT INTO comments (articleId, userId, comment, commentDate) VALUES
    (${comment.articleId}, ${comment.userId}, ${comment.comment}, datetime('now'))`);

    comment.id = result.lastID;
}

/**
 * Updates the given comment in the database.
 * 
 * @param comment the comment to update in the database. 
 */
async function updateComment(comment) {
    const db = await dbPromise;

    await db.run(SQL`
        UPDATE comments
        SET comment = ${comment.comment}
        WHERE id = ${comment.id}`);
}

/**
 * Deletes the comment with the given id from the database.
 * 
 * @param {number} id 
 */
async function deleteComment(id) {
    const db = await dbPromise;

    await db.run(SQL`
    DELETE FROM comments
    WHERE id = ${id}`);
}

/**
 * Gets the comment with the given id from the database.
 * If there is no such comment, undefined will be returned.
 * 
 * @param {number} id 
 */
 async function retrieveCommentById(id) {
    const db = await dbPromise;

    const comment = await db.get(SQL`
        SELECT * FROM comments
        WHERE id = ${id}`);

    return comment;
}

/**
 * Gets an array of comments with the given articleId from the database.
 * If there is no such article, undefined will be returned.
 * 
 * @param {number} articleId the id of the article the comments relate to. 
 */
 async function retrieveCommentsByArticleId(articleId) {
    const db = await dbPromise;

    const comments = await db.all(SQL`
        SELECT c.id, c.articleId, u.username, u.firstName, u.lastName, u.profilePicture, c.comment, c.commentDate 
        FROM comments c, users u
        WHERE c.userId = u.id AND c.articleId = ${articleId}`);

    return comments;
}

/**
 * Gets an array of comments with the given userId from the database.
 * If there is no such user, undefined will be returned.
 * 
 * @param {number} userId the id of the user who created the comment.
 */
 async function retrieveCommentsByUserId(userId) {
    const db = await dbPromise;

    const comments = await db.all(SQL`
        SELECT * FROM comments
        WHERE userId = ${userId}`);

    return comments;
}

// Export functions.
module.exports = {
    createComment,
    retrieveCommentById,
    retrieveCommentsByArticleId,
    retrieveCommentsByUserId
}