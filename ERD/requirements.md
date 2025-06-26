# Entity-Relationship Diagram Requirements for Airbnb Database

## Entities and Attributes

### User
- user_id: Primary Key, UUID, Indexed
- first_name: VARCHAR, NOT NULL
- last_name: VARCHAR, NOT NULL
- email: VARCHAR, UNIQUE, NOT NULL
- password_hash: VARCHAR, NOT NULL
- phone_number: VARCHAR, NULL
- role: ENUM (guest, host, admin), NOT NULL
- created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

### Property
- property_id: Primary Key, UUID, Indexed
- host_id: Foreign Key, references User(user_id)
- name: VARCHAR, NOT NULL
- description: TEXT, NOT NULL
- location: VARCHAR, NOT NULL
- pricepernight: DECIMAL, NOT NULL
- created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
- updated_at: TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP

### Booking
- booking_id: Primary Key, UUID, Indexed
- property_id: Foreign Key, references Property(property_id)
- user_id: Foreign Key, references User(user_id)
- start_date: DATE, NOT NULL
- end_date: DATE, NOT NULL
- total_price: DECIMAL, NOT NULL
- status: ENUM (pending, confirmed, canceled), NOT NULL
- created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

### Payment
- payment_id: Primary Key, UUID, Indexed
- booking_id: Foreign Key, references Booking(booking_id)
- amount: DECIMAL, NOT NULL
- payment_date: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
- payment_method: ENUM (credit_card, paypal, stripe), NOT NULL

### Review
- review_id: Primary Key, UUID, Indexed
- property_id: Foreign Key, references Property(property_id)
- user_id: Foreign Key, references User(user_id)
- rating: INTEGER, CHECK: rating >= 1 AND rating <= 5, NOT NULL
- comment: TEXT, NOT NULL
- created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

### Message
- message_id: Primary Key, UUID, Indexed
- sender_id: Foreign Key, references User(user_id)
- recipient_id: Foreign Key, references User(user_id)
- message_body: TEXT, NOT NULL
- sent_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

## Relationships
1. User to Property: One-to-Many (A user can host multiple properties)
2. User to Booking: One-to-Many (A user can make multiple bookings)
3. Property to Booking: One-to-Many (A property can have multiple bookings)
4. Booking to Payment: One-to-Many (A booking can have multiple payments)
5. User to Review: One-to-Many (A user can write multiple reviews)
6. Property to Review: One-to-Many (A property can receive multiple reviews)
7. User to Message: One-to-Many (as both sender and recipient)

## Constraints
- User Table: Unique constraint on email
- Review Table: Rating must be between 1 and 5
- All required fields have NOT NULL constraints

## Design Requirements

1. Each entity must have appropriate attributes including primary keys
2. Foreign keys must be used to establish relationships between entities
3. Many-to-many relationships should use junction tables
4. The database design should be normalized to at least 3NF (Third Normal Form)
5. Entity and referential integrity must be maintained
