CREATE DATABASE catalog;

-- Create Label table
CREATE TABLE Label(
 id INTEGER GENERATED ALWAYS AS IDENTITY,
 title VARCHAR(20),
 color VARCHAR(20),
 PRIMARY KEY(id)
);

-- Create Book table  
CREATE TABLE Book(
  id INT GENERATED ALWAYS AS IDENTITY,
  publisher VARCHAR(50),
  cover_state VARCHAR(10),
  publish_date DATE,
  archived BOOLEAN,
  label_id  INT,
  CONSTRAINT fk_book FOREIGN KEY (label_id) REFERENCES label (id) ON DELETE CASCADE,
  PRIMARY KEY(id)
);

-- Create Source table
CREATE TABLE Source(
 id INTEGER GENERATED ALWAYS AS IDENTITY,
 name VARCHAR(50),
 PRIMARY KEY(id)
);

-- Create Movie table  
CREATE TABLE Movie(
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(50),
  silent VARCHAR(10),
  publish_date DATE,
  archived BOOLEAN,
  source_id  INT,
  CONSTRAINT fk_movie FOREIGN KEY (source_id) REFERENCES source (id) ON DELETE CASCADE,
  PRIMARY KEY(id)
);

-- Create Author table  
create table Author (
    id integer generated always as identity,
    first_name varchar(100),
    last_name varchar(100),
    primary key(id)
);

-- Create Game table  
create table Game (
    id integer generated always as identity,
    multiplayer varchar(100),
    last_played_at date,
    published_date date,
    archived boolean,
    author_id  INT,
    CONSTRAINT fk_author FOREIGN KEY (author_id) REFERENCES Author (id) ON DELETE CASCADE,
    PRIMARY KEY(id)
)

-- Create Genre table  
CREATE TABLE genre(
  ID SERIAL PRIMARY KEY,
  name VARCHAR(30)
);


-- Create music_album table  
CREATE TABLE music_album(
  ID SERIAL PRIMARY KEY,
  publish_date DATE NOT NULL,
  on_spotify BOOLEAN NOT NULL,
  archived BOOLEAN NOT NULL,
  label_ID INT REFERENCES label(ID),
  author_ID INT REFERENCES author(ID),
  genre_ID INT REFERENCES genre(ID)
);