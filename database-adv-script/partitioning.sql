-- Partition the Booking table by RANGE on start_date

-- 1. Remove existing partitions if any (for fresh setup) in case the table was previously partitioned
-- ALTER TABLE booking REMOVE PARTITIONING;

-- 2. Partition by year (change the years as needed for your data)
ALTER TABLE booking
PARTITION BY RANGE (YEAR(start_date)) (
    PARTITION p2022 VALUES LESS THAN (2023),
    PARTITION p2023 VALUES LESS THAN (2024),
    PARTITION p2024 VALUES LESS THAN (2025),
    PARTITION p2025 VALUES LESS THAN (2026),
    PARTITION pmax  VALUES LESS THAN MAXVALUE
);

-- 3. Example: Test performance on partitioned table
EXPLAIN ANALYZE
SELECT * FROM booking
WHERE start_date >= '2024-01-01' AND start_date < '2025-01-01';

