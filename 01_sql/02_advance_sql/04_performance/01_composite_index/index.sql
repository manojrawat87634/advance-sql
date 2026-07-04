-- ============================================
-- USERS
-- ============================================
CREATE TABLE users (
    user_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(255) UNIQUE NOT NULL,
    username VARCHAR(100) NOT NULL,
    city VARCHAR(100),
    country VARCHAR(100),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Login
CREATE UNIQUE INDEX idx_users_email
ON users(email);

-- Search users by city and newest first
CREATE INDEX idx_users_city_created
ON users(city, created_at);

-- ==========================================================
-- Common Queries
-- ==========================================================

SELECT *
FROM users
WHERE email = 'manoj@gmail.com';

SELECT *
FROM users
WHERE city = 'Delhi'
ORDER BY created_at DESC
LIMIT 20;



-- ============================================
-- USER SESSIONS
-- ============================================

CREATE TABLE sessions (
    session_id CHAR(36) PRIMARY KEY,
    user_id BIGINT NOT NULL,
    device_id VARCHAR(100),
    ip_address VARCHAR(50),
    created_at DATETIME,
    expires_at DATETIME,
    FOREIGN KEY(user_id)
    REFERENCES users(user_id)
);

-- Get latest sessions of one user
CREATE INDEX idx_sessions_user_created
ON sessions(user_id, created_at);

-- Delete expired sessions
CREATE INDEX idx_sessions_expiry
ON sessions(expires_at);

-- ==========================================================
-- Common Queries
-- ==========================================================

SELECT *
FROM sessions
WHERE user_id = 10
ORDER BY created_at DESC;

DELETE
FROM sessions
WHERE expires_at < NOW();

-- ============================================
-- USER PROFILE
-- ============================================

CREATE TABLE profiles (

    user_id BIGINT PRIMARY KEY,
    profession VARCHAR(100),
    country VARCHAR(100),
    age INT,

    FOREIGN KEY(user_id)
    REFERENCES users(user_id)

);

-- Search developers from India
CREATE INDEX idx_profiles_country_profession
ON profiles(country, profession);

-- ==========================================================
-- Common Queries
-- ==========================================================

SELECT *
FROM profiles
WHERE country='India'
AND profession='Developer';



-- ============================================
-- ORDERS
-- ============================================

CREATE TABLE orders (
    order_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    user_id BIGINT,
    status VARCHAR(30),
    total DECIMAL(10,2),
    created_at DATETIME,
    FOREIGN KEY(user_id)
    REFERENCES users(user_id)
);

-- Customer Order History
CREATE INDEX idx_orders_user_created
ON orders(user_id, created_at);

-- Admin Dashboard
CREATE INDEX idx_orders_status_created
ON orders(status, created_at);

-- ==========================================================
-- Common Queries
-- ==========================================================

SELECT *
FROM orders
WHERE user_id=10
ORDER BY created_at DESC;

SELECT *
FROM orders
WHERE status='PENDING'
ORDER BY created_at;


-- ============================================
-- PRODUCTS
-- ============================================

CREATE TABLE products (

    product_id BIGINT PRIMARY KEY AUTO_INCREMENT,

    category_id BIGINT,

    brand_id BIGINT,

    product_name VARCHAR(255),

    price DECIMAL(10,2),

    created_at DATETIME

);

-- Product Filtering
CREATE INDEX idx_products_category_brand_price
ON products(category_id, brand_id, price);

-- ==========================================================
-- Common Queries
-- ==========================================================

SELECT *
FROM products
WHERE category_id=2
AND brand_id=5
ORDER BY price;



-- ============================================
-- SHOPPING CART
-- ============================================

CREATE TABLE cart (

    cart_id BIGINT PRIMARY KEY AUTO_INCREMENT,

    user_id BIGINT,

    product_id BIGINT,

    quantity INT,

    added_at DATETIME,

    FOREIGN KEY(user_id)
    REFERENCES users(user_id),

    FOREIGN KEY(product_id)
    REFERENCES products(product_id)

);

CREATE INDEX idx_cart_user_added
ON cart(user_id, added_at);

-- ==========================================================
-- Common Queries
-- ==========================================================

SELECT *
FROM cart
WHERE user_id=10
ORDER BY added_at DESC;



-- ============================================
-- CHAT MESSAGES
-- ============================================

CREATE TABLE messages (

    message_id BIGINT PRIMARY KEY AUTO_INCREMENT,

    chat_id BIGINT,

    sender_id BIGINT,

    message TEXT,

    created_at DATETIME

);

CREATE INDEX idx_messages_chat_created
ON messages(chat_id, created_at);

-- ==========================================================
-- Common Queries
-- ==========================================================

SELECT *
FROM messages
WHERE chat_id=100
ORDER BY created_at;



-- ============================================
-- NOTIFICATIONS
-- ============================================

CREATE TABLE notifications (

    notification_id BIGINT PRIMARY KEY AUTO_INCREMENT,

    user_id BIGINT,

    is_read BOOLEAN,

    created_at DATETIME,

    FOREIGN KEY(user_id)
    REFERENCES users(user_id)

);

CREATE INDEX idx_notifications_user_read_created
ON notifications(user_id, is_read, created_at);

-- ==========================================================
-- Common Queries
-- ==========================================================

SELECT *
FROM notifications
WHERE user_id=10
AND is_read=FALSE
ORDER BY created_at DESC;



-- ============================================
-- BLOG POSTS
-- ============================================

CREATE TABLE posts (

    post_id BIGINT PRIMARY KEY AUTO_INCREMENT,

    author_id BIGINT,

    category VARCHAR(100),

    created_at DATETIME,

    title VARCHAR(255)

);

CREATE INDEX idx_posts_category_created
ON posts(category, created_at);

-- ==========================================================
-- Common Queries
-- ==========================================================

SELECT *
FROM posts
WHERE category='Technology'
ORDER BY created_at DESC;



-- ============================================
-- API KEYS
-- ============================================

CREATE TABLE api_keys (

    api_key_id BIGINT PRIMARY KEY AUTO_INCREMENT,

    user_id BIGINT,

    api_key VARCHAR(255),

    expires_at DATETIME,

    created_at DATETIME

);

CREATE UNIQUE INDEX idx_api_key
ON api_keys(api_key);

CREATE INDEX idx_api_key_expiry
ON api_keys(expires_at);

-- ==========================================================
-- Common Queries
-- ==========================================================

SELECT *
FROM api_keys
WHERE api_key='abc123';
DELETE
FROM api_keys
WHERE expires_at < NOW();