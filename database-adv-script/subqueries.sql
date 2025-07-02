-- 1. Find all properties where the average rating is greater than 4.0 using a subquery (non-correlated)
SELECT
    property.property_id,
    property.name,
    property.description,
    property.location,
    property.pricepernight
FROM
    property
WHERE
    property.property_id IN (
        SELECT
            review.property_id
        FROM
            review
        GROUP BY
            review.property_id
        HAVING
            AVG(review.rating) > 4.0
    );

-- 2. Find users who have made more than 3 bookings using a correlated subquery
SELECT
    user.user_id,
    user.first_name,
    user.last_name,
    user.email
FROM
    user
WHERE
    (
        SELECT COUNT(*)
        FROM booking
        WHERE booking.user_id = user.user_id
    ) > 3;