CREATE SEQUENCE auction_winner_seq START WITH 1 INCREMENT BY 1;

-- VALIDATE BID
CREATE OR REPLACE TRIGGER validate_bid
BEFORE INSERT ON bid
FOR EACH ROW
DECLARE
    max_bid NUMBER;
    start_t DATE;
    end_t DATE;
BEGIN
    SELECT NVL(MAX(bid_amount),0) INTO max_bid FROM bid WHERE auction_id = :NEW.auction_id;
    SELECT start_time, end_time INTO start_t, end_t FROM auction WHERE auction_id = :NEW.auction_id;

    IF :NEW.bid_amount <= max_bid THEN
        RAISE_APPLICATION_ERROR(-20001, 'Bid must be higher');
    END IF;

    IF :NEW.bid_time < start_t OR :NEW.bid_time > end_t THEN
        RAISE_APPLICATION_ERROR(-20002, 'Invalid time');
    END IF;
END;
/

-- ASSIGN WINNER
CREATE OR REPLACE TRIGGER assign_winner
AFTER UPDATE ON auction
FOR EACH ROW
WHEN (NEW.auction_status = 'closed')
DECLARE
    v_user NUMBER;
    v_bid NUMBER;
BEGIN
    SELECT user_id, bid_amount INTO v_user, v_bid
    FROM bid
    WHERE auction_id = :NEW.auction_id
    AND bid_amount = (SELECT MAX(bid_amount) FROM bid WHERE auction_id = :NEW.auction_id);

    INSERT INTO auction_winner
    VALUES (auction_winner_seq.NEXTVAL, :NEW.auction_id, v_user, v_bid);
END;
/