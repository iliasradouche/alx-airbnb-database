# Index Performance Analysis

## Identified High-Usage Columns

Based on common query patterns (WHERE, JOIN, ORDER BY), the following columns were identified as high-usage and indexed:

- **user.email:** Used for login/authentication.
- **user.role:** Often filtered in admin/user queries.
- **booking.user_id:** Used for joining with users and filtering bookings by user.
- **booking.property_id:** Used for joining with properties and filtering bookings by property.
- **booking.status:** Used in filtering bookings by their status.
- **property.host_id:** Used for finding all properties of a host.
- **property.location:** Frequently used in property search queries.

## Example: Measuring Performance with EXPLAIN

### Before Adding Indexes

```sql
EXPLAIN SELECT * FROM booking WHERE user_id = 'some-user-uuid';
```

- **Result:** Table scan, higher cost, slower for large datasets.

### After Adding Indexes

```sql
CREATE INDEX idx_booking_user ON booking(user_id);
EXPLAIN SELECT * FROM booking WHERE user_id = 'some-user-uuid';
```

- **Result:** Uses the `idx_booking_user` index, lower cost, much faster for large datasets.

### Sample Output (MySQL)

| id | select_type | table   | type  | possible_keys     | key              | rows | Extra       |
|----|-------------|---------|-------|-------------------|------------------|------|-------------|
|  1 | SIMPLE      | booking | ref   | idx_booking_user  | idx_booking_user |    1 | Using where |

## Conclusion

Adding indexes on high-usage columns significantly improves query performance for large datasets, reducing table scan operations and allowing for quick lookups, especially on columns used in JOIN, WHERE, and ORDER BY clauses.