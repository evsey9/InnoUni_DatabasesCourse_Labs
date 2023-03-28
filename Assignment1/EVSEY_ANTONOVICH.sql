-- Query 1
CREATE INDEX IF NOT EXISTS idx_rental_customer_inventory ON rental (customer_id, inventory_id);
CREATE INDEX IF NOT EXISTS idx_inventory_film ON inventory (film_id);
CREATE INDEX IF NOT EXISTS idx_customer_first_name ON customer (first_name);
CREATE INDEX IF NOT EXISTS idx_payment_rental ON payment USING hash (rental_id);

-- Query 2
CREATE INDEX IF NOT EXISTS idx_rental_customer_rental_date
ON rental (customer_id, rental_date)
WHERE (rental_date >= '2023-01-01')
AND (rental_date < '2023-02-01');

CREATE INDEX IF NOT EXISTS idx_rental_inventory_rental_date
ON rental (inventory_id, rental_date)
WHERE (rental_date >= '2023-01-01')
AND (rental_date < '2023-02-01');

-- Query 3
CREATE INDEX IF NOT EXISTS idx_rental_last_update_customer_id_active
ON rental (last_update DESC, customer_id);

-- Query 4
CREATE INDEX IF NOT EXISTS idx_film_rental_rate_length ON film (rental_rate DESC, length ASC)
    WHERE (rating = 'G' OR rating = 'PG') AND (language_id = 1);
