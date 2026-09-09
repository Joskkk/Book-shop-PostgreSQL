--
-- PostgreSQL database dump
--

\restrict DP3nWwaCceId9nqbEk3hlPTzOF5xE1hoVt0duQejG8fxV4Gf0RANmGuVPW0bn03

-- Dumped from database version 16.11 (Ubuntu 16.11-1.pgdg24.04+1)
-- Dumped by pg_dump version 16.11 (Ubuntu 16.11-1.pgdg24.04+1)

-- Started on 2026-09-09 07:34:36 MSK

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
-- TOC entry 5 (class 2615 OID 73955)
-- Name: public; Type: SCHEMA; Schema: -; Owner: student
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO student;

--
-- TOC entry 3476 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: student
--

COMMENT ON SCHEMA public IS '';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 216 (class 1259 OID 73957)
-- Name: books; Type: TABLE; Schema: public; Owner: student
--

CREATE TABLE public.books (
    book_id integer NOT NULL,
    title character varying(200) NOT NULL,
    author character varying(100) NOT NULL,
    genre character varying(50),
    price numeric(8,2),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT books_price_check CHECK ((price > (0)::numeric))
);


ALTER TABLE public.books OWNER TO student;

--
-- TOC entry 215 (class 1259 OID 73956)
-- Name: books_book_id_seq; Type: SEQUENCE; Schema: public; Owner: student
--

CREATE SEQUENCE public.books_book_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.books_book_id_seq OWNER TO student;

--
-- TOC entry 3478 (class 0 OID 0)
-- Dependencies: 215
-- Name: books_book_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: student
--

ALTER SEQUENCE public.books_book_id_seq OWNED BY public.books.book_id;


--
-- TOC entry 219 (class 1259 OID 73972)
-- Name: inventory; Type: TABLE; Schema: public; Owner: student
--

CREATE TABLE public.inventory (
    store_id integer NOT NULL,
    book_id integer NOT NULL,
    quantity integer,
    CONSTRAINT inventory_quantity_check CHECK ((quantity >= 0))
);


ALTER TABLE public.inventory OWNER TO student;

--
-- TOC entry 221 (class 1259 OID 73989)
-- Name: sales; Type: TABLE; Schema: public; Owner: student
--

CREATE TABLE public.sales (
    sale_id integer NOT NULL,
    book_id integer,
    store_id integer,
    quantity integer,
    revenue numeric(10,2),
    sale_date date DEFAULT CURRENT_DATE,
    CONSTRAINT sales_quantity_check CHECK ((quantity > 0))
);


ALTER TABLE public.sales OWNER TO student;

--
-- TOC entry 220 (class 1259 OID 73988)
-- Name: sales_sale_id_seq; Type: SEQUENCE; Schema: public; Owner: student
--

CREATE SEQUENCE public.sales_sale_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sales_sale_id_seq OWNER TO student;

--
-- TOC entry 3479 (class 0 OID 0)
-- Dependencies: 220
-- Name: sales_sale_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: student
--

ALTER SEQUENCE public.sales_sale_id_seq OWNED BY public.sales.sale_id;


--
-- TOC entry 218 (class 1259 OID 73966)
-- Name: stores; Type: TABLE; Schema: public; Owner: student
--

CREATE TABLE public.stores (
    store_id integer NOT NULL,
    store_name character varying(100) NOT NULL,
    city character varying(100) NOT NULL
);


ALTER TABLE public.stores OWNER TO student;

--
-- TOC entry 217 (class 1259 OID 73965)
-- Name: stores_store_id_seq; Type: SEQUENCE; Schema: public; Owner: student
--

CREATE SEQUENCE public.stores_store_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.stores_store_id_seq OWNER TO student;

--
-- TOC entry 3480 (class 0 OID 0)
-- Dependencies: 217
-- Name: stores_store_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: student
--

ALTER SEQUENCE public.stores_store_id_seq OWNED BY public.stores.store_id;


--
-- TOC entry 3301 (class 2604 OID 73960)
-- Name: books book_id; Type: DEFAULT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.books ALTER COLUMN book_id SET DEFAULT nextval('public.books_book_id_seq'::regclass);


--
-- TOC entry 3304 (class 2604 OID 73992)
-- Name: sales sale_id; Type: DEFAULT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.sales ALTER COLUMN sale_id SET DEFAULT nextval('public.sales_sale_id_seq'::regclass);


--
-- TOC entry 3303 (class 2604 OID 73969)
-- Name: stores store_id; Type: DEFAULT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.stores ALTER COLUMN store_id SET DEFAULT nextval('public.stores_store_id_seq'::regclass);


--
-- TOC entry 3465 (class 0 OID 73957)
-- Dependencies: 216
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: student
--

COPY public.books (book_id, title, author, genre, price, created_at) FROM stdin;
1	1984	George Orwell	Dystopia	500.00	2026-07-29 14:47:30.456854
2	Animal Farm	George Orwell	Classic	300.00	2026-07-29 14:47:30.456854
3	Crime and Punishment	Fyodor Dostoevsky	Classic	650.00	2026-07-29 14:47:30.456854
4	The Brothers Karamazov	Fyodor Dostoevsky	Classic	700.00	2026-07-29 14:47:30.456854
5	Harry Potter and the Philosopher Stone	J.K. Rowling	Fantasy	800.00	2026-07-29 14:47:30.456854
6	Harry Potter and the Chamber of Secrets	J.K. Rowling	Fantasy	850.00	2026-07-29 14:47:30.456854
7	Dune	Frank Herbert	Science Fiction	900.00	2026-07-29 14:47:30.456854
8	Dune Messiah	Frank Herbert	Science Fiction	750.00	2026-07-29 14:47:30.456854
9	Clean Code	Robert Martin	Programming	1200.00	2026-07-29 14:47:30.456854
10	The Clean Coder	Robert Martin	Programming	950.00	2026-07-29 14:47:30.456854
11	The Hobbit	J.R.R. Tolkien	Fantasy	600.00	2026-07-29 14:47:30.456854
12	Foundation	Isaac Asimov	Science Fiction	550.00	2026-07-29 14:47:30.456854
13	The Da Vinci Code	Dan Brown	Detective	450.00	2026-07-29 14:47:30.456854
14	The Idiot	Fyodor Dostoevsky	Classic	500.00	2026-07-29 14:47:30.456854
15	Effective Java	Joshua Bloch	Programming	1100.00	2026-07-29 14:47:30.456854
\.


--
-- TOC entry 3468 (class 0 OID 73972)
-- Dependencies: 219
-- Data for Name: inventory; Type: TABLE DATA; Schema: public; Owner: student
--

COPY public.inventory (store_id, book_id, quantity) FROM stdin;
1	1	15
1	2	20
1	5	8
1	7	12
1	9	5
1	11	10
2	1	7
2	3	15
2	6	10
2	8	6
2	10	9
3	4	5
3	5	12
3	7	8
3	12	14
2	15	6
3	13	7
\.


--
-- TOC entry 3470 (class 0 OID 73989)
-- Dependencies: 221
-- Data for Name: sales; Type: TABLE DATA; Schema: public; Owner: student
--

COPY public.sales (sale_id, book_id, store_id, quantity, revenue, sale_date) FROM stdin;
1	1	1	5	2500.00	2026-07-01
2	2	1	3	900.00	2026-07-01
3	5	1	4	3200.00	2026-07-01
4	1	2	2	1000.00	2026-07-02
5	3	2	6	3900.00	2026-07-02
6	10	2	3	2850.00	2026-07-02
7	7	3	5	4500.00	2026-07-03
8	12	3	4	2200.00	2026-07-03
9	13	3	2	900.00	2026-07-03
10	9	1	1	1200.00	2026-07-04
11	15	2	2	2200.00	2026-07-04
12	11	3	3	1800.00	2026-07-04
\.


--
-- TOC entry 3467 (class 0 OID 73966)
-- Dependencies: 218
-- Data for Name: stores; Type: TABLE DATA; Schema: public; Owner: student
--

COPY public.stores (store_id, store_name, city) FROM stdin;
1	Central Book Store	Amsterdam
2	Knowledge Center	Rotterdam
3	Readers House	Utrecht
\.


--
-- TOC entry 3481 (class 0 OID 0)
-- Dependencies: 215
-- Name: books_book_id_seq; Type: SEQUENCE SET; Schema: public; Owner: student
--

SELECT pg_catalog.setval('public.books_book_id_seq', 15, true);


--
-- TOC entry 3482 (class 0 OID 0)
-- Dependencies: 220
-- Name: sales_sale_id_seq; Type: SEQUENCE SET; Schema: public; Owner: student
--

SELECT pg_catalog.setval('public.sales_sale_id_seq', 12, true);


--
-- TOC entry 3483 (class 0 OID 0)
-- Dependencies: 217
-- Name: stores_store_id_seq; Type: SEQUENCE SET; Schema: public; Owner: student
--

SELECT pg_catalog.setval('public.stores_store_id_seq', 3, true);


--
-- TOC entry 3310 (class 2606 OID 73964)
-- Name: books books_pkey; Type: CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_pkey PRIMARY KEY (book_id);


--
-- TOC entry 3314 (class 2606 OID 73977)
-- Name: inventory inventory_pkey; Type: CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT inventory_pkey PRIMARY KEY (store_id, book_id);


--
-- TOC entry 3316 (class 2606 OID 73996)
-- Name: sales sales_pkey; Type: CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.sales
    ADD CONSTRAINT sales_pkey PRIMARY KEY (sale_id);


--
-- TOC entry 3312 (class 2606 OID 73971)
-- Name: stores stores_pkey; Type: CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.stores
    ADD CONSTRAINT stores_pkey PRIMARY KEY (store_id);


--
-- TOC entry 3317 (class 2606 OID 73983)
-- Name: inventory inventory_book_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT inventory_book_id_fkey FOREIGN KEY (book_id) REFERENCES public.books(book_id);


--
-- TOC entry 3318 (class 2606 OID 73978)
-- Name: inventory inventory_store_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT inventory_store_id_fkey FOREIGN KEY (store_id) REFERENCES public.stores(store_id);


--
-- TOC entry 3319 (class 2606 OID 73997)
-- Name: sales sales_book_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.sales
    ADD CONSTRAINT sales_book_id_fkey FOREIGN KEY (book_id) REFERENCES public.books(book_id);


--
-- TOC entry 3320 (class 2606 OID 74002)
-- Name: sales sales_store_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.sales
    ADD CONSTRAINT sales_store_id_fkey FOREIGN KEY (store_id) REFERENCES public.stores(store_id);


--
-- TOC entry 3477 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: student
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;


-- Completed on 2026-09-09 07:34:37 MSK

--
-- PostgreSQL database dump complete
--

\unrestrict DP3nWwaCceId9nqbEk3hlPTzOF5xE1hoVt0duQejG8fxV4Gf0RANmGuVPW0bn03

