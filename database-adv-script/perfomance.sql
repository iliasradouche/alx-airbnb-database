-- Initial Query: Retrieve all bookings with user, property, and payment details

SELECT
    booking.booking_id,
    booking.start_date,
    booking.end_date,
    booking.total_price,
    booking.status,
    user.user_id,
    user.first_name,
    user.last_name,
    user.email,
    property.property_id,
    property.name AS property_name,
    property.location,
    payment.payment_id,
    payment.amount,
    payment.payment_date,
    payment.payment_method
FROM
    booking
JOIN user ON booking.user_id = user.user_id
JOIN property ON booking.property_id = property.property_id
LEFT JOIN payment ON booking.booking_id = payment.booking_id;

-- Analyze performance of the initial query
EXPLAIN SELECT
    booking.booking_id,
    booking.start_date,
    booking.end_date,
    booking.total_price,
    booking.status,
    user.user_id,
    user.first_name,
    user.last_name,
    user.email,
    property.property_id,
    property.name AS property_name,
    property.location,
    payment.payment_id,
    payment.amount,
    payment.payment_date,
    payment.payment_method
FROM
    booking
JOIN user ON booking.user_id = user.user_id
JOIN property ON booking.property_id = property.property_id
LEFT JOIN payment ON booking.booking_id = payment.booking_id;

-- Optimized Query: Only select necessary columns, assume indexes exist on join/filter columns

SELECT
    booking.booking_id,
    booking.start_date,
    booking.end_date,
    booking.total_price,
    booking.status,
    user.user_id,
    user.first_name,
    user.last_name,
    user.email,
    property.property_id,
    property.name AS property_name,
    property.location,
    payment.payment_id,
    payment.amount,
    payment.payment_date,
    payment.payment_method
FROM
    booking
JOIN user ON booking.user_id = user.user_id
JOIN property ON booking.property_id = property.property_id
LEFT JOIN payment ON booking.booking_id = payment.booking_id
-- Example filter: only retrieve recent bookings to further optimize (optional)
-- WHERE booking.created_at > DATE_SUB(NOW(), INTERVAL 1 YEAR)
ORDER BY booking.created_at DESC;

-- Analyze performance of the optimized query
EXPLAIN SELECT
    booking.booking_id,
    booking.start_date,
    booking.end_date,
    booking.total_price,
    booking.status,
    user.user_id,
    user.first_name,
    user.last_name,
    user.email,
    property.property_id,
    property.name AS property_name,
    property.location,
    payment.payment_id,
    payment.amount,
    payment.payment_date,
    payment.payment_method
FROM
    booking
JOIN user ON booking.user_id = user.user_id
JOIN property ON booking.property_id = property.property_id
LEFT JOIN payment ON booking.booking_id = payment.booking_id
ORDER BY booking.created_at DESC;