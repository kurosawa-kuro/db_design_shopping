DROP DATABASE IF EXISTS shopping_clone;
CREATE DATABASE shopping_clone;
USE shopping_clone; 

CREATE TABLE users (
    `id` INTEGER AUTO_INCREMENT PRIMARY KEY,
    `name` varchar(100) NOT NULL,
    `email` varchar(100) NOT NULL,
    `password` varchar(100) NOT NULL,
    `role` varchar(100) NOT NULL DEFAULT 'user',
    `avatar` varchar(100) DEFAULT NULL,

    `created_at` TIMESTAMP DEFAULT NOW()
);

CREATE TABLE products (
    `id` INTEGER AUTO_INCREMENT PRIMARY KEY,
    `user_id` int(11) NOT NULL,
    `name` varchar(100) NOT NULL,
    `price` int(11) NOT NULL,
    `image` varchar(100) NOT NULL,

    `created_at` TIMESTAMP DEFAULT NOW(),

    FOREIGN KEY(user_id) REFERENCES users(id)
);


CREATE TABLE carts (
    `id` INTEGER AUTO_INCREMENT PRIMARY KEY,
    `user_id` int(11) NOT NULL,
    `product_id` int(11) NOT NULL,
    `product_quantity` int(11) NOT NULL,

    `created_at` TIMESTAMP DEFAULT NOW(),

    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(product_id) REFERENCES products(id)
);

CREATE TABLE categories (
    `id` INTEGER AUTO_INCREMENT PRIMARY KEY,
    `name` varchar(100) NOT NULL,

    `created_at` TIMESTAMP DEFAULT NOW()
);

CREATE TABLE product_categories (
    `product_id` int(11) NOT NULL,
    `category_id` int(11) NOT NULL,

    `created_at` TIMESTAMP DEFAULT NOW(),

    FOREIGN KEY(product_id) REFERENCES products(id),
    FOREIGN KEY(category_id) REFERENCES categories(id),
    PRIMARY KEY(product_id, category_id)
);



-- ====================================














CREATE TABLE photos (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    url VARCHAR(255) NOT NULL,
    user_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),

    FOREIGN KEY(user_id) REFERENCES users(id)
);

CREATE TABLE comments (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    text VARCHAR(255) NOT NULL,
    photo_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    FOREIGN KEY(user_id) REFERENCES users(id)
);

CREATE TABLE likes (
    user_id INTEGER NOT NULL,
    photo_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    PRIMARY KEY(user_id, photo_id)
);

CREATE TABLE follows (
    follower_id INTEGER NOT NULL,
    followee_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(follower_id) REFERENCES users(id),
    FOREIGN KEY(followee_id) REFERENCES users(id),
    PRIMARY KEY(follower_id, followee_id)
);

CREATE TABLE tags (
  id INTEGER AUTO_INCREMENT PRIMARY KEY,
  tag_name VARCHAR(255) UNIQUE,
  created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE photo_tags (
    photo_id INTEGER NOT NULL,
    tag_id INTEGER NOT NULL,
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    FOREIGN KEY(tag_id) REFERENCES tags(id),
    PRIMARY KEY(photo_id, tag_id)
);