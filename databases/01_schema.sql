-- Disable foreign key checks momentarily if you are overwriting an existing DB
USE media_platform_db;
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS Watch_History;
DROP TABLE IF EXISTS Content;
DROP TABLE IF EXISTS Genres;
DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Plans;

SET FOREIGN_KEY_CHECKS = 1;

-- Create Tables
CREATE TABLE Plans (
    plan_id INT PRIMARY KEY,
    plan_name VARCHAR(50),
    monthly_price DECIMAL(10, 2)
);

CREATE TABLE Genres (
    genre_id INT PRIMARY KEY,
    genre_name VARCHAR(50)
);

CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    plan_id INT,
    join_date DATE,
    FOREIGN KEY (plan_id) REFERENCES Plans(plan_id)
);

CREATE TABLE Content (
    content_id INT PRIMARY KEY,
    title VARCHAR(255),
    duration_minutes INT,
    genre_id INT,
    FOREIGN KEY (genre_id) REFERENCES Genres(genre_id)
);

CREATE TABLE Watch_History (
    watch_id INT PRIMARY KEY,
    user_id INT,
    content_id INT,
    watch_date DATE,
    minutes_watched INT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (content_id) REFERENCES Content(content_id)
);