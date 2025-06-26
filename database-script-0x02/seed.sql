
-- Users data (10 users: 5 guests, 4 hosts, 1 admin)
INSERT INTO user (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at) VALUES
('a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'John', 'Doe', 'john.doe@example.com', '$2a$12$1InE4AoCGUFkfbWxxZ7O9.jCJ7tIe2hfANNkkRZ1vfxHLVlcU4NpW', '+14155552671', 'guest', '2024-01-15 10:00:00'),
('a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'Jane', 'Smith', 'jane.smith@example.com', '$2a$12$3S7tyDpVxmOT4hpHH/nbSO5qnZ7lyZ1KE3txPvTVf345Asdf9WrNu', '+14155552672', 'host', '2024-01-20 11:15:00'),
('a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13', 'Robert', 'Johnson', 'robert.j@example.com', '$2a$12$QKaZ2wUkEOTREmI6jWLVAO1sBiX92hq5s9Nt4iCE4yCZnpo5z7z9q', '+14155552673', 'guest', '2024-01-25 09:30:00'),
('a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14', 'Maria', 'Garcia', 'maria.g@example.com', '$2a$12$yv7kJwMGR8cDNcUvXe7A5uQBSVlLd9Q7mCdKZypN0IeKP8vR2RAE2', '+14155552674', 'host', '2024-02-01 14:45:00'),
('a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15', 'David', 'Brown', 'david.b@example.com', '$2a$12$a6dJ7GwqZY0YoZf9kS1S0etTF9BFXFJr6mS4VsOD/qoKTFsZb5k/W', '+14155552675', 'guest', '2024-02-05 16:20:00'),
('a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16', 'Linda', 'Wilson', 'linda.w@example.com', '$2a$12$Byr9XgXrBX1AS5wYyTJr4OK5hoD8kWM5FJZsXpG97Lfn0QNwOyQrK', '+14155552676', 'host', '2024-02-10 10:10:00'),
('a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a17', 'Michael', 'Taylor', 'michael.t@example.com', '$2a$12$f9dJ2bQTVhsZ5f4kISpDKu7XRWGmfNHNzEMFCJcjr1ZJmky9vbZe2', '+14155552677', 'guest', '2024-02-15 11:30:00'),
('a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a18', 'Sarah', 'Anderson', 'sarah.a@example.com', '$2a$12$Oy2pFwTg.QkzBvvKBEmVS.qXCxZP6JI0lYpKvDjVnBY2WoDhBUe8.', '+14155552678', 'host', '2024-02-20 13:45:00'),
('a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a19', 'James', 'Thomas', 'james.t@example.com', '$2a$12$F4C3.5i2oYdSJ5wqWEBXBOS.9yYJp.TQGpjYE5P8qoaXEJUvpfM9G', '+14155552679', 'guest', '2024-02-25 15:15:00'),
('a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a20', 'Admin', 'User', 'admin@airbnb.example', '$2a$12$J0i2ZBGnxmXG7Lr3ZKDZ0eBqA6pOSbT.FJrxEq4tYI1nfkH6xUPXC', '+14155552680', 'admin', '2024-01-01 09:00:00');

-- Properties data (8 properties from 4 hosts)
INSERT INTO property (property_id, host_id, name, description, location, pricepernight, created_at, updated_at) VALUES
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a21', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'Cozy Downtown Apartment', 'Charming 1-bedroom apartment in the heart of downtown.', '123 Main St, San Francisco, CA 94105', 120.00, '2024-01-22 10:30:00', '2024-01-22 10:30:00'),
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a22', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'Modern Loft with City View', 'Spacious loft with panoramic views of the skyline.', '456 Market St, San Francisco, CA 94105', 180.00, '2024-01-23 11:45:00', '2024-01-23 11:45:00'),
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a23', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14', 'Beachfront Villa', 'Luxurious villa steps away from the beach.', '789 Ocean Dr, Miami, FL 33139', 350.00, '2024-02-03 15:00:00', '2024-02-03 15:00:00'),
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a24', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14', 'Rustic Mountain Cabin', 'Cozy cabin surrounded by nature and hiking trails.', '101 Pine Rd, Aspen, CO 81611', 200.00, '2024-02-04 16:15:00', '2024-02-04 16:15:00'),
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a25', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16', 'Historic Brownstone', 'Elegant brownstone in a quiet, historic neighborhood.', '202 Beacon St, Boston, MA 02116', 230.00, '2024-02-12 10:30:00', '2024-02-12 10:30:00'),
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a26', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16', 'Urban Micro Studio', 'Compact and efficient studio in a prime location.', '303 Madison Ave, New York, NY 10017', 100.00, '2024-02-13 11:45:00', '2024-02-13 11:45:00'),
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a27', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a18', 'Desert Retreat', 'Peaceful adobe home with stunning desert views.', '404 Cactus Way, Sedona, AZ 86336', 150.00, '2024-02-22 14:00:00', '2024-02-22 14:00:00'),
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a28', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a18', 'Lakeside Cottage', 'Charming cottage with private dock and lake access.', '505 Shore Dr, Lake Tahoe, CA 96150', 275.00, '2024-02-23 15:15:00', '2024-02-23 15:15:00');

-- Bookings data (12 bookings)
INSERT INTO booking (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at) VALUES
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380a31', 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a21', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', '2024-03-10', '2024-03-15', 600.00, 'confirmed', '2024-02-15 09:00:00'),
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380a32', 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a23', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13', '2024-03-20', '2024-03-27', 2450.00, 'confirmed', '2024-02-20 10:15:00'),
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380a33', 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a25', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15', '2024-04-05', '2024-04-10', 1150.00, 'confirmed', '2024-03-01 11:30:00'),
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380a34', 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a27', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a17', '2024-04-15', '2024-04-20', 750.00, 'confirmed', '2024-03-05 12:45:00'),
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380a35', 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a22', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a19', '2024-04-25', '2024-04-30', 900.00, 'confirmed', '2024-03-10 14:00:00'),
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380a36', 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a24', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', '2024-05-05', '2024-05-12', 1400.00, 'pending', '2024-03-15 15:15:00'),
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380a37', 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a26', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13', '2024-05-15', '2024-05-18', 300.00, 'confirmed', '2024-03-20 16:30:00'),
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380a38', 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a28', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15', '2024-05-25', '2024-06-01', 1925.00, 'pending', '2024-03-25 09:45:00'),
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380a39', 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a21', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a17', '2024-03-01', '2024-03-05', 480.00, 'completed', '2024-01-25 11:00:00'),
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380a40', 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a23', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a19', '2024-03-01', '2024-03-08', 2450.00, 'completed', '2024-01-30 12:15:00'),
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380a41', 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a25', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', '2024-02-15', '2024-02-20', 1150.00, 'canceled', '2024-01-15 13:30:00'),
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380a42', 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a27', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13', '2024-02-20', '2024-02-25', 750.00, 'completed', '2024-01-20 14:45:00');

-- Payments data (10 payments for confirmed and completed bookings)
INSERT INTO payment (payment_id, booking_id, amount, payment_date, payment_method) VALUES
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd380a51', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380a31', 600.00, '2024-02-15 09:30:00', 'credit_card'),
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd380a52', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380a32', 2450.00, '2024-02-20 10:45:00', 'paypal'),
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd380a53', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380a33', 1150.00, '2024-03-01 12:00:00', 'credit_card'),
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd380a54', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380a34', 750.00, '2024-03-05 13:15:00', 'stripe'),
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd380a55', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380a35', 900.00, '2024-03-10 14:30:00', 'credit_card'),
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd380a56', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380a37', 300.00, '2024-03-20 17:00:00', 'paypal'),
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd380a57', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380a39', 480.00, '2024-01-25 11:30:00', 'credit_card'),
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd380a58', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380a40', 2450.00, '2024-01-30 12:45:00', 'stripe'),
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd380a59', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380a42', 750.00, '2024-01-20 15:15:00', 'credit_card');

-- Reviews data (6 reviews for completed stays)
INSERT INTO review (review_id, property_id, user_id, rating, comment, created_at) VALUES
('e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a61', 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a21', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a17', 5, 'Beautiful apartment in a perfect location. Very clean and had everything we needed.', '2024-03-06 10:00:00'),
('e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a62', 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a23', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a19', 4, 'Amazing views and great amenities. The beach access was convenient. Would stay again.', '2024-03-09 11:15:00'),
('e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a63', 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a27', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13', 5, 'The desert retreat was exactly what we needed. Peaceful, beautiful, and comfortable.', '2024-02-26 12:30:00'),
('e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a64', 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a21', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 3, 'Good location but a bit noisy at night. The apartment was clean though.', '2024-03-16 13:45:00'),
('e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a65', 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a23', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13', 5, 'Luxurious beachfront property with outstanding service. We had a wonderful week!', '2024-03-28 15:00:00'),
('e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a66', 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a25', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15', 4, 'Loved the historic charm of this place. Great neighborhood with lots to explore.', '2024-04-11 16:15:00');

-- Messages data (8 conversations between users)
INSERT INTO message (message_id, sender_id, recipient_id, message_body, sent_at) VALUES
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a71', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'Hi, I have a question about your Cozy Downtown Apartment. Is parking available?', '2024-02-14 09:00:00'),
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a72', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'Hello! There is street parking available, and a paid garage one block away.', '2024-02-14 09:30:00'),
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a73', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14', 'Is the beach at your property good for swimming?', '2024-02-19 10:45:00'),
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a74', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13', 'Yes, the beach is excellent for swimming! The water is clear and usually calm in the mornings.', '2024-02-19 11:15:00'),
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a75', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16', 'Do you allow pets at the Historic Brownstone?', '2024-02-28 12:30:00'),
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a76', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15', 'Im sorry, but we dont allow pets due to allergies of other guests.', '2024-02-28 13:00:00'),
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a77', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a17', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a18', 'What hiking trails are near the Lakeside Cottage?', '2024-03-04 14:15:00'),
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a78', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a18', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a17', 'There are several great trails within a 10-minute drive. I will leave a guidebook at the cottage with maps and recommendations!', '2024-03-04 14:45:00');