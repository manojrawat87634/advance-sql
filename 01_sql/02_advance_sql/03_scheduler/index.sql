CREATE TABLE users (
    user_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE inactive_users (
    user_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    deleted_at DATETIME
);

DELIMITER $$

CREATE TRIGGER move_user_to_inactive
BEFORE DELETE ON users
FOR EACH ROW
BEGIN
    INSERT INTO inactive_users (
        user_id,
        name,
        email,
        deleted_at
    )
    VALUES (
        OLD.user_id,
        OLD.name,
        OLD.email,
        NOW()
    );
END$$

DELIMITER ;