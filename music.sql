-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE producers 
(
  id SERIAL PRIMARY KEY,
  producer TEXT NOT NULL UNIQUE
);

INSERT INTO producers
  (producer)
VALUES
  ('Dust Brothers'), ('Stephen Lironi'), ('Roy Thomas Baker'), ('Walter Afanasieff'), ('Benjamin Rice'), ('Rick Parashar'), ('Al Shux'), ('Max Martin'), ('Cirkut'), ('Shellback'), ('Benny Blanco'), ('The Matrix'), ('Darkchild');

CREATE TABLE artists
(
  id SERIAL PRIMARY KEY,
  artist TEXT NOT NULL UNIQUE
);

INSERT INTO artists
  (artist)
VALUES
  ('Hanson'), ('Queen'), ('Mariah Carey'), ('Boyz II Men'),
  ('Lady Gaga'), ('Bradley Cooper'), ('Nickelback'), ('Jay Z'),
  ('Alicia Keys'), ('Katy Perry'), ('Juicy J'), ('Maroon 5'),
  ('Christina Aguilera'), ('Avril Lavigne'), ('Destiny''s Child');

CREATE TABLE albums 
(
  id SERIAL PRIMARY KEY,
  album TEXT NOT NULL UNIQUE,
  release_date DATE NOT NULL
);

INSERT INTO albums
  (album, release_date)
VALUES
  ('Middle of Nowhere', '04-15-1997'),
  ('A Night at the Opera', '10-31-1975'),
  ('Daydream', '11-14-1995'),
  ('A Star Is Born', '09-27-2018'),
  ('Silver Side Up', '08-21-2001'),
  ('The Blueprint 3', '10-20-2009'),
  ('Prism', '12-17-2013'),
  ('Hands All Over', '06-21-2011'),
  ('Let Go', '05-14-2002'),
  ('The Writing''s on the Wall', '11-07-1999');

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL,
  album_id INT NOT NULL REFERENCES albums(id)
);

INSERT INTO songs
  (title, duration_in_seconds, release_date, album_id)
VALUES
  ('MMMBop', 238, '04-15-1997', 1),
  ('Bohemian Rhapsody', 355, '10-31-1975', 2),
  ('One Sweet Day', 282, '11-14-1995', 3),
  ('Shallow', 216, '09-27-2018', 4),
  ('How You Remind Me', 223, '08-21-2001', 5),
  ('New York State of Mind', 276, '10-20-2009', 6),
  ('Dark Horse', 215, '12-17-2013', 7),
  ('Moves Like Jagger', 201, '06-21-2011', 8),
  ('Complicated', 244, '05-14-2002', 9),
  ('Say My Name', 240, '11-07-1999', 10);

CREATE TABLE works
(
  id SERIAL PRIMARY KEY,
  artist_id INT REFERENCES artists(id),
  song_id INT REFERENCES songs(id),
  album_id INT REFERENCES albums(id)
);

INSERT INTO works
  (artist_id, song_id, album_id)
VALUES
  (1, 1, 1), (2, 2, 2), (3, 3, 3), (4, 3, 3), (5, 4, 4), (6, 4, 4), (7, 5, 5), (8, 6, 6), (9, 6, 6), (10, 7, 7),
  (11, 7, 7), (12, 8, 8), (13, 8, 8), (14, 9, 9), (15, 10, 10);

-- INSERT INTO songs
--   (title, duration_in_seconds, release_date, artists, album, producers)
-- VALUES
--   ('MMMBop', 238, '04-15-1997', '{'Hanson'}', 'Middle of Nowhere', '{'Dust Brothers', 'Stephen Lironi'}'),
--   ('Bohemian Rhapsody', 355, '10-31-1975', '{'Queen'}', 'A Night at the Opera', '{'Roy Thomas Baker'}'),
--   ('One Sweet Day', 282, '11-14-1995', '{'Mariah Cary', 'Boyz II Men'}', 'Daydream', '{'Walter Afanasieff'}'),
--   ('Shallow', 216, '09-27-2018', '{'Lady Gaga', 'Bradley Cooper'}', 'A Star Is Born', '{'Benjamin Rice'}'),
--   ('How You Remind Me', 223, '08-21-2001', '{'Nickelback'}', 'Silver Side Up', '{'Rick Parashar'}'),
--   ('New York State of Mind', 276, '10-20-2009', '{'Jay Z', 'Alicia Keys'}', 'The Blueprint 3', '{'Al Shux'}'),
--   ('Dark Horse', 215, '12-17-2013', '{'Katy Perry', 'Juicy J'}', 'Prism', '{'Max Martin', 'Cirkut'}'),
--   ('Moves Like Jagger', 201, '06-21-2011', '{'Maroon 5', 'Christina Aguilera'}', 'Hands All Over', '{'Shellback', 'Benny Blanco'}'),
--   ('Complicated', 244, '05-14-2002', '{'Avril Lavigne'}', 'Let Go', '{'The Matrix'}'),
--   ('Say My Name', 240, '11-07-1999', '{'Destiny''s Child'}', 'The Writing''s on the Wall', '{'Darkchild'}');
