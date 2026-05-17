USE MEDIA_PLATFORM_DB;
INSERT INTO Plans (plan_id, plan_name, monthly_price) VALUES
(1, 'Mobile Basic', 199.00),
(2, 'Standard HD', 499.00),
(3, 'Premium 4K', 649.00);

INSERT INTO Genres (genre_id, genre_name) VALUES
(1, 'Sci-Fi'),
(2, 'Tech Documentary'),
(3, 'Action'),
(4, 'Thriller');

INSERT INTO Users (user_id, name, email, plan_id, join_date) VALUES
(1, 'Arjun Reddy', 'arjun.r@gmail.com', 3, '2023-11-01'),
(2, 'Priya Sharma', 'priya.s@yahoo.com', 1, '2024-01-15'),
(3, 'Rohan Desai', 'rohan.d@outlook.com', 2, '2024-02-20'),
(4, 'Kavya Singh', 'kavya.s@gmail.com', 3, '2024-03-10');

INSERT INTO Content (content_id, title, duration_minutes, genre_id) VALUES
(1, 'The Matrix Resurrections', 148, 1),
(2, 'Deepfake Detectives: The AI War', 95, 2),
(3, 'Mad Max: Fury Road', 120, 3),
(4, 'Inception', 148, 1),
(5, 'Silicon Valley: The Untold Story', 110, 2);

INSERT INTO Watch_History (watch_id, user_id, content_id, watch_date, minutes_watched) VALUES
(1, 1, 2, '2024-04-01', 95),  -- Arjun finished the documentary
(2, 1, 4, '2024-04-03', 45),  -- Arjun stopped Inception early
(3, 2, 3, '2024-04-05', 120), -- Priya finished Mad Max
(4, 3, 2, '2024-04-06', 95),  -- Rohan finished the documentary
(5, 3, 5, '2024-04-07', 30),  -- Rohan stopped Silicon Valley early
(6, 1, 1, '2024-04-10', 148); -- Arjun finished Matrix