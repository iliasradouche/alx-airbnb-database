-- 1. Create indexes for frequently used columns

CREATE INDEX idx_user_email ON user(email);
CREATE INDEX idx_user_role ON user(role);

CREATE INDEX idx_booking_user ON booking(user_id);
CREATE INDEX idx_booking_property ON booking(property_id);
CREATE INDEX idx_booking_status ON booking(status);

CREATE INDEX idx_property_host ON property(host_id);
CREATE INDEX idx_property_location ON property(location);

-- 2. Measure query performance before and after adding indexes

-- Example: Check performance of a query filtering by user_id in booking
EXPLAIN ANALYZE SELECT * FROM booking WHERE user_id = 'sample-user-id';

-- Example: Check performance of a query joining booking and user on user_id
EXPLAIN ANALYZE
SELECT booking.booking_id, user.first_name
FROM booking
JOIN user ON booking.user_id = user.user_id
WHERE booking.status = 'confirmed';

-- Example: Check performance of a query filtering property by location
EXPLAIN ANALYZE SELECT * FROM property WHERE location = 'New York';

-- Example: Check performance of a query finding all bookings for a property
EXPLAIN ANALYZE SELECT * FROM booking WHERE property_id = 'sample-property-id';