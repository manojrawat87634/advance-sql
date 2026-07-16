# How to create secondary index
CREATE INDEX idx_users_email ON users (email);

# -- This duplicates the 'username' column directly onto the index disk space,
# -- preventing the database from making a second network jump to the primary table node.
CREATE INDEX idx_users_email_fast ON users (email) STORING (username);

EXPLAIN SELECT username FROM users WHERE email = '1@gmail.com';