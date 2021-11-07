const usersDao = require("../modules/users-dao");
const articlesDao = require("../modules/articles-dao");

async function addUserToLocals(req, res, next) {
    const user = await usersDao.retrieveUserWithAuthToken(req.cookies.authToken);
    res.locals.user = user;
    
    next();
}

async function verifyAuthenticated(req, res, next) {
    if (res.locals.user) {
  
        const id = res.locals.user.id;
        const articles = await articlesDao.retrieveArticlesByUserId(id);
        res.locals.articles = await articles;
        
        next();
    } else {
 
        res.redirect("/");
    }
}

module.exports = {
    addUserToLocals,
    verifyAuthenticated,

}