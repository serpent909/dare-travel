const { v4: uuid } = require("uuid");
const express = require("express");
const router = express.Router();
router.use(express.urlencoded({ extended: false }));
const usersDao = require("../modules/users-dao");
const bcrypt = require('bcrypt');

const { verifyAuthenticated } = require("../middleware/auth-middleware.js");
const { OAuth2Client } = require('google-auth-library');
const client = new OAuth2Client("787140582355-d9k9m0j892624bbi2m5vd5qha9v92ako.apps.googleusercontent.com");


// Whenever we POST to /login, check the username and password submitted by the user.
// If they match a user in the database, give that user an authToken, save the authToken
// in a cookie, and redirect to "/".
router.post("/login", async function (req, res) {

    // Get the username and password submitted in the form
    const username = req.body.username;
    const password = req.body.password;

    // Find a matching user in the database

    const user = await usersDao.retrieveUserByUsername(username);

    if (user) {
        const passwordMatch = await bcrypt.compare(password, user.password);
        if (passwordMatch) {
            // If there is a matching user in the database. Given that user an authToken save in a cookie and redirect to the homepage.

            const authToken = uuid();
            user.authToken = authToken;
            await usersDao.updateUser(user);
            res.cookie("authToken", authToken);
            res.locals.user = user;
            res.setToastMessage("Login Successful, Welcome " + user.username + "!");
            res.redirect('back');
        }

        // Otherwise, if there's no matching user in the database. Don't assign a token, send toast message and redirect to login.
        else {
            res.locals.user = null;
            res.setToastMessage("Login Failed!");
            res.redirect('back')
        }
    }

    else {
        res.locals.user = null;
        res.setToastMessage("Login Failed!");
        res.redirect('back');
    }
});


//Google autentication and create new Google-based account
router.post("/google", async function (req, res) {

    const idToken = req.body.credential;
    const clientID = "787140582355-d9k9m0j892624bbi2m5vd5qha9v92ako.apps.googleusercontent.com"
    const token = await client.verifyIdToken({
        idToken: idToken,
        audience: clientID
    })

    const googleAccountToken = token.payload.sub;
    const googleUser = await usersDao.retrieveUserByGoogleAccountToken(googleAccountToken); 

    if(googleUser === undefined) {

        const authToken = uuid();

        const user = {
    
            firstName: token.payload.given_name,
            lastName: token.payload.family_name,
            email: token.payload.email,
            profilePicture: token.payload.picture,
            authToken: authToken,
            googleAccountToken: token.payload.sub
        }
    
        await usersDao.createUserWithGoogle(user);
        res.cookie("authToken", authToken);
        res.locals.user = user;
        res.locals.googleAccount = true;
        res.setToastMessage("Account created!")

        res.redirect("/manage-account");

    } else {

        const user = googleUser;
        const authToken = uuid();
        user.authToken = authToken;
        await usersDao.updateUser(user);
        res.cookie("authToken", authToken);
        res.locals.user = user;
        res.locals.googleAccount = true;
        res.setToastMessage("Successfully signed in!")
  
        res.redirect("/");
    }
});

//Accept account creation form and create new user
router.post("/createAccount", async function (req, res) {

    const authToken = uuid();

    const salt = bcrypt.genSaltSync(10);
    //Hash Password
    const hash = bcrypt.hashSync(req.body.password, salt);

    const user = {
        username: req.body.username,
        firstName: req.body.fName,
        lastName: req.body.lName,
        age: req.body.age,
        email: req.body.email,
        profilePicture: req.body.profilePicture,
        bio: req.body.bio,
        password: hash,
        authToken: authToken
    }

    await usersDao.createUser(user);
    res.cookie("authToken", authToken);
    res.locals.user = user;

    res.redirect("/");
});


//Update account information
router.post("/updateAccount", async function (req, res) {

    if (res.locals.user.googleAccountToken) {

        const id = res.locals.user.id;
        const authToken = res.locals.user.authToken;

        const user = {
            id: id,
            username: req.body.username,
            firstName: req.body.fName,
            lastName: req.body.lName,
            age: req.body.age,
            email: req.body.email,
            profilePicture: req.body.profilePicture,
            bio: req.body.bio,
            authToken: authToken
        }

        await usersDao.updateGoogleUser(user)

        res.redirect("/manage-account")

    } else {

        //generate a Salt
        const salt = bcrypt.genSaltSync(10);
        //Hash Password
        const hash = bcrypt.hashSync(req.body.password, salt);

        const id = res.locals.user.id;
        const authToken = res.locals.user.authToken;

        const user = {
            id: id,
            username: req.body.username,
            firstName: req.body.fName,
            lastName: req.body.lName,
            age: req.body.age,
            email: req.body.email,
            profilePicture: req.body.profilePicture,
            bio: req.body.bio,
            password: hash,
            authToken: authToken
        }

        await usersDao.updateUser(user)

        res.redirect("/manage-account")
    }
});


// Whenever we navigate to /logout, delete the authToken cookie.
// redirect to "/login", supplying a "logged out successfully" message.
router.get("/logout", function (req, res) {
    res.clearCookie("authToken");
    res.locals.user = null;
    res.setToastMessage("Successfully logged out!");
    res.redirect("./");
});


router.post("/deleteAccount", verifyAuthenticated, async function (req, res){

    const authToken = res.locals.user.authToken;
    await usersDao.deleteUserByAuthToken(authToken);
    res.setToastMessage("Successfully deleted account!");

    res.redirect("/");

});

module.exports = router;
