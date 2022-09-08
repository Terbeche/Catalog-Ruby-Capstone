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