-- JOIN
SELECT u.name, p.title, b.bid_amount
FROM users u
JOIN bid b ON u.user_id = b.user_id
JOIN auction a ON b.auction_id = a.auction_id
JOIN product p ON a.product_id = p.product_id;

-- HIGHEST BID
SELECT auction_id, MAX(bid_amount)
FROM bid
GROUP BY auction_id;

-- COUNT BIDS
SELECT auction_id, COUNT(*) total_bids
FROM bid
GROUP BY auction_id;

-- ACTIVE AUCTIONS
SELECT COUNT(*) FROM auction WHERE auction_status = 'active';