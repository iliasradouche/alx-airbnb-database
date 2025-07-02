# Database Performance Monitoring & Refinement

## Monitoring Tools Used

- **EXPLAIN ANALYZE**: Used to examine query execution plans and measure performance.
- **SHOW PROFILE** (if supported): Used to get detailed breakdown of query execution phases.

---

## 1. Frequently Used Queries Monitored

### a) Fetch bookings for a user
```sql
EXPLAIN ANALYZE
SELECT * FROM booking WHERE user_id = 1234;
```

### b) List bookings for a property within a date range
```sql
EXPLAIN ANALYZE
SELECT * FROM booking 
WHERE property_id = 42 AND start_date BETWEEN '2025-01-01' AND '2025-01-31';
```

### c) Aggregate bookings per property for ranking
```sql
EXPLAIN ANALYZE
SELECT property_id, COUNT(*) AS total
FROM booking
GROUP BY property_id
ORDER BY total DESC;
```

---

## 2. Bottlenecks Identified

- Full table scans observed in queries filtering by `user_id` and `property_id`.
- Slow aggregation in the ranking query due to missing indexes on `property_id`.
- For large date-range queries, the absence of partitioning or indexes led to high I/O.

---

## 3. Schema Adjustments & Indexes Implemented

### Indexes Added

```sql
-- For user-based lookup
CREATE INDEX idx_booking_user_id ON booking(user_id);

-- For property-based lookup and aggregations
CREATE INDEX idx_booking_property_id ON booking(property_id);

-- For date-range queries (can also help with partition pruning)
CREATE INDEX idx_booking_start_date ON booking(start_date);
```

### Partitioning

- The `booking` table was partitioned by year on the `start_date` column, greatly accelerating date-based queries.

---

## 4. Post-Adjustment Performance

### a) User Bookings
- **Before:** Full table scan, high cost.
- **After:** Index scan using `idx_booking_user_id`, much lower cost and latency.

### b) Property Bookings by Date
- **Before:** Full scan or partial scan, slow for large tables.
- **After:** Index scan + partition pruning, fast response even on large tables.

### c) Aggregation per Property
- **Before:** Expensive group-by over all rows.
- **After:** Uses `idx_booking_property_id`, dramatically improved.

---

## 5. Recommendations for Ongoing Monitoring

- Regularly review slow query logs.
- Use `EXPLAIN ANALYZE` before and after any schema changes.
- Periodically run `SHOW PROFILE` (if supported) on complex queries.
- Monitor index usage and drop unused indexes to save space and reduce write overhead.
- Consider further partitioning or table sharding if data volume grows significantly.

---

**Conclusion:**  
Continuous monitoring with EXPLAIN/SHOW PROFILE and targeted indexing/partitioning yields measurable, significant improvements in query performance and database scalability.