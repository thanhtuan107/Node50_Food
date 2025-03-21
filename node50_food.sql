-- Tạo database
CREATE DATABASE FoodOrderingSystem;
USE FoodOrderingSystem;

-- Tạo bảng User
CREATE TABLE `Users` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `fullName` VARCHAR(255) DEFAULT NULL,
    `email` VARCHAR(255) UNIQUE,
    `password` VARCHAR(255),
    `deletedBy` INT NOT NULL DEFAULT '0',
    `isDeleted` TINYINT(1) NOT NULL DEFAULT '0',
    `deletedAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updatedAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
);

-- Tạo bảng Restaurant
CREATE TABLE `Restaurants` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `resName` VARCHAR(255) DEFAULT NULL,
    `image` VARCHAR(255),
    `description` TEXT,
    `deletedBy` INT NOT NULL DEFAULT '0',
    `isDeleted` TINYINT(1) NOT NULL DEFAULT '0',
    `deletedAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updatedAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
);

-- Tạo bảng Food Type
CREATE TABLE `FoodTypes` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `typeName` VARCHAR(255) DEFAULT NULL,
    `deletedBy` INT NOT NULL DEFAULT '0',
    `isDeleted` TINYINT(1) NOT NULL DEFAULT '0',
    `deletedAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updatedAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
);

-- Tạo bảng Food
CREATE TABLE `Foods` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `foodName` VARCHAR(255) DEFAULT NULL,
    `image` VARCHAR(255),
    `price` FLOAT,
    `description` TEXT,
    `typeId` INT,
    `deletedBy` INT NOT NULL DEFAULT '0',
    `isDeleted` TINYINT(1) NOT NULL DEFAULT '0',
    `deletedAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updatedAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`typeId`) REFERENCES `FoodTypes`(`id`)
);

-- Tạo bảng Sub-Food
CREATE TABLE `SubFoods` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `subName` VARCHAR(255) DEFAULT NULL,
    `subPrice` FLOAT,
    `foodId` INT,
    `deletedBy` INT NOT NULL DEFAULT '0',
    `isDeleted` TINYINT(1) NOT NULL DEFAULT '0',
    `deletedAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updatedAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`foodId`) REFERENCES `Foods`(`id`)
);

-- Tạo bảng Orders
CREATE TABLE `Orders` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `userId` INT,
    `foodId` INT,
    `amount` INT,
    `code` VARCHAR(50),
    `arrSubId` VARCHAR(255),
    `deletedBy` INT NOT NULL DEFAULT '0',
    `isDeleted` TINYINT(1) NOT NULL DEFAULT '0',
    `deletedAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updatedAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`userId`) REFERENCES `Users`(`id`),
    FOREIGN KEY (`foodId`) REFERENCES `Foods`(`id`)
);

-- Tạo bảng Like Restaurant
CREATE TABLE `LikeRestaurants` (
    `userId` INT,
    `resId` INT,
    `dateLike` DATETIME,
    PRIMARY KEY (`userId`, `resId`),
    FOREIGN KEY (`userId`) REFERENCES `Users`(`id`),
    FOREIGN KEY (`resId`) REFERENCES `Restaurants`(`id`)
);

-- Tạo bảng Rate Restaurant
CREATE TABLE `RateRestaurants` (
    `userId` INT,
    `resId` INT,
    `amount` INT,
    `dateRate` DATETIME,
    PRIMARY KEY (`userId`, `resId`),
    FOREIGN KEY (`userId`) REFERENCES `Users`(`id`),
    FOREIGN KEY (`resId`) REFERENCES `Restaurants`(`id`)
);

-- insert data
INSERT INTO `Users` (`fullName`, `email`, `password`) VALUES
('John Doe', 'john@example.com', 'password123'),
('Jane Smith', 'jane@example.com', 'password123'),
('Alice Brown', 'alice@example.com', 'password123'),
('Bob White', 'bob@example.com', 'password123'),
('Charlie Black', 'charlie@example.com', 'password123'),
('David Green', 'david@example.com', 'password123'),
('Ella Blue', 'ella@example.com', 'password123'),
('Frank Red', 'frank@example.com', 'password123'),
('Grace Yellow', 'grace@example.com', 'password123'),
('Hank Purple', 'hank@example.com', 'password123');

INSERT INTO `Restaurants` (`resName`, `image`, `description`) VALUES
('Restaurant A', 'image1.jpg', 'A great place to eat'),
('Restaurant B', 'image2.jpg', 'Delicious food'),
('Restaurant C', 'image3.jpg', 'Best in town'),
('Restaurant D', 'image4.jpg', 'Cozy atmosphere'),
('Restaurant E', 'image5.jpg', 'Family friendly'),
('Restaurant F', 'image6.jpg', 'Authentic cuisine'),
('Restaurant G', 'image7.jpg', 'Fine dining'),
('Restaurant H', 'image8.jpg', 'Fast service'),
('Restaurant I', 'image9.jpg', 'Highly rated'),
('Restaurant J', 'image10.jpg', 'Affordable prices');

INSERT INTO `FoodTypes` (`typeName`) VALUES
('Fast Food'),
('Dessert'),
('Drinks'),
('Seafood'),
('Vegan'),
('Meat'),
('Pasta'),
('Pizza'),
('Sushi'),
('Soup');

INSERT INTO `Foods` (`foodName`, `image`, `price`, `description`, `typeId`) VALUES
('Burger', 'burger.jpg', 5.99, 'Juicy beef burger', 1),
('Chocolate Cake', 'cake.jpg', 4.99, 'Delicious cake', 2),
('Coke', 'coke.jpg', 1.99, 'Refreshing drink', 3),
('Grilled Salmon', 'salmon.jpg', 12.99, 'Fresh grilled salmon', 4),
('Vegan Salad', 'salad.jpg', 7.99, 'Healthy salad', 5),
('Steak', 'steak.jpg', 14.99, 'Tender beef steak', 6),
('Spaghetti', 'spaghetti.jpg', 8.99, 'Italian pasta', 7),
('Margherita Pizza', 'pizza.jpg', 9.99, 'Classic pizza', 8),
('Sushi Set', 'sushi.jpg', 15.99, 'Assorted sushi', 9),
('Chicken Soup', 'soup.jpg', 6.99, 'Hot soup', 10);

--truy van 
-- 1. 5 người đã like nhà hàng nhiều nhất
SELECT userId, COUNT(*) AS likeCount FROM LikeRestaurants
GROUP BY userId
ORDER BY likeCount DESC
LIMIT 5;

-- 2. 2 nhà hàng có lượt like nhiều nhất
SELECT resId, COUNT(*) AS likeCount FROM LikeRestaurants
GROUP BY resId
ORDER BY likeCount DESC
LIMIT 2;

-- 3. Người đã đặt hàng nhiều nhất
SELECT userId, COUNT(*) AS orderCount FROM Orders
GROUP BY userId
ORDER BY orderCount DESC
LIMIT 1;

-- 4. Người dùng không hoạt động trong hệ thống
SELECT * FROM Users
WHERE id NOT IN (SELECT userId FROM Orders)
AND id NOT IN (SELECT userId FROM LikeRestaurants)
AND id NOT IN (SELECT userId FROM RateRestaurants);

