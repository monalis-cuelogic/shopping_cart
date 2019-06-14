--
-- PostgreSQL database dump
--

-- Dumped from database version 10.8 (Ubuntu 10.8-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.8 (Ubuntu 10.8-0ubuntu0.18.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: brands; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.brands (
    id bigint NOT NULL,
    name character varying,
    description character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    logo character varying
);


--
-- Name: brands_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.brands_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: brands_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.brands_id_seq OWNED BY public.brands.id;


--
-- Name: carts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.carts (
    id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    product_id character varying,
    user_id integer
);


--
-- Name: carts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.carts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: carts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.carts_id_seq OWNED BY public.carts.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products (
    id bigint NOT NULL,
    name character varying,
    price character varying,
    quantity integer,
    description character varying,
    size character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    brand_id integer,
    images character varying
);


--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.roles (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying,
    address character varying,
    role integer,
    password character varying,
    c_password character varying,
    gender character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    role_id integer,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: brands id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.brands ALTER COLUMN id SET DEFAULT nextval('public.brands_id_seq'::regclass);


--
-- Name: carts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.carts ALTER COLUMN id SET DEFAULT nextval('public.carts_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2019-06-13 06:42:43.9809	2019-06-13 06:42:43.9809
\.


--
-- Data for Name: brands; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.brands (id, name, description, created_at, updated_at, logo) FROM stdin;
1	Roadster	roadster clothes 	2019-06-13 07:37:47.86334	2019-06-13 07:37:47.86334	roadster.jpeg
2	Oppo	Oppo Mobile	2019-06-13 07:38:05.271698	2019-06-13 07:38:05.271698	oppo.png
3	Nokia	Nokia Mobile	2019-06-13 07:38:22.919	2019-06-13 07:38:22.919	nokia.png
4	Samsung	Samsung Mobile	2019-06-13 07:38:48.641962	2019-06-13 07:38:48.641962	samsung.jpeg
5	Motorola	Motorola Mobile	2019-06-13 07:39:11.624243	2019-06-13 07:39:11.624243	motorola.png
6	Adidas	Adidas shoe	2019-06-13 07:40:54.708282	2019-06-13 07:40:54.708282	adidas.png
7	Nike	Nike description	2019-06-13 08:39:02.302802	2019-06-13 08:42:31.927844	nike.png
\.


--
-- Data for Name: carts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.carts (id, created_at, updated_at, product_id, user_id) FROM stdin;
1	2019-06-13 12:25:39.712143	2019-06-13 12:25:39.712143	8	4
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products (id, name, price, quantity, description, size, created_at, updated_at, brand_id, images) FROM stdin;
10	Samsung Galaxy S9+	15000	30	13+5+5MP Triple rear camera	no size	2019-06-13 10:00:30.748328	2019-06-13 11:37:50.826244	4	["sam7.jpeg"]
4	Galaxy S10	3000	30	13+5+5MP Triple rear camera	no size	2019-06-13 10:00:30.699624	2019-06-13 11:38:09.959791	4	["sam1.jpeg"]
13	Nokia 8 Sirocco	30000	30	Memory, Storage and SIM 4GB RAM | 64GB internal memory	no size	2019-06-13 10:00:30.773773	2019-06-13 10:23:11.919946	3	["sam8.jpeg","sam7.jpeg","sam6.jpeg","sam5.jpeg","sam4.jpeg"]
15	Nokia 8	60000	30	Memory, Storage and SIM 4GB RAM | 64GB internal memory	no size	2019-06-13 10:00:30.79074	2019-06-13 10:23:21.494164	3	["sam4.jpeg","sam3.jpeg"]
17	Nokia 8.1	80000	30	Memory, Storage and SIM 4GB RAM | 64GB internal memory	no size	2019-06-13 10:00:30.80717	2019-06-13 10:23:29.363081	3	["sam10.jpeg","sam2.jpeg","sam1.jpeg"]
21	Motorola Milestone XT800	4500	30	5000mAH lithium-ion battery	no size	2019-06-13 10:00:30.84977	2019-06-13 10:24:09.747177	5	["moto10.jpeg","moto1.jpeg"]
23	Motorola Razr Maxx	10500	30	5000mAH lithium-ion battery	no size	2019-06-13 10:00:30.864736	2019-06-13 10:24:26.159106	5	["moto10.jpeg","moto3.jpeg","moto2.jpeg","moto1.jpeg"]
25	Motorola Moto X Style	10500	30	5000mAH lithium-ion battery	no size	2019-06-13 10:00:30.882219	2019-06-13 10:24:36.522987	5	["moto3.jpeg"]
27	Motorola Droid Ultra	10900	30	5000mAH lithium-ion battery	no size	2019-06-13 10:00:30.898885	2019-06-13 10:24:49.896446	5	["moto4.jpeg"]
29	Motorola Milestone XT700	10700	30	5000mAH lithium-ion battery	no size	2019-06-13 10:00:30.91581	2019-06-13 10:25:06.31118	5	["moto5.jpeg"]
14	Nokia Lumia	40000	30	Memory, Storage and SIM 4GB RAM | 64GB internal memory	no size	2019-06-13 10:00:30.782561	2019-06-13 10:26:26.850379	3	["moto7.jpeg"]
48	Roadster-Black & Grey Printed Polo T-shirt	899	30	Black & Grey Printed Polo T-shirt	no size	2019-06-13 10:00:31.082037	2019-06-13 11:12:54.954419	1	["11470647913061-Roadster-Black--Grey-Printed-Polo-T-shirt-9481470647912943-4.jpg"]
37	OPPO A6s	10700	30	Handset, Travel Adapter, USB Cable, Ejection Pin	no size	2019-06-13 10:00:30.98193	2019-06-13 10:26:52.432121	2	["moto9.jpeg"]
39	OPPO A77	10300	30	Handset, Travel Adapter, USB Cable, Ejection Pin	no size	2019-06-13 10:00:31.007479	2019-06-13 10:27:02.834752	2	["moto10.jpeg"]
43	Roadster-Men Black Regular Fit Solid Casual Shirt	10700	30	Black Regular Fit Solid Casual Shirt	no size	2019-06-13 10:00:31.041177	2019-06-13 10:28:18.262484	1	["11511431472633-Roadster-Men-Black-Regular-Fit-Solid-Casual-Shirt-8801511431472500-1.jpg"]
46	Roadster-Women Burgundy Solid High-Low Top	499	30	Burgundy Solid High-Low Top	no size	2019-06-13 10:00:31.064782	2019-06-13 10:44:41.17022	1	["08ba64ff-1261-4e1e-a293-31a78a989aae1557462026034-Roadster-Women-Maroon-Solid-High-Low-Top-5021557462024390-1.jpg"]
47	Roadster-Women Mustard Yellow Solid Boat Neck T-shirt	899	30	Mustard Yellow Solid Boat Neck T-shirt	no size	2019-06-13 10:00:31.073202	2019-06-13 10:45:01.779997	1	["11497332701241-Roadster-Women-Mustard-Solid-Boat-Neck-T-shirt-7541497332700950-1.jpg"]
49	Roadster-Women Pack of 2 T-shirts	899	30	Pack of 2 T-shirts	no size	2019-06-13 10:00:31.090182	2019-06-13 10:45:19.19742	1	["bc098660-c26e-4316-9656-7f626d9f91fc1543408246899-Roadster-Pack-of-2-T-shirts-9731543408246118-1.jpg"]
44	Roadster-Men Black & Green Regular Fit Checked Casual Shirt	300	30	Black & Green Regular Fit Checked Casual Shirt	no size	2019-06-13 10:00:31.049267	2019-06-13 10:53:58.801888	1	["11506510782416-Roadster-Men-Black--Green-Regular-Fit-Checked-Casual-Shirt-5561506510782069-1.jpg"]
8	Galaxy A2 Core	7000	28	13+5+5MP Triple rear camera	no size	2019-06-13 10:00:30.73285	2019-06-13 12:25:52.582937	4	["sam8.jpeg"]
3	Galaxy S10+	2000	30	13+5+5MP Triple rear camera	no size	2019-06-13 10:00:30.691702	2019-06-13 10:58:26.876154	4	["sam9.jpeg"]
2	Galaxy S10 5G	1000	30	13+5+5MP Triple rear camera	no size	2019-06-13 10:00:30.675129	2019-06-13 11:37:56.749542	4	["sam3.jpeg"]
5	Galaxy S10e	4000	30	13+5+5MP Triple rear camera	no size	2019-06-13 10:00:30.706878	2019-06-13 11:38:03.019085	4	["sam2.jpeg"]
12	Nokia 808 Pure	20000	30	Memory, Storage and SIM 4GB RAM | 64GB internal memory	no size	2019-06-13 10:00:30.765023	2019-06-13 11:07:26.700969	3	["nokia1.jpeg"]
16	Nokia 7 Plus	70000	30	Memory, Storage and SIM 4GB RAM | 64GB internal memory	no size	2019-06-13 10:00:30.798848	2019-06-13 11:07:33.781573	3	["nokia2.jpeg"]
20	Nokia 3.1 A	9000	30	Memory, Storage and SIM 4GB RAM | 64GB internal memory	no size	2019-06-13 10:00:30.841177	2019-06-13 11:07:52.29627	3	["nokia4.jpeg"]
22	Motorola Moto Turbo	1050	30	5000mAH lithium-ion battery	no size	2019-06-13 10:00:30.856694	2019-06-13 11:08:57.149664	5	["moto1.jpeg"]
24	Motorola Moto Z2 Force	19000	30	5000mAH lithium-ion battery	no size	2019-06-13 10:00:30.873362	2019-06-13 11:09:03.072985	5	["moto2.jpeg"]
26	Motorola Droid Turbo	10090	30	5000mAH lithium-ion battery	no size	2019-06-13 10:00:30.890546	2019-06-13 11:09:09.149497	5	["moto3.jpeg"]
28	Motorola Moto G Turbo Edition	10700	30	5000mAH lithium-ion battery	no size	2019-06-13 10:00:30.907309	2019-06-13 11:09:14.920921	5	["moto5.jpeg"]
30	Motorola One Power	10700	30	5000mAH lithium-ion battery	no size	2019-06-13 10:00:30.923988	2019-06-13 11:09:24.361147	5	["moto8.jpeg","moto7.jpeg"]
32	OPPO A5s	25000	30	Handset, Travel Adapter, USB Cable, Ejection Pin	no size	2019-06-13 10:00:30.940518	2019-06-13 11:10:06.721195	2	["oppo1.jpeg"]
33	OPPO A3s	10200	30	Handset, Travel Adapter, USB Cable, Ejection Pin	no size	2019-06-13 10:00:30.949429	2019-06-13 11:10:12.670787	2	["oppo5.jpeg"]
36	OPPO Reno	10700	30	Handset, Travel Adapter, USB Cable, Ejection Pin	no size	2019-06-13 10:00:30.973263	2019-06-13 11:10:49.250759	2	["oppo7.jpeg"]
38	OPPO F9 Pro	10700	30	Handset, Travel Adapter, USB Cable, Ejection Pin	no size	2019-06-13 10:00:30.99544	2019-06-13 11:10:57.467404	2	["oppo9.jpeg"]
35	OPPO A7	10700	30	Handset, Travel Adapter, USB Cable, Ejection Pin	no size	2019-06-13 10:00:30.964727	2019-06-13 11:11:31.498042	2	["oppo2.jpeg"]
7	Galaxy Watch Active	6000	30	13+5+5MP Triple rear camera	no size	2019-06-13 10:00:30.724511	2019-06-13 11:36:36.638427	4	["sam1.jpeg"]
9	Samsung W2019	10000	30	13+5+5MP Triple rear camera	no size	2019-06-13 10:00:30.740553	2019-06-13 11:36:45.416614	4	["sam2.jpeg"]
11	Nokia Lumia 635	10000	30	Memory, Storage and SIM 4GB RAM | 64GB internal memory	no size	2019-06-13 10:00:30.756442	2019-06-13 10:23:01.73646	3	["sam10.jpeg","sam9.jpeg","sam8.jpeg","sam7.jpeg","sam6.jpeg"]
19	Nokia 3.1 C	9000	30	Memory, Storage and SIM 4GB RAM | 64GB internal memory	no size	2019-06-13 10:00:30.824001	2019-06-13 10:23:43.476426	3	["sam10.jpeg","sam4.jpeg","sam3.jpeg","sam2.jpeg","sam1.jpeg"]
31	Oppo	2000	30	Handset, Travel Adapter, USB Cable, Ejection Pin	no size	2019-06-13 10:00:30.931847	2019-06-13 10:25:18.831824	2	["moto6.jpeg","moto5.jpeg"]
41	Roadster-Men Brown & Black Slim Fit Checked Casual Shirt	700	30	Brown & Black Slim Fit Checked Casual Shirt	no size	2019-06-13 10:00:31.023852	2019-06-13 10:27:55.170763	1	["11510749192975-Roadster-Men-Brown--Black-Regular-Fit-Checked-Casual-Shirt-8071510749192783-1.jpg"]
45	Roadster-Women Red & White Striped Top with Gathered Sleeves	299	30	Red & White Striped Top with Gathered Sleeves	no size	2019-06-13 10:00:31.056628	2019-06-13 10:53:18.459082	1	["6ac94681-2dfe-4e0d-8fb7-64484c9c13fe1555410690582-Roadster-Women-Red-Striped-Top-1681555410689485-1.jpg"]
40	Roadster-Men Blue Regular Fit Printed Casual Shirt	1700	30	Blue Regular Fit Printed Casual Shirt	no size	2019-06-13 10:00:31.015625	2019-06-13 10:53:36.40367	1	["08ba64ff-1261-4e1e-a293-31a78a989aae1557462026034-Roadster-Women-Maroon-Solid-High-Low-Top-5021557462024390-1.jpg"]
6	Galaxy Fold	5000	30	13+5+5MP Triple rear camera	no size	2019-06-13 10:00:30.715841	2019-06-13 11:37:29.368298	4	["sam9.jpeg"]
18	Nokia Lumia 820	9000	30	Memory, Storage and SIM 4GB RAM | 64GB internal memory	no size	2019-06-13 10:00:30.815903	2019-06-13 11:07:41.042675	3	["nokia4.jpeg"]
34	OPPO K1	10500	30	Handset, Travel Adapter, USB Cable, Ejection Pin	no size	2019-06-13 10:00:30.956658	2019-06-13 11:10:41.934309	2	["oppo4.jpeg"]
42	Roadster-Men Navy Blue & Grey Slim Fit Checked Casual Shirt	500	30	Navy Blue & Grey Slim Fit Checked Casual Shirt	no size	2019-06-13 10:00:31.032239	2019-06-13 11:12:24.912129	1	["265a9cd7-8230-4a2c-9e8d-3fd98aa6e8061551695225874-Roadster-Men-Navy-Blue--Grey-Regular-Fit-Checked-Casual-Shir-1.jpg"]
70	Nike-Men's Solay Thong	899	30	Men's Solay Thong	no size	2019-06-13 11:18:42.606476	2019-06-13 11:20:16.528543	6	["fba5b25b-186d-4314-96f8-6b1e541165951528366923094-Mens-Nike-Solay-Thong-1731528366921721-1.jpg"]
71	Nike-Unisex Black Brand Logo Backpack	349	30	Unisex Black Brand Logo Backpack	no size	2019-06-13 11:18:42.616882	2019-06-13 11:21:16.63971	6	["11523523392584-Nike-Unisex-Black-Brand-Logo-Backpack-5501523523392463-1.jpg"]
72	Nike-Men Blue LEGEND REACT Running Shoes	349	30	Men Blue LEGEND REACT Running Shoes	no size	2019-06-13 11:18:42.624659	2019-06-13 11:21:24.917214	6	["41c8e2af-8184-48b1-9a8d-f0a190f579611549351850756-Nike-Men-Blue-LEGEND-REACT-Running-Shoes-1841549351849425-1.jpg"]
73	Nike-Men Black Printed AS DRI-FIT WILD RUN Standard Fit Round Neck T-shirt	349	30	Men Black Printed AS DRI-FIT WILD RUN Standard Fit Round Neck T-shirt	no size	2019-06-13 11:18:42.633284	2019-06-13 11:21:51.046546	6	["a780e057-c0fa-4188-87d4-bb2abf67d7281557301133758-Nike-Men-Black-Solid-Standard-Fit-Round-Neck-AS-M-NK-DRI-FIT-1.jpg"]
74	Nike-Men Black & White Graphic Rpm Backpack	349	30	Men Black & White Graphic Rpm Backpack	no size	2019-06-13 11:18:42.641217	2019-06-13 11:22:11.193516	6	["7f166131-a774-4432-8f25-64687520cc921556016875305-Nike-Men-Black--White-Graphic-Rpm-Backpack-6271556016874062-1.jpg"]
75	Nike-Girls Peach-Coloured Solid Round Neck T-shirt	349	30	Girls Peach-Coloured Solid Round Neck T-shirt	no size	2019-06-13 11:18:42.649158	2019-06-13 11:22:20.760228	6	["46f3c4e3-3012-436d-aa3f-e47e5374e8731540966453459-Nike-Girls-Peach-Coloured-Solid-Round-Neck-T-shirt-854154096-1.jpg"]
76	Nike-Grey Melange CF JSY CLUB KNIT Joggers	599	30	Grey Melange CF JSY CLUB KNIT Joggers	no size	2019-06-13 11:18:42.65763	2019-06-13 11:22:31.342059	6	["11509338603383-Nike-Grey-Melange-CF-JSY-CLUB-KNIT-Joggers-1911509338603174-1.jpg"]
77	Nike-Women Blue Self Design Round Neck Dri-Fit SS Running T-shirt	599	30	Women Blue Self Design Round Neck Dri-Fit SS Running T-shirt	no size	2019-06-13 11:18:42.666398	2019-06-13 11:23:07.703505	6	["55030b13-9756-44d4-a1cb-28b416c850971559982488374-Nike-Women-Blue-Self-Design-Round-Neck-T-shirt-7481559982486-1.jpg"]
78	Nike-Men Black & White Printed AS M NSW HYBRID 1 FS Round Neck T-shirt	599	24	Men Black & White Printed AS M NSW HYBRID 1 FS Round Neck T-shirt	no size	2019-06-13 11:18:42.674346	2019-06-13 11:25:47.276363	6	["2ada6196-b308-4a35-bbc7-6d1af38721d81558003690300-Nike-Men-Black-Printed-Round-Neck-T-shirt-6061558003688842-1.jpg"]
79	Nike-Men Blue Solid KEPA KAI Thong Flip-Flops	599	24	Men Blue Solid KEPA KAI Thong Flip-Flops	no size	2019-06-13 11:18:42.682395	2019-06-13 11:26:29.116514	6	["fba5b25b-186d-4314-96f8-6b1e541165951528366923094-Mens-Nike-Solay-Thong-1731528366921721-1.jpg"]
80	Adidas-Men Grey & White Beach Print Maxout 2 Thong Flip-Flops	599	30	Men Grey & White Beach Print Maxout 2 Thong Flip-Flops	no size	2019-06-13 11:18:42.691041	2019-06-13 11:28:50.560896	7	["0717cc1c-edad-4f9d-82c0-538b084da7411552990162163-ADIDAS-Men-Flip-Flops-6011552990161291-1.jpg"]
81	Adidas-Men Green Stan Smith Leather Sneakers	599	30	Men Green Stan Smith Leather Sneakers	no size	2019-06-13 11:18:42.699624	2019-06-13 11:29:07.251979	7	["4519db0c-d069-48cb-bc07-038dfce415661550659434134-ADIDAS-Originals-Men-Casual-Shoes-8321550659432878-1.jpg"]
82	Adidas-Unisex Olive Green & Beige Training Linear Core Graphic Printed Backpack	599	30	Unisex Olive Green & Beige Training Linear Core Graphic Printed Backpack	no size	2019-06-13 11:18:42.707901	2019-06-13 11:29:21.900719	7	["a4b559fd-fc24-4a27-81ae-90a6f22e9fe71559280804292-ADIDAS-Unisex-Backpacks-6371559280802584-1.jpg"]
83	Adidas-Women Black Solid OWN THE RUN LS Round Neck T-shirt	599	30	Women Black Solid OWN THE RUN LS Round Neck T-shirt	no size	2019-06-13 11:18:42.716134	2019-06-13 11:30:20.500717	7	["d34b0eeb-0811-45b7-9d9a-b438297cf24e1552453314453-ADIDAS-Originals-Women-Tshirts-8441552453313146-1.jpg"]
84	Adidasp-Unisex Mustard Yellow Continental Vulc Sneakers	599	30	Unisex Mustard Yellow Continental Vulc Sneakers	no size	2019-06-13 11:18:42.724104	2019-06-13 11:30:28.624175	7	["e10839f0-f7ae-4737-b5a0-e3262b7251741559207275649-ADIDAS-Unisex-Yellow-CONTINENTAL-VULC-Casual-Shoes-155155920-1.jpg"]
86	Adidas-Men White Samba RM Leather Sneakers	599	30	Men White Samba RM Leather Sneakers	no size	2019-06-13 11:18:42.742814	2019-06-13 11:31:21.932466	7	["d9347db1-9310-4346-9aa9-e9dcb5473e891549537170476-ADIDAS-Originals-Men-White-Samba-RM-Leather-Sneakers-8491549-1.jpg"]
88	Adidas-Men Burgundy Continental 80 Sneakers	599	30	Men Burgundy Continental 80 Sneakers	no size	2019-06-13 11:18:42.765486	2019-06-13 11:31:44.230106	7	["60d214f8-d9ec-421a-a732-9d679130d2c31554384877213-ADIDAS-Originals-Men-Burgundy-Continental-80-Sneakers-840155-1.jpg"]
89	Adidas-Men Black Printed TREFOIL T-shirt	599	30	Men Black Printed TREFOIL T-shirt	no size	2019-06-13 11:18:42.773907	2019-06-13 11:32:29.600435	7	["a78bf630-5e84-43c5-96f5-436850c9e3691531126476771-Adidas-Originals-Men-Black-Printed-Round-Neck-T-shirt-961531126476583-1.jpg"]
1	Galaxy View2	1000	30	13+5+5MP Triple rear camera	no size	2019-06-13 10:00:30.633084	2019-06-13 11:37:23.314562	4	["sam10.jpeg"]
85	Adidas-Women Orange Trefoil Print Round Neck T-shirt	599	30	Women Orange Trefoil Print Round Neck T-shirt	no size	2019-06-13 11:18:42.732593	2019-06-13 11:31:04.296126	7	["d34b0eeb-0811-45b7-9d9a-b438297cf24e1552453314453-ADIDAS-Originals-Women-Tshirts-8441552453313146-1.jpg"]
87	Adidas-Men Teal Blue Terrex AX3 Trekking Shoes	599	30	Men Teal Blue Terrex AX3 Trekking Shoes	no size	2019-06-13 11:18:42.7577	2019-06-13 11:31:34.431681	7	["a64a0b43-de34-41b8-b6b3-92f410fad07e1553071946074-ADIDAS-Men-Teal-Blue-Terrex-AX3-Trekking-Shoes-6171553071944-1.jpg"]
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.roles (id, name, created_at, updated_at) FROM stdin;
1	admin	2019-06-13 06:50:34.168999	2019-06-13 06:50:34.168999
2	customer	2019-06-13 06:52:07.27742	2019-06-13 06:52:07.27742
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.schema_migrations (version) FROM stdin;
20190507141207
20190507142159
20190507143217
20190507144217
20190507145535
20190507150012
20190507150138
20190508062331
20190508091030
20190508091256
20190510065348
20190513062245
20190514130725
20190514133746
20190515065306
20190515074547
20190523082722
20190523102431
20190523105530
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users (id, name, address, role, password, c_password, gender, created_at, updated_at, role_id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at) FROM stdin;
2	Ashwini Mandal	Ground Floor, Mariplex mall,, next to Axis bank, kalyani nagar, Pune, Maharashtra 411014	\N	\N	\N	\N	2019-06-13 07:03:11.044629	2019-06-13 07:03:11.044629	2	ashwini.mandal@cuelogic.com	$2a$11$v9YPmiTU6ITMSJz99SYMx.PIauMbln.g3WAgvjo/q6..bni2cSE.S	\N	\N	\N
3	Dhanshri Joshi		\N	\N	123456	\N	2019-06-13 07:09:36.567293	2019-06-13 07:11:38.54355	2	dhanashri.joshi@cuelogic.com	$2a$11$JYls3ay/Vl97bUbYcOOZLOh68tiXxFSgohYqPq3ynCvZtxe.VIGaG	\N	\N	\N
4	Monali Shinde	Unit 503, 5th Floor, Godrej Castlemaine, Bund Garden Road, Next To Ruby Hall Clinic, Pune, Maharashtra 411001 Hours: Open ⋅ Closes 7PM	\N	\N	\N	\N	2019-06-13 07:14:50.748022	2019-06-13 07:14:50.748022	1	monali.shinde@cuelogic.com	$2a$11$qtGKm3II3xx/AT.Yk2W/XeW5vN2hOrxQOKlPo/GGo0HB5thKoQId.	\N	\N	\N
5	Nikhil Thombare	 Boat Club Rd, Bund Garden, Sangamvadi, Pune, Maharashtra 411001	\N	\N	\N	\N	2019-06-13 07:17:09.147105	2019-06-13 07:17:09.147105	2	nikhil.thombare@cuelogic.com	$2a$11$s7LDU3y7MmhI/XgSy0udhOYGOVIvVPPCi3S2ZQxlxNoxoCeJb77VS	\N	\N	\N
\.


--
-- Name: brands_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.brands_id_seq', 7, true);


--
-- Name: carts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.carts_id_seq', 1, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.products_id_seq', 89, true);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.roles_id_seq', 2, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 5, true);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: brands brands_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.brands
    ADD CONSTRAINT brands_pkey PRIMARY KEY (id);


--
-- Name: carts carts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.carts
    ADD CONSTRAINT carts_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_carts_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_carts_on_user_id ON public.carts USING btree (user_id);


--
-- Name: index_products_on_brand_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_products_on_brand_id ON public.products USING btree (brand_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: index_users_on_role_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_users_on_role_id ON public.users USING btree (role_id);


--
-- PostgreSQL database dump complete
--

