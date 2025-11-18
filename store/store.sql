-- Drop the table if it exists
DROP TABLE IF EXISTS game;

-- Create Game Table
CREATE TABLE game (
    game_id INT PRIMARY KEY,
    game_title VARCHAR(255) UNIQUE NOT NULL CHECK (game_title ~ '^[A-Za-z0-9 _\-:''\\]+$'),
    quantity INT NOT NULL CHECK(quantity > 0 AND quantity < 51),
    price DECIMAL(5, 2) NOT NULL CHECK(price > 10 AND price < 60)
);



-- Insert Sample Data into Game Table
\COPY game FROM './data/game.csv' WITH CSV HEADER;


DROP TABLE IF EXISTS action_figure;

CREATE TABLE action_figure (
    id INT PRIMARY KEY,
    action_figure_title VARCHAR UNIQUE,
    quantity INT CHECK(quantity >= 1 AND quantity <= 30),
    price DECIMAL(5,2) CHECK(price >= 10.00 AND price <= 100.00),
    CHECK(action_figure_title ~ '^(?:[A-Z][a-z]*(?:-[A-Z][a-z]*)*\s+)+\d+$')
);

\COPY action_figure FROM './data/action_figure.csv' WITH CSV HEADER;

-- INSERT INTO action_figure (id, action_figure_title, quantity, price)
-- VALUES (11, '2 yellow Person', -12, 300.00);
-- INSERT INTO action_figure (id, action_figure_title, quantity, price)
-- VALUES (12, 'Person Figure 4', 12, 30.00);

DROP TABLE IF EXISTS employee;

CREATE TABLE employee (
    id INT PRIMARY KEY,
    employee_name VARCHAR,
    position VARCHAR,
    salary DECIMAL(7,2),
    CHECK(employee_name ~ '^([A-Z][a-z]* [A-Z][a-z]*)*$'),
    CHECK(position IN ('Sales Associate', 'Store Manager', 'Inventory Clerk', 'Customer Service Representative', 'IT Specialist', 'Marketing Coordinator', 'Assistant Manager', 'Finance Analyst', 'Security Officer', 'HR Coordinator')),
    CHECK(salary >= 32000 AND salary < (31.25 * 40* 52))
);

\COPY employee FROM './data/employee.csv' WITH CSV HEADER;
-- --bad
-- INSERT INTO employee (id, employee_name, position, salary)
-- VALUES(11, 'Karen Miller', 'Inventory Clerk', 32000.01, );
-- --good
-- INSERT INTO employee (id, employee_name, position, salary)
-- VALUES(12, 'Mark Johnson', 'Store Manager', 50000);

DROP TABLE IF EXISTS poster;

CREATE TABLE poster (
    id INT PRIMARY KEY,
    poster_title VARCHAR,
    quantity INT,
    price DECIMAL(4,2),
    CHECK(poster_title ~ '^(?:[A-Z][A-Za-z]*(?:-[A-Z][a-z]*)*\s+)+\d+$'),
    CHECK(quantity >= 1 AND quantity <= 30),
    CHECK(price >= 6.00 AND price <= 20.00)
);

\COPY poster FROM './Data/poster.csv' WITH CSV HEADER;


INSERT INTO poster (id, poster_title, quantity, price)
VALUES(11, 'Super Hero Poster 3', 19, 19);

INSERT INTO poster (id, poster_title, quantity, price)
VALUES(12, 'Super Hero Poster 4', 15, 19 );