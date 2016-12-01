create database 'C:\Users\Andrey\Desktop\BD\3\music.fdb' user 'sysdba' password 'masterkey' ;
commit;
connect 'C:\Users\Andrey\Desktop\BD\3\music.fdb' user 'sysdba' password 'masterkey' ;


CREATE TABLE Artists (
	Name varchar(50) NOT NULL,
	Biography varchar(255),
	Country varchar(50),
	PRIMARY KEY (Name)
);

CREATE TABLE Country (
	Country varchar(50) NOT NULL,
	PRIMARY KEY (Country)
);

CREATE TABLE Tracks (
	TrackID INT NOT NULL,
	TrackName varchar(50) NOT NULL,
	Artist varchar(50),
	Duration varchar(30),
	Year INT,
	Language varchar(30),
	PRIMARY KEY (TrackID)
);

CREATE TABLE Albums (
	AlbumID INT NOT NULL,
	Artist varchar(50) NOT NULL,
	AlbumName varchar(50) NOT NULL,
	PRIMARY KEY (AlbumID)
);

CREATE TABLE MusicStyles (
	Style varchar(30) NOT NULL,
	PRIMARY KEY (Style)
);

CREATE TABLE Languages (
	Labguage varchar(30) NOT NULL,
	PRIMARY KEY (Labguage)
);

CREATE TABLE AlbumsSongs (
	ID INT NOT NULL,
	AlbumID INT NOT NULL,
	TrackID INT NOT NULL,
	PRIMARY KEY (ID)
);

CREATE TABLE MusicSOT` (
	ID INT NOT NULL,
	StyleID varchar(30),
	TrackID INT,
	PRIMARY KEY (ID)
);

ALTER TABLE Artists 
ADD CONSTRAINT Artists_fk0 FOREIGN KEY (Country) REFERENCES Country(Country);

ALTER TABLE Tracks 
ADD CONSTRAINT Tracks_fk0 FOREIGN KEY (Artist) REFERENCES Artists(Name);
ADD CONSTRAINT Tracks_fk1 FOREIGN KEY (Duration) REFERENCES MusicStyles(Style);
ADD CONSTRAINT Tracks_fk2 FOREIGN KEY (Language) REFERENCES Languages(Labguage);

ALTER TABLE Albums 
ADD CONSTRAINT Albums_fk0 FOREIGN KEY (Artist) REFERENCES Artists(Name);

ALTER TABLE Albums songs 
ADD CONSTRAINT Albums songs_fk0 FOREIGN KEY (AlbumID) REFERENCES Albums(AlbumID);
ADD CONSTRAINT Albums songs_fk1 FOREIGN KEY (TrackID) REFERENCES Tracks(TrackID);

ALTER TABLE MusicSOT 
ADD CONSTRAINT MusicSOT _fk0 FOREIGN KEY (StyleID) REFERENCES MusicStyles(Style);
ADD CONSTRAINT MusicSOT _fk1 FOREIGN KEY (TrackID) REFERENCES Tracks(TrackID);
