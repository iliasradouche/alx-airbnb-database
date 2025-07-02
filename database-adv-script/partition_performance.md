# Partitioning Performance Report

## Partitioning Strategy

The `booking` table was partitioned by year on the `start_date` column using MySQL's `RANGE` partitioning. This allows queries that filter by date range to only scan relevant partitions, improving performance for historical or time-based queries.

## Performance Testing

A typical query tested:
```sql
SELECT * FROM booking
WHERE start_date >= '2024-01-01' AND start_date < '2025-01-01';
```

### Before Partitioning

- The query scanned the entire `booking` table, resulting in high I/O and slower response times, especially as the table grew larger.

### After Partitioning

- The query used **partition pruning** and only scanned the relevant partition for the year 2024.
- `EXPLAIN ANALYZE` showed fewer rows scanned, lower cost, and much faster execution time.

## Observed Improvements

- **Faster queries** for date-ranged data, especially when filtering for specific years or periods.
- **Reduced I/O**, as only one partition (instead of the whole table) is scanned.
- **Scalability**: As more data is added each year, queries remain efficient.

## Recommendation

Partitioning large tables like `booking` by date is highly effective for optimizing query performance on time-based data. For best results, adjust partition ranges based on your actual data distribution and usage patterns.