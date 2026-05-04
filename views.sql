CREATE VIEW auction_summary AS
SELECT a.auction_id,
       COUNT(b.bid_id) total_bids,
       MAX(b.bid_amount) highest_bid
FROM auction a
LEFT JOIN bid b ON a.auction_id = b.auction_id
GROUP BY a.auction_id;

CREATE VIEW seller_report AS
SELECT u.name,
       COUNT(p.product_id) total_products
FROM users u
JOIN product p ON u.user_id = p.user_id
GROUP BY u.name;