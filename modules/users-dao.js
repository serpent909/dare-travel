const SQL = require("sql-template-strings");
const dbPromise = require("./database.js");

/**
 * Inserts the given user into the database. Then, reads the ID which is auto-generated and assigns it the user object.
 * @param user the user to insert into the database.
 */
async function createUser(user) {
    const db = await dbPromise;

    const result = await db.run(SQL`INSERT INTO users (username, password, firstname, lastname, email, age, bio, profilePicture, authToken) VALUES
    (${user.username}, ${user.password}, ${user.firstName}, ${user.lastName}, ${user.email}, ${user.age}, ${user.bio}, ${user.profilePicture}, ${user.authToken})`)

    // Get the auto-generated ID value, and assign it back to the user object.
    user.id = result.lastID;
}

async function createUserWithGoogle(user) {
    const db = await dbPromise;

    const result = await db.run(SQL`INSERT INTO users (firstname, lastname, email, profilePicture, authToken, googleAccountToken) VALUES
    (${user.firstName}, ${user.lastName}, ${user.email}, ${user.profilePicture}, ${user.authToken}, ${user.googleAccountToken})`)

    // Get the auto-generated ID value, and assign it back to the user object.
    user.id = result.lastID;
}

/**
 * Updates the given user in the database. Not including authToken.
 * @param  user the user to update in the database.
 */
async function updateUser(user) {
    const db = await dbPromise;

    await db.run(SQL`
        UPDATE users
        SET username = ${user.username}, password = ${user.password}, firstName = ${user.firstName}, 
            lastname = ${user.lastName}, email = ${user.email}, age = ${user.age}, bio = ${user.bio}, 
            profilePicture = ${user.profilePicture}, authToken = ${user.authToken}
            WHERE id = ${user.id}`);
}

async function updateGoogleUser(user) {
    const db = await dbPromise;

    await db.run(SQL`
        UPDATE users
        SET username = ${user.username}, firstName = ${user.firstName}, 
            lastname = ${user.lastName}, email = ${user.email}, age = ${user.age}, bio = ${user.bio}, 
            profilePicture = ${user.profilePicture}, authToken = ${user.authToken}
            WHERE id = ${user.id}`);
}

/**
 * Deletes the user with the given id from the database.
 * @param {number} id 
 */
async function deleteUser(id) {
    const db = await dbPromise;
    await db.run(SQL`
        DELETE FROM users
        WHERE id = ${id}`);
}

async function deleteUserByAuthToken(authToken) {
    const db = await dbPromise;
    await db.run(SQL`
        DELETE FROM users
        WHERE authToken = ${authToken}`);
}

/**
 * Gets the users with the matching username and password from the database.
 * If there isn't a matching user, undefined is returned.
 * @param {string} username 
 * @param {string} password  
 */
async function retrieveUserWithCredentials(username, password) {
    const db = await dbPromise;
    const user = await db.get(SQL`
        SELECT * FROM users
        WHERE username = ${username} AND password = ${password}`);

    return user;
}

/**
 * Gets the user with the matching authToken from the database.
 * If there is no matching user, undefined is returned.
 * @param {string} authToken the users authentication token.
 */
async function retrieveUserWithAuthToken(authToken) {
    const db = await dbPromise;
    const user = db.get(SQL`
        SELECT * FROM users
        WHERE authToken = ${authToken}`);

    return user;
}

/**
 * Gets the user with the given id from the database.
 * If there is no matching user, returns undefined. 
 * @param {number} id the id of the user to retrieve.
 */
async function retrieveUserById(id) {
    const db = await dbPromise;
    const user = await db.get(SQL`
        SELECT * FROM users
        WHERE id = ${id}`);

    return user;
}

async function retrieveUserByGoogleAccountToken(googleAccountToken) {
    const db = await dbPromise;
    const user = await db.get(SQL`
        SELECT * FROM users
        WHERE googleAccountToken = ${googleAccountToken}`);

    return user;
}

/**
 * Gets the user with the given username from the database.
 * If there is no matching user, returns undefined. 
 * @param {string} username the username of the user.
 */
async function retrieveUserByUsername(username) {
    const db = await dbPromise;
    const user = await db.get(SQL`
        SELECT * FROM users
        WHERE username = ${username}`);

    return user;
}

/**
 * Gets an array with all users from the database.
 */
async function retrieveAllUsers() {
    const db = await dbPromise;
    const users = await db.all(SQL`SELECT * from users`);

    return users;
}

/**
 * Gets an array all usernames from the database. 
 */
async function retrieveAllUsernames() {
    const db = await dbPromise;
    const usernames = await db.all(SQL`SELECT username from users`);
    
    return usernames;
}

// Export functions.
module.exports = {
    createUser,
    createUserWithGoogle,
    updateUser,
    updateGoogleUser,
    deleteUser,
    retrieveUserWithCredentials,
    retrieveUserWithAuthToken,
    retrieveUserById,
    retrieveUserByUsername,
    retrieveAllUsers,
    retrieveAllUsernames,
    retrieveUserByGoogleAccountToken,
    deleteUserByAuthToken
};