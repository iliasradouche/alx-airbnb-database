-- 1. INNER JOIN: Retrieve all bookings and the respective users who made those bookings
SELECT
    booking.booking_id,
    booking.property_id,
    booking.start_date,
    booking.end_date,
    booking.total_price,
    booking.status,
    user.user_id,
    user.first_name,
    user.last_name,
    user.email
FROM
    booking
INNER JOIN user ON booking.user_id = user.user_id;

-- 2. LEFT JOIN: Retrieve all properties and their reviews, including properties that have no reviews
SELECT
    property.property_id,
    property.host_id,
    property.name,
    property.description,
    property.location,
    property.pricepernight,
    review.review_id,
    review.user_id AS reviewer_id,
    review.rating,
    review.comment
FROM
    property
LEFT JOIN review ON property.property_id = review.property_id;

-- 3. FULL OUTER JOIN: Retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user
-- Note: FULL OUTER JOIN is not supported in MySQL. we use UNION of LEFT JOIN and RIGHT JOIN for compatibility.

SELECT
    user.user_id,
    user.first_name,
    user.last_name,
    user.email,
    booking.booking_id,
    booking.property_id,
    booking.start_date,
    booking.end_date,
    booking.total_price,
    booking.status
FROM
    user
LEFT JOIN booking ON user.user_id = booking.user_id

UNION

SELECT
    user.user_id,
    user.first_name,
    user.last_name,
    user.email,
    booking.booking_id,
    booking.property_id,
    booking.start_date,
    booking.end_date,
    booking.total_price,
    booking.status
FROM
    booking
RIGHT JOIN user ON booking.user_id = user.user_id;