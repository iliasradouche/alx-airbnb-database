# Database Normalization to 3NF

## Objective
This document explains the normalization process applied to the Airbnb database to ensure it meets the requirements of the Third Normal Form (3NF).

## Current Schema Analysis

The current database schema includes these entities:
- User
- Property
- Booking
- Payment
- Review
- Message

## First Normal Form (1NF) Analysis

1NF requires:
- Tables have no repeating groups
- Each column contains atomic values
- Each row is unique

**Status:**
- All tables have a primary key (UUID)
- All attributes contain atomic values
- No repeating groups in the schema

The database satisfies 1NF.

## Second Normal Form (2NF) Analysis

2NF requires:
- The database is in 1NF
- All non-key attributes are fully dependent on the primary key

**Status:**
- User: All attributes depend on user_id (PK)
- Property: All attributes depend on property_id (PK)
- Booking: All attributes depend on booking_id (PK)
- Payment: All attributes depend on payment_id (PK)
- Review: All attributes depend on review_id (PK)
- Message: All attributes depend on message_id (PK)

The database satisfies 2NF.

## Third Normal Form (3NF) Analysis

3NF requires:
- The database is in 2NF
- No transitive dependencies (non-key attributes depending on other non-key attributes)

**Issues:**

1. **Booking Table:**
   - `total_price` is calculated from `start_date`, `end_date`, and Property's `pricepernight`
   - This creates a transitive dependency where `total_price` depends on these attributes, not just the primary key

2. **Property Table:**
   - `location` is stored as a single VARCHAR field, which may contain multiple pieces of information
   - This creates update anomalies and makes it difficult to search by specific location components

## Normalization Steps to Achieve 3NF

### 1. Addressing the Booking Table Issue

**Problem:** The `total_price` in the Booking table is calculated from other attributes.

**Solution:** Remove the `total_price` attribute from the Booking table and make it a derived attribute calculated at runtime using:
- Booking's `start_date` and `end_date` (to determine the number of nights)
- Property's `pricepernight`

**Alternative:** If storing the total price is necessary for historical reasons, add a comment indicating that this is a denormalized field for record-keeping purposes.

### 2. Normalizing the Property Location

**Problem:** The `location` field in the Property table is a composite value.

**Solution:** Create a separate Location table:

```
Location
- location_id: Primary Key, UUID, Indexed
- property_id: Foreign Key, references Property(property_id)
- street_address: VARCHAR, NOT NULL
- city: VARCHAR, NOT NULL
- state_province: VARCHAR, NOT NULL
- postal_code: VARCHAR, NOT NULL
- country: VARCHAR, NOT NULL
- latitude: DECIMAL(10,8), NULL
- longitude: DECIMAL(11,8), NULL
```

Then modify the Property table:
- Remove the `location` field
- Add a foreign key `location_id` referencing Location(location_id)

### 3. Additional Normalization Considerations

1. **Property Amenities:**
   The current schema does not track amenities for properties. If needed, add:

   ```
   Amenity
   - amenity_id: Primary Key, UUID, Indexed
   - name: VARCHAR, NOT NULL
   - description: TEXT, NULL
   
   PropertyAmenity (Junction Table)
   - property_id: Foreign Key, references Property(property_id)
   - amenity_id: Foreign Key, references Amenity(amenity_id)
   - Primary Key (property_id, amenity_id)
   ```

2. **User Profile and Authentication:**
   Consider separating user authentication from profile information:

   ```
   UserAuth
   - user_id: Primary Key, UUID, Indexed
   - email: VARCHAR, UNIQUE, NOT NULL
   - password_hash: VARCHAR, NOT NULL
   - role: ENUM (guest, host, admin), NOT NULL
   
   UserProfile
   - user_id: Foreign Key, references UserAuth(user_id)
   - first_name: VARCHAR, NOT NULL
   - last_name: VARCHAR, NOT NULL
   - phone_number: VARCHAR, NULL
   - profile_picture: VARCHAR, NULL
   - bio: TEXT, NULL
   ```

## Final Normalized Schema

After applying the normalization steps, the 3NF-compliant schema:

### User Table
- user_id: Primary Key, UUID, Indexed
- first_name: VARCHAR, NOT NULL
- last_name: VARCHAR, NOT NULL
- email: VARCHAR, UNIQUE, NOT NULL
- password_hash: VARCHAR, NOT NULL
- phone_number: VARCHAR, NULL
- role: ENUM (guest, host, admin), NOT NULL
- created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

### Location Table
- location_id: Primary Key, UUID, Indexed
- street_address: VARCHAR, NOT NULL
- city: VARCHAR, NOT NULL
- state_province: VARCHAR, NOT NULL
- postal_code: VARCHAR, NOT NULL
- country: VARCHAR, NOT NULL
- latitude: DECIMAL(10,8), NULL
- longitude: DECIMAL(11,8), NULL

### Property Table
- property_id: Primary Key, UUID, Indexed
- host_id: Foreign Key, references User(user_id)
- location_id: Foreign Key, references Location(location_id)
- name: VARCHAR, NOT NULL
- description: TEXT, NOT NULL
- pricepernight: DECIMAL, NOT NULL
- created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
- updated_at: TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP

### Booking Table
- booking_id: Primary Key, UUID, Indexed
- property_id: Foreign Key, references Property(property_id)
- user_id: Foreign Key, references User(user_id)
- start_date: DATE, NOT NULL
- end_date: DATE, NOT NULL
- status: ENUM (pending, confirmed, canceled), NOT NULL
- created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
- Note: total_price is now calculated at runtime

### Payment Table
- payment_id: Primary Key, UUID, Indexed
- booking_id: Foreign Key, references Booking(booking_id)
- amount: DECIMAL, NOT NULL
- payment_date: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
- payment_method: ENUM (credit_card, paypal, stripe), NOT NULL

### Review Table
- review_id: Primary Key, UUID, Indexed
- property_id: Foreign Key, references Property(property_id)
- user_id: Foreign Key, references User(user_id)
- rating: INTEGER, CHECK: rating >= 1 AND rating <= 5, NOT NULL
- comment: TEXT, NOT NULL
- created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

### Message Table
- message_id: Primary Key, UUID, Indexed
- sender_id: Foreign Key, references User(user_id)
- recipient_id: Foreign Key, references User(user_id)
- message_body: TEXT, NOT NULL
- sent_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

## Benefits of the Normalized Schema

1. **Eliminated Redundancy:** Creating a separate Location table eliminates the redundancy of storing the same location data multiple times.

2. **Improved Data Integrity:** Separating location data ensures that updates to addresses are consistent.

3. **Enhanced Query Capability:** Breaking down the location field into components allows for more precise querying.

4. **Removed Transitive Dependencies:** Making total_price a calculated field eliminates the transitive dependency in the Booking table.

5. **Future-Proofing:** The normalized structure better accommodates future changes to the data model.

## Conclusion

The normalization process has enhanced our database design by ensuring it adheres to 3NF principles. These changes lead to better data integrity, reduced redundancy, and improved maintainability.
