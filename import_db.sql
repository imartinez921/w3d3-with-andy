pragma foreign_keys = on;

-- CREATE TABLE users (
--   id INTEGER PRIMARY KEY,
--   fname TEXT NOT NULL,
--   lname TEXT NOT NULL,
-- );

-- CREATE TABLE questions (
--   id INTEGER PRIMARY KEY, 
--   title TEXT, 
--   body TEXT NOT NULL,
--   associated_author INTEGER NOT NULL, -- this is a users.id

--     FOREIGN KEY (associated_author) REFERENCES users(id)
-- );

-- -- CREATE TABLE question_follows(
-- --   id INTEGER PRIMARY KEY,
-- --   (SELECT * FROM users JOIN questions ON questions.id = users.id)
-- -- );

-- CREATE TABLE replies(
--   id INTEGER PRIMARY KEY,
--   question_id INTEGER NOT NULL, -- this should be a questions.id
--   parent_reply INTEGER, -- this should be another replies.id
--   user_id INTEGER NOT NULL, -- this should be a users.id
--   body TEXT NOT NULL,

--     FOREIGN KEY (parent_reply) REFERENCES replies(id),
--     FOREIGN KEY (question_id) REFERENCES questions(id),
--     FOREIGN KEY (user_id) REFERENCES users(id),
-- );

-- CREATE TABLE questions_likes(
--   id INTEGER PRIMARY KEY,
--   user_id INTEGER NOT NULL,
--   question_id INTEGER,
    
--     FOREIGN KEY (user_id) REFERENCES users(id), -- this is the user who Liked it
--     FOREIGN KEY (question_id) REFERENCES questions(id),
-- );


-- INSERT INTO
--   users (fname,lname)
-- VALUES 
--   ('rini', 'martinez'),
--   ('andy', 'liu');

-- INSERT INTO
--   questions (title, body, associated_author)
-- VALUES
--   ('projectwork', 'Why are we doing this?', 1); --(SELECT id FROM users WHERE associated_author = users.id))

-- INSERT INTO
--   replies (question_id, parent_reply, user_id, body)
-- VALUES
--   (1,null,1,'What''s going on?');

--   -- ((SELECT id FROM questions WHERE question_id = questions.id),
--   -- (SELECT id from replies WHERE parent_reply = replies.id),
--   -- (SELECT id from users WHERE user_id = users.id),
--   -- 'We still have no idea.'
--   -- );

-- INSERT INTO
--   questions_likes (user_id, question_id)
-- VALUES
--   (1,1);
--   -- ((SELECT id FROM users WHERE user_id = users.id),
--   --   (SELECT id FROM questions WHERE question_id = questions.id)
--   -- )




