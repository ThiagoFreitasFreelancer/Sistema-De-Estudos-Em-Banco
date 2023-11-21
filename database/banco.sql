-- Database: HMSDB

-- DROP DATABASE IF EXISTS "HMSDB";

CREATE DATABASE "HMSDB"
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
