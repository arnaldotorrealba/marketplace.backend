-- users values

INSERT INTO users (username, name, lastname, phonenumber, email, password) VALUES
('user1', 'John', 'Doe', '+123456789', 'john@example.com', '$2a$10$bAYodSchd2AD9LTzyW9wJeP80PhvapzD3Ein4A/eLf4hX483aG0Ce'),
('user2', 'Jane', 'Smith', '+987654321', 'jane@example.com', '$2a$10$j.2NhVt0.QmzrJw2tu1IYe4xcYjobQoZSkOBdacbHWjk02ikfoEMu'),
('user3', 'Alice', 'Johnson', NULL, 'alice@example.com', '$2a$10$6sYLXPGoFWw3EvOlKF.jcuBuAFv9Ur/HbAwRXisZhG0P/XBd7274q'),
('user4', 'Bob', 'Williams', '+111222333', 'bob@example.com', '$2a$10$dC67kmjQ4vlcZB3H2O.Fqe5AtghovLWpkRYmx0oxR2ifATRlOHrze'),
('user5', 'Emma', 'Brown', '+444555666', 'emma@example.com', '$2a$10$0QqrtGyFjKAPCAwpbuSM7uiR61QmNlVKXnJrEkvd2hdi5vvxFjW92');

-- user passwords:

--  password | id
-- ----------+----
-- password1 |  1
-- password2 |  2
-- password3 |  3
-- password4 |  4
-- password5 |  5

-- addresses values

INSERT INTO addresses (user_id, street, city, state, country, postal_code)
VALUES
(1, '123 Main St', 'City1', 'State1', 'Country1', '12345'),
(2, '456 Elm St', 'City2', 'State2', 'Country2', '23456'),
(3, '789 Oak St', 'City3', 'State3', 'Country3', '34567'),
(4, '101 Pine St', 'City4', 'State4', 'Country4', '45678'),
(5, '202 Maple St', 'City5', 'State5', 'Country5', '56789'),
(1, '753 Gam St', 'City6', 'State6', 'Country6', '52856');

-- products values

INSERT INTO products (name, description, price, stock_quantity, img_url, average_rating, total_ratings, state, user_id) VALUES
-- Electrónicos
('Smartwatch Samsung Galaxy Watch 4', 'El smartwatch Samsung Galaxy Watch 4 ofrece un diseño elegante y funciones avanzadas para mantener un estilo de vida activo y saludable. Con seguimiento de actividad, monitoreo de salud y compatibilidad con aplicaciones, es el compañero perfecto para tu día a día.', 299.99, 50, 'galaxy_watch_4.jpg', 4.7, 25, 'active', 1),
('Ordenador portátil ASUS ZenBook', 'El ordenador portátil ASUS ZenBook es una combinación perfecta de estilo y rendimiento. Con un diseño ultradelgado y potentes especificaciones, es ideal para profesionales creativos y usuarios exigentes.', 1299.00, 30, 'asus_zenbook_laptop.jpg', 4.6, 20, 'active', 1),
('Auriculares inalámbricos Sony WH-1000XM4', 'Los auriculares inalámbricos Sony WH-1000XM4 ofrecen cancelación de ruido líder en su clase y una calidad de sonido excepcional. Con una comodidad incomparable y una batería de larga duración, son perfectos para viajes y uso diario.', 349.99, 40, 'sony_wh1000xm4_headphones.jpg', 4.8, 30, 'active', 1),
('Televisor LG OLED 4K', 'El televisor LG OLED 4K ofrece imágenes impresionantes con colores vibrantes y negros perfectos. Con tecnología de pantalla OLED y funciones inteligentes, ofrece una experiencia de visualización inigualable.', 1799.00, 20, 'lg_oled_tv.jpg', 4.9, 35, 'active', 1),
('Cámara réflex Canon EOS Rebel T7i', 'La cámara réflex Canon EOS Rebel T7i es perfecta para fotógrafos aficionados y entusiastas. Con una resolución impresionante y características avanzadas, captura momentos memorables con claridad y detalle.', 699.99, 25, 'canon_eos_rebel_t7i.jpg', 4.5, 15, 'active', 1),
-- Ropa
('Vestido de noche elegante', 'Este vestido de noche elegante es perfecto para ocasiones especiales y eventos formales. Con un diseño atemporal y detalles de alta costura, te hará destacar en cualquier ocasión.', 129.99, 60, 'elegant_evening_dress.jpg', 4.7, 50, 'active', 1),
('Camisa de manga corta para hombre', 'Esta camisa de manga corta para hombre es ideal para looks casuales y relajados. Confeccionada con tejidos de alta calidad y un diseño moderno, es una prenda básica para el armario de cualquier hombre.', 49.99, 100, 'short_sleeve_shirt.jpg', 4.3, 80, 'active', 1),
('Jeans ajustados de mujer', 'Estos jeans ajustados de mujer son una combinación perfecta de comodidad y estilo. Confeccionados con denim elástico y un diseño moderno, son ideales para cualquier ocasión.', 69.99, 80, 'skinny_jeans_women.jpg', 4.6, 70, 'active', 1),
('Traje de baño de dos piezas', 'Este traje de baño de dos piezas es perfecto para disfrutar del sol y la playa. Con un diseño elegante y tejidos de secado rápido, te verás y te sentirás genial en tus vacaciones.', 39.99, 120, 'two_piece_swimsuit.jpg', 4.4, 90, 'active', 2),
('Bufanda de lana tejida a mano', 'Esta bufanda de lana tejida a mano es el accesorio perfecto para mantenerte abrigado en los días fríos. Confeccionada con lana de alta calidad y un diseño único, es un complemento imprescindible para tu guardarropa de invierno.', 29.99, 150, 'hand_knitted_wool_scarf.jpg', 4.8, 100, 'active', 2),
-- Hogar y Jardín
('Juego de sábanas de algodón', 'Este juego de sábanas de algodón ofrece comodidad y suavidad para una noche de sueño reparador. Confeccionado con algodón de alta calidad y un diseño elegante, transforma tu dormitorio en un oasis de tranquilidad.', 79.99, 70, 'cotton_bed_sheets.jpg', 4.5, 55, 'active', 2),
('Set de cuchillos de cocina profesionales', 'Este set de cuchillos de cocina profesionales es imprescindible para cualquier chef aficionado o profesional. Con hojas afiladas y mangos ergonómicos, facilita la preparación de alimentos en la cocina.', 149.99, 40, 'professional_kitchen_knife_set.jpg', 4.6, 35, 'active', 2),
('Mesa de comedor extensible de roble', 'Esta mesa de comedor extensible de roble es perfecta para reuniones familiares y cenas con amigos. Con un diseño elegante y capacidad para adaptarse a diferentes tamaños, es una adición práctica y sofisticada a tu hogar.', 499.00, 15, 'extendable_oak_dining_table.jpg', 4.7, 20, 'active', 2),
('Juego de macetas de cerámica', 'Este juego de macetas de cerámica es ideal para dar vida a tu jardín o terraza. Con diseños vibrantes y duraderos, añade un toque de color y estilo a tus plantas favoritas.', 39.99, 80, 'ceramic_pot_set.jpg', 4.4, 45, 'active', 2),
('Cortinas opacas para sala de estar', 'Estas cortinas opacas para sala de estar bloquean la luz solar no deseada y proporcionan privacidad en tu hogar. Con un diseño elegante y tejidos de alta calidad, añaden un toque de estilo a cualquier habitación.', 59.99, 50, 'living_room_blackout_curtains.jpg', 4.8, 30, 'active', 2),
-- Libros
('Cien años de soledad - Gabriel García Márquez', 'Cien años de soledad es una obra maestra de la literatura que narra la historia de la familia Buendía a lo largo de varias generaciones en el pueblo ficticio de Macondo. Una novela imprescindible para cualquier amante de la literatura.', 15.99, 100, 'cien_anos_de_soledad_book.jpg', 4.9, 65, 'active', 2),
('El señor de los anillos - J.R.R. Tolkien', 'El señor de los anillos es una epopeya fantástica que sigue las aventuras de Frodo Bolsón y su viaje para destruir el Anillo Único. Una historia épica de amistad, valentía y sacrificio.', 19.99, 80, 'lord_of_the_rings_book.jpg', 4.7, 55, 'active', 3),
('Orgullo y prejuicio - Jane Austen', 'Orgullo y prejuicio es una novela clásica que sigue la historia de Elizabeth Bennet y su relación con el orgulloso y misterioso Sr. Darcy. Una comedia romántica atemporal que cautiva a los lectores de todas las edades.', 12.99, 120, 'pride_and_prejudice_book.jpg', 4.8, 75, 'active', 3),
('1984 - George Orwell', '1984 es una distopía política que presenta un futuro totalitario donde el gobierno ejerce un control absoluto sobre la sociedad. Una obra visionaria que sigue siendo relevante en la era moderna.', 14.99, 90, '1984_book.jpg', 4.6, 40, 'active', 3),
('Harry Potter y la piedra filosofal - J.K. Rowling', 'Harry Potter y la piedra filosofal es el primer libro de la exitosa serie de fantasía que sigue las aventuras del joven mago Harry Potter. Una historia mágica que ha cautivado a millones de lectores en todo el mundo.', 11.99, 150, 'harry_potter_book.jpg', 4.9, 85, 'active', 3),
-- Deportes y Aire libre
('Bicicleta de montaña de carbono', 'La bicicleta de montaña de carbono ofrece un rendimiento excepcional en senderos difíciles y terrenos variados. Con un cuadro ligero y componentes de alta gama, es ideal para ciclistas aventureros.', 1999.99, 25, 'carbon_mountain_bike.jpg', 4.8, 20, 'active', 3),
('Tablero de paddle surf inflable', 'El tablero de paddle surf inflable es fácil de transportar y perfecto para aventuras en el agua. Con una construcción duradera y estabilidad excepcional, es ideal para principiantes y usuarios avanzados.', 499.00, 30, 'inflatable_paddle_board.jpg', 4.7, 15, 'active', 3),
('Set de pesas ajustables', 'Este set de pesas ajustables es perfecto para entrenamientos en casa o en el gimnasio. Con una variedad de pesos y un diseño compacto, te permite realizar una amplia gama de ejercicios para fortalecer y tonificar tu cuerpo.', 249.99, 40, 'adjustable_dumbbell_set.jpg', 4.6, 25, 'active', 3),
('Tienda de campaña para 4 personas', 'La tienda de campaña para 4 personas ofrece comodidad y protección en tus aventuras al aire libre. Con un diseño espacioso y fácil de montar, es perfecta para acampar en familia o con amigos.', 149.99, 20, '4_person_tent.jpg', 4.5, 10, 'active', 3),
('Raquetas de tenis de mesa profesionales', 'Estas raquetas de tenis de mesa profesionales ofrecen un excelente control y velocidad para partidos competitivos. Con mangos ergonómicos y una construcción duradera, son ideales para jugadores de todos los niveles.', 79.99, 50, 'professional_ping_pong_paddles.jpg', 4.7, 35, 'active', 3);


-- likes values

INSERT INTO likes (user_id, product_id) VALUES
(1, 1),
(1, 3),
(1, 5),
(1, 7),
(1, 9),
(2, 2),
(2, 4),
(2, 6),
(2, 8),
(2, 10);

-- comments values

INSERT INTO comments (product_id, user_id, comment) VALUES
(1, 1, '¡Este producto es increíble! Lo he estado usando durante semanas y estoy muy satisfecho con su rendimiento.'),
(2, 1, 'Excelente calidad de sonido en estos auriculares. Definitivamente recomendaría este producto a cualquier amante de la música.'),
(3, 2, 'La cámara DSLR Pro es perfecta para capturar momentos especiales. Estoy muy contento con la calidad de las imágenes que he obtenido.'),
(4, 2, '¡Me encanta esta Smart TV! La resolución 4K y las funciones inteligentes hacen que ver películas sea una experiencia asombrosa.'),
(5, 3, 'Los auriculares inalámbricos son cómodos de llevar y ofrecen un sonido nítido. ¡Me encantan!'),
(6, 3, 'La tableta digitalizadora es impresionante. Ha mejorado significativamente mi flujo de trabajo como diseñador gráfico.'),
(7, 4, 'Este monitor curvo es perfecto para juegos. La calidad de la imagen y la suavidad de la pantalla son impresionantes.'),
(8, 4, 'La impresora multifunción ha sido una adición excelente a mi oficina en casa. Es fácil de configurar y usar.'),
(9, 5, 'La aspiradora robot hace un trabajo increíble limpiando mi casa. Es muy conveniente y ahorra mucho tiempo.'),
(10, 5, 'El altavoz Bluetooth portátil ofrece un sonido sorprendentemente potente. ¡Lo llevo a todas partes!'),
(11, 1, 'La silla gamer ergonómica es muy cómoda y ayuda a mantener una postura adecuada durante largas sesiones de juego.'),
(12, 2, 'El teclado mecánico RGB tiene una respuesta táctil excelente y las luces LED son impresionantes.'),
(13, 3, 'La cafetera espresso automática hace cafés deliciosos y es muy fácil de usar.'),
(14, 4, 'La impresora 3D profesional ha sido una herramienta invaluable para mis proyectos de diseño.'),
(15, 5, 'La barra de sonido surround proporciona un sonido envolvente y mejora mi experiencia de entretenimiento en casa.');

-- categories values

INSERT INTO categories (name) VALUES
('Electronicos'),
('Ropa'),
('Hogar y Jardín'),
('Libros'),
('Deportes y Aire libre'),
('Otros');

-- product_categories values

INSERT INTO product_categories (product_id, category_id) VALUES
-- Electrónicos
(1, 1),  -- Teléfono inteligente Galaxy S22 - Electrónicos
(2, 1),  -- Ordenador portátil ASUS ZenBook - Electrónicos
(3, 1),  -- Auriculares inalámbricos Sony WH-1000XM4 - Electrónicos
(4, 1),  -- Televisor LG OLED 4K - Electrónicos
(5, 1),  -- Cámara réflex Canon EOS Rebel T7i - Electrónicos
-- Ropa
(6, 2),  -- Vestido de noche elegante - Ropa
(7, 2),  -- Camisa de manga corta para hombre - Ropa
(8, 2),  -- Jeans ajustados de mujer - Ropa
(9, 2),  -- Traje de baño de dos piezas - Ropa
(10, 2), -- Bufanda de lana tejida a mano - Ropa
-- Hogar y Jardín
(11, 3), -- Juego de sábanas de algodón - Hogar y Jardín
(12, 3), -- Set de cuchillos de cocina profesionales - Hogar y Jardín
(13, 3), -- Mesa de comedor extensible de roble - Hogar y Jardín
(14, 3), -- Juego de macetas de cerámica - Hogar y Jardín
(15, 3), -- Cortinas opacas para sala de estar - Hogar y Jardín
-- Libros
(16, 4), -- Cien años de soledad - Libros
(17, 4), -- El Gran Gatsby - Libros
(18, 4), -- Los miserables - Libros
(19, 4), -- Orgullo y prejuicio - Libros
(20, 4), -- El nombre del viento - Libros
-- Deportes y Aire libre
(21, 5), -- Raqueta de tenis Wilson Pro Staff - Deportes y Aire libre
(22, 5), -- Smartwatch Samsung Galaxy Watch 4 - Deportes y Aire libre
(23, 5), -- Set de golf completo - Deportes y Aire libre
(24, 5), -- Bicicleta de montaña Cannondale Trail - Deportes y Aire libre
(25, 5), -- Tienda de campaña para 4 personas - Deportes y Aire libre
-- Posibles múltiples categorías
(5, 5), -- Cámara réflex Canon EOS Rebel T7i - Deportes y Aire libre
(7, 5), -- Camisa de manga corta para hombre - Deportes y Aire libre
(13, 5); -- Mesa de comedor extensible de roble - Deportes y Aire libre

-- orders values

-- Insertar la orden 01
INSERT INTO orders (user_id, address_id, total_quantity, total_amount, state)
VALUES (1, 1, 2, 120.00, 'pendiente');

-- Insertar la orden 02

INSERT INTO orders (user_id, address_id, total_quantity, total_amount, state)
VALUES (2, 2, 3, 250.00, 'pendiente');

-- Insertar la orden 03

INSERT INTO orders (user_id, address_id, total_quantity, total_amount, state)
VALUES (1, 1, 7, 3929.93, 'pendiente');

-- order_products values

INSERT INTO order_products (order_id, product_id, quantity, subtotal)
VALUES 
(1, 1, 1, 299.99),  -- Producto 1: Cantidad 1
(1, 2, 1, 1299.00),  -- Producto 2: Cantidad 1 
(2, 3, 1, 349.99),  -- Producto 3: Cantidad 1
(2, 4, 2, 3598.00),  -- Producto 4: Cantidad 2
(3, 5, 5, 3499.95),
(3, 6, 1, 129.99),
(3, 1, 1, 299.99);


-- roles values

INSERT INTO roles (name, description) VALUES
('user', 'Rol estándar para los usuarios normales.'),
('admin', 'Rol con privilegios de administrador.'),
('superadmin', 'Rol con privilegios de superadministrador.'),
('seller', 'Rol para vendedores y comerciantes.');

-- user_roles values

INSERT INTO user_roles (user_id, role_id) VALUES
(1, 3), -- John Doe (superadmin)
(2, 1), -- Jane Smith (user)
(3, 1), -- Alice Johnson (user)
(4, 2), -- Bob Williams (admin)
(5, 4); -- Emma Brown (seller)


