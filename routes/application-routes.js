const express = require("express");
const router = express.Router();

const articlesDao = require("../modules/articles-dao");
const commentsDao = require("../modules/comments-dao");
const { verifyAuthenticated } = require("../middleware/auth-middleware.js");
const fs = require("fs");
const upload = require("../middleware/multer-uploader.js");

const regions = ["Oceania", "Africa", "Europe", "Antarctica", "North-America", "South-America", "Asia", "Australia"];

//Navigate to the homepage
router.get("/", async function (req, res) {
  res.locals.title = "Home";
  res.locals.regions = regions;

  res.render("home");
});


// Navigate to region pages
router.get("/region/:region", async function (req, res) {
  const region = req.params.region;
  res.locals.title = region;
  res.locals.regionArticles = await articlesDao.retrieveArticlesByRegion(region);

  res.render("region-articles");
});


//Navigate to article page
router.get("/read-article/:id", async function (req, res) {
  const id = req.params.id;
  const article = await articlesDao.retrieveArticleById(id);
  const articleLikes = await articlesDao.retrieveArticleLikesById(id);
  const comments = await commentsDao.retrieveCommentsByArticleId(id);

  res.locals.article = article;
  res.locals.comment = comments;

  if (res.locals.user) {
    if (res.locals.user.id === article.userId) {
      res.locals.author = true;
    }

    articleLikes.forEach(function (article) {
      if (article.userId === res.locals.user.id) {
        res.locals.articleLiked = true;
      }
      else {
        res.locals.articleLiked = false;
      }
    });
  }

  res.locals.title = article.title;
  res.render("read-article");
});


// Route handler to the create-article page
router.post("/createArticle", verifyAuthenticated, upload.single("thumbnail"), async function (req, res) {

  const fileInfo = req.file;
  const oldFileName = fileInfo.path;
  const newFileName = `./public/images/uploadedImages/${fileInfo.originalname}`;
  fs.renameSync(oldFileName, newFileName);

  const article = {
    title: req.body.title,
    region: req.body.region,
    content: req.body.content,
    thumbnail: `/images/uploadedImages/${fileInfo.originalname}`,
    userId: res.locals.user.id,
    likes: 0
  }

  await articlesDao.createArticle(article)
  res.setToastMessage("Article posted!");

  res.redirect(`/region/${article.region}`);
});


// Route handler to render the edit-article page
router.get("/edit-article/:id", async function (req, res) {

  const id = req.params.id;
  const article = await articlesDao.retrieveArticleById(id);

  res.locals.regions = regions;
  res.locals.article = article;
  res.locals.article.fileName = article.thumbnail.substring(article.thumbnail.lastIndexOf('/') + 1);

  if (res.locals.user) {
    if (res.locals.user.id == article.userId) {
      res.locals.author = true;
    }
  }

  res.locals.title = "Edit Article";
  res.render("edit-article");
});


// Custom upload for TinyMCE to process images embedded into an article
router.post("/upload", upload.any(), async function (req, res) {
  const fileInfo = req.files[0];

  const oldFileName = fileInfo.path;
  const newFileName = `./public/images/articleImages/${fileInfo.originalname}`;
  fs.renameSync(oldFileName, newFileName);

  res.send({ "location": `../images/articleImages/${fileInfo.originalname}` });
});


//Navigate to the article creation page
router.get("/create-article", verifyAuthenticated, function (req, res) {

  res.locals.regions = regions;
  res.locals.title = "Create Article";

  res.render("create-article");
});


// POST request to update article content in the database
router.post("/editArticle/", verifyAuthenticated, upload.single("thumbnail"), async function (req, res) {

  const fileInfo = req.file;
  let article = {
    title: req.body.title,
    region: req.body.region,
    content: req.body.content,
    userId: res.locals.user.id,
    thumbnail: "",
    likes: 0,
    id: req.body.articleId
  };

  if (fileInfo === undefined) {
    article.thumbnail = `/images/uploadedImages/${req.body.fileName}`;
  } else {

    const oldFileName = fileInfo.path;
    const newFileName = `./public/images/uploadedImages/${fileInfo.originalname}`;
    fs.renameSync(oldFileName, newFileName);

    article.thumbnail = `/images/uploadedImages/${fileInfo.originalname}`;
  }
  await articlesDao.updateArticle(article)
  res.setToastMessage("Article saved!");
  res.redirect(`/read-article/${article.id}`);
});


// Delete an article if the user is also the author
router.post("/deleteArticle", verifyAuthenticated, async function (req, res) {

  await articlesDao.deleteArticle(req.body.articleId);
  res.setToastMessage("Article deleted!");
  
  res.redirect("/my-articles");
});


// Navigate to the account management page
router.get("/manage-account", verifyAuthenticated, async function (req, res) {

  res.locals.title = "Manage Account";
  res.render("manage-account");
});


// Navigate to view of articles the user has created
router.get("/my-articles", verifyAuthenticated, async function (req, res) {
  user = res.locals.user;
  const userId = res.locals.user.id;
  const myArticles = await articlesDao.retrieveArticlesByUserId(userId);
  res.locals.articles = myArticles;
  res.render("my-articles");
});


// Navigate to the account creation page
router.get("/create-account", function (req, res) {
  res.locals.title = "Create Account";
  res.render("create-account");
});


// POST request to update comments on an article page
router.post("/updateComments", async function (req, res) {

  const comment = {
    articleId: req.body.articleId,
    userId: req.body.userId,
    comment: req.body.comment
  }
  await commentsDao.createComment(comment);
});


// Route handler to update likes in the database
router.get("/updateLikes", async function (req, res) {
  const articleId = req.query.articleId;
  const likeStatus = req.query.likeStatus;
  const userId = res.locals.user.id;

  if (likeStatus == "unliked") {
    await articlesDao.addLike(articleId, userId);
  }
  else if (likeStatus == "liked") {
    await articlesDao.removeLike(articleId, userId);
  }
});


// Route handler to retrieve articals based on search input
router.get("/searchArticles", async function (req, res) {
  const searchDetails = req.query.articleSearch;
  const searchQuery = `%${searchDetails}%`;

  const articles = await articlesDao.retrieveArticalSearch(searchQuery);

  res.locals.searchArticles = articles;
  res.locals.title = "Search Articles";
  res.render("search-articles");
});

module.exports = router;
