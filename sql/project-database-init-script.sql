/*
 * Upon submission, this file should contain the SQL script to initialize your database.
 * It should contain all DROP TABLE and CREATE TABLE statements, and any INSERT statements
 * required.
 */

DROP TABLE IF EXISTS comments;
DROP TABLE IF EXISTS articleLikes;
DROP TABLE IF EXISTS articles;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
	id INTEGER NOT NULL PRIMARY KEY, 
	username varchar(64) UNIQUE, 
	password varchar(64), 
	firstName varchar(64) NOT NULL, 
	lastName varchar(64) NOT NULL, 
	email varchar(64) NOT NULL, 
	age INTEGER, 
	bio varchar(300), 
	profilePicture varchar(64) NOT NULL,
	authToken varchar(128),
	googleAccountToken varchar(24)
);

CREATE TABLE articles (
	id INTEGER NOT NULL PRIMARY KEY, 
	title VARCHAR(64) NOT NULL, 
	region VARCHAR(64) NOT NULL,
	content TEXT, 
	thumbnail VARCHAR(64),
	userId INTEGER NOT NULL, 
	likes INTEGER NOT NULL,
	articleDate DATETIME NOT NULL,
	FOREIGN KEY (userId) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE articleLikes (
	id INTEGER NOT NULL PRIMARY KEY,
	articleId INTEGER NOT NULL, 
	userId INTEGER NOT NULL, 
	FOREIGN KEY (articleId) REFERENCES articles(id) ON DELETE CASCADE
);

CREATE TABLE comments (
	id INTEGER NOT NULL PRIMARY KEY, 
	articleId INTEGER NOT NULL, 
	userId INTEGER NOT NULL, 
	comment VARCHAR(300),
	commentDate DATETIME NOT NULL,
	FOREIGN KEY (articleId) REFERENCES articles(id) ON DELETE CASCADE,
	FOREIGN KEY (userId) REFERENCES users(id) ON DELETE CASCADE
);

INSERT INTO "users" ("id","username","password","firstName","lastName","email","age","bio","profilePicture","authToken","googleAccountToken") VALUES (1,'user1','$2b$10$yL5VdI9QkOMWPx.Mx3zrKu2ZXiVFekeINSbZcbO9IrV47ZHawniIW','Peter','Smart','peters@email.com',55,'I''m 55 years old and living in Amsterdam. Looking for awesome things to do in Asia.','/images/avatars/hiker.png','7a9999a3-62c2-4fa1-8e9e-4b5667480b27',NULL),
 (2,'user2','$2b$10$jZZTew.RYpOTpnlx20Qv6u.PNOa.Z5Ft9o3EGkFl0futY.lnCnrxu','Alice','Green','alices@email.com',24,'I''m living in North America and looking for some exciting adventures in the Pacific.','/images/avatars/surfer.png','f52bb4f2-009f-4593-b7a3-5afa752c14b8',NULL),
 (3,'user3','$2b$10$PDetb2DwMPBNaikJW6B4eelE.MGZyFepMV28OB.7jwu5IJclelB9.','Paul','Jones','jones451@email.com',35,'I''m a nature photographer looking for a new challenges. I''''m thinking Africa...','/images/avatars/skiier.png','b646e34f-d305-407a-a890-e022eb81ca3a',NULL),
 (4,'user4','$2b$10$GYDlbZulZ7VO6UQvRaKXQux/18mKCMQO7.MENppUIGnGnEyZe5mZS','Jan','Bedford','janb123@email.com',70,'I just want to hear about people''s exciting adventures.','/images/avatars/lady.png','d984f821-642d-4241-b658-78920401478e',NULL);
INSERT INTO "articles" ("id","title","region","content","thumbnail","userId","likes","articleDate") VALUES (1,'Top Cities to Visit in Asia for 2022','Asia','<h4>Itching to travel but not sure where you should be going? We&rsquo;ve made a list of the top Asian cities to visit in 2022, so you can get planning your next adventure.</h4>







<h4>Busan</h4>







<p>South Korea is a destination just starting to establish itself as a top Asian travel destination. With Seoul as its buzzing capital, Busan is South Korea&rsquo;s second city with more of a laid back vibe.</p>







<p>Located right on the coast, it&rsquo;s home to stretches of beautiful beaches. One of Busan&rsquo;s features that break with how many imagine South Korea is the brightly coloured Gamcheon Culture Village, sometimes referred to as the &lsquo;Machu Pichu of South Korea&rsquo;. The neighbourhood and its construction have a complex past but today the city takes pride in it as a tourist attraction. Wander around its winding streets, marvel at the street art, and grab a bite to eat.</p>







<p>As for other activities you can get up to the in the city, it&rsquo;s a pretty long list. Some of our favourites when we visit on our South Korea Tour include exploring its seafood markets, riding its marine cable car, paying a visit to the Haedong Yonggungsa Temple, and relaxing in one of its jjimjilbangs (bathhouses).</p>







<h4><img class="alignnone wp-image-96353 size-large lazyloaded" src="https://thedragontrip.com/wp-content/uploads/2021/08/62D2BC14-0F36-4973-AAD1-650D84175D3B-1024x536.jpg" sizes="(max-width: 1024px) 100vw, 1024px" srcset="https://thedragontrip.com/wp-content/uploads/2021/08/62D2BC14-0F36-4973-AAD1-650D84175D3B-1024x536.jpg 1024w, https://thedragontrip.com/wp-content/uploads/2021/08/62D2BC14-0F36-4973-AAD1-650D84175D3B-300x157.jpg 300w, https://thedragontrip.com/wp-content/uploads/2021/08/62D2BC14-0F36-4973-AAD1-650D84175D3B-768x402.jpg 768w, https://thedragontrip.com/wp-content/uploads/2021/08/62D2BC14-0F36-4973-AAD1-650D84175D3B-1536x804.jpg 1536w, https://thedragontrip.com/wp-content/uploads/2021/08/62D2BC14-0F36-4973-AAD1-650D84175D3B-2048x1072.jpg 2048w, https://thedragontrip.com/wp-content/uploads/2021/08/62D2BC14-0F36-4973-AAD1-650D84175D3B-260x136.jpg 260w, https://thedragontrip.com/wp-content/uploads/2021/08/62D2BC14-0F36-4973-AAD1-650D84175D3B-50x26.jpg 50w, https://thedragontrip.com/wp-content/uploads/2021/08/62D2BC14-0F36-4973-AAD1-650D84175D3B-143x75.jpg 143w, https://thedragontrip.com/wp-content/uploads/2021/08/62D2BC14-0F36-4973-AAD1-650D84175D3B-scaled.jpg 1920w" alt="Busan" width="722" height="378" data-srcset="https://thedragontrip.com/wp-content/uploads/2021/08/62D2BC14-0F36-4973-AAD1-650D84175D3B-1024x536.jpg 1024w, https://thedragontrip.com/wp-content/uploads/2021/08/62D2BC14-0F36-4973-AAD1-650D84175D3B-300x157.jpg 300w, https://thedragontrip.com/wp-content/uploads/2021/08/62D2BC14-0F36-4973-AAD1-650D84175D3B-768x402.jpg 768w, https://thedragontrip.com/wp-content/uploads/2021/08/62D2BC14-0F36-4973-AAD1-650D84175D3B-1536x804.jpg 1536w, https://thedragontrip.com/wp-content/uploads/2021/08/62D2BC14-0F36-4973-AAD1-650D84175D3B-2048x1072.jpg 2048w, https://thedragontrip.com/wp-content/uploads/2021/08/62D2BC14-0F36-4973-AAD1-650D84175D3B-260x136.jpg 260w, https://thedragontrip.com/wp-content/uploads/2021/08/62D2BC14-0F36-4973-AAD1-650D84175D3B-50x26.jpg 50w, https://thedragontrip.com/wp-content/uploads/2021/08/62D2BC14-0F36-4973-AAD1-650D84175D3B-143x75.jpg 143w, https://thedragontrip.com/wp-content/uploads/2021/08/62D2BC14-0F36-4973-AAD1-650D84175D3B-scaled.jpg 1920w" data-src="https://thedragontrip.com/wp-content/uploads/2021/08/62D2BC14-0F36-4973-AAD1-650D84175D3B-1024x536.jpg" data-sizes="(max-width: 1024px) 100vw, 1024px" /></h4>







<h4>Hanoi</h4>







<p>Although the Southeast Asian region is a well-trodden route for backpackers, we still don&rsquo;t feel Hanoi gets the credit it deserves. With Vietnam not being quite as popular as the likes of Thailand, you can still easily explore this city without feeling like you&rsquo;re at a 24 hour party. Plus, as the Vietnamese economy develops, the &lsquo;modern character&rsquo; of the country&rsquo;s cities is becoming more distinct.</p>







<p>Paying a visit to the city still means you have to do the main attractions &ndash; exploring the Old Quarter is a must as is visiting the National Museum of Vietnamese History. Of course, also grab some street food! We&rsquo;d also recommend taking your time though: try visiting a few temples (we&rsquo;d recommend the Temple of Literature), head up to the top of the city&rsquo;s Lotte Centre for an incredible view of the city, and make the walk across the Long Bien Bridge, a structure very important to the Vietnamese people.</p>







<h4><img class="alignnone wp-image-14931 size-full lazyloaded" src="https://thedragontrip.com/wp-content/uploads/2019/02/hanoi-main.jpg" sizes="(max-width: 968px) 100vw, 968px" srcset="https://thedragontrip.com/wp-content/uploads/2019/02/hanoi-main.jpg 968w, https://thedragontrip.com/wp-content/uploads/2019/02/hanoi-main-300x211.jpg 300w, https://thedragontrip.com/wp-content/uploads/2019/02/hanoi-main-768x540.jpg 768w, https://thedragontrip.com/wp-content/uploads/2019/02/hanoi-main-208x146.jpg 208w, https://thedragontrip.com/wp-content/uploads/2019/02/hanoi-main-50x35.jpg 50w, https://thedragontrip.com/wp-content/uploads/2019/02/hanoi-main-107x75.jpg 107w" alt="" width="728" height="512" data-srcset="https://thedragontrip.com/wp-content/uploads/2019/02/hanoi-main.jpg 968w, https://thedragontrip.com/wp-content/uploads/2019/02/hanoi-main-300x211.jpg 300w, https://thedragontrip.com/wp-content/uploads/2019/02/hanoi-main-768x540.jpg 768w, https://thedragontrip.com/wp-content/uploads/2019/02/hanoi-main-208x146.jpg 208w, https://thedragontrip.com/wp-content/uploads/2019/02/hanoi-main-50x35.jpg 50w, https://thedragontrip.com/wp-content/uploads/2019/02/hanoi-main-107x75.jpg 107w" data-src="https://thedragontrip.com/wp-content/uploads/2019/02/hanoi-main.jpg" data-sizes="(max-width: 968px) 100vw, 968px" /></h4>







<h4>Almaty</h4>







<p>Central Asia (aka the &lsquo;Stans) is one of the rising stars in Asian travel. Much of what draws travellers to the area is its sprawling rural areas but you&rsquo;d be foolish to visit without exploring its cities. Kazakhstan&rsquo;s former capital, Almaty, is home to an incredibly diverse range of attractions.</p>







<p>Its rural location means you can still make the most of Kazakhstan&rsquo;s natural beauty on a day trip &ndash; we&rsquo;d recommend heading out to Turgen Gorge to explore its forests, waterfalls and breath-taking views. In the evening, explore its range of caf&eacute;s and restaurants to try some of the&nbsp;<a href="https://thedragontrip.com/blog/top-5-central-asian-food/">traditional dishes of Kazakhstan</a>. If you&rsquo;re looking to party, head out for the night and make the most of the city&rsquo;s micro-brewery scene.</p>







<p>When it comes to spending time in the city itself there are a few essential activities you can&rsquo;t miss. On our tour there we make sure we visit its Soviet baths, explore its traditional bazaars and cathedrals, head up to the Kok Tobe viewpoint, and then (for a bit of fun) try out some of the city&rsquo;s rollercoasters. For more info, check out&nbsp;<a href="https://thedragontrip.com/blog/48-hours-in-almaty-central-asia-pre-trip-guide/">this guide</a>.</p>







<h4><img class="alignnone wp-image-96354 size-large lazyloaded" src="https://thedragontrip.com/wp-content/uploads/2021/08/Almaty-Copy-1024x682.jpg" sizes="(max-width: 1024px) 100vw, 1024px" srcset="https://thedragontrip.com/wp-content/uploads/2021/08/Almaty-Copy-1024x682.jpg 1024w, https://thedragontrip.com/wp-content/uploads/2021/08/Almaty-Copy-300x200.jpg 300w, https://thedragontrip.com/wp-content/uploads/2021/08/Almaty-Copy-768x512.jpg 768w, https://thedragontrip.com/wp-content/uploads/2021/08/Almaty-Copy-1536x1024.jpg 1536w, https://thedragontrip.com/wp-content/uploads/2021/08/Almaty-Copy-219x146.jpg 219w, https://thedragontrip.com/wp-content/uploads/2021/08/Almaty-Copy-50x33.jpg 50w, https://thedragontrip.com/wp-content/uploads/2021/08/Almaty-Copy-113x75.jpg 113w, https://thedragontrip.com/wp-content/uploads/2021/08/Almaty-Copy-scaled.jpg 1800w" alt="Almaty, Kazakhstan" width="739" height="492" data-srcset="https://thedragontrip.com/wp-content/uploads/2021/08/Almaty-Copy-1024x682.jpg 1024w, https://thedragontrip.com/wp-content/uploads/2021/08/Almaty-Copy-300x200.jpg 300w, https://thedragontrip.com/wp-content/uploads/2021/08/Almaty-Copy-768x512.jpg 768w, https://thedragontrip.com/wp-content/uploads/2021/08/Almaty-Copy-1536x1024.jpg 1536w, https://thedragontrip.com/wp-content/uploads/2021/08/Almaty-Copy-219x146.jpg 219w, https://thedragontrip.com/wp-content/uploads/2021/08/Almaty-Copy-50x33.jpg 50w, https://thedragontrip.com/wp-content/uploads/2021/08/Almaty-Copy-113x75.jpg 113w, https://thedragontrip.com/wp-content/uploads/2021/08/Almaty-Copy-scaled.jpg 1800w" data-src="https://thedragontrip.com/wp-content/uploads/2021/08/Almaty-Copy-1024x682.jpg" data-sizes="(max-width: 1024px) 100vw, 1024px" /></h4>







<h4>New Delhi</h4>







<p>It&rsquo;s big, busy, and likely to be a shock to the system when you arrive. Although that might sound intimidating to some, it&rsquo;s what makes New Delhi so great. The city is packed with markets, temples, restaurants, bars and a whole lot more. Plus, despite what you might imagine, the city is also roughly 20% green space, so there&rsquo;s no shortage of&nbsp;<a href="https://theculturetrip.com/asia/india/articles/the-5-most-beautiful-parks-in-new-delhi/" target="_blank" rel="noopener">beautiful parks to relax in</a>.</p>







<p>It&rsquo;s difficult to condense a list of things to do in New Delhi but visiting street food markets is a must (we&rsquo;d recommend Sarojini Nagar). You have to make sure you visit at least one of the city&rsquo;s temples &ndash; we go to the Sikh temple Gurudwara Bangla Sahib on our India tour. If you like to party then make the most of New Delhi&rsquo;s nightlife, there are plenty of hotspots for this but The Dragon Trip&rsquo;s favourite is probably Hauz Khas Village.</p>







<h4><img class="alignnone wp-image-29646 size-large lazyloaded" src="https://thedragontrip.com/wp-content/uploads/2021/02/delhi-street-food-1024x683.jpg" sizes="(max-width: 1024px) 100vw, 1024px" srcset="https://thedragontrip.com/wp-content/uploads/2021/02/delhi-street-food-1024x683.jpg 1024w, https://thedragontrip.com/wp-content/uploads/2021/02/delhi-street-food-300x200.jpg 300w, https://thedragontrip.com/wp-content/uploads/2021/02/delhi-street-food-768x512.jpg 768w, https://thedragontrip.com/wp-content/uploads/2021/02/delhi-street-food-1536x1024.jpg 1536w, https://thedragontrip.com/wp-content/uploads/2021/02/delhi-street-food-219x146.jpg 219w, https://thedragontrip.com/wp-content/uploads/2021/02/delhi-street-food-50x33.jpg 50w, https://thedragontrip.com/wp-content/uploads/2021/02/delhi-street-food-113x75.jpg 113w, https://thedragontrip.com/wp-content/uploads/2021/02/delhi-street-food-scaled.jpg 1800w" alt="street food vendor in delhi" width="750" height="500" data-srcset="https://thedragontrip.com/wp-content/uploads/2021/02/delhi-street-food-1024x683.jpg 1024w, https://thedragontrip.com/wp-content/uploads/2021/02/delhi-street-food-300x200.jpg 300w, https://thedragontrip.com/wp-content/uploads/2021/02/delhi-street-food-768x512.jpg 768w, https://thedragontrip.com/wp-content/uploads/2021/02/delhi-street-food-1536x1024.jpg 1536w, https://thedragontrip.com/wp-content/uploads/2021/02/delhi-street-food-219x146.jpg 219w, https://thedragontrip.com/wp-content/uploads/2021/02/delhi-street-food-50x33.jpg 50w, https://thedragontrip.com/wp-content/uploads/2021/02/delhi-street-food-113x75.jpg 113w, https://thedragontrip.com/wp-content/uploads/2021/02/delhi-street-food-scaled.jpg 1800w" data-src="https://thedragontrip.com/wp-content/uploads/2021/02/delhi-street-food-1024x683.jpg" data-sizes="(max-width: 1024px) 100vw, 1024px" /></h4>







<h4>Kyoto</h4>







<p>Although the Olympics didn&rsquo;t quite go as planned for Japan, they were partly intended as a signal of how the country ranks in the big leagues when it comes to travel destinations. It&rsquo;s undoubtedly true, and if you don&rsquo;t believe us, pay a visit to Kyoto in 2022.</p>







<p>Japan is famously a blend of preserved historical traditional and trailblazing modern technology. Robots and geishas, Super Mario and sumos, Skyscrapers and temples. If you were picking a city where this blend is most apparent, we would say it&rsquo;s Kyoto.</p>







<p>Must-visits and activities while you&rsquo;re there include beautiful temples and religious sites (Kinkaku-Ji and the Fushimi Inari Shrine to name a couple), checking out the International Manga Museum, watching a geisha performance, learning calligraphy, and doing some classic Japanese karaoke! We could go on, but you probably need to visit for yourself.</p>







<p><em><img class="alignnone wp-image-96355 size-large lazyloaded" src="https://thedragontrip.com/wp-content/uploads/2021/08/Kyoto-2-1024x683.jpg" sizes="(max-width: 1024px) 100vw, 1024px" srcset="https://thedragontrip.com/wp-content/uploads/2021/08/Kyoto-2-1024x683.jpg 1024w, https://thedragontrip.com/wp-content/uploads/2021/08/Kyoto-2-300x200.jpg 300w, https://thedragontrip.com/wp-content/uploads/2021/08/Kyoto-2-768x512.jpg 768w, https://thedragontrip.com/wp-content/uploads/2021/08/Kyoto-2-1536x1024.jpg 1536w, https://thedragontrip.com/wp-content/uploads/2021/08/Kyoto-2-2048x1365.jpg 2048w, https://thedragontrip.com/wp-content/uploads/2021/08/Kyoto-2-219x146.jpg 219w, https://thedragontrip.com/wp-content/uploads/2021/08/Kyoto-2-50x33.jpg 50w, https://thedragontrip.com/wp-content/uploads/2021/08/Kyoto-2-113x75.jpg 113w, https://thedragontrip.com/wp-content/uploads/2021/08/Kyoto-2-scaled.jpg 1800w" alt="" width="713" height="476" data-srcset="https://thedragontrip.com/wp-content/uploads/2021/08/Kyoto-2-1024x683.jpg 1024w, https://thedragontrip.com/wp-content/uploads/2021/08/Kyoto-2-300x200.jpg 300w, https://thedragontrip.com/wp-content/uploads/2021/08/Kyoto-2-768x512.jpg 768w, https://thedragontrip.com/wp-content/uploads/2021/08/Kyoto-2-1536x1024.jpg 1536w, https://thedragontrip.com/wp-content/uploads/2021/08/Kyoto-2-2048x1365.jpg 2048w, https://thedragontrip.com/wp-content/uploads/2021/08/Kyoto-2-219x146.jpg 219w, https://thedragontrip.com/wp-content/uploads/2021/08/Kyoto-2-50x33.jpg 50w, https://thedragontrip.com/wp-content/uploads/2021/08/Kyoto-2-113x75.jpg 113w, https://thedragontrip.com/wp-content/uploads/2021/08/Kyoto-2-scaled.jpg 1800w" data-src="https://thedragontrip.com/wp-content/uploads/2021/08/Kyoto-2-1024x683.jpg" data-sizes="(max-width: 1024px) 100vw, 1024px" /></em></p>','/images/uploadedImages/Kyoto-2-1536x1024.jpg',4,2,'2021-11-05 10:28:47'),
 (3,'The Ultimate South Island Road Trip','Oceania','<p>Congratulations for making the decision to do a New Zealand South Island road trip, this is going to be one of the best trips of your life!</p>







<p>The South Island is a sublime and striking part of the planet, where you&rsquo;ll find glacial lakes, lush native forest, cloud-piercing mountains and golden beaches within a few hours from each other.</p>







<p><img src="https://findingalexx.com/wp-content/uploads/2020/10/Things-to-do-in-Te-Anau-fiordland-25-1024x768.jpg.webp" alt="lady bowen falls milford sound" width="590" height="442" /></p>







<p>Throw in some buzzing cities, plenty of character-filled towns, moody national parks and abundant wildlife on land, underwater and in the air, and you&rsquo;ve got the makings for a seriously impressive adventure.</p>







<p>After coming home in March 2020 due to it-that-must-not-be-named, I immediately started planning a New Zealand campervan road trip.</p>







<p>We kicked off our six weeks in the&nbsp;<strong><a href="https://findingalexx.com/things-to-do-in-marlborough-new-zealand/" target="_self" rel="follow" data-wpel-link="internal">Marlborough Sounds</a></strong>&nbsp;and made our way down the&nbsp;<strong><a href="https://findingalexx.com/things-to-do-in-franz-josef-glacier-new-zealand/" target="_self" rel="follow" data-wpel-link="internal">West Coast</a></strong>, through Central Otago,&nbsp;<strong><a href="https://findingalexx.com/things-to-do-in-milford-sound/" target="_self" rel="follow" data-wpel-link="internal">Fiordland National Park</a></strong>,&nbsp;<strong><a href="https://findingalexx.com/things-to-do-on-stewart-island/" target="_self" rel="follow" data-wpel-link="internal">Stewart Island</a></strong>, along the Otago Coast and through Canterbury.</p>







<figure class="wp-block-gallery columns-2 is-cropped">







<figure><img class="wp-image-12013 lazyloaded" src="https://findingalexx.com/wp-content/uploads/2020/10/Driving-the-Milford-Road-from-Te-Anau-to-Milford-Sound-4-819x1024.jpg.webp" sizes="(max-width: 819px) 100vw, 819px" srcset="https://findingalexx.com/wp-content/uploads/2020/10/Driving-the-Milford-Road-from-Te-Anau-to-Milford-Sound-4-819x1024.jpg.webp 819w,https://findingalexx.com/wp-content/uploads/2020/10/Driving-the-Milford-Road-from-Te-Anau-to-Milford-Sound-4-240x300.jpg.webp 240w,https://findingalexx.com/wp-content/uploads/2020/10/Driving-the-Milford-Road-from-Te-Anau-to-Milford-Sound-4-768x960.jpg.webp 768w,https://findingalexx.com/wp-content/uploads/2020/10/Driving-the-Milford-Road-from-Te-Anau-to-Milford-Sound-4-175x219.jpg.webp 175w,https://findingalexx.com/wp-content/uploads/2020/10/Driving-the-Milford-Road-from-Te-Anau-to-Milford-Sound-4-450x563.jpg.webp 450w,https://findingalexx.com/wp-content/uploads/2020/10/Driving-the-Milford-Road-from-Te-Anau-to-Milford-Sound-4.jpg.webp 895w" alt="campervan at cascade creek along milford road" width="676" height="845" loading="lazy" data-id="12013" data-full-url="https://findingalexx.com/wp-content/uploads/2020/10/Driving-the-Milford-Road-from-Te-Anau-to-Milford-Sound-4.jpg" data-link="https://findingalexx.com/driving-to-milford-sound-from-te-anau/driving-the-milford-road-from-te-anau-to-milford-sound-4/" data-ll-status="loaded" data-pinit-id="3" />







<figcaption class="blocks-gallery-item__caption"></figcaption>







</figure>







<figure><img class="wp-image-11827 lazyloaded" src="https://findingalexx.com/wp-content/uploads/2020/10/New-Zealand-bucket-list-wanaka-roys-peak-helicopter-819x1024.jpg.webp" sizes="(max-width: 819px) 100vw, 819px" srcset="https://findingalexx.com/wp-content/uploads/2020/10/New-Zealand-bucket-list-wanaka-roys-peak-helicopter-819x1024.jpg.webp 819w,https://findingalexx.com/wp-content/uploads/2020/10/New-Zealand-bucket-list-wanaka-roys-peak-helicopter-240x300.jpg.webp 240w,https://findingalexx.com/wp-content/uploads/2020/10/New-Zealand-bucket-list-wanaka-roys-peak-helicopter-768x960.jpg.webp 768w,https://findingalexx.com/wp-content/uploads/2020/10/New-Zealand-bucket-list-wanaka-roys-peak-helicopter-175x219.jpg.webp 175w,https://findingalexx.com/wp-content/uploads/2020/10/New-Zealand-bucket-list-wanaka-roys-peak-helicopter-450x563.jpg.webp 450w,https://findingalexx.com/wp-content/uploads/2020/10/New-Zealand-bucket-list-wanaka-roys-peak-helicopter.jpg.webp 895w" alt="coromandel peak mt roys peak wanaka bucket list" width="741" height="926" loading="lazy" data-id="11827" data-full-url="https://findingalexx.com/wp-content/uploads/2020/10/New-Zealand-bucket-list-wanaka-roys-peak-helicopter.jpg" data-link="https://findingalexx.com/new-zealand-bucket-list/new-zealand-bucket-list-wanaka-roys-peak-helicopter/" data-ll-status="loaded" data-pinit-id="4" />







<figcaption class="blocks-gallery-item__caption"></figcaption>







</figure>







</figure>







<p>We had a few mishaps along the way (like self-isolating after lockdown levels increased + a smashed window, ugh!) which messed with our itinerary BUT this blog is the perfect New Zealand South Island road trip itinerary that we had hoped for.</p>','/images/uploadedImages/Things-to-do-in-Te-Anau-fiordland-25.jpg',1,1,'2021-11-05 10:40:52'),
 (4,'Experience the Thrill of Tree Top Ziplines','Oceania','<h2>A Perfect Blend of Ziplines, Swing Bridges, Conservation &amp; A Native Forest</h2>

<p>Rotorua Canopy Tours provide multiple daily tours that take you into a living, breathing native forest. There, you will learn about their conservation efforts and your contribution, ironically while having a hell-yeah fun time - even if you''re crazy scared of heights (we''ll talk more on that).<br /><br /></p>

<center><iframe src="https://www.youtube.com/embed/71Nk6yrM1cY" width="560" height="315" frameborder="0" allowfullscreen=""></iframe><br /><span style="color: #647391; font-size: xx-small;"><em>Video courtesy of Rotorua Canopy Tours</em></span></center>

<p><br />Any sort of ziplining is fun but when you&rsquo;re flying high above the treetops, and between the trees on these Rotorua zipline tours, it&rsquo;s super next level. The swing bridges are fun too, especially when you realise the trajectory you&rsquo;re on is getting higher and higher above the forest floor.&nbsp;</p>

<p>Anybody from the age of 6 to 160 and beyond - if you make it that far - can do this. Yes, you can! No previous experience required.</p>

<div class="ImageBlock ImageBlockCenter"><img class="ss-lazy loaded" title="Writer''s daughter Elise on a swingbridge on our Canopy Tour" src="https://www.rotorua-travel-secrets.com/images/elise-at-canopy-tours.jpg" alt="Writer''s daughter Elise on a swingbridge at our Rotorua Canopy Tours experience." width="600" height="800" data-src="https://www.rotorua-travel-secrets.com/images/elise-at-canopy-tours.jpg" data-pin-media="https://www.rotorua-travel-secrets.com/images/elise-at-canopy-tours.jpg" data-was-processed="true" /></div>

<h2><br />Original or Ultimate Canopy Tour?</h2>

<p>Rotorua Canopy Tours provide two tours. The Original Canopy Tour and the Ultimate Canopy Tour. Ziplines, swing bridges, and conservation talks are included in both. The Ultimate though takes it a few steps further - and higher still - with additional challenging elements.</p>

<p>Here&rsquo;s a condensed overview of both tours.<br /><br /></p>

<div class="">

<div class="responsive_grid_block-2 responsive_grid_block-225245617">

<div class="responsive-row">

<div class="responsive_col-1 responsive_grid_block-225245617">

<h2>Original Canopy Tour</h2>

<hr />

<ul>

<li>3 Hours inclusive of driving times</li>

<li>6 Ziplines 600m total</li>

<li>Longest is 220m</li>

<li>Swingbridge 50m</li>

<li>Conservation trail walk</li>

<li>Free photos</li>

<li>Cost Adult $149, Child to 15yrs incl $119, Family $449 (2 Adults, 2 Children)</li>

<li>Restrictions: Max weight 120kg, min age 6yrs, 15yrs and under must be accompanied by adult 16yrs and over</li>

</ul>

</div>

<div class="responsive_col-2 responsive_grid_block-225245617">

<h2>Ultimate Canopy Tour</h2>

<hr />

<ul>

<li>3&frac12; hours inclusive of driving times</li>

<li>6 Ziplines 1200m total</li>

<li>Longest is 400m tandem</li>

<li>3 suspended swing bridges, longest is 70m</li>

<li>50m high rock cliff-face boardwalk</li>

<li>Spiral staircase up around a tree</li>

<li>18m abseil (controlled) to the ground</li>

<li>Free photos</li>

<li>Cost Adult $199, Child 10 to 15yrs incl $169, Family $599 (2 Adults, 2 Children)</li>

<li>Restrictions: Max weight 120kg, min age 10yrs, 15yrs and under must be accompanied by adult 16yrs and over</li>

</ul>

</div>

</div>

</div>

</div>

<p><br />If you''ve already made up your mind and would like to book your zipline tour now, Get Your Guide in the banners just below can do that for you. They stay flexible with easy cancellation right up to 24 hours before your tour.</p>','/images/uploadedImages/rotorua-canopy-tours-silver-fern-bridge-1.jpg',2,2,'2021-11-07 03:46:53'),
 (5,'MOST DELICIOUS AND BEST ROME FOOD TOURS','Europe','<p>Eating the best pasta and pizza is, of course, an important part of any trip to Rome. After all, Italian dishes are some of the most popular around the world.</p>







<p>When you join a Rome food tour you&rsquo;re taken on a journey of discovery of the best eateries in the Eternal City, its famous dishes and some surprises you may not have heard of.</p>







<p>In this article we share the best Rome food tours and experiences in the city to add to your Rome itinerary.</p>







<h2><span id="Why_take_a_food_tour_in_Rome">WHY TAKE A FOOD TOUR IN ROME</span></h2>







<p><img class="aligncenter size-full wp-image-1014482" src="https://cdn.shortpixel.ai/spai/w_792+q_lossy+ret_img+to_auto/https://www.untoldmorsels.com/wp-content/uploads/2019/11/trattoria-testaccio-rome-food-tour.jpg" alt="restaurant from food walking tour in rome" width="634" height="420" data-spai="1" data-pin-description="Rome food tours - when in Rome you have to eat all the pizza, pasta and gelato right? Check out our guide to the top 10 food tours in Rome that will help you order you coffee and carbonara the right way. These walking tours take you through the historic center and fun neighborhoods like Trastevere to visit some of the best markets, gelateria and restaurants in Italy. #romeitaly #rome #foodguide #travelguide #europevacation #italytravel" data-pin-title="The most delicious Rome food tours and experiences as voted by us!" data-spai-upd="634" /></p>







<div>Usually in a small group of no more than 10 people, &nbsp;Rome walking food tours take you around one or two of the city&rsquo;s neighbourhoods. You&rsquo;ll stop at traditional eateries and try local specialties like&nbsp;<em>suppli</em>&nbsp;(fried rice balls) and&nbsp;<em>cacio e pepe</em>&nbsp;pasta. Along the the way your guide tells you about the history of the dishes and explains their importance to local culture. You&rsquo;ll share wine, make new friends and eat a delicious meal or lots of snacks (sometimes both!).</div>







<div>&nbsp;</div>







<div>At the end of your experience, the best food tours of Rome provide a list of restaurants to visit so you can continue your eating adventures on your own. It&rsquo;s the best way to learn about the cuisine of a city and also build confidence to explore on your own. You can even find food tours that cater for dietary requirements and preferences.</div>','/images/uploadedImages/best-rome-food-tours.jpg',3,1,'2021-11-05 10:55:17'),
 (6,'Sydney Tour Guide','Australia','<p>Sydney is a cosmopolitan city surrounded by iconic beaches, world heritage sites, and acclaimed wine regions.</p>

<p>Besides being Australia&rsquo;s largest city, Sydney is also its most visited. (And, contrary to popular belief, not the country&rsquo;s capital!). Few people skip the city &mdash; and why would they?</p>

<p>With an incredible variety of attractions, beaches, restaurants, and sights to see, it&rsquo;s easy to see why people come here and stay a while! There&rsquo;s so much to do here. Try to stay at least a week if you can. I never, ever get tired of visit Sydney! It&rsquo;s amazing. Be sure to also spend some time on the lesser visited North Shore beaches.</p>

<p>This Sydney travel guide will help you make sense of all the things to see, show you where to stay, and help you save money.</p>

<h3 id="seedo">Other Things to See and Do in Sydney</h3>

<h5>1. Visit The Rocks</h5>

<p>The Rocks is the oldest part of Sydney. With its narrow lanes, colonial buildings, sandstone churches, and Australia&rsquo;s oldest pubs, this neighborhood is where Sydney started when the British first landed. It was almost torn down in the 1970s for modern high-rises, but, luckily, citizen action got it preserved instead. The Rocks&rsquo; weekend markets, art museums, street entertainment, delicious (and sometimes overpriced) restaurants, and beautiful views of the harbor, Opera House, and bridge make this is one of the coolest areas of the city. I love heading up to the Sydney Observatory Hill Park for a good view of the city, wandering the harbor promenade, and hitting the bars at night.</p>

<h5>2. Botanic Gardens &amp; Mrs. Macquarie Chair</h5>

<p>You&rsquo;ll find Australia&rsquo;s first vegetable garden and a treasure trove of trees, ferns, flowers, and gardens at the Royal Botanic Gardens. On a sunny day, you&rsquo;ll find locals sprawled out all over the lawns soaking up the sun. You can also see Mrs. Macquarie&rsquo;s Chair, a seat carved into a stone cliff, where you can sit and gaze out at the harbor. There are also free one-hour volunteer-guided tours of the garden, too! Admission is free.</p>

<h5>3. Ferry to Manly Beach</h5>

<p>The ferry ride to Manly offers sweeping views of the harbor, Sydney Harbour Bridge, and the world-famous Opera House. It&rsquo;s a picturesque 30-minute ride each way that puts you in one of the coolest parts of the north end of the city. Manly is famous for its wide beach, giant waves, surfing, and kick-ass nightlife. Ferry tickets are 9.90 AUD ($7.50 USD).</p>

<h5>4. Take the Town Hall tour</h5>

<p>Built in 1889, Sydney&rsquo;s beautiful Town Hall is a picturesque Victorian building. They offer a detailed two-hour tour for only 10 AUD. It&rsquo;s a great way to learn some extra history about the building and its place in the greater tapestry of Sydney&rsquo;s history. Tours only available on weekdays.</p>

<h5>5. Go to the museums</h5>

<p>Like most cities, Sydney has a wide variety of museums. And, luckily, thanks to Australia&rsquo;s Commonwealth past, all the public museums in the city are free, making it a great and inexpensive activity in an otherwise expensive city. My favorite museum in Sydney is the Hyde Park Barracks. Set in the old convict barracks from the 18th century, it does an amazing and detailed job of chronicling colonial life in Sydney, using the stories of the early settlers, historical information, artifacts, and historical recreations. It&rsquo;s well worth the 19.20 AUD entrance fee. It&rsquo;s always the highlight of my trip. Few people visit, making it one of the best non-touristy things to do in the city!</p>

<p>Other museums in Sydney worth visiting are the Art Gallery of New South Wales (modern art), the Museum of Contemporary Art Australia at The Rocks (contemporary art), the Australian National Maritime Museum (maritime history), the White Rabbit Gallery (contemporary Chinese art; also has a teahouse), the Hyde Park Barracks Museum (local, criminal, and judicial history), and the Museum of Sydney (local history).</p>

<h5>6. Learn to surf</h5>

<p>Sydney is often the place travelers bite the bullet and learn the art of Australia&rsquo;s famous national pastime. There are many companies here that offer lessons. While Bondi is the most popular beach, Manly on the north shore of Sydney has better waves (though you can find good waves up and down the coast!). Surfboard rentals start at 12 AUD ($9 USD) per hour while two-hour group lessons cost around 75 AUD ($57 USD). Umina Beach, Collaroy Beach, and Corrimal Beach are good beaches for beginners.</p>

<h5>7. Visit the Hunter Valley</h5>

<p>North of town is one of Australia&rsquo;s premier wine regions. The Hunter Valley is home to amazing wineries that produce luscious reds. While it&rsquo;s not as easy on the budget, it is an excuse to get out of the city and see the countryside. Day tours are offered from Sydney but they are expensive (150-200 AUD/$115-152 USD) and you&rsquo;ll spend a lot of time on a bus. It&rsquo;s best to stay for at least a night out in the valley to get the full experience.</p>

<p>If you have a car, you can base yourself in Newcastle or Cessnock, but you&rsquo;d have a more unique experience if you booked a secluded cabin or home on Airbnb as there are plenty in the area, including some that are also vineyards.</p>

<h5>8. The Tower Sky Walk</h5>

<p>At 286m, the Sydney Tower Skywalk is as tall as the Eiffel Tower and twice as high as the Harbour Bridge. It offers amazing panoramic views of the city from its Skywalk at the top. I&rsquo;m not a fan of heights but even I was impressed by the view! At 59.80 AUD ($45 USD), it&rsquo;s cheaper and easier than climbing the bridge itself (and the views are actually better).</p>

<h5>9. Do a coastal walk</h5>

<p>There are a number of stunning coastal walks that allow you to take in the breathtaking natural beauty of Sydney Harbor. While tons of people follow the two-hour Coogee-to-Bondi walk (skip the weekends when it&rsquo;s overly crowded), I found both the shorter walk in Watson&rsquo;s Bay and the Split-to-Manly walk quieter and more breathtaking.</p>

<h5>10. Attend a Cultural Event</h5>

<p>Since Sydney has a complex about Melbourne being called the cultural capital of Australia, it tries to outdo its rival by hosting over tons of official festivals and events each year. It offers art gallery nights, concerts, festivals, and much more. It wants to be seen as more of a beach destination. No matter what time of the year you visit, you will find something going on in the city! Most of the events are free and a list of what&rsquo;s going on soon can be found on the&nbsp;<a href="https://www.sydney.com/" target="_blank" rel="noopener noreferrer">Sydney tourism website</a>. It will give you dates, prices, times, and everything in between.</p>

<h5>11. Party in King&rsquo;s Cross</h5>

<p>If you&rsquo;re looking to go out and get wild on the cheap, then go to King&rsquo;s Cross. This is where the beer is inexpensive and the backpackers (and locals) party late. The famous World Bar is where most of the action happens (cheap drinks and a large dance floor). For a less traveler-centric time, head to Manly, The Rocks, or the CBD (Central Business District) where there are more locals and fewer travelers (but more expensive cocktails and beers).</p>

<h5>12. Visit the Markets</h5>

<p>Sydney has many amazing markets to explore. At Paddington Markets, the Fish Market, Bondi Farmers Market, the Flower Market, and a whole lot more seasonal markets, it&rsquo;s really easy to spend a lot of time wandering and shopping. I love Paddington Markets and the Farmers Market the best &mdash; they draw an eclectic crowd and the farmers market makes me want to cook nonstop. Other markets worth checking out are Glebe Market (vintage clothes, eclectic local handicrafts, delicious food stalls), Rozelle Collectors Market (antiques, clothing, DVDs), and Orange Grove Organic (produce and food stalls).</p>','/images/uploadedImages/photo-1612953293239-4befdc359b72.jpg',3,0,'2021-11-07 03:48:29'),
 (7,'CAPTIVATED BY THE COOK ISLANDS','Oceania','<div class="clearfix text-formatted field field--name-field-abstract field--type-text-long field--label-hidden field__item">



<p>There was a fish swimming towards me. It was big. Very big. Human-sized in fact. And I&rsquo;m not being funny but it appeared to have some rather sharp teeth...</p>



</div>



<div class="clearfix text-formatted field field--name-body field--type-text-with-summary field--label-hidden field__items">



<div class="field__item">



<p>But floating in the azure blue waters off Aitutaki in the Cook Islands, there was absolutely nothing to be afraid of.</p>



<p>The area is home to one of the area&rsquo;s most impressive tourist attractions, giant trevally &ndash; enormous silvery grey fish &ndash; and I was having the time of my life snorkelling with them among the coral. My partner Kenny and I had travelled to the tiny tropical island of Aitutaki from the main island of Rarotonga just a day earlier. After spending the night at the impressive five-star Pacific Resort Aitutaki in a premium beach-front bungalow overlooking Aitutaki Lagoon (the resort is for guests aged 12 and over), Kenny and I had headed off bright and early to join the much-talked about Vaka Lagoon Cruise.</p>



<p>A fresh coconut awaited us on board the traditional vessel, along with a ukulele band who rolled out cheerful tunes throughout the day and prepared a delicious barbecue for lunch.</p>



<p>And while swimming with the giant trevally was a highlight, we also got to see some seriously lush tropical islands &ndash; which you might recognise if you&rsquo;ve ever watched the reality TV shows&nbsp;<em>Shipwrecked</em>&nbsp;or&nbsp;<em>Survivor</em>.</p>



<p>There&rsquo;s one more must-do on the cruise. It&rsquo;s practically mandatory to get your passport stamped at the world&rsquo;s most remote post office located on the beach at One Foot Island, and the inky stamp serves as a permanent reminder of the time you stepped into paradise.</p>



<p>That&rsquo;s precisely what the Cook Islands are &ndash; tiny slices of paradise dotted in the vast expanse of the Pacific Ocean.</p>



<p>Arriving into Rarotonga a week earlier at 6.30am after a pleasant overnight Air New Zealand flight direct from Sydney, Kenny and I were serenaded by a ukulele player in a straw hat by the name of Papa Jake as we waited at the baggage carousel. No other airport I&rsquo;ve visited has exuded the laid-back charm of Rarotonga.</p>



<p>We were enchanted &ndash; and our joy continued when our cheerful guide Auntie Nane greeted us with a beautifully scented garland of fresh flowers each.</p>



<p>On route to our&nbsp;accommodation &ndash; the delightful Moana Sands Lagoon Resort (guests must be aged 18 and over) &ndash; Auntie Nane proceeded to give us tips about our stay. One thing she didn&rsquo;t mention, however, was falling fruit ...</p>



<div>



<article class="media media--type-image media--view-mode-default">



<div class="field field--name-field-media-image field--type-image field--label-visually_hidden">



<div class="field__label visually-hidden">Image</div>



<div class="field__item"><img class="image-style-full-win lazyloaded" src="https://cookislands.travel/sites/default/files/styles/full_win/public/2019-10/home_things_to_do_snorkelling.png?itok=Hchf9BxU" alt="Home - Things to Do - Snorkelling" width="786" height="474" loading="lazy" /></div>



</div>



</article>



<article class="media media--type-image media--view-mode-default">



<div class="field field--name-field-media-image field--type-image field--label-visually_hidden">



<div class="field__label visually-hidden">Image</div>



<div class="field__item"><img class="image-style-full-win lazyloaded" src="https://cookislands.travel/sites/default/files/styles/full_win/public/charlies3_0.jpg?itok=5uAT6vM0" width="783" height="465" loading="lazy" /></div>



</div>



</article>



</div>



<p>That night, while tucking into the island&rsquo;s speciality raw fish dish Ika Mata at the palm-fringed watering hole (and local snorkelling spot) Charlie&rsquo;s Bar, Kenny and I had the first of two near misses with a coconut. A big brown ball detached itself from a tree, and plonked down alarmingly close to our heads. But that&rsquo;s island life for you, right?!</p>



<p>We quickly realised that&nbsp;as well as falling coconuts there is also a thing called &ldquo;island time&rdquo;. It basically means everyone is cheerfully laid-back and in no hurry to get anywhere.</p>



<p>There are 11,000 people on Rarotonga, one main road that runs for approximately 30km around the island, no traffic lights and only two roundabouts, which frankly means it&rsquo;s an absolute joy to navigate either by car or by electric bicycle (which we rented at Moana Sands Lagoon Resort).</p>



<p>Another thing to remember is that if you&rsquo;re there on a Sunday don&rsquo;t expect to be able to buy alcohol outside the resorts. To Cook Islanders, Sunday is a day for &ldquo;rest, reflection and family&rdquo; and there&rsquo;s not much open.</p>



<p>One place that is open on Sundays, however, is the delightful Mooring Fish Cafe&nbsp;&ndash; a relaxed spot nestled inside a blue cargo container next to the lagoon. The friendly staff revealed the caf&eacute; began with just four tables 10 years ago and has blossomed into the place to go for an FOB &ndash; an epic fish sandwich, the name of which translates to &ldquo;Fresh Off the Boat&rdquo;.</p>



<p>The abundance of fresh food is a highlight of any Cook Islands holiday. We not only enjoyed a fabulous Progressive Dinner Tour during our time on the island &ndash; where each course was served at a different family home &ndash; but we also discovered the world&rsquo;s best breakfast.</p>



<div>



<article class="media media--type-image media--view-mode-default">



<div class="field field--name-field-media-image field--type-image field--label-visually_hidden">



<div class="field__label visually-hidden">Image</div>



<div class="field__item"><img class="image-style-full-win lazyloaded" src="https://cookislands.travel/sites/default/files/styles/full_win/public/2020-10/Progressive%20Dinner%20Tour%20Rarotonga%202.jpg?itok=jpkIXIQ6" alt="Local Food at Progressive Dinner Tour in Rarotonga Cook Islands" width="746" height="420" loading="lazy" /></div>



</div>



</article>



<article class="media media--type-image media--view-mode-default">



<div class="field field--name-field-media-image field--type-image field--label-visually_hidden">



<div class="field__label visually-hidden">Image</div>



<div class="field__item"><img class="image-style-full-win lazyloaded" src="https://cookislands.travel/sites/default/files/styles/full_win/public/2021-06/Progressive%20Dinner%20Garden%20Tour.jpg?itok=20bQe0zx" alt="Progressive Dinner Garden Tour.jpg" width="752" height="423" loading="lazy" /></div>



</div>



</article>



</div>



<p>Ironically, we discovered it by accident when we missed brekkie in order to be picked up at 8am for a Storytellers Eco Cycle Discovery Tour.</p>



<p>Mentioning to our tour guide Uncle Jimmy that we were, in fact, a bit hungry, he happily led us on a gastronomic adventure that involved him cracking open fresh coconut and sharing the sweet flesh with us.</p>



<p>A fresh mango &ndash; picked straight from the tree &ndash; and a fresh guava followed. It was, Kenny and I agreed, the best tasting fruit we had ever eaten.</p>



<p>As we cycled along the ancient Coral Road &ndash; stopping to hear Uncle Jimmy&rsquo;s stories along the way &ndash; we got a real glimpse into the tranquil pace of village life. &ldquo;I love sharing the lifestyle,&rdquo; Uncle Jimmy told us. &ldquo;You can&rsquo;t do any of this back home.&rdquo;</p>



<p>And that&rsquo;s beauty of the Cook Islands. It&rsquo;s not like home. It&rsquo;s a different pace, a different way of living. It&rsquo;s a pace Storytellers&rsquo; Australian owner, Dave, embraced when he started his Cook Islands&rsquo; cycle tour business six years ago, after falling in love with the islands during a visit for a friend&rsquo;s wedding.</p>



<p>Does he miss Australia? &ldquo;Not really,&rdquo; he says simply. And as another coconut thudded to the ground behind us, Kenny and I looked at each other and smiled.</p>



<p>This is island life. And it&rsquo;s truly magnetic.</p>



</div>



</div>','/images/uploadedImages/vaka-cruise-2.jpg',3,0,'2021-11-05 22:35:30'),
 (8,'Best Road Trips in the USA','North-America','<p data-birdsend-par-index="0">Pack your car, prepare your playlist, wind down the windows, and get ready for stunning views and adventures on an epic United States road trip.</p>



<p data-birdsend-par-index="1">We&rsquo;ve been taking&nbsp;<a href="https://www.ytravelblog.com/tag/usa-road-trips/" data-type="URL" data-id="https://www.ytravelblog.com/tag/usa-road-trips/">road trips in the USA</a>&nbsp;since 2004 before we had kids, and for the past 4 years in-depth with our kids, including a&nbsp;<a href="https://www.ytravelblog.com/american-road-trip-podcast/" data-type="post" data-id="101804">10 month RV trip across the Western part of the USA.</a></p>



<figure class="wp-block-image size-full"><a href="https://www.ytravelblog.com/snow-canyon-state-park-utah/"><img class="wp-image-86891 lazyloaded" src="https://www.ytravelblog.com/wp-content/uploads/2019/03/snow-canyon-state-park-utah-1.jpg" alt="Snow Canyon State Park" width="800" height="562" data-jpibfi-post-excerpt="" data-jpibfi-post-url="https://www.ytravelblog.com/best-road-trips-in-the-usa/" data-jpibfi-post-title="19 of the Best Road Trips in the USA" data-jpibfi-src="https://www.ytravelblog.com/wp-content/uploads/2019/03/snow-canyon-state-park-utah-1.jpg" data-ll-status="loaded" /></a>



<figcaption>Snow Canyon State Park, Utah</figcaption>



</figure>



<p data-birdsend-par-index="2">We&rsquo;ve put together a list of what we think are the best road trips in the USA. We&rsquo;ve experienced almost all of them (we threw in a couple at the end we haven&rsquo;t done yet but know are worthy of making the list).</p>



<p data-birdsend-par-index="3"><strong>We want to hear your favorite USA road trips in the comments!</strong></p>



<p data-birdsend-par-index="4">In this post, we have included those road trip routes that incorporate multiple stops or destinations. They are usually longer than a day trip or scenic drive. But don&rsquo;t worry, we have written a post of the&nbsp;<a href="https://www.ytravelblog.com/best-scenic-drives-usa/" data-type="post" data-id="119119">best scenic drives in the USA</a>. Some of those scenic drives are part of these suggestions below or may be the entire length of the drive.</p>','/images/uploadedImages/glacier-national-park-montana-24.jpg',3,1,'2021-11-05 22:41:14'),
 (9,'African Adventure','Africa','<div class="entry-content">

<p>Africa is a beautiful, diverse and captivating continent, and those who travel there often find themselves forever hooked on its spectacular landscapes, welcoming people and breathtaking wildlife.&nbsp;</p>

<p>However, myths, inaccuracies and misconceptions continue to persist about this fascinating part of the world &ndash; largely due to negative portrayals of Africa in the media. We want to set the record straight once and for all, and show you why Africa should be top of your travel list!</p>

<p>Here are five common misconceptions about Africa debunked&hellip;</p>

<p><strong>Myth One: Africa is all one place</strong></p>

<p>The continent of Africa is home to a whopping 54 countries, with a combined population of 1.3 billion people. It&rsquo;s the second largest continent on the planet, with extremely diverse cultures, languages, climates, landscapes and wildlife.&nbsp;</p>

<p>From the sweeping savannahs of Kenya&rsquo;s Maasai Mara to the luscious tropical forests of Ghana&rsquo;s Kakum National Park and the palm-fringed beaches of Zanzibar, our host countries are each unique destinations in their own right, and together they showcase Africa&rsquo;s diversity in all its wonder.&nbsp;</p>

<p><strong>Myth Two: It&rsquo;s always hot</strong></p>

<p>Given the size of Africa (see above!), it&rsquo;s no surprise that each country has its own climate, seasons and weather.&nbsp;</p>

<p>Indeed, each of our host destinations has its own climate, with&nbsp;<a href="https://www.african-adventures.co.uk/ghana/">Ghana</a>&nbsp;enjoying year-round tropical weather and temperatures of 30 degrees celsius or above, punctuated by two rainy seasons in the south in April and November.&nbsp;</p>

<p>In contrast,&nbsp;<a href="https://www.african-adventures.co.uk/kenya/">Kenya</a>&nbsp;enjoys a drier heat, with temperatures of 20-28 degrees celsius, and short, refreshing bursts of rain in April and November. Finally, off the coast of Tanzania,&nbsp;<a href="https://www.african-adventures.co.uk/zanzibar/">Zanzibar&rsquo;s</a>&nbsp;weather is more humid, with slightly higher temperatures.</p>

<p>Across the continent, you&rsquo;ll find a range of temperatures and weather patterns, including almost annual snow on South Africa&rsquo;s mountains, on Mount Kilimanjaro in Tanzania and on Mount Kenya.&nbsp;</p>

<p><strong>Myth Three: Going on safari is the only thing to do</strong></p>

<figure id="attachment_31804" class="wp-caption alignnone" aria-describedby="caption-attachment-31804"><img class="wp-image-31804 size-full" src="https://www.african-adventures.co.uk/wp-content/uploads/2021/08/Untitled-design.png" sizes="(max-width: 1280px) 100vw, 1280px" srcset="https://www.african-adventures.co.uk/wp-content/uploads/2021/08/Untitled-design.png 1280w, https://www.african-adventures.co.uk/wp-content/uploads/2021/08/Untitled-design-300x168.png 300w, https://www.african-adventures.co.uk/wp-content/uploads/2021/08/Untitled-design-1024x574.png 1024w, https://www.african-adventures.co.uk/wp-content/uploads/2021/08/Untitled-design-768x431.png 768w" alt="" width="1280" height="718" loading="lazy" />

<figcaption id="caption-attachment-31804" class="wp-caption-text">Trek through the rainforest at Ghana&rsquo;s Kakum National Park</figcaption>

</figure>

<p>Whilst a safari drive through one of Africa&rsquo;s spectacular national parks is a breathtaking experience that shouldn&rsquo;t be missed, there is so much more on offer in Africa.&nbsp;</p>

<p>We&rsquo;ve curated a range of&nbsp;<a href="https://african-adventures.co.uk/wp-content/uploads/2021/06/Beyond-Volunteering-compressed.pdf">adventure activities</a>&nbsp;that groups can add to their trips, all of which showcase the very best of our host destinations. In addition to unforgettable safari drives through Kenya&rsquo;s Lake Nakuru National Park and Maasai Mara National Reserve, our volunteers can snorkel alongside tropical fish in Zanzibar, trek through the rainforest in Ghana or learn how to cook traditional Kenyan food.&nbsp;</p>

<p>If that&rsquo;s not enough, you can explore the history of Zanzibar&rsquo;s Stone Town on a walking tour (a UNESCO World Heritage Site), learn about the dark history of the transatlantic slave trade at Ghana&rsquo;s Cape Coast Castle or enjoy a buffet of some of the freshest seafood imaginable as you island-hop around Zanzibar&rsquo;s islands. What more could you want?!</p>

<p><strong>Myth Four: Africa is dangerous</strong></p>

<p>Did you know that Ghana was ranked the&nbsp;<a href="https://citinewsroom.com/2021/06/ghana-ranked-second-most-peaceful-country-in-africa/">second most peaceful country in Africa</a>&nbsp;this year (second only to Mauritius!) in the Global Peace Index Report?</p>

<p>Kenya and Tanzania (including Zanzibar) have also long been heralded as huge tourism hotspots, with the vast majority of visits to all three of our host destinations trouble-free.&nbsp;</p>

<p>After more than 10 years of organising life-changing volunteering experiences in Africa, we&rsquo;re experts at delivering safe, memorable trips. Our comprehensive&nbsp;<a href="https://www.african-adventures.co.uk/your-safety/">Safety Management System</a>&nbsp;ensures the highest possible standards of safety in-country, and our expert team, 24-hour emergency response system and impeccable safety record should give you peace of mind that it really is safe to travel to Africa.&nbsp;</p>

<p>We also proudly hold a number of&nbsp;<a href="https://www.african-adventures.co.uk/your-safety/">awards and accreditations</a>&nbsp;that demonstrate we are a safe, reputable company. Find out more here!</p>

<p><strong>Myth Five: African food is not good</strong></p>

<figure id="attachment_31805" class="wp-caption alignnone" aria-describedby="caption-attachment-31805"><img class="wp-image-31805 size-full" src="https://www.african-adventures.co.uk/wp-content/uploads/2021/08/Untitled-design-1.png" sizes="(max-width: 1280px) 100vw, 1280px" srcset="https://www.african-adventures.co.uk/wp-content/uploads/2021/08/Untitled-design-1.png 1280w, https://www.african-adventures.co.uk/wp-content/uploads/2021/08/Untitled-design-1-300x168.png 300w, https://www.african-adventures.co.uk/wp-content/uploads/2021/08/Untitled-design-1-1024x574.png 1024w, https://www.african-adventures.co.uk/wp-content/uploads/2021/08/Untitled-design-1-768x431.png 768w" alt="" width="1280" height="718" loading="lazy" />

<figcaption id="caption-attachment-31805" class="wp-caption-text">Ugali is a diet staple in Kenya</figcaption>

</figure>

<p>Again, there is no such thing as &ldquo;African food&rdquo;, because each country has its own distinct cuisine with unique flavours and tastes.&nbsp;</p>

<p>Embracing the food of your destination is a fantastic way to immerse yourself into the culture, and we source all the food you eat locally so that you can experience your destination&rsquo;s cuisine for yourself.&nbsp;</p>

<p>In Ghana, dishes traditionally have a spicy tomato base. Popular regional meals include okra or palm-nut soups and red-red, which is a pepper and bean stew. Cassava, plantain and yam are staple accompaniments to these. Along the Keta Lagoon, where our partner schools are located, there is also plenty of fresh fish and tropical fruit, including pineapples, coconuts and avocados.&nbsp;</p>

<p>In Kenya, ugali (which is a kind of porridge made from maize) is a diet staple, and is usually served with a vegetable or bean stew. Rice is also widely eaten, and fish or meat is sometimes served as an accompaniment. Fresh fruit, such as bananas, melon or oranges, is also available.&nbsp;</p>

<p>Finally, as an island, Zanzibar has an abundance of fresh, delicious seafood which is sold in its bustling markets. Zanzibar&rsquo;s varied history, and its historical importance as a trading centre between East and West, can still be seen today in the Zanzibari cuisine, with a rich mix of spices and flavours typically used in cooking. Vegetables, potatoes, rice and ugali are also widely eaten, and fresh fruit is widely available.&nbsp;</p>

</div>','/images/uploadedImages/photo-1523805009345-7448845a9e53.jpg',1,1,'2021-11-07 03:20:43');
INSERT INTO "articleLikes" ("id","articleId","userId") VALUES (1,1,4),
 (2,1,3),
 (3,4,3),
 (4,5,2),
 (5,3,2),
 (6,4,4),
 (7,8,3),
 (8,9,1);
INSERT INTO "comments" ("id","articleId","userId","comment","commentDate") VALUES (1,1,3,'What amazing cities!','2021-11-05 11:11:40'),
 (2,4,3,'This looks so exciting :)','2021-11-05 11:12:53'),
 (3,5,2,'The food sounds amazing!!!','2021-11-05 11:15:22'),
 (4,3,2,'The South Island is beautiful. ','2021-11-05 11:16:47'),
 (5,4,4,'The zip lines look kinda scary!','2021-11-05 11:17:45'),
 (6,8,3,'Road trips really are a blast.','2021-11-05 22:41:37');