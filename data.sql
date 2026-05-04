-- USERS
INSERT INTO users VALUES (1, 'Ali', 'ali@email.com', '123', 'seller', 'active', SYSDATE);
INSERT INTO users VALUES (2, 'Ahmed', 'ahmed@email.com', '123', 'buyer', 'active', SYSDATE);
INSERT INTO users VALUES (3, 'Sara', 'sara@email.com', '123', 'buyer', 'active', SYSDATE);
INSERT INTO users VALUES (4, 'Usman', 'usman@email.com', '123', 'seller', 'active', SYSDATE);
INSERT INTO users VALUES (5, 'Zain', 'zain@email.com', '123', 'buyer', 'active', SYSDATE);

-- CATEGORY
INSERT INTO category VALUES (1, 'Electronics');
INSERT INTO category VALUES (2, 'Furniture');
INSERT INTO category VALUES (3, 'Vehicles');

-- PRODUCT
INSERT INTO product VALUES (1, 'Laptop', 'Gaming Laptop', 50000, 1, 1);
INSERT INTO product VALUES (2, 'Mobile', 'iPhone', 80000, 1, 1);
INSERT INTO product VALUES (3, 'Sofa', 'Luxury Sofa', 30000, 4, 2);
INSERT INTO product VALUES (4, 'Bike', 'Sports Bike', 120000, 4, 3);

-- AUCTION
INSERT INTO auction VALUES (1, 1, SYSDATE, SYSDATE+1, 'active');
INSERT INTO auction VALUES (2, 2, SYSDATE, SYSDATE+1, 'active');
INSERT INTO auction VALUES (3, 3, SYSDATE, SYSDATE+1, 'active');
INSERT INTO auction VALUES (4, 4, SYSDATE, SYSDATE+1, 'active');

COMMIT;