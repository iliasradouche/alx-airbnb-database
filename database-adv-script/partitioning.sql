-- Partition the Booking table by RANGE on start_date

-- 1. Remove existing partitions if any (for fresh setup) in case the table was previously partitioned
-- ALTER TABLE booking REMOVE PARTITIONING;

-- 2. Create a partitioned Booking table based on the start_date column (MySQL example)

CREATE TABLE booking_partitioned (
    booking_id        INT PRIMARY KEY,
    user_id           INT NOT NULL,
    property_id       INT NOT NULL,
    start_date        DATE NOT NULL,
    end_date          DATE,
    total_price       DECIMAL(10,2),
    status            VARCHAR(50),
    created_at        DATETIME,
    updated_at        DATETIME
    -- Add any other necessary columns from your original booking table
)
PARTITION BY RANGE (YEAR(start_date)) (
    PARTITION p2022 VALUES LESS THAN (2023),
    PARTITION p2023 VALUES LESS THAN (2024),
    PARTITION p2024 VALUES LESS THAN (2025),
    PARTITION pmax  VALUES LESS THAN MAXVALUE
);

-- Test performance on the partitioned table
EXPLAIN ANALYZE
SELECT * FROM booking_partitioned
WHERE start_date >= '2024-01-01' AND start_date < '2025-01-01';

-- 3. Partition by year (change the years as needed for your data)
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

