ALTER TABLE VENUE
ADD CAPACITY NUMBER;

ALTER TABLE VENUE
ADD CAPACITY NUMBER;
UPDATE Venue
SET Capacity = 
    CASE
        WHEN VENUE_ID = 1 THEN 20000  -- Bangladesh National Stadium
        WHEN VENUE_ID = 2 THEN 66000  -- Eden Gardens
        WHEN VENUE_ID = 3 THEN 32000  -- National Stadium
        WHEN VENUE_ID = 4 THEN 100024 -- Melbourne Cricket Ground
        WHEN VENUE_ID = 5 THEN 28000  -- Lord's Cricket Ground
        WHEN VENUE_ID = 6 THEN 50000  -- Eden Park
        WHEN VENUE_ID = 7 THEN 25000  -- Newlands
        WHEN VENUE_ID = 8 THEN 5000   -- Rashid Latif Cricket Academy
        WHEN VENUE_ID = 9 THEN 11000  -- Kensington Oval
        ELSE 0  -- Default capacity if none of the VENUE_IDs match
    END;
