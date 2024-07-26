CREATE TABLE IF NOT EXISTS users (
    id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO users (name, email, password)
VALUES 
('Juan Perez', 'juan.perez@example.com', 'password123'),
('Ana Gomez', 'ana.gomez@example.com', 'password456'),
('Carlos Ruiz', 'carlos.ruiz@example.com', 'password789');

CREATE TABLE IF NOT EXISTS products (
    id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    prize DECIMAL(10, 2) NOT NULL,
    stock INTEGER NOT NULL,
    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO products (name, description, prize, stock)
VALUES 
('Zapatos', 'Zapatos deportivos de color negro', 89900.00, 50),
('Chaqueta', 'Chaqueta de invierno de color gris', 119900.00, 30),
('Gorra', 'Gorra de béisbol de color rojo', 15900.00, 200);

CREATE TABLE IF NOT EXISTS orders (
    id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    user_id BIGINT NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    status VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_user_id
        FOREIGN KEY(user_id) 
        REFERENCES users(id)
);

CREATE TABLE IF NOT EXISTS order_products (
    id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    order_id BIGINT NOT NULL,
    product_id BIGINT NOT NULL,
    quantity INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_order_id
        FOREIGN KEY(order_id) 
        REFERENCES orders(id),
    CONSTRAINT fk_product_id
        FOREIGN KEY(product_id) 
        REFERENCES products(id)
);

CREATE TABLE IF NOT EXISTS payments (
    id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    order_id BIGINT NOT NULL,
    payment_method VARCHAR(50) NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    payment_status VARCHAR(50) NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_order_id
        FOREIGN KEY(order_id) 
        REFERENCES orders(id)
);
