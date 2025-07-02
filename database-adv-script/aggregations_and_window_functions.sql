-- 1. Find the total number of bookings made by each user using COUNT and GROUP BY
SELECT
    user.user_id,
    user.first_name,
    user.last_name,
    user.email,
    COUNT(booking.booking_id) AS total_bookings
FROM
    user
LEFT JOIN booking ON user.user_id = booking.user_id
GROUP BY
    user.user_id,
    user.first_name,
    user.last_name,
    user.email
ORDER BY
    total_bookings DESC;

-- 2. Rank properties based on the total number of bookings they have received using a window function
SELECT
    property.property_id,
    property.name,
    property.location,
    COUNT(booking.booking_id) AS total_bookings,
    ROW_NUMBER() OVER (ORDER BY COUNT(booking.booking_id) DESC) AS booking_rank
FROM
    property
LEFT JOIN booking ON property.property_id = booking.property_id
GROUP BY
    property.property_id,
    property.name,
    property.location
ORDER BY
    booking_rank ASC;
