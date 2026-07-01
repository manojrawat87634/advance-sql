CREATE TABLE users (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(200) NOT NULL UNIQUE,
    phone VARCHAR(20) NOT NULL UNIQUE,
    role ENUM('student','faculty','admin'),
    created_at DATETIME DEFAULT NOW()
);

create table courses
 ( id bigint primary key auto_increment, name varchar(200) not null unique);


CREATE TABLE course_pricing (
    id bigint PRIMARY KEY AUTO_INCREMENT,
    course_id bigint,
    price DECIMAL(10,2),
    currency VARCHAR(10),
    valid_from DATETIME,
    valid_to DATETIME,
    FOREIGN KEY (course_id) REFERENCES courses(id)
);


CREATE TABLE modules (
    id bigint PRIMARY KEY AUTO_INCREMENT,
    module_name VARCHAR(100)
);


CREATE TABLE course_modules (
    course_id BIGINT,
    module_id BIGINT,
    total_classes INT,   -- 🔥 THIS IS WHAT YOU NEED
    PRIMARY KEY (course_id, module_id),
    FOREIGN KEY (course_id) REFERENCES courses(id),
    FOREIGN KEY (module_id) REFERENCES modules(id)
);


CREATE TABLE enrollments (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    user_id BIGINT,
    course_id BIGINT,
    enrolled_at DATETIME DEFAULT NOW(),

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (course_id) REFERENCES courses(id)
);


CREATE TABLE batches (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    course_id BIGINT,
    name VARCHAR(100),

    FOREIGN KEY (course_id) REFERENCES courses(id)
);


CREATE TABLE batch_students (
    batch_id BIGINT,
    user_id BIGINT,
    PRIMARY KEY (batch_id, user_id),
    FOREIGN KEY (batch_id) REFERENCES batches(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE batch_schedule (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    batch_id BIGINT,
    module_id BIGINT,
    user_id bigint,
    day_of_week ENUM('Mon','Tue','Wed','Thu','Fri','Sat','Sun'),
    start_time TIME,
    end_time TIME,
    FOREIGN KEY (batch_id) REFERENCES batches(id),
    FOREIGN KEY (module_id) REFERENCES modules(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE classes (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    batch_id BIGINT,
    module_id BIGINT,
    faculty_id BIGINT,
    class_date DATE,
    start_time TIME,
    end_time TIME,
    status ENUM('scheduled','completed','cancelled') DEFAULT 'scheduled',

    FOREIGN KEY (batch_id) REFERENCES batches(id),
    FOREIGN KEY (module_id) REFERENCES modules(id),
    FOREIGN KEY (faculty_id) REFERENCES users(id)
);