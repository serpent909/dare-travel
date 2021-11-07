#COMPSCI 719 Final Project; A Person Blogging System; Team:
Dandelion Deer

a) Brief Introduction to webapp
We have made a travel blog for travellers called “Dare Travel”. The travel blog can be read by anyone that uses the website. However, only individuals that create an account can post an article to the blog.

The content of the blog is categorised by the 8 major continents (Asia, Africa, North America, South America, Antarctica, Europe, Australia and Oceania). This is the way our “Home Page” is organised so that you can choose which article you want to read based on the 8 continents. Also, when you write an article one of the requirements is that you categorise your article by the 8 continents. 
The website is designed to be used on all devices (i.e., desktops, phones & tablets). 

b) Compulsory Features
All 11 of the compulsory features required for the assignment have been completed in full. There have been no partially completed features.

c) Extra features
-Search functionality:  Contained in the Navbar is a search box. This allows users to search for an article post based on its title, author and region. 

-Comments: For users that have an account and are logged in they have the ability to comment on articles that have been posted. The comments section can be accessed on the “read-article” page if the user wants to write a comment. Comments can be seen on the “region/Continent” page which lists all the articles assigned to that continent and on the “read-article” page (for users with and without an account).  

-Likes: For users that have an account and are logged in they have the ability to like articles that have been posted. The likes section can be accessed on the “read-article” page if the user wants to like an article. Likes can be seen on the “region/Continent” page which lists all the articles assigned to that continent and on the “read-article” page.  An article with more likes than others suggests that it is an article worth reading! 

-Single Sign On: Users can use a “Single Sign On” with their Google Account rather then providing all the required details on the create account page. The user then has the option to edit their account details in the “manage account” page.  

-Maps: Using a ArcGIS API, we have a map embedded into the” Home Page” that shows the continents that our blog is categorised by. The continent can then be clicked on and that will take you to the “region/Continent” page where you can read all articles that have been assigned to that continent. 

d) Database file
The database file should be named “project-database.db”. 

e) Does the marker need to do anything prior to running your webapp, other than npm install
The marker needs to provide Matt Smith with their gmail address in order to be able to use the “Single Sign On” additional feature described above.

The user will have to run project-database-init-script.sql. This will create the tables for articles, users, comments and article likes and populate these tables with test data. 

f) Does the marker need to do anything special to run your webapp, other then running NPM start?

To run this webapp do an “npm install” then start the app using “npm start”. You should be able to browse to http://localhost:3000 and see the rendered “home-page”. From there you can see the other pages and create an account. 

g) At least one username/ password combination for an existing user in your system with some already-published articles.

The below username / password combinations can be used after database initialisation:

user1: pa55word
user2: pa55word
user3: pa55word
user4: pa55word

No Google accounts can be initialised with the database script. However, this functionality can be tested by simply singing in with a Google account. 
For published apps, Google requires an application which takes 3-4 weeks to process before SSO functionality can be integrated into a live website. During development, functionality can be tested with named Google accounts only, these are set in the developer console. The following accounts have been granted permission to sign in with Google for the purposes of marking. 

amea020@aucklanduni.ac.nz
ytu001@aucklanduni.ac.nz
wzhe219@aucklanduni.ac.nz
wwan999@aucklanduni.ac.nz


h) Any further instructions

Enjoy using the website :)
