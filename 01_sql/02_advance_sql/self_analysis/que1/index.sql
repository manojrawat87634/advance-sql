create table users(
     id int primary key auto_increment,
    name text not null
);

create table orders(
     id int primary key auto_increment,
     user_id int not null,
    amount int  not null,
     created_at datetime default now(),
    foreign key(user_id) references users(id)
);


INSERT INTO users(name)
VALUES
('Alice'),
('Bob'),
('Charlie');

INSERT INTO orders(user_id, amount, created_at)
VALUES
(1, 200, '2025-01-01 10:00:00'),
(1, 500, '2025-01-04 14:30:00'),
(2, 100, '2025-01-02 09:15:00'),
(2, 300, '2025-01-08 16:20:00'),
(2, 600, '2025-01-10 11:45:00');