create table users (
    user_id varchar(10) primary key,
    name varchar(50),
    email varchar(225) unique not null,
    gender enum("Male", "Other", "Female"),
    city varchar(225),
    signup_date date
);

create table products(
    product_id varchar(10) primary key,
    product_name varchar(225),
    category varchar(60),
    brand varchar(60),
    price decimal(10, 2),
    rating decimal(2, 1)
);

create table orders( 
    order_id varchar(10) primary key,
    user_id varchar(10),
    order_date date,
    order_status enum("processing", "completed", "cancelled", "returned", "shipped"),
    total_amount decimal(10, 2),
    foreign key(user_id) references users(user_id)
);

create table order_item(
    order_item_id varchar(10) primary key,
    order_id varchar(10),
    product_id varchar(10),
    user_id varchar(10),
    quantity int default 1,
    item_price decimal(10, 2),
    item_total decimal(10, 2),
    foreign key(user_id) references users(user_id),
    foreign key(product_id) references products(product_id),
    foreign key(order_id) references orders(order_id)
);

create table reviews(
    review_id varchar(10) primary key,
    order_id varchar(10),
    product_id varchar(10),
    user_id varchar(10),
    rating decimal(2, 1),
    review_text text,
    review_date date,
    foreign key(order_id) references orders(order_id),
    foreign key(user_id) references users(user_id),
    foreign key(product_id) references products(product_id)
);

create table events (
    event_id varchar(10) primary key,
    user_id varchar(10),
    product_id varchar(10),
    event_type ENUM(
'view',
'cart',
'wishlist',
'purchase',
'search'
),
    event_timestamp datetime default now(),
    foreign key(user_id) references users(user_id),
    foreign key(product_id) references products(product_id)
);

