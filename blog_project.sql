-- Active: 1736137488939@@127.0.0.1@3306@blogs
--Authors Table

CREATE TABLE authors(
    id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
     ON UPDATE CURRENT_TIMESTAMP
);

--Categories Table

CREATE TABLE categories(
    id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR (50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
     ON UPDATE CURRENT_TIMESTAMP
);

--Blogs Table

CREATE TABLE blogs(
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR (150) NOT NULL,
    body TEXT NOT NULL,
    category_id INT NOT NULL,
    author_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
     ON UPDATE CURRENT_TIMESTAMP,

    FOREIGN KEY (category_id) REFERENCES categories (id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (author_id) REFERENCES authors (id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

--. Authors Table:
--How do you add a new author to the authors table?
INSERT INTO authors (author_name) VALUES ("John Doe");

--How do you retrieve all authors from the authors table?
SELECT * FROM authors;

--How do you retrieve a specific author by their ID from the authors table?
SELECT * FROM authors WHERE id = 4;

--How do you update an author’s name in the authors table?
UPDATE authors SET author_name = "Jasim Vai" WHERE id = 2;

--How do you delete an author by their ID from the authors table?
DELETE FROM authors WHERE id = 1;


--. Categories Table:
--How do you add a new category to the categories table?
INSERT INTO categories (category_name) VALUES ("My category");

--How do you retrieve all categories from the categories table?
SELECT * FROM categories;

--How do you retrieve a specific category by its ID from the categories table?
SELECT * FROM categories WHERE id = 5

--How do you update a category’s name in the categories table?
UPDATE categories SET category_name = "our category" WHERE id = 1;

--How do you delete a category by its ID from the categories table?
DELETE FROM categories WHERE id = 1;

--.Blogs Table:
--How do you add a new blog to the blogs table?

INSERT INTO blogs (title, body, category_id, author_id) 
VALUES ("My Blog", "My blog's content", 2, 2)

--How do you retrieve all blogs from the blogs table?
SELECT * FROM blogs;

--How do you retrieve a specific blog by its ID from the blogs table?
SELECT * FROM blogs WHERE id = 1;

--How do you retrieve all blogs with their category and author information?
SELECT
    blogs.title,
    blogs.body,
    categories.category_name,
    authors.author_name
FROM
    blogs
JOIN
    categories ON blogs.category_id = categories.id
JOIN
    authors ON blogs.author_id = authors.id

--How do you update a blog’s title in the blogs table?
UPDATE blogs SET title = "My updated Blog title" WHERE id = 1;

--How do you update a blog’s category or author in the blogs table?
UPDATE blogs SET category_id = 4, author_id = 2 WHERE id = 10

--How do you delete a blog by its ID from the blogs table?
DELETE FROM blogs WHERE id =1;

--. Specific Queries:
--How do you get all blogs written by a specific author?
SELECT
    authors.author_name,
    blogs.title,
    blogs.body,
    categories.category_name
FROM 
    blogs
JOIN 
    authors ON blogs.author_id = authors.id
JOIN
    categories ON blogs.category_id = categories.id
WHERE
    authors.id = 4;

--How do you get all blogs under a specific category?
SELECT categories.category_name, blogs.title, blogs.body
FROM blogs
JOIN categories ON blogs.category_id = categories.id
WHERE categories.category_name = "Lifestyle";
