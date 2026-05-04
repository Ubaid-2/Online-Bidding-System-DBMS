-- USERS
CREATE TABLE users (
    user_id NUMBER PRIMARY KEY,
    name VARCHAR2(100),
    email VARCHAR2(100) UNIQUE,
    password VARCHAR2(100),
    user_type VARCHAR2(10) CHECK (user_type IN ('buyer','seller')),
    status VARCHAR2(10),
    created_at DATE DEFAULT SYSDATE
);

-- CATEGORY
CREATE TABLE category (
    category_id NUMBER PRIMARY KEY,
    category_name VARCHAR2(100)
);

-- PRODUCT
CREATE TABLE product (
    product_id NUMBER PRIMARY KEY,
    title VARCHAR2(100),
    description VARCHAR2(255),
    base_price NUMBER CHECK (base_price > 0),
    user_id NUMBER,
    category_id NUMBER,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (category_id) REFERENCES category(category_id)
);

-- AUCTION
CREATE TABLE auction (
    auction_id NUMBER PRIMARY KEY,
    product_id NUMBER UNIQUE,
    start_time DATE,
    end_time DATE,
    auction_status VARCHAR2(10),
    CHECK (end_time > start_time),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

-- BID
CREATE TABLE bid (
    bid_id NUMBER PRIMARY KEY,
    auction_id NUMBER,
    user_id NUMBER,
    bid_amount NUMBER CHECK (bid_amount > 0),
    bid_time DATE,
    FOREIGN KEY (auction_id) REFERENCES auction(auction_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- AUCTION WINNER
CREATE TABLE auction_winner (
    winner_id NUMBER PRIMARY KEY,
    auction_id NUMBER UNIQUE,
    user_id NUMBER,
    winning_bid NUMBER,
    FOREIGN KEY (auction_id) REFERENCES auction(auction_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);