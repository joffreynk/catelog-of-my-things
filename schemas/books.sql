CREATE TABLE books (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  publisher VARCHAR NOT NULL,
  archived BOOLEAN NOT NULL,
  cover_state VARCHAR NOT NULL,
  publish_date DATE NOT NULL,
  author_id INT NOT NULL,
  genre_id INT NOT NULL,
  label_id INT NOT NULL,
  CONSTRAINT fk_authors FOREIGN KEY (author_id) REFERENCES authors(id),
  CONSTRAINT fk_genres FOREIGN KEY (genre_id) REFERENCES genres(id),
  CONSTRAINT fk_labels FOREIGN KEY (label_id) REFERENCES labels(id)
);