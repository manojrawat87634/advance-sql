CREATE TABLE users (
    id BIGINT NOT NULL,
    name VARCHAR(100),
    country_code VARCHAR(3) NOT NULL,
    PRIMARY KEY (id, country_code)
)

PARTITION BY LIST COLUMNS(country_code) (
    PARTITION p_north_america VALUES IN ('USA', 'CAN', 'MEX'),
    PARTITION p_europe VALUES IN ('GBR', 'FRA', 'DEU', 'ESP'),
    PARTITION p_asia VALUES IN ('IND', 'JPN', 'CHN'),
    PARTITION p_others VALUES IN ('AUS', 'ZAF')
);