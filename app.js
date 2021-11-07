/**
 * Main application file.
 * 
 * NOTE: This file contains many required packages, but not all of them - you may need to add more!
 */

// Setup Express
const express = require("express");
const app = express();
const port = 3000;

//Setup DAO
const usersDao = require("./modules/users-dao");

// Setup Handlebars
const handlebars = require("express-handlebars");
app.engine("handlebars", handlebars({
    defaultLayout: "main"
}));
app.set("view engine", "handlebars");

// Create custom handlebar
const hbs = handlebars.create({});

hbs.handlebars.registerHelper('ifEquals', function(a, b, options) {
    if (a === b) {
      return options.fn(this);
    }
    return options.inverse(this);
  });

// Setup body-parser
app.use(express.urlencoded({ extended: false }));

//Setup express to parse JSON
app.use(express.json())

// Setup cookie-parser
const cookieParser = require("cookie-parser");
app.use(cookieParser());

// Make the "public" folder available statically
const path = require("path");
app.use(express.static(path.join(__dirname, "public")));

//Use the toaster middleware
app.use(require("./middleware/toaster-middleware.js"));

//Use the auth middleware
const { addUserToLocals } = require("./middleware/auth-middleware.js");
app.use(addUserToLocals);

// Setup routes
app.use(require("./routes/application-routes.js"));
app.use(require("./routes/auth-routes.js"));

//APIs
app.get("/getUsernames", async function (req, res) {
    let users = await usersDao.retrieveAllUsernames();
    res.json(users);
});

app.get("/getUserAccountInformation", async function (req, res) {
    const authToken = res.locals.user.authToken;
    let userAccountInformation = await usersDao.retrieveUserWithAuthToken(authToken);
    res.json(userAccountInformation);

});

// Start the server running.
app.listen(port, function () {
    console.log(`App listening on port ${port}!`);
});

