USE albums_db;
DESCRIBE albums;
SELECT id FROM albums;
SELECT release_date FROM albums
	ORDER BY release_date ASC;
/* 3. a. six rows; 
	b. 31 
	c. id 
	d. 1967 */

SELECT name from albums WHERE artist = 'Pink Floyd';

SELECT release_date FROM albums
	where name = "Sgt. Pepper's Lonely Hearts Club Band";
/* 4b. 1967 */

SELECT genre FROM albums where name = 'Nevermind';
/* 4c. Grunge, Alt. Rock */

SELECT name FROM albums
	WHERE release_date BETWEEN 1990 AND 1999;
/* 4d. The Bodyguard
Jagged Little Pill
Come On Over
Falling into You
Let's Talk About Love
Dangerous
The Immaculate Collection
Titanic: Music from the Motion Picture
Metallica
Nevermind
Supernatural */

SELECT name FROM albums
	WHERE sales < 20000000;
/* 4e. Thriller
Back in Black
The Dark Side of the Moon
Bat Out of Hell
The Bodyguard
Their Greatest Hits (1971–1975)
Saturday Night Fever
Rumours
Grease: The Original Soundtrack from the Motion Picture
Led Zeppelin IV
Bad
Jagged Little Pill
Come On Over
Falling into You
Sgt. Pepper's Lonely Hearts Club Band
Hotel California
Dirty Dancing
21
Let's Talk About Love
1
Dangerous
The Immaculate Collection
Abbey Road
Born in the U.S.A.
Brothers in Arms
Titanic: Music from the Motion Picture
Metallica
Nevermind
The Wall
Supernatural
Appetite for Destruction */

SELECT name from albums
	WHERE genre = 'rock';
/* 4f. Hard rock and Progressive rock have addtional words, "Hard/Progressive", that exclude it from the query. This is because the query is only looking for the string 'rock' with nothing else included. */




