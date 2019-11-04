CREATE TABLE User
(
	Email VARCHAR(50),
	Name VARCHAR(25),
	Permission INT,
	PRIMARY KEY (Email)
);

CREATE TABLE PhoneNoDetails
(
	Email VARCHAR(50), 
	Phone_no INT,
	PRIMARY KEY (Email, Phone_no),
	FOREIGN KEY (Email) REFERENCES User(Email)
);

CREATE TABLE Login
(
	Email INT,
	Password VARCHAR(25),
	Username VARCHAR(10),
	PRIMARY KEY (Email, Password, Username),
	FOREIGN KEY (Email) REFERENCES User(Email)
);

CREATE TABLE ArticlePage
(
	Article_id INT,
	Title VARCHAR(255),
	Creation_date DATE,
	Contributor_id INT,
	PRIMARY KEY (Article_id)
);

CREATE TABLE Tag
(
	Tag_id INT,
	Name VARCHAR(25),
	PRIMARY KEY (Tag_id)
);

CREATE TABLE Rating
(
	Article_id INT,
	Weight INT,
	Contributor_id INT,
	PRIMARY KEY (Article_id,  Weight, Contributor_id),
	FOREIGN KEY (Article_id) REFERENCES ArticlePage(Article_id)
);

CREATE TABLE ViewsOrManages
(
	Email INT,
	Article_id INT,
	PRIMARY KEY (Article_id),
	FOREIGN KEY (Email) REFERENCES User(Email),
	FOREIGN KEY (Article_id) REFERENCES ArticlePage(Article_id)
);

CREATE TABLE TaggedTopics
(
	Tag_id INT,
	Article_id INT,
	PRIMARY KEY (Tag_id, Article_id),
	FOREIGN KEY (Tag_id) REFERENCES Tag(Tag_id),
	FOREIGN KEY (Article_id) REFERENCES ArticlePage(Article_id)
);

CREATE TABLE Course
(
	Course_code INT,
	Description VARCHAR(255),
	Course_name VARCHAR(50),
	PRIMARY KEY (Course_code)
);

CREATE TABLE CourseMaterial
(
	Course_code INT,
	Article_id INT,
	PRIMARY KEY (Article_id),
	FOREIGN KEY (Course_code) REFERENCES Course(Course_code),
	FOREIGN KEY (Article_id) REFERENCES ArticlePage(Article_id)
);

CREATE TABLE Comment
(
	Comment_id INT,
	Title VARCHAR(255),
	Contributor_id INT,
	Comment_date DATE,
	Description VARCHAR(255),
	PRIMARY KEY (Comment_id)
);

CREATE TABLE ContainsCommment
(
	Comment_id INT,
	Article_id INT,
	PRIMARY KEY (Comment_id),
	FOREIGN KEY (Comment_id) REFERENCES Comment(Comment_id),
	FOREIGN KEY (Article_id) REFERENCES ArticlePage(Article_id)
);

CREATE TABLE CommentFor
(
	Comment_id INT,
	CommentFor_id INT,
	PRIMARY KEY (CommentFor_id),
	FOREIGN KEY (Comment_id) REFERENCES Comment(Comment_id),
	FOREIGN KEY (CommentFor_id) REFERENCES Comment(Comment_id)
);