--
-- PostgreSQL database dump
--

-- Dumped from database version 13.4
-- Dumped by pg_dump version 13.4

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
-- Name: adm; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA adm;


ALTER SCHEMA adm OWNER TO postgres;

--
-- Name: test; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA test;


ALTER SCHEMA test OWNER TO postgres;

--
-- Name: exercise_seq; Type: SEQUENCE; Schema: adm; Owner: postgres
--

CREATE SEQUENCE adm.exercise_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE adm.exercise_seq OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: exercise; Type: TABLE; Schema: adm; Owner: postgres
--

CREATE TABLE adm.exercise (
    idexercise integer DEFAULT nextval('adm.exercise_seq'::regclass) NOT NULL,
    title character varying(45) NOT NULL,
    description character varying(45),
    modulecode integer NOT NULL
);


ALTER TABLE adm.exercise OWNER TO postgres;

--
-- Name: module_seq; Type: SEQUENCE; Schema: adm; Owner: postgres
--

CREATE SEQUENCE adm.module_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE adm.module_seq OWNER TO postgres;

--
-- Name: module; Type: TABLE; Schema: adm; Owner: postgres
--

CREATE TABLE adm.module (
    idmodule integer DEFAULT nextval('adm.module_seq'::regclass) NOT NULL,
    title character varying(45) NOT NULL,
    description character varying(45)
);


ALTER TABLE adm.module OWNER TO postgres;

--
-- Name: people; Type: TABLE; Schema: adm; Owner: postgres
--

CREATE TABLE adm.people (
    id integer NOT NULL,
    username character varying(20) NOT NULL,
    apppassword character varying(20) NOT NULL,
    firstname character varying(30) NOT NULL,
    lastname character varying(30) NOT NULL,
    email character varying(30),
    phone character varying(20),
    birthdate date NOT NULL,
    card character varying(20),
    visible smallint
);


ALTER TABLE adm.people OWNER TO postgres;

--
-- Name: session_seq; Type: SEQUENCE; Schema: adm; Owner: postgres
--

CREATE SEQUENCE adm.session_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE adm.session_seq OWNER TO postgres;

--
-- Name: session; Type: TABLE; Schema: adm; Owner: postgres
--

CREATE TABLE adm.session (
    idsession integer DEFAULT nextval('adm.session_seq'::regclass) NOT NULL,
    sessiondate timestamp(0) without time zone NOT NULL,
    carercode integer NOT NULL,
    adultcode integer NOT NULL
);


ALTER TABLE adm.session OWNER TO postgres;

--
-- Name: session_exercise_seq; Type: SEQUENCE; Schema: adm; Owner: postgres
--

CREATE SEQUENCE adm.session_exercise_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE adm.session_exercise_seq OWNER TO postgres;

--
-- Name: session_exercise; Type: TABLE; Schema: adm; Owner: postgres
--

CREATE TABLE adm.session_exercise (
    idsession_exercise integer DEFAULT nextval('adm.session_exercise_seq'::regclass) NOT NULL,
    sessioncode integer NOT NULL,
    exercisecode integer NOT NULL
);


ALTER TABLE adm.session_exercise OWNER TO postgres;

--
-- Name: tbl_people; Type: TABLE; Schema: adm; Owner: postgres
--

CREATE TABLE adm.tbl_people (
    id integer NOT NULL,
    name character varying(30) NOT NULL,
    apppassword character varying(30) NOT NULL
);


ALTER TABLE adm.tbl_people OWNER TO postgres;

--
-- Name: people; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.people (
    id integer NOT NULL,
    username character varying(20) NOT NULL,
    apppassword character varying(20) NOT NULL,
    firstname character varying(30) NOT NULL,
    lastname character varying(30) NOT NULL,
    email character varying(30),
    phone character varying(20),
    birthdate date NOT NULL,
    card character varying(20),
    visible smallint
);


ALTER TABLE public.people OWNER TO postgres;

--
-- Name: session; Type: TABLE; Schema: test; Owner: postgres
--

CREATE TABLE test.session (
    id integer NOT NULL,
    id_user integer NOT NULL,
    id_adult integer NOT NULL,
    correct integer,
    wrong integer,
    date date,
    observations text,
    exercises text
);


ALTER TABLE test.session OWNER TO postgres;

--
-- Name: session_id; Type: SEQUENCE; Schema: test; Owner: postgres
--

CREATE SEQUENCE test.session_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999
    CACHE 1;


ALTER TABLE test.session_id OWNER TO postgres;

--
-- Name: session_id_seq; Type: SEQUENCE; Schema: test; Owner: postgres
--

ALTER TABLE test.session ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME test.session_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: tbl_adult; Type: TABLE; Schema: test; Owner: postgres
--

CREATE TABLE test.tbl_adult (
    id integer NOT NULL,
    name character varying(30) NOT NULL,
    birth_date date NOT NULL
);


ALTER TABLE test.tbl_adult OWNER TO postgres;

--
-- Name: tbl_user; Type: TABLE; Schema: test; Owner: postgres
--

CREATE TABLE test.tbl_user (
    id integer NOT NULL,
    name character varying(30) NOT NULL,
    email character varying(40) NOT NULL,
    apppassword character varying(30) NOT NULL,
    cellphone character varying(20) NOT NULL,
    birth_date date NOT NULL
);


ALTER TABLE test.tbl_user OWNER TO postgres;

--
-- Data for Name: exercise; Type: TABLE DATA; Schema: adm; Owner: postgres
--

COPY adm.exercise (idexercise, title, description, modulecode) FROM stdin;
\.


--
-- Data for Name: module; Type: TABLE DATA; Schema: adm; Owner: postgres
--

COPY adm.module (idmodule, title, description) FROM stdin;
\.


--
-- Data for Name: people; Type: TABLE DATA; Schema: adm; Owner: postgres
--

COPY adm.people (id, username, apppassword, firstname, lastname, email, phone, birthdate, card, visible) FROM stdin;
\.


--
-- Data for Name: session; Type: TABLE DATA; Schema: adm; Owner: postgres
--

COPY adm.session (idsession, sessiondate, carercode, adultcode) FROM stdin;
\.


--
-- Data for Name: session_exercise; Type: TABLE DATA; Schema: adm; Owner: postgres
--

COPY adm.session_exercise (idsession_exercise, sessioncode, exercisecode) FROM stdin;
\.


--
-- Data for Name: tbl_people; Type: TABLE DATA; Schema: adm; Owner: postgres
--

COPY adm.tbl_people (id, name, apppassword) FROM stdin;
1	juan	1234
2	1	1
1000372279	Juan Pablo	4444
\.


--
-- Data for Name: people; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.people (id, username, apppassword, firstname, lastname, email, phone, birthdate, card, visible) FROM stdin;
\.


--
-- Data for Name: session; Type: TABLE DATA; Schema: test; Owner: postgres
--

COPY test.session (id, id_user, id_adult, correct, wrong, date, observations, exercises) FROM stdin;
1	1	123456789	3	2	2021-10-14	Dificultades para recordar su infancia	1.1, 1.2, 1.3
2	1	1234	1	4	2021-10-14	lento para responder	1.1, 1.2, 1.3, 1.4, 1.5
3	1000372279	123456789	5	0	2021-10-14	Respondio de manera rapida y acertada.	1.1,1.2,1.3,1.4,1.5
5	1000372279	1234	5	0	2021-09-14	Ninguna.	1.1,1.2,1.3,1.4,1.5
6	1000372279	123456789	2	1	2021-09-19	Ninguna	1.1, 1.2, 1.3
\.


--
-- Data for Name: tbl_adult; Type: TABLE DATA; Schema: test; Owner: postgres
--

COPY test.tbl_adult (id, name, birth_date) FROM stdin;
123456789	Jane Doe	1927-01-07
1234	Jhon Doe	1954-01-13
\.


--
-- Data for Name: tbl_user; Type: TABLE DATA; Schema: test; Owner: postgres
--

COPY test.tbl_user (id, name, email, apppassword, cellphone, birth_date) FROM stdin;
1000372279	Juan Pablo Angel	juan.angel@ucp.edu.co	4444	3112528170	2000-04-04
1	Jhon Doe	jhon.doe@test.com	1234	3112223344	1990-01-01
555	Abril Gaviria	abi.gav@test.com	1	3112223242	1996-05-22
12345	Juan	juan@gmail.com	1234	3111111	1992-09-17
11111111	Rosario Iodice	rosario.iodice@ucp.edu.co	1234	3111111111	1990-01-01
11111112	Maria Luisa Nieto	luisa.nieto@ucp.edu.co	1234	3111111111	1990-01-01
11111113	Lida Patricia	lidapatriciar@gmail.com	1234	3111111111	1990-01-01
11111114	Andres Mauricio Martinez	andres.martinez@ucp.edu.co	1234	3111111111	1990-01-01
\.


--
-- Name: exercise_seq; Type: SEQUENCE SET; Schema: adm; Owner: postgres
--

SELECT pg_catalog.setval('adm.exercise_seq', 1, false);


--
-- Name: module_seq; Type: SEQUENCE SET; Schema: adm; Owner: postgres
--

SELECT pg_catalog.setval('adm.module_seq', 1, false);


--
-- Name: session_exercise_seq; Type: SEQUENCE SET; Schema: adm; Owner: postgres
--

SELECT pg_catalog.setval('adm.session_exercise_seq', 1, false);


--
-- Name: session_seq; Type: SEQUENCE SET; Schema: adm; Owner: postgres
--

SELECT pg_catalog.setval('adm.session_seq', 1, false);


--
-- Name: session_id; Type: SEQUENCE SET; Schema: test; Owner: postgres
--

SELECT pg_catalog.setval('test.session_id', 1, false);


--
-- Name: session_id_seq; Type: SEQUENCE SET; Schema: test; Owner: postgres
--

SELECT pg_catalog.setval('test.session_id_seq', 6, true);


--
-- Name: exercise exercise_pkey; Type: CONSTRAINT; Schema: adm; Owner: postgres
--

ALTER TABLE ONLY adm.exercise
    ADD CONSTRAINT exercise_pkey PRIMARY KEY (idexercise);


--
-- Name: module module_pkey; Type: CONSTRAINT; Schema: adm; Owner: postgres
--

ALTER TABLE ONLY adm.module
    ADD CONSTRAINT module_pkey PRIMARY KEY (idmodule);


--
-- Name: people people_pkey; Type: CONSTRAINT; Schema: adm; Owner: postgres
--

ALTER TABLE ONLY adm.people
    ADD CONSTRAINT people_pkey PRIMARY KEY (id);


--
-- Name: session_exercise session_exercise_pkey; Type: CONSTRAINT; Schema: adm; Owner: postgres
--

ALTER TABLE ONLY adm.session_exercise
    ADD CONSTRAINT session_exercise_pkey PRIMARY KEY (idsession_exercise);


--
-- Name: session session_pkey; Type: CONSTRAINT; Schema: adm; Owner: postgres
--

ALTER TABLE ONLY adm.session
    ADD CONSTRAINT session_pkey PRIMARY KEY (idsession);


--
-- Name: tbl_people tbl_people_pkey; Type: CONSTRAINT; Schema: adm; Owner: postgres
--

ALTER TABLE ONLY adm.tbl_people
    ADD CONSTRAINT tbl_people_pkey PRIMARY KEY (id);


--
-- Name: people people_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.people
    ADD CONSTRAINT people_pkey PRIMARY KEY (id);


--
-- Name: session session_pkey; Type: CONSTRAINT; Schema: test; Owner: postgres
--

ALTER TABLE ONLY test.session
    ADD CONSTRAINT session_pkey PRIMARY KEY (id);


--
-- Name: tbl_adult tbl_adult_pkey; Type: CONSTRAINT; Schema: test; Owner: postgres
--

ALTER TABLE ONLY test.tbl_adult
    ADD CONSTRAINT tbl_adult_pkey PRIMARY KEY (id);


--
-- Name: tbl_user tbl_user_pkey; Type: CONSTRAINT; Schema: test; Owner: postgres
--

ALTER TABLE ONLY test.tbl_user
    ADD CONSTRAINT tbl_user_pkey PRIMARY KEY (id);


--
-- Name: exercise candado1; Type: FK CONSTRAINT; Schema: adm; Owner: postgres
--

ALTER TABLE ONLY adm.exercise
    ADD CONSTRAINT candado1 FOREIGN KEY (modulecode) REFERENCES adm.module(idmodule);


--
-- Name: session candado2; Type: FK CONSTRAINT; Schema: adm; Owner: postgres
--

ALTER TABLE ONLY adm.session
    ADD CONSTRAINT candado2 FOREIGN KEY (carercode) REFERENCES adm.people(id);


--
-- Name: session candado3; Type: FK CONSTRAINT; Schema: adm; Owner: postgres
--

ALTER TABLE ONLY adm.session
    ADD CONSTRAINT candado3 FOREIGN KEY (adultcode) REFERENCES adm.people(id);


--
-- Name: session_exercise candado4; Type: FK CONSTRAINT; Schema: adm; Owner: postgres
--

ALTER TABLE ONLY adm.session_exercise
    ADD CONSTRAINT candado4 FOREIGN KEY (sessioncode) REFERENCES adm.session(idsession);


--
-- Name: session_exercise candado5; Type: FK CONSTRAINT; Schema: adm; Owner: postgres
--

ALTER TABLE ONLY adm.session_exercise
    ADD CONSTRAINT candado5 FOREIGN KEY (exercisecode) REFERENCES adm.exercise(idexercise);


--
-- PostgreSQL database dump complete
--

