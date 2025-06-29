-- AirBnB Database Schema


-- Drop tables if they exist to allow for clean recreation
DROP TABLE IF EXISTS message;
DROP TABLE IF EXISTS review;
DROP TABLE IF EXISTS payment;
DROP TABLE IF EXISTS booking;
DROP TABLE IF EXISTS property;
DROP TABLE IF EXISTS user;

-- Create User table
CREATE TABLE user (
    user_id CHAR(36) PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    phone_number VARCHAR(20),
    role ENUM('guest', 'host', 'admin') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Property table
CREATE TABLE property (
    property_id CHAR(36) PRIMARY KEY,
    host_id CHAR(36) NOT NULL,
    name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(255) NOT NULL,
    pricepernight DECIMAL(10, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (host_id) REFERENCES user(user_id) ON DELETE CASCADE
);

-- Create Booking table
CREATE TABLE booking (
    booking_id CHAR(36) PRIMARY KEY,
    property_id CHAR(36) NOT NULL,
    user_id CHAR(36) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (property_id) REFERENCES property(property_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES user(user_id) ON DELETE CASCADE
);

-- Create Payment table
CREATE TABLE payment (
    payment_id CHAR(36) PRIMARY KEY,
    booking_id CHAR(36) NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method ENUM('credit_card', 'paypal', 'stripe') NOT NULL,
    FOREIGN KEY (booking_id) REFERENCES booking(booking_id) ON DELETE CASCADE
);

-- Create Review table
CREATE TABLE review (
    review_id CHAR(36) PRIMARY KEY,
    property_id CHAR(36) NOT NULL,
    user_id CHAR(36) NOT NULL,
    rating INTEGER NOT NULL CHECK (rating >= 1 AND rating <= 5),
    comment TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (property_id) REFERENCES property(property_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES user(user_id) ON DELETE CASCADE
);

-- Create Message table
CREATE TABLE message (
    message_id CHAR(36) PRIMARY KEY,
    sender_id CHAR(36) NOT NULL,
    recipient_id CHAR(36) NOT NULL,
    message_body TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (sender_id) REFERENCES user(user_id) ON DELETE CASCADE,
    FOREIGN KEY (recipient_id) REFERENCES user(user_id) ON DELETE CASCADE
);

-- Create additional indexes for performance optimization
CREATE INDEX idx_user_email ON user(email);
CREATE INDEX idx_property_host ON property(host_id);
CREATE INDEX idx_booking_property ON booking(property_id);
CREATE INDEX idx_booking_user ON booking(user_id);
CREATE INDEX idx_payment_booking ON payment(booking_id);
CREATE INDEX idx_review_property ON review(property_id);
CREATE INDEX idx_review_user ON review(user_id);
CREATE INDEX idx_message_sender ON message(sender_id);
CREATE INDEX idx_message_recipient ON message(recipient_id);

-- Add constraints for date logic in bookings
ALTER TABLE booking
ADD CONSTRAINT check_booking_dates
CHECK (end_date >= start_date);

-- Add trigger to automatically generate UUIDs for new records
DELIMITER //
CREATE TRIGGER before_insert_user
BEFORE INSERT ON user
FOR EACH ROW
BEGIN
    IF NEW.user_id IS NULL THEN
        SET NEW.user_id = UUID();
    END IF;
END//

CREATE TRIGGER before_insert_property
BEFORE INSERT ON property
FOR EACH ROW
BEGIN
    IF NEW.property_id IS NULL THEN
        SET NEW.property_id = UUID();
    END IF;
END//

CREATE TRIGGER before_insert_booking
BEFORE INSERT ON booking
FOR EACH ROW
BEGIN
    IF NEW.booking_id IS NULL THEN
        SET NEW.booking_id = UUID();
    END IF;
END//

CREATE TRIGGER before_insert_payment
BEFORE INSERT ON payment
FOR EACH ROW
BEGIN
    IF NEW.payment_id IS NULL THEN
        SET NEW.payment_id = UUID();
    END IF;
END//

CREATE TRIGGER before_insert_review
BEFORE INSERT ON review
FOR EACH ROW
BEGIN
    IF NEW.review_id IS NULL THEN
        SET NEW.review_id = UUID();
    END IF;
END//

CREATE TRIGGER before_insert_message
BEFORE INSERT ON message
FOR EACH ROW
BEGIN
    IF NEW.message_id IS NULL THEN
        SET NEW.message_id = UUID();
    END IF;
END//
DELIMITER ;