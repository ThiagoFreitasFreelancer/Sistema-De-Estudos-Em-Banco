-- Database: HMSDB

-- DROP DATABASE IF EXISTS "HMSDB";

CREATE DATABASE "GerenciadorDeSalao"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Portuguese_Brazil.1252'
    LC_CTYPE = 'Portuguese_Brazil.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;
    Model Author: Thiago de Freitas

SET check_function_bodies = false;
-- ddl-end --

-- object: public."Account" | type: TABLE --
CREATE TABLE IF NOT EXISTS public."Account"(
	name varchar(100),
	password varchar(100),
	cpf bigint,
	cnpj bigint,
	type_hair_id integer,
	start_date date,
	birthday date,
	active date,
	avatar smallint,
	"tipeAccount" varchar(100),
	id integer,
	"account_id_Adress" integer,
	"account_id_Phone" integer,
	"account_id_Email" integer,
	"id_TypeAccount" integer,
	"id_Hair" integer,
	CONSTRAINT account_id PRIMARY KEY (id)

);
-- ddl-end --
-- object: public."Adress" | type: TABLE --
CREATE TABLE IF NOT EXISTS public."Adress"(
	account_id integer,
	city varchar(100),
	neighborhood varchar(100),
	road varchar(100),
	CONSTRAINT account_id_adress PRIMARY KEY (account_id)

);
-- ddl-end --
-- object: "Adress_fk" | type: CONSTRAINT --
ALTER TABLE public."Account" ADD CONSTRAINT "Adress_fk" FOREIGN KEY ("account_id_Adress")
REFERENCES public."Adress" (account_id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE NOT DEFERRABLE;
-- ddl-end --


-- object: public."Phone" | type: TABLE --
CREATE TABLE IF NOT EXISTS public."Phone"(
	account_id integer,
	phone integer,
	ddd integer,
	active date,
	type smallint,
	CONSTRAINT account_id_phone PRIMARY KEY (account_id)

);
-- ddl-end --
-- object: "Phone_fk" | type: CONSTRAINT --
ALTER TABLE public."Account" ADD CONSTRAINT "Phone_fk" FOREIGN KEY ("account_id_Phone")
REFERENCES public."Phone" (account_id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE NOT DEFERRABLE;
-- ddl-end --


-- object: public."Email" | type: TABLE --
CREATE TABLE IF NOT EXISTS public."Email"(
	account_id integer,
	name varchar(100),
	active date,
	email varchar(100),
	CONSTRAINT account_int PRIMARY KEY (account_id)

);
-- ddl-end --
-- object: "Email_fk" | type: CONSTRAINT --
ALTER TABLE public."Account" ADD CONSTRAINT "Email_fk" FOREIGN KEY ("account_id_Email")
REFERENCES public."Email" (account_id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE NOT DEFERRABLE;
-- ddl-end --


-- object: "Account_uq" | type: CONSTRAINT --
ALTER TABLE public."Account" ADD CONSTRAINT "Account_uq" UNIQUE ("account_id_Email");
-- ddl-end --


-- object: public."TypeAccount" | type: TABLE --
CREATE TABLE IF NOT EXISTS public."TypeAccount"(
	id integer,
	type varchar,
	edit boolean,
	creat boolean,
	viwer boolean,
	delete boolean,
	CONSTRAINT type_id PRIMARY KEY (id)

);
-- ddl-end --
-- object: "TypeAccount_fk" | type: CONSTRAINT --
ALTER TABLE public."Account" ADD CONSTRAINT "TypeAccount_fk" FOREIGN KEY ("id_TypeAccount")
REFERENCES public."TypeAccount" (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE NOT DEFERRABLE;
-- ddl-end --


-- object: public."Hair" | type: TABLE --
CREATE TABLE IF NOT EXISTS public."Hair"(
	type varchar(100),
	level integer,
	letter smallint,
	id integer,
	CONSTRAINT hair_id PRIMARY KEY (id)

);
-- ddl-end --
-- object: "Hair_fk" | type: CONSTRAINT --
ALTER TABLE public."Account" ADD CONSTRAINT "Hair_fk" FOREIGN KEY ("id_Hair")
REFERENCES public."Hair" (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE NOT DEFERRABLE;
-- ddl-end --


-- object: "Account_uq1" | type: CONSTRAINT --
--ALTER TABLE public."Account" ADD CONSTRAINT "Account_uq1" ("id_Hair");

ALTER TABLE public."Account" ADD CONSTRAINT "Account_uq1" FOREIGN KEY ("id_Hair")
REFERENCES public."Hair" (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE NOT DEFERRABLE;
-- ddl-end --


-- object: public."Service" | type: TABLE --
CREATE TABLE public."Service"(
	name_client varchar(100),
	name_provider varchar(100),
	client_id integer,
	value float,
	service smallint,
	id_account_service_provider integer,
	date_service date,
	id integer
);
-- ddl-end --
-- object: public."Sale" | type: TABLE --
CREATE TABLE public."Sale"(
	name_product varchar(100),
	amount_product integer,
	price_total float,
	client_id integer,
	account_id_sale integer,
	discount integer,
	date_sale date,
	paid_off boolean,
	reamining float,
	product_id integer
);
-- ddl-end --
-- object: public."Purchase" | type: TABLE --
CREATE TABLE public."Purchase"(
	nameproduct varchar(100),
	amount_product varchar(100),
	value_product float,
	id_account integer,
	id_company_purchase integer,
	date_purchase date,
	id integer,
	product_description text,
	CONSTRAINT id_purchase PRIMARY KEY (id)

);
-- ddl-end --
-- object: public."Product" | type: TABLE --
CREATE TABLE public."Product"(
	purchase_id integer,
	liters float,
	weight float,
	name varchar(100),
	"priceTotal" float,
	amount smallint,
	description text,
	"tipeProduct" varchar(100),
	brand varchar(100),
	date_validity date,
	id integer,
	CONSTRAINT product_id PRIMARY KEY (id)

);
-- ddl-end --

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

INSERT INTO public."Hair" (id, type, level, letter) VALUES
(1, 'Straight', 1, 5),
(2, 'Curly', 2, 3),
(3, 'Wavy', 3, 2);

INSERT INTO public."Account" (id, name, password, cpf, cnpj, type_hair_id, start_date, birthday, active, avatar, "tipeAccount", "account_id_Adress", "account_id_Phone", "account_id_Email", "id_TypeAccount", "id_Hair") VALUES
(1,'John Doe', 'password123', 12345678901, null, 1, '2023-01-01', '1990-05-15', '2023-01-01', 1, 'Client', 1, 1, 1, 1, 1),
(2,'Jane Smith', 'pass456', 98765432102, null, 2, '2023-02-01', '1985-08-22', '2023-02-01', 2, 'Provider', 2, 2, 2, 2, 2),
(3,'Alice Johnson', 'pass789', 55555555503, null, 1, '2023-03-01', '2000-12-10', '2023-03-01', 3, 'Client', 3, 3, 3, 1, 3),
(4,'Bob Miller', 'testpass', 44444444404, null, 3, '2023-04-01', '1978-06-05', '2023-04-01', 4, 'Manager', 4, 4, 4, 2, 1),
(5,'Eva Davis', 'eva_pass', 11112222335, null, 2, '2023-05-01', '1995-04-20', '2023-05-01', 5, 'Provider', 5, 5, 5, 1, 2),
(6,'Mike Brown', 'mike_pass', 98765432106, null, 1, '2023-06-01', '1980-09-15', '2023-06-01', 6, 'Client', 6, 6, 6, 2, 3),
(7,'Linda White', 'linda_pass', 12345678907, null, 3, '2023-07-01', '1992-11-25', '2023-07-01', 7, 'Manager', 7, 7, 7, 1, 1),
(8,'Mark Taylor', 'mark_pass', 55555555508, null, 2, '2023-08-01', '1988-03-08', '2023-08-01', 8, 'Provider', 8, 8, 8, 2, 2),
(9,'Sophia Clark', 'sophia_pass', 44444444490, null, 1, '2023-09-01', '2005-07-12', '2023-09-01', 9, 'Client', 9, 9, 9, 1, 3),
(10,'Daniel Turner', 'daniel_pass', 11112222310, null, 3, '2023-10-01', '1975-01-30', '2023-10-01', 10, 'Manager', 10, 10, 10, 2, 1);

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

INSERT INTO public."Purchase" (id, nameproduct, amount_product, value_product, id_account, id_company_purchase, date_purchase, product_description) VALUES
(1, 'Hair Dye', 10, 50.00, 4, 1, '2023-01-05', 'Permanent color for hair'),
(2, 'Scissors', 5, 20.00, 7, 2, '2023-02-08', 'Professional haircutting scissors'),
(3, 'Hairbrush', 15, 30.00, 10, 3, '2023-03-15', 'Detangling hairbrush'),
(4, 'Shampoo', 20, 80.00, 1, 1, '2023-04-18', 'Moisturizing shampoo');

INSERT INTO public."Product" (id, purchase_id, liters, weight, name, "priceTotal", amount, description, "tipeProduct", brand, date_validity) VALUES
(1, 1, 500.00, null, 'Hair Dye - Red', 50.00, 10, 'Permanent red hair dye', 'Coloring', 'Brand A', '2023-12-01'),
(2, 2, null, 0.5, 'Professional Scissors', 20.00, 5, 'High-quality stainless steel scissors', 'Tool', 'Brand B', '2024-06-01'),
(3, 3, null, null, 'Detangling Hairbrush', 30.00, 15, 'Gentle on hair, suitable for all hair types', 'Accessory', 'Brand C', '2024-06-01'),
(4, 4, 1000.00, null, 'Moisturizing Shampoo', 80.00, 20, 'Enriched with vitamins and natural extracts', 'Shampoo', 'Brand D', '2024-06-01');


-- object: provider_id | type: CONSTRAINT --
ALTER TABLE public."Service" ADD CONSTRAINT provider_id FOREIGN KEY (id_account_service_provider)
REFERENCES public."Account" (id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;
-- ddl-end --


-- object: client_id | type: CONSTRAINT --
ALTER TABLE public."Service" ADD CONSTRAINT client_id_service FOREIGN KEY (client_id)
REFERENCES public."Account" (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;
-- ddl-end --


-- object: client_id | type: CONSTRAINT --
ALTER TABLE public."Sale" ADD CONSTRAINT client_id_sale FOREIGN KEY (client_id)
REFERENCES public."Account" (id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;
-- ddl-end --


-- object: account_id_sale | type: CONSTRAINT --
ALTER TABLE public."Sale" ADD CONSTRAINT account_id_sale FOREIGN KEY (account_id_sale)
REFERENCES public."Account" (id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;
-- ddl-end --


-- object: product_id | type: CONSTRAINT --
ALTER TABLE public."Sale" ADD CONSTRAINT product_id_sale FOREIGN KEY (product_id)
REFERENCES public."Product" (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE CASCADE NOT DEFERRABLE;
-- ddl-end --


-- object: account_id | type: CONSTRAINT --
ALTER TABLE public."Purchase" ADD CONSTRAINT account_id_purchase FOREIGN KEY (id_account)
REFERENCES public."Account" (id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE CASCADE NOT DEFERRABLE;
-- ddl-end --


-- object: company_id | type: CONSTRAINT --
ALTER TABLE public."Purchase" ADD CONSTRAINT company_id_purchase FOREIGN KEY (id_company_purchase)
REFERENCES public."Account" (id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE CASCADE NOT DEFERRABLE;
-- ddl-end --


-- object: purchase_id | type: CONSTRAINT --
ALTER TABLE public."Product" ADD CONSTRAINT purchase_id_product FOREIGN KEY (purchase_id)
REFERENCES public."Purchase" (id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE CASCADE NOT DEFERRABLE;
-- ddl-end --
