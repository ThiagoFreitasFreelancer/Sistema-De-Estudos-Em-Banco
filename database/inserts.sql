INSERT INTO public."Account" (name, password, cpf, cnpj, type_hair_id, start_date, birthday, active, avatar, "tipeAccount", "account_id_Adress", "account_id_Phone", "account_id_Email", "id_TypeAccount", "id_Hair") VALUES
('John Doe', 'password123', 12345678900, null, 1, '2023-01-01', '1990-05-15', '2023-01-01', 1, 'Client', 1, 1, 1, 1, 1),
('Jane Smith', 'pass456', 98765432100, null, 2, '2023-02-01', '1985-08-22', '2023-02-01', 2, 'Provider', 2, 2, 2, 2, 2),
('Alice Johnson', 'pass789', 55555555500, null, 1, '2023-03-01', '2000-12-10', '2023-03-01', 3, 'Client', 3, 3, 3, 1, 3),
('Bob Miller', 'testpass', 44444444400, null, 3, '2023-04-01', '1978-06-05', '2023-04-01', 4, 'Manager', 4, 4, 4, 2, 1),
('Eva Davis', 'eva_pass', 11112222333, null, 2, '2023-05-01', '1995-04-20', '2023-05-01', 5, 'Provider', 5, 5, 5, 1, 2),
('Mike Brown', 'mike_pass', 98765432100, null, 1, '2023-06-01', '1980-09-15', '2023-06-01', 6, 'Client', 6, 6, 6, 2, 3),
('Linda White', 'linda_pass', 12345678900, null, 3, '2023-07-01', '1992-11-25', '2023-07-01', 7, 'Manager', 7, 7, 7, 1, 1),
('Mark Taylor', 'mark_pass', 55555555500, null, 2, '2023-08-01', '1988-03-08', '2023-08-01', 8, 'Provider', 8, 8, 8, 2, 2),
('Sophia Clark', 'sophia_pass', 44444444400, null, 1, '2023-09-01', '2005-07-12', '2023-09-01', 9, 'Client', 9, 9, 9, 1, 3),
('Daniel Turner', 'daniel_pass', 11112222333, null, 3, '2023-10-01', '1975-01-30', '2023-10-01', 10, 'Manager', 10, 10, 10, 2, 1);

INSERT INTO public."Adress" (account_id, city, neighborhood, road) VALUES
(1, 'City A', 'Neighborhood 1', 'Road 123'),
(2, 'City B', 'Neighborhood 2', 'Road 456'),
(3, 'City C', 'Neighborhood 3', 'Road 789'),
(4, 'City D', 'Neighborhood 4', 'Road 321'),
(5, 'City E', 'Neighborhood 5', 'Road 654'),
(6, 'City F', 'Neighborhood 6', 'Road 987'),
(7, 'City G', 'Neighborhood 7', 'Road 654'),
(8, 'City H', 'Neighborhood 8', 'Road 321'),
(9, 'City I', 'Neighborhood 9', 'Road 987'),
(10, 'City J', 'Neighborhood 10', 'Road 123');

INSERT INTO public."Phone" (account_id, phone, ddd, active, type) VALUES
(1, 123456789, 11, '2023-01-01', 1),
(2, 987654321, 22, '2023-02-01', 2),
(3, 555555555, 33, '2023-03-01', 1),
(4, 444444444, 44, '2023-04-01', 3),
(5, 1111222233, 55, '2023-05-01', 2),
(6, 987654321, 66, '2023-06-01', 1),
(7, 123456789, 77, '2023-07-01', 3),
(8, 555555555, 88, '2023-08-01', 2),
(9, 444444444, 99, '2023-09-01', 1),
(10, 1111222233, 10, '2023-10-01', 3);

INSERT INTO public."Email" (account_id, name, active, email) VALUES
(1, 'john@example.com', '2023-01-01', 'john@example.com'),
(2, 'jane@example.com', '2023-02-01', 'jane@example.com'),
(3, 'alice@example.com', '2023-03-01', 'alice@example.com'),
(4, 'bob@example.com', '2023-04-01', 'bob@example.com'),
(5, 'eva@example.com', '2023-05-01', 'eva@example.com'),
(6, 'mike@example.com', '2023-06-01', 'mike@example.com'),
(7, 'linda@example.com', '2023-07-01', 'linda@example.com'),
(8, 'mark@example.com', '2023-08-01', 'mark@example.com'),
(9, 'sophia@example.com', '2023-09-01', 'sophia@example.com'),
(10, 'daniel@example.com', '2023-10-01', 'daniel@example.com');

INSERT INTO public."TypeAccount" (id, type, edit, creat, viwer, delete) VALUES
(1, 'Client', true, true, true, false),
(2, 'Provider', true, false, true, false),
(3, 'Manager', true, true, true, true);

INSERT INTO public."Hair" (type, level, letter) VALUES
('Straight', 1, 5),
('Curly', 2, 3),
('Wavy', 3, 2);

INSERT INTO public."Service" (name_client, name_provider, client_id, value, service, id_account_service_provider, date_service) VALUES
('John Doe', 'Jane Smith', 1, 50.00, 1, 2, '2023-01-15'),
('Alice Johnson', 'Eva Davis', 3, 30.00, 2, 5, '2023-02-10'),
('Mike Brown', 'Mark Taylor', 6, 25.00, 3, 8, '2023-03-22'),
('Sophia Clark', 'Daniel Turner', 9, 40.00, 1, 10, '2023-04-18');

INSERT INTO public."Sale" (name_product, amount_product, price_total, client_id, account_id_sale, discount, date_sale, paid_off, reamining, product_id) VALUES
('Shampoo', 2, 30.00, 1, 1, 5, '2023-01-20', true, 0.00, 1),
('Conditioner', 1, 15.00, 3, 3, 2, '2023-02-12', true, 0.00, 2),
('Haircut', 1, 20.00, 6, 6, 0, '2023-03-25', true, 0.00, 3),
('Coloring', 1, 35.00, 9, 9, 7, '2023-04-20', false, 35.00, 4);

INSERT INTO public."Purchase" (nameproduct, amount_product, value_product, id_account, id_company_purchase, date_purchase, product_description) VALUES
('Hair Dye', '10 units', 50.00, 4, 1, '2023-01-05', 'Permanent color for hair'),
('Scissors', '5 units', 20.00, 7, 2, '2023-02-08', 'Professional haircutting scissors'),
('Hairbrush', '15 units', 30.00, 10, 3, '2023-03-15', 'Detangling hairbrush'),
('Shampoo', '20 units', 80.00, 1, 1, '2023-04-18', 'Moisturizing shampoo');

INSERT INTO public."Product" (purchase_id, liters, weight, name, "priceTotal", amount, description, "tipeProduct", brand, date_validity) VALUES
(1, 500.00, null, 'Hair Dye - Red', 50.00, 10, 'Permanent red hair dye', 'Coloring', 'Brand A', '2023-12-01'),
(2, null, 0.5, 'Professional Scissors', 20.00, 5, 'High-quality stainless steel scissors', 'Tool', 'Brand B', null),
(3, null, null, 'Detangling Hairbrush', 30.00, 15, 'Gentle on hair, suitable for all hair types', 'Accessory', 'Brand C', null),
(4, 1000.00, null, 'Moisturizing Shampoo', 80.00, 20, 'Enriched with vitamins and natural extracts', 'Shampoo', 'Brand D', '2024-06-01');
