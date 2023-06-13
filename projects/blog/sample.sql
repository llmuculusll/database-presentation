INSERT INTO users (username, email, password)
VALUES
  ('user1', 'user1@example.com', 'password1'),
  ('user2', 'user2@example.com', 'password2'),
  ('user3', 'user3@example.com', 'password3'),
  ('user4', 'user4@example.com', 'password4'),
  ('user5', 'user5@example.com', 'password5'),
  ('user6', 'user6@example.com', 'password6'),
  ('user7', 'user7@example.com', 'password7'),
  ('user8', 'user8@example.com', 'password8'),
  ('user9', 'user9@example.com', 'password9'),
  ('user10', 'user10@example.com', 'password10');
INSERT INTO users (username, email, password)
VALUES
  ('user1', 'user1@example.com', 'password1'),
  ('user2', 'user2@example.com', 'password2'),
  ('user3', 'user3@example.com', 'password3'),
  ('user4', 'user4@example.com', 'password4'),
  ('user5', 'user5@example.com', 'password5'),
  ('user6', 'user6@example.com', 'password6'),
  ('user7', 'user7@example.com', 'password7'),
  ('user8', 'user8@example.com', 'password8'),
  ('user9', 'user9@example.com', 'password9'),
  ('user10', 'user10@example.com', 'password10');


INSERT INTO categories (name, parent_id, path)
VALUES
  ('Category 1', NULL, '/1'),
  ('Category 2', NULL, '/2'),
  ('Category 3', NULL, '/3'),
  ('Subcategory 1', 1, '/1/4'),
  ('Subcategory 2', 1, '/1/5'),
  ('Subcategory 3', 2, '/2/6'),
  ('Subcategory 4', 2, '/2/7'),
  ('Subcategory 5', 3, '/3/8'),
  ('Subcategory 6', 3, '/3/9'),
  ('Subcategory 7', 3, '/3/10');


INSERT INTO blog_posts (title, content, category_id, user_id, created_at, updated_at)
VALUES
  ('Blog Post 1', 'Content for Blog Post 1', 1, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
  ('Blog Post 2', 'Content for Blog Post 2', 2, 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
  ('Blog Post 3', 'Content for Blog Post 3', 3, 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
  ('Blog Post 4', 'Content for Blog Post 4', 1, 4, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
  ('Blog Post 5', 'Content for Blog Post 5', 2, 5, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
  ('Blog Post 6', 'Content for Blog Post 6', 3, 6, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
  ('Blog Post 7', 'Content for Blog Post 7', 1, 7, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
  ('Blog Post 8', 'Content for Blog Post 8', 2, 8, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
  ('Blog Post 9', 'Content for Blog Post 9', 3, 9, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
  ('Blog Post 10', 'Content for Blog Post 10', 1, 10, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);


INSERT INTO comments (content, parent_id, blog_post_id, user_id)
VALUES
  ('Comment 1', NULL, 1, 1),
  ('Comment 2', NULL, 1, 2),
  ('Comment 3', NULL, 2, 3),
  ('Reply to Comment 1', 1, 1, 4),
  ('Reply to Comment 1', 1, 1, 5),
  ('Reply to Comment 2', 2, 1, 6),
  ('Comment 4', NULL, 2, 7),
  ('Comment 5', NULL, 3, 8),
  ('Comment 6', NULL, 3, 9),
  ('Comment 7', NULL, 3, 10);


INSERT INTO menus (name, parent_id, left_val, right_val)
VALUES
  ('Menu 1', NULL, 1, 2),
  ('Menu 2', NULL, 3, 4),
  ('Submenu 1', 1, 5, 6),
  ('Submenu 2', 1, 7, 8),
  ('Submenu 3', 2, 9, 10),
  ('Submenu 4', 2, 11, 12),
  ('Submenu 5', 3, 13, 14),
  ('Submenu 6', 3, 15, 16),
  ('Submenu 7', 3, 17, 18),
  ('Submenu 8', 4, 19, 20);


-- Inserting tags
INSERT INTO tags (name) VALUES
  ('Tag 1'),
  ('Tag 2'),
  ('Tag 3'),
  ('Tag 4'),
  ('Tag 5'),
  ('Tag 6'),
  ('Tag 7'),
  ('Tag 8'),
  ('Tag 9'),
  ('Tag 10'),
  ('Tag 11'),
  ('Tag 12'),
  ('Tag 13'),
  ('Tag 14'),
  ('Tag 15'),
  ('Tag 16'),
  ('Tag 17'),
  ('Tag 18'),
  ('Tag 19'),
  ('Tag 20');

-- Inserting post_tags
INSERT INTO post_tags (blog_post_id, tag_id) VALUES
  (1, 1),
  (1, 2),
  (2, 3),
  (2, 4),
  (3, 5),
  (3, 6),
  (4, 7),
  (5, 8),
  (6, 9),
  (7, 10);