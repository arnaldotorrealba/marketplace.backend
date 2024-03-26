CREATE DATABASE marketplace;

-- ***** users table *****

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username VARCHAR(25) NOT NULL UNIQUE,
  name VARCHAR(50) NOT NULL,
  lastname VARCHAR(50) NOT NULL,
  phonenumber VARCHAR(50),
  email VARCHAR(100) NOT NULL UNIQUE,
  password VARCHAR(200) NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMP NOT NULL DEFAULT NOW()
);

-- ***** add trigger for users table *****

CREATE FUNCTION update_updated_at_users()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW;
END;
$$ language 'plpgsql';

CREATE TRIGGER update_users_updated_at
    BEFORE UPDATE
    ON
        users
    FOR EACH ROW
EXECUTE PROCEDURE update_updated_at_users();

-- ***** addresses table *****

CREATE TABLE addresses (
  id SERIAL PRIMARY KEY,
  user_id INT REFERENCES users(id),
  street VARCHAR(100) NOT NULL,
  city VARCHAR(50) NOT NULL,
  state VARCHAR(50) NOT NULL,
  country VARCHAR(50) NOT NULL,
  postal_code VARCHAR(20) NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMP NOT NULL DEFAULT NOW()
);

-- ***** add trigger for addresses table *****

CREATE FUNCTION update_updated_at_addresses()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW;
END;
$$ language 'plpgsql';

CREATE TRIGGER update_users_updated_at
    BEFORE UPDATE
    ON
        addresses
    FOR EACH ROW
EXECUTE PROCEDURE update_updated_at_addresses();

-- ***** products table *****

CREATE TABLE products (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL UNIQUE,
  description TEXT,
  price NUMERIC(10, 2) NOT NULL,  -- Up to 10 digits total, with 2 of them after the decimal point.
  stock_quantity INT NOT NULL,
  img_url VARCHAR(255), 
  average_rating DECIMAL(2, 1),   -- Decimal for the average of the ratings
  total_ratings INT DEFAULT 0;    -- Number of reviews
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMP NOT NULL DEFAULT NOW()
);

-- ***** add trigger for products table *****

CREATE FUNCTION update_updated_at_products()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW;
END;
$$ language 'plpgsql';

CREATE TRIGGER update_users_updated_at
    BEFORE UPDATE
    ON
        products
    FOR EACH ROW
EXECUTE PROCEDURE update_updated_at_products();

-- ***** comments table *****

CREATE TABLE comments (
  id SERIAL PRIMARY KEY,
  product_id INT REFERENCES products(id),
  user_id INT REFERENCES users(id),
  comment TEXT,
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMP NOT NULL DEFAULT NOW()
);

-- ***** add trigger for comments table *****

CREATE FUNCTION update_updated_at_comments()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW;
END;
$$ language 'plpgsql';

CREATE TRIGGER update_users_updated_at
    BEFORE UPDATE
    ON
        comments
    FOR EACH ROW
EXECUTE PROCEDURE update_updated_at_comments();

-- ***** categories table ***** -- 👀 DEBERÍA AGREGAR TRIGGER?

CREATE TABLE categories (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL UNIQUE
);

-- ***** product_categories intermediate table *****

CREATE TABLE product_categories (
  product_id INT REFERENCES products(id),
  category_id INT REFERENCES categories(id),
  PRIMARY KEY (product_id, category_id) -- Ensure there are no duplicate product and category combinations
);

-- ***** orders table *****

CREATE TABLE orders (
  id SERIAL PRIMARY KEY,
  user_id INT REFERENCES users(id),
  address_id INT REFERENCES addresses(id),
  total_quantity INT NOT NULL,
  total_amount NUMERIC(10, 2) NOT NULL, -- Up to 10 digits total, with 2 of them after the decimal point.
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMP NOT NULL DEFAULT NOW()
);

-- ***** add trigger for orders table *****

CREATE FUNCTION update_updated_at_orders()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW;
END;
$$ language 'plpgsql';

CREATE TRIGGER update_users_updated_at
    BEFORE UPDATE
    ON
        orders
    FOR EACH ROW
EXECUTE PROCEDURE update_updated_at_orders();

-- ***** order_products intermediate table *****

CREATE TABLE order_products (
  order_id INT REFERENCES orders(id),
  product_id INT REFERENCES products(id),
  quantity INT NOT NULL,
  PRIMARY KEY (order_id, product_id)
);
