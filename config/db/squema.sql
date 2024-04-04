CREATE DATABASE marketplace;
/c marketplace;

-- ***** create function for TIMESTAMPS *****

CREATE FUNCTION update_record()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW;
END;
$$ language 'plpgsql';

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

CREATE TRIGGER update_users_updated_at
    BEFORE UPDATE
    ON
        users
    FOR EACH ROW
EXECUTE PROCEDURE update_record();

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

CREATE TRIGGER update_addresses_updated_at
    BEFORE UPDATE
    ON
        addresses
    FOR EACH ROW
EXECUTE PROCEDURE update_record();

-- ***** products table *****

CREATE TABLE products (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL UNIQUE,
  description TEXT,
  price NUMERIC(10, 2) NOT NULL,  -- Up to 10 digits total, with 2 of them after the decimal point.
  stock_quantity INT NOT NULL,
  img_url VARCHAR(255), 
  average_rating DECIMAL(2, 1),   -- Decimal for the average of the ratings
  total_ratings INT DEFAULT 0,    -- Number of reviews
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMP NOT NULL DEFAULT NOW()
);

-- ***** add trigger for products table *****

CREATE TRIGGER update_products_updated_at
    BEFORE UPDATE
    ON
        products
    FOR EACH ROW
EXECUTE PROCEDURE update_record();

-- ***** likes table *****

CREATE TABLE likes (
  user_id INT REFERENCES users(id),
  product_id INT REFERENCES products(id),
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMP NOT NULL DEFAULT NOW(),
  PRIMARY KEY (user_id, product_id)
);

-- ***** add trigger for likes table *****

CREATE TRIGGER update_likes_updated_at
    BEFORE UPDATE
    ON
        likes
    FOR EACH ROW
EXECUTE PROCEDURE update_record();

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

CREATE TRIGGER update_comments_updated_at
    BEFORE UPDATE
    ON
        comments
    FOR EACH ROW
EXECUTE PROCEDURE update_record();

-- ***** categories table ***** -- 

CREATE TABLE categories (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL UNIQUE,
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMP NOT NULL DEFAULT NOW()
);

-- ***** add trigger for categories table *****

CREATE TRIGGER update_categories_updated_at
    BEFORE UPDATE
    ON
        categories
    FOR EACH ROW
EXECUTE PROCEDURE update_record();

-- ***** product_categories intermediate table *****

CREATE TABLE product_categories (
  product_id INT REFERENCES products(id),
  category_id INT REFERENCES categories(id),
  PRIMARY KEY (product_id, category_id), -- Ensure there are no duplicate product and category combinations
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMP NOT NULL DEFAULT NOW()
);

-- ***** add trigger for product_categories table *****

CREATE TRIGGER update_product_categories_updated_at
    BEFORE UPDATE
    ON
        product_categories
    FOR EACH ROW
EXECUTE PROCEDURE update_record();

-- ***** orders table *****

CREATE TABLE orders (
  id SERIAL PRIMARY KEY,
  user_id INT REFERENCES users(id),
  address_id INT REFERENCES addresses(id),
  total_quantity INT NOT NULL,
  total_amount NUMERIC(10, 2) NOT NULL,
  state VARCHAR(20) NOT NULL DEFAULT 'pendiente',
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMP NOT NULL DEFAULT NOW()
);

-- ***** add trigger for orders table *****

CREATE TRIGGER update_orders_updated_at
    BEFORE UPDATE
    ON
        orders
    FOR EACH ROW
EXECUTE PROCEDURE update_record();

-- ***** order_products intermediate table *****

CREATE TABLE order_products (
  order_id INT REFERENCES orders(id),
  product_id INT REFERENCES products(id),
  quantity INT NOT NULL,
  PRIMARY KEY (order_id, product_id), -- Ensure there are no duplicate order and product combinations
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMP NOT NULL DEFAULT NOW()
);

-- ***** add trigger for order_products table *****

CREATE TRIGGER update_order_products_updated_at
    BEFORE UPDATE
    ON
        order_products
    FOR EACH ROW
EXECUTE PROCEDURE update_record();

-- ***** roles table *****

CREATE TABLE roles (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  description TEXT,
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMP NOT NULL DEFAULT NOW()
);

-- ***** add trigger for roles table *****

CREATE TRIGGER update_roles_updated_at
    BEFORE UPDATE
    ON
        roles
    FOR EACH ROW
EXECUTE PROCEDURE update_record();

-- ***** user_roles intermediate table *****

CREATE TABLE user_roles (
  user_id INT REFERENCES users(id),
  role_id INT REFERENCES roles(id),
  PRIMARY KEY (user_id, rol_id), -- Ensure there are no duplicate user and rol combinations
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMP NOT NULL DEFAULT NOW()
);

-- ***** add trigger for user_roles table *****

CREATE TRIGGER update_user_roles_updated_at
    BEFORE UPDATE
    ON
        user_roles
    FOR EACH ROW
EXECUTE PROCEDURE update_record();
