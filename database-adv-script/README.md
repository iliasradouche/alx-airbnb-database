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