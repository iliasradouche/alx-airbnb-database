# Advanced SQL Join Queries

This file contains examples of complex SQL queries using different types of joins on the AirBnB database schema.

## 1. INNER JOIN: Bookings and Users

Retrieves all bookings and the respective users who made those bookings.
- Only bookings that are associated with a user are included.

## 2. LEFT JOIN: Properties and Reviews

Retrieves all properties and any reviews they have received.
- Properties without any reviews will still appear, with review columns as `NULL`.

## 3. FULL OUTER JOIN: Users and Bookings

Retrieves all users and all bookings, even if a user has no bookings or a booking is not linked to a user.
- MySQL does not support FULL OUTER JOIN directly. This is achieved by combining the results of a `LEFT JOIN` and a `RIGHT JOIN` using `UNION`.
- Ensures every user and every booking is represented.


# Subqueries Practice

This file demonstrates the use of both correlated and non-correlated subqueries on the ALX AirBnB database schema.

## 1. Properties with Average Rating > 4.0 (Non-correlated Subquery)

Retrieves all properties whose average review rating is greater than 4.0.
- Uses a subquery in the `WHERE` clause to filter properties based on aggregated ratings from the `review` table.

## 2. Users with More Than 3 Bookings (Correlated Subquery)

Finds all users who have made more than 3 bookings.
- Uses a correlated subquery in the `WHERE` clause, where for each user, it counts the number of bookings associated with that user and selects those with more than 3.

# Aggregations and Window Functions

This file contains SQL queries demonstrating the use of aggregation and window functions on the ALX AirBnB database schema.

## 1. Total Bookings by Each User

Calculates the total number of bookings made by each user.
- Uses the `COUNT()` aggregation function and `GROUP BY` clause.
- Includes users with zero bookings (via `LEFT JOIN`).

## 2. Ranking Properties by Number of Bookings

Ranks properties based on the total number of bookings they have received.
- Uses `COUNT()` to aggregate bookings for each property.
- Applies the `RANK()` window function to assign a rank to each property based on booking counts.
- Properties with no bookings are included and ranked accordingly.