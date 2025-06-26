# Airbnb Database Seed Data

## Overview

This directory contains SQL scripts to populate the Airbnb database with sample data. The seed data is designed to simulate realistic usage patterns and relationships between entities in the system.

## Seed Data Summary

The seed script populates the database with:

### Users (10 total)
- 5 guests
- 4 hosts
- 1 admin
- Each user has a unique UUID, email, and hashed password

### Properties (8 total)
- Distributed among 4 hosts
- Variety of property types (apartments, houses, cabins, etc.)
- Located in different cities across the United States
- Price range from $100 to $350 per night

### Bookings (12 total)
- Mix of confirmed, pending, completed, and canceled bookings
- Different date ranges spanning several months
- Various properties and guests represented
- Realistic pricing based on property rates and stay duration

### Payments (9 total)
- Linked to confirmed and completed bookings
- Different payment methods (credit card, PayPal, Stripe)
- Payment amounts matching booking total prices

### Reviews (6 total)
- Submitted for completed stays
- Ratings range from 3 to 5 stars
- Detailed comments providing feedback on the stay experience

### Messages (8 total)
- Conversations between guests and hosts
- Questions about properties and amenities
- Host responses with additional information

## Data Relationships

The seed data maintains referential integrity across all tables:

1. Each property is linked to a valid host user
2. Each booking is linked to a valid guest user and property
3. Each payment is linked to a valid booking
4. Each review is linked to a valid property and user
5. Each message is linked to valid sender and recipient users

## Usage Scenarios

The sample data supports various usage scenarios:

1. **User Authentication**: Test login with different user roles
2. **Property Search**: Filter properties by location, price, or availability
3. **Booking Process**: Trace the entire booking lifecycle
4. **Payment Processing**: Examine payment records for financial analysis
5. **Review System**: Analyze customer feedback and ratings
6. **Messaging**: View communication history between users

## Implementation Notes

1. All UUID values are pre-generated to ensure consistent relationships between tables
2. Password values are stored as bcrypt hashes (represented here as dummy hashes)
3. Dates are carefully structured to create a realistic timeline of events
4. Data volumes are intentionally modest for ease of understanding but sufficient to test most functionality

## Extending the Seed Data

To extend this seed data for larger testing scenarios:

1. Follow the same patterns for creating additional records
2. Maintain proper relationships between entities
3. Ensure UUID values are unique across all records
4. Keep timestamps consistent with the logical flow of events

## Usage Instructions

To populate your database with this sample data:

1. Ensure the database schema has been created using the schema.sql script
2. Run this seed.sql script to insert the sample data
3. Verify all data has been properly inserted by querying each table