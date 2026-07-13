CREATE TABLE stock_data (
    id INT AUTO_INCREMENT PRIMARY KEY,
    trade_date DATE,
    symbol VARCHAR(20),
    series VARCHAR(10),
    prev_close DECIMAL(10,2),
    open_price DECIMAL(10,2),
    high_price DECIMAL(10,2),
    low_price DECIMAL(10,2),
    last_price DECIMAL(10,2),
    close_price DECIMAL(10,2),
    vwap DECIMAL(10,2), 
    volume BIGINT,
    turnover DOUBLE,
    trades BIGINT NULL,
    deliverable_volume BIGINT,
    deliverable_percent DECIMAL(6,4)
);