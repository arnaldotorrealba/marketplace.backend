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

UPDATE products SET img_url = 'https://unsplash.com/es/fotos/zapatilla-nike-roja-sin-emparejar-164_6wVEHfI';
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


UPDATE products
SET img_url = 'https://img.freepik.com/psd-gratis/set-diferentes-relojes-inteligentes_1104-120.jpg?w=740&t=st=1713311651~exp=1713312251~hmac=214cef251a45decc7c1373abf8b149c452b111f1a623c9e8ab2ca58f2f87cb63'
WHERE id = 1;

UPDATE products
SET img_url = 'https://img.freepik.com/foto-gratis/mujer-negocios-usando-portatil-cafeteria_23-2148002116.jpg?t=st=1713311805~exp=1713315405~hmac=58da13cb98d2e701e9d658eaa4aafe1640737339f083ad41aace87018571abd7&w=740'
WHERE id = 2;

UPDATE products
SET img_url = 'https://img.freepik.com/foto-gratis/cerrar-manos-sosteniendo-funda-auriculares-inalambricos_23-2148989858.jpg?t=st=1713311852~exp=1713315452~hmac=3d9040d194416fe6024f94f96ecd243fb8035a6b96b4ef1f4907bc08f6735630&w=740'
WHERE id = 3;

UPDATE products
SET img_url = 'https://img.freepik.com/foto-gratis/vista-pantalla-monitor-computadora_23-2150757335.jpg?t=st=1713311943~exp=1713315543~hmac=16e0938d6f7ea07ace56ae00690b09715a136ba804cd98e7793006a6e97c7e23&w=740'
WHERE id = 4;

UPDATE products
SET img_url = 'https://img.freepik.com/foto-gratis/camara-fotos-explotacion-mano_23-2150630972.jpg?t=st=1713311981~exp=1713315581~hmac=e2e4cec60e31aeeccbf708e9d27ed1f2e2459002ca7f19d064cd539df75c23e0&w=360'
WHERE id = 5;

UPDATE products
SET img_url = 'https://img.freepik.com/foto-gratis/modelo-moda-atractiva-posando-vestido-noche-negro_651396-1241.jpg?t=st=1713312050~exp=1713315650~hmac=97c84bfdbc599e556cf887563d5f16860a21c1e34750734cd4ae2b86d311dde1&w=360'
WHERE id = 6;

UPDATE products
SET img_url = 'https://img.freepik.com/foto-gratis/hombre-vestido-camisa-azul-diseno-signo-igual_53876-125243.jpg?t=st=1713312100~exp=1713315700~hmac=a4da60a49de846c381e7c30e59526ef3d7aaa2c80614d4e7668705d7b1fb4b96&w=360'
WHERE id = 7;

UPDATE products
SET img_url = 'https://img.freepik.com/foto-gratis/mujer-bonita-que-usa-tableta-pared_23-2148095800.jpg?t=st=1713312196~exp=1713315796~hmac=5ffdbc3206b1ed5a4ce08ccc4daa672eb5b86b5d3a9061de0453e4deafa2eb16&w=360'
WHERE id = 8;

UPDATE products
SET img_url = 'https://img.freepik.com/foto-gratis/mujer-mascara-buceo-playa_23-2148165134.jpg?t=st=1713366667~exp=1713370267~hmac=acacf0c0114d58a227d014385ff41f96a0a5bb991521a570dab253304f86ac0c&w=996'
WHERE id = 9;

UPDATE products
SET img_url = 'https://img.freepik.com/foto-gratis/chica-feliz-tiro-medio-sombrero-grande_23-2148905752.jpg?t=st=1713312361~exp=1713315961~hmac=19791572f769002b5e5d02251db20657a714b5e7eb42c6d9d90cd4da23c98c50&w=360'
WHERE id = 10;

UPDATE products
SET img_url = 'https://img.freepik.com/foto-gratis/primer-plano-cama-sabanas-blancas-arrugadas_1203-1512.jpg?t=st=1713312470~exp=1713316070~hmac=bfc6f6198dd5dc9f887b8178b0e5f8d24706181930ff0fb85562c615f431378d&w=360'
WHERE id = 11;

UPDATE products
SET img_url = 'https://img.freepik.com/vector-gratis/coleccion-cuchillos-chef-realista_52683-75275.jpg?t=st=1713312544~exp=1713316144~hmac=7a54828b9a506043c92c8e6e2b722cc6925d95029eee0c713134cd6a415c1a9c&w=740'
WHERE id = 12;

UPDATE products
SET img_url = 'https://img.freepik.com/foto-gratis/fondo-mesa-comedor-angulo-alto-llamadas-zoom_23-2149684457.jpg?t=st=1713366480~exp=1713370080~hmac=af2f73e6372de50ad48460e41761b361775f9255efec81251fccd024d0c696bf&w=1380'
WHERE id = 13;

UPDATE products
SET img_url = 'https://img.freepik.com/foto-gratis/cerrar-arreglo-jarrones-modernos_23-2149646554.jpg?t=st=1713312794~exp=1713316394~hmac=bce9fce2bec422698079a0e04fb63ef664157a5d92aad98c22b4fa434f5247fe&w=740'
WHERE id = 14;

UPDATE products
SET img_url = 'https://img.freepik.com/foto-gratis/diseno-interiores-hermosa-planta_23-2149551400.jpg?t=st=1713312886~exp=1713316486~hmac=d0539d27485892138340a971ccae839930da4085bc22c5f1fdae5496a349c0c3&w=740'
WHERE id = 15;

UPDATE products
SET img_url = 'https://img.freepik.com/foto-gratis/naturaleza-muerta-sant-jordi-dia-libros-rosas_23-2151197560.jpg?t=st=1713312948~exp=1713316548~hmac=c8c823ef4b49075723e4f5c9c7889d67c809b3575fc6d4c8e8d217a5cac0b093&w=360'
WHERE id = 16;

UPDATE products
SET img_url = 'https://img.freepik.com/foto-gratis/mujer-libro-abierto-vela-suelo-bosque_23-2147902916.jpg?t=st=1713312976~exp=1713316576~hmac=6e7dcd9366370420c14a0bba192363d823083acecd3d85328a06095488617b6d&w=740'
WHERE id = 17;

UPDATE products
SET img_url = 'https://img.freepik.com/foto-gratis/bruja-halloween-que-sostiene-libro-conjuros-antiguo-maderas-iluminadas-sol_23-2147902862.jpg?t=st=1713313004~exp=1713316604~hmac=e6124c5e1bb7471556fb98b699ea47360c9f58c3bc22b54424518872f194ddb2&w=360'
WHERE id = 18;

UPDATE products
SET img_url = 'https://img.freepik.com/foto-gratis/flor-ramitas-flores-jarron-cerca-volumen-textil-azul-oscuridad_23-2148069321.jpg?t=st=1713313084~exp=1713316684~hmac=9bef60e2d6c552b77a85b2ec9b4ec3237f70ac0d53a2efb087fba96054640278&w=360'
WHERE id = 19;

UPDATE products
SET img_url = 'https://img.freepik.com/foto-gratis/naturaleza-muerta-sant-jordi-dia-libros-rosas_23-2151197561.jpg?t=st=1713313121~exp=1713316721~hmac=5a8cc20270643ea5131e5e39e57dc18c9c9241ee8449a1be9e875567950f4688&w=360'
WHERE id = 20;

UPDATE products
SET img_url = 'https://img.freepik.com/foto-gratis/retrato-hombre-mayor-bicicleta-montana_23-2148929646.jpg?t=st=1713313207~exp=1713316807~hmac=da1fb0c8404caa5b6b8981cb89e32c8084ead01b7fc9a29bd4b00f05f5f442ea&w=740'
WHERE id = 21;

UPDATE products
SET img_url = 'https://img.freepik.com/foto-gratis/cerrar-mujer-paddleboarding_23-2149105107.jpg?t=st=1713313243~exp=1713316843~hmac=0884b97d11ff6d35c373fdbdf6fcc810affac9da7f43009b2e71cfc5817f843b&w=740'
WHERE id = 22;

UPDATE products
SET img_url = 'https://img.freepik.com/foto-gratis/disposicion-equipo-entrenamiento-vista-superior_23-2149177960.jpg?t=st=1713366856~exp=1713370456~hmac=439ac9274e237b0c5e7ccbadfcebb96a2ca8336b0d7f41d20b7597576b31f7e5&w=1380'
WHERE id = 23;

UPDATE products
SET img_url = 'https://img.freepik.com/foto-gratis/hoguera-campamento-bosque-establecido-excursionistas_181624-7040.jpg?t=st=1713313484~exp=1713317084~hmac=963ea2e419ac968d61dd3e2fc7fe2198346dbfa80145802c6d377ffe36622aad&w=360'
WHERE id = 24;

UPDATE products
SET img_url = 'https://img.freepik.com/foto-gratis/personas-que-tienen-actividad-jubilacion-feliz_23-2149168927.jpg?t=st=1713366922~exp=1713370522~hmac=412741dda5330c34bceca648bd4f141347fcb66a31b4f565f1eaadb999903049&w=1380'
WHERE id = 25;