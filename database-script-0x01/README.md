# Airbnb Database Schema

## Overview

This directory contains SQL scripts to create the database schema for an Airbnb-like application. The schema is designed based on the provided database specification and includes tables for users, properties, bookings, payments, reviews, and messages.

## Schema Design

The database schema follows a relational model with six main entities:

1. **User** - Stores information about all system users (guests, hosts, admins)
2. **Property** - Stores listings that can be booked
3. **Booking** - Records reservations made by users for properties
4. **Payment** - Tracks financial transactions for bookings
5. **Review** - Stores user feedback about properties
6. **Message** - Facilitates communication between users

## Database Tables

### User Table
Stores user account information and authentication details.
- Primary Key: `user_id` (UUID)
- Notable fields: email (unique), role (guest/host/admin), password_hash

### Property Table
Stores information about rental properties listed on the platform.
- Primary Key: `property_id` (UUID)
- Foreign Key: `host_id` references User(user_id)
- Contains details like name, description, location, and pricing

### Booking Table
Records reservations made by users.
- Primary Key: `booking_id` (UUID)
- Foreign Keys: `property_id`, `user_id`
- Tracks dates, status, and pricing information

### Payment Table
Records financial transactions related to bookings.
- Primary Key: `payment_id` (UUID)
- Foreign Key: `booking_id` references Booking(booking_id)
- Tracks payment method and amount

### Review Table
Stores user feedback about properties after stays.
- Primary Key: `review_id` (UUID)
- Foreign Keys: `property_id`, `user_id`
- Includes numerical rating and text comments

### Message Table
Facilitates communication between users.
- Primary Key: `message_id` (UUID)
- Foreign Keys: `sender_id`, `recipient_id` both reference User(user_id)
- Stores message content and timestamps

## Indexing Strategy

The schema includes indexes to optimize query performance:

1. **Primary Keys**: All tables have primary keys that are automatically indexed
2. **Foreign Keys**: Indexed to improve join operations
3. **Additional Indexes**:
   - User email (for login lookups)
   - Property host (for host property listings)
   - Booking property and user (for reservation lookups)
   - Payment booking (for transaction lookups)
   - Review property and user (for feedback lookups)
   - Message sender and recipient (for conversation lookups)

## Constraints

The schema implements various constraints to maintain data integrity:

1. **Primary Key Constraints**: Ensure unique identification of each record
2. **Foreign Key Constraints**: Maintain referential integrity between tables
3. **Unique Constraints**: Prevent duplicate values (e.g., email addresses)
4. **Not Null Constraints**: Ensure required fields are populated
5. **Check Constraints**: Validate data (e.g., ratings between 1-5)
6. **Enum Constraints**: Limit values to predefined options

## UUID Generation

The schema includes triggers to automatically generate UUIDs for new records when not explicitly provided. This ensures that each record has a unique identifier.

## Usage

To implement this schema:

1. Connect to your MySQL database server
2. Run the `schema.sql` script to create the tables and constraints
3. Verify the schema has been created correctly

## Design Considerations

- **Soft Delete**: The current schema does not implement soft deletion. If needed, status fields could be added to tables.
- **Scalability**: Indexes are created on frequently queried columns to maintain performance as data grows.
- **Security**: Password hashing is implemented but additional security measures should be considered in the application layer.
- **Booking Logic**: A constraint ensures end_date is not before start_date.
