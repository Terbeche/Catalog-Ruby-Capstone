CREATE DATABASE catalog;

-- Create source table
CREATE TABLE source(
 id INTEGER GENERATED ALWAYS AS IDENTITY,
 name VARCHAR(50),
 PRIMARY KEY(id)
);

-- Create movies table  
CREATE TABLE movie(
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(50),
  silent VARCHAR(10),
  publish_date DATE,
  archived BOOLEAN,
  source_id  INT,
  CONSTRAINT fk_movie FOREIGN KEY (source_id) REFERENCES source (id) ON DELETE CASCADE,
  PRIMARY KEY(id)
);
create table Author (
    id integer generated always as identity,
    first_name varchar(100),
    last_name varchar(100),
    primary key(id)
);

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
