
CREATE TABLE sales_data (
  ship_mode VARCHAR(20),
  sales FLOAT(10, 2),
  profit FLOAT(10, 2)
);

-- Insert the sample data
INSERT INTO sales_data
VALUES
  ('Same Day', 1000, 200),
  ('First Class', 1500, 300),
  ('Standard Class', 2000, 400),
  ('Second Class', 1200, 250),
  ('First Class', 1500, 300),
  ('Standard Class', 2000, 400),
  ('Second Class', 1200, 250),
  ('First Class', 1800, 350),
  ('Same Day', 900, 150),
  ('Second Class', 1100, 230),
  ('Standard Class', 2200, 450),
  ('Same Day', 950, 180),
  ('Standard Class', 2100, 430),
  ('First Class', 1700, 320),
  ('Same Day', 850, 130);

SELECT
  ship_mode,sales,profit,
  CASE
    WHEN ship_mode = 'Same Day' THEN 0.2
    WHEN ship_mode = 'First Class' THEN 0.1
    WHEN ship_mode = 'Standard Class' THEN 0.05
    ELSE 0
  END AS surcharge,
  (sales - profit) * (1 + 
    CASE
      WHEN ship_mode = 'Same Day' THEN 0.2
      WHEN ship_mode = 'First Class' THEN 0.1
      WHEN ship_mode = 'Standard Class' THEN 0.05
      ELSE 0
    END) AS total_cost
FROM sales_data;

