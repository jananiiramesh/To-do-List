DROP DATABASE IF EXISTS todo_list;
CREATE DATABASE todo_list;
USE todo_list;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS tasks;
DROP TABLE IF EXISTS admin;
CREATE TABLE users (
	user_id SERIAL PRIMARY KEY,
    username VARCHAR(20) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL
);
CREATE TABLE admin (
    admin_id SERIAL PRIMARY KEY,
    username VARCHAR(20) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL
);
CREATE TABLE tasks (
    task_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    name VARCHAR(20) NOT NULL,
    description TEXT,
    status ENUM('Completed','Ongoing','Yet to start') NOT NULL DEFAULT 'Yet to start',
    createdOn DATE DEFAULT CURRENT_TIMESTAMP(),
    due_date DATE,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);