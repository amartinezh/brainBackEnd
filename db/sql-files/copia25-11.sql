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
-- Name: exercise; Type: TABLE; Schema: test; Owner: postgres
--

CREATE TABLE test.exercise (
    id character varying(16) NOT NULL,
    exercise_number character varying(128),
    title character varying(1024),
    description character varying(2048),
    module character varying(64),
    media_type character varying(64)
);


ALTER TABLE test.exercise OWNER TO postgres;

--
-- Name: exercise_media; Type: TABLE; Schema: test; Owner: postgres
--

CREATE TABLE test.exercise_media (
    id_exercise character varying(16) NOT NULL,
    id_media character varying(64) NOT NULL,
    observation character varying(1024),
    id_session integer NOT NULL
);


ALTER TABLE test.exercise_media OWNER TO postgres;

--
-- Name: media; Type: TABLE; Schema: test; Owner: postgres
--

CREATE TABLE test.media (
    id character varying(64) NOT NULL,
    description character varying(256),
    id_exercise character varying(16) NOT NULL
);


ALTER TABLE test.media OWNER TO postgres;

--
-- Name: session; Type: TABLE; Schema: test; Owner: postgres
--

CREATE TABLE test.session (
    id integer NOT NULL,
    id_user integer NOT NULL,
    id_adult integer NOT NULL,
    date date,
    observations text
);


ALTER TABLE test.session OWNER TO postgres;

--
-- Name: session_exercise; Type: TABLE; Schema: test; Owner: postgres
--

CREATE TABLE test.session_exercise (
    id_session integer NOT NULL,
    id_exercise character varying(16) NOT NULL,
    observation character varying(1024),
    correct integer
);


ALTER TABLE test.session_exercise OWNER TO postgres;

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
-- Data for Name: exercise; Type: TABLE DATA; Schema: test; Owner: postgres
--

COPY test.exercise (id, exercise_number, title, description, module, media_type) FROM stdin;
1	Ejercicio 1.1	Evocación de acontecimientos autobiográficos por el uso de palabras claves.	Con base en las preguntas que se ofrecen, se le pide a la persona que narre acontecimientos relacionados con su vida.	1	Questions
3	Ejercicio 1.3	Identificación de fechas importantes en el ciclo vital del participante usando palabras claves.	Se le harán distintas preguntas al adulto con cada palabra clave de las que se muestran a continuación.	1	Questions
4	Ejercicio 1.4	Reconstrucción del tiempo vivido (técnica narrativa).	El adulto debe narrar algo de su infancia, cómo estaba compuesta su familia,  quienes eran sus amigos, cuál era la escuela en la que estudió, cómo era el lugar donde vivía, donde conoció a su pareja, cuándo se casaron, cuántos hijos tuvieron, cuál fue su primer trabajo.	1	
5	Ejercicio 1.5	Distribución cronológica de las vivencias identificadas.	El adulto debe acomodar en orden todo lo que ha contado, desde lo más antiguo hasta lo más nuevo.	1	
6	Ejercicio 1.6	Recuerdo de los acontecimientos principales del año en curso.	Se deben hacer preguntas sobre sucesos ocurridos durante el año actual y el adulto debe responder correctamente, por ejemplo.	1	Questions
7	Ejercicio 2.1	Mencionar películas y actores.	El adulto debe hacer una lista de las películas que recuerde, luego intentar recordar también actores que participen en estas.	2	
8	Ejercicio 2.2	Mencionar programas TV / Presentadores / Productores.	El adulto debe hacer una lista de programas de televisión, y de personajes que aparezcan allí.	2	
9	Ejercicio 2.3	Mencionar personajes famosos	El adulto debe mencionar otros personajes famosos, que no haya nombrado ni en las películas ni en los programas de televisión.	2	
10	Ejercicio 2.4	Observación y detección de contrastes entre imágenes en formas y colores.	El adulto debe mencionar en voz alta las diferencias entre las distintas figuras que se muestran a continuación.	2	Pictures
11	Ejercicio 2.5	Observación y detección de contrastes entre imágenes en colores e indumentos	El adulto debe mencionar en voz alta las diferencias entre las distintas figuras que se muestran a continuación.	2	Pictures
12	Ejercicio 2.6	Recuerde las películas.	De las películas mencionadas anteriormente por el adulto mayos, identifique cuál es su favorita.	2	
13	Ejercicio 3.1	Discriminación auditiva de estímulos lingüísticos.	El adulto debe escuchar el siguiente sonido y describir lo que es.	2	Audio
14	Ejercicio 3.2	Discriminación auditiva: Piezas musicales con ritmos.	El adulto debe escuchar el siguiente sonido y describir lo que es.	2	Audio
15	Ejercicio 3.3	Discriminación olfativa y gustativa.	El adulto mayor debe cerrar los ojos y olfatear y/o saborear los elementos proporcionados por el cuidador. Para este ejercicio es necesario contar con elementos que puedan ser olfateados o sabereados tales como menta, dulces, frutas, especias, etc. En caso de no contar con estos elementos, no califique este ejercicio.	2	
16	Ejercicio 3.4	Discriminación gnoseológica por medio del tacto.	El adulto mayor debe cerrar los ojos y por medio del tacto, identificar y mencionar los elementos proporcionados por el cuidador. Para este ejercicio es necesario contar con elementos que puedan ser palpados tales como frutas, pelotas, madera, lijas, algodón, etc. En caso de no contar con estos elementos, no califique este ejercicio.	2	
17	Ejercicio 4.1	Identificación de errores en un texto.	El adulto mayor debe leer el texto a continuación y determinar cuáles son los errores en él.	2	Text
18	Ejercicio 4.2	Diferencias entre textos.	El adulto mayor debe leer los textos a continuación y determinar cuáles son las diferencias entre ambos textos.	2	Text
21	Ejercicio 4.5	Palabras ocultas.	Encuentra las palabras ocultas en la siguiente tabla basándote en los animales que están abajo.	2	Pictures
23	Ejercicio 4.7	Completamiento de frases.	El adulto mayor, debe completar las frases que se le leerán a continuación.	2	Questions
\.


--
-- Data for Name: exercise_media; Type: TABLE DATA; Schema: test; Owner: postgres
--

COPY test.exercise_media (id_exercise, id_media, observation, id_session) FROM stdin;
6	0	Prueba media 1	57
6	2	Prueba media 3	57
6	3	Prueba media 4	57
6	4	Prueba media 5	57
6	1	Prueba media 2	57
\.


--
-- Data for Name: media; Type: TABLE DATA; Schema: test; Owner: postgres
--

COPY test.media (id, description, id_exercise) FROM stdin;
0	¿Cuál es su fecha de nacimiento?	1
1	¿Cuál es el lugar donde pasó su infancia?	1
2	¿Quién era tu padre?	1
3	¿Quién era tu madre?	1
4	¿Cómo se llaman tus hermanos/as?	1
5	¿Cuál era la escuela a la que ibas?	1
6	¿Vivías en la ciudad o en el campo?	1
7	¿Cuál fue tu primer trabajo?	1
8	¿Cuál es la fecha de tu matrimonio?	1
9	¿En qué iglesia te casaste?	1
10	¿Quiénes son tus hijos?	1
11	¿Cuál es el viaje que más te ha gustado?	1
12	¿Cuál es el mayor logro de tu vida?	1
13	¿Cuántos nietos tienes?	1
14	¿Cómo se llaman tus nietos?	1
15	¿Cuál es el lugar donde vives ahora?	1
0	¿Cuál fue el momento más difícil que vivió con su familia?	3
1	¿Cuál fue el momento más feliz que vivió con su familia?	3
2	¿Cuándo se le cayó el primer diente a su hijo?	3
3	¿Cuándo conoció a su pareja?	3
4	¿Cuánto tiempo llevan o llevaban juntos?	3
5	¿Cuándo fue su boda?	3
6	¿Cuándo fue su primer trabajo?	3
7	¿A qué edad consiguió su primer trabajo?	3
8	¿Cuántos trabajos realizo en su vida?	3
9	¿Cuándo fue su último trabajo?	3
10	¿Dónde creció?	3
11	¿Qué recuerda de su niñez?	3
12	¿Qué le gustaba cuando era pequeño?	3
13	¿Qué no le gustaba cuando era pequeño?	3
14	¿Qué extraña de cuando era pequeño?	3
15	¿Qué quería ser cuando fuera grande?	3
16	¿Qué es lo que primero que recuerda del estudio?	3
17	¿Qué recuerda hacer en los recreos?	3
18	¿Qué recuerda de sus profesores?	3
19	¿Qué recuerda de sus compañeros?	3
20	¿Anteriormente qué le gustaba hacer en su tiempo libre?	3
21	¿Qué aromas y sabores le recuerda la comida?	3
22	¿Cuál fue el momento que más satisfacción trajo a su vida?	3
23	¿Cuál fue el momento que más desgracia trajo a su vida?	3
24	¿Qué metas tenia?	3
25	¿Pudo cumplir alguna de sus metas?	3
26	¿Qué le hubiera gustado cambiar en su vida?	3
0	¿Dónde celebraste el inicio del año actual?	6
1	¿Qué hiciste el día de tu cumpleaños?	6
2	¿Qué hiciste el día de la madre/padre?	6
3	¿Con quién estuviste el día del amor y la amistad?	6
4	¿Dónde celebraste la navidad?	6
0	./assets/img/exe/figures (1).png	10
1	./assets/img/exe/figures (2).png	10
2	./assets/img/exe/figures (3).png	10
3	./assets/img/exe/figures (4).png	10
4	./assets/img/exe/figures (5).png	10
5	./assets/img/exe/figures (6).png	10
0	./assets/img/exe/clothes (1).png	11
1	./assets/img/exe/clothes (2).png	11
2	./assets/img/exe/clothes (3).png	11
3	./assets/img/exe/clothes (4).png	11
4	./assets/img/exe/clothes (5).png	11
5	./assets/img/exe/clothes (6).png	11
0	./assets/audio/FAUNA/sonido de gatos.mp3	13
1	./assets/audio/FAUNA/Sonidos de Cerdos.mp3	13
2	./assets/audio/FAUNA/sonido de vacas.mp3	13
3	./assets/audio/FAUNA/sonido de pollos.mp3	13
4	./assets/audio/FAUNA/sonido de perros.mp3	13
5	./assets/audio/NATURALEZA/Sonido de agua.mp3	13
6	./assets/audio/NATURALEZA/sonido de truenos.mp3	13
7	./assets/audio/NATURALEZA/sonido de la selva.mp3	13
8	./assets/audio/NATURALEZA/sonido de lluvia.mp3	13
9	./assets/audio/NATURALEZA/sonido de viento.mp3	13
0	./assets/audio/INSTRUMENTOS MUSICALES/sonido de guitarra.mp3	14
1	./assets/audio/INSTRUMENTOS MUSICALES/sonido de piano.mp3	14
2	./assets/audio/INSTRUMENTOS MUSICALES/sonido flauta.mp3	14
3	./assets/audio/INSTRUMENTOS MUSICALES/sonido maracas.mp3	14
4	./assets/audio/INSTRUMENTOS MUSICALES/sonido tambor.mp3	14
0	./assets/img/exe/PalabrasOcultas.png	21
0	Las manzanas crecen en los...	23
1	Los caballos son...	23
2	La sangre es de color...	23
3	Colombia es un...	23
4	Diciembre es...	23
5	La madre de mi madre es mi...	23
6	Después de mayo está...	23
7	El otoño y la primavera son...	23
8	Antes del miércoles está...	23
\.


--
-- Data for Name: session; Type: TABLE DATA; Schema: test; Owner: postgres
--

COPY test.session (id, id_user, id_adult, date, observations) FROM stdin;
38	1000372279	123456789	2021-10-11	test
39	1000372279	1234	2021-10-11	afsdga
40	11223344	11223322	2021-10-25	Prueba observaciones sesion
41	11223344	1234	2021-10-25	Prueba Observaciones
42	11223344	11223322	2021-10-25	Ninguna
43	11223344	1234	2021-11-25	Observaciones Prueba
44	11223344	123456789	2021-11-25	Ninguna
45	11223344	1234	2021-11-25	x
46	11223344	123456789	2021-11-25	
47	11223344	11223322	2021-11-25	prueba
48	11223344	11223322	2021-11-25	ninguna
49	11223344	1234	2021-11-25	ninguna
50	19283746	11223322	2021-11-25	ninguna
51	19283746	11223322	2021-11-25	ninguna
52	19283746	11223322	2021-11-25	ninguna
53	19283746	11223322	2021-11-25	Bien hecho
54	19283746	1234	2021-11-25	Mal
55	19283746	1234	2021-11-25	Mal hecho
56	19283746	123456789	2021-11-25	Prueba
57	19283746	11223322	2021-11-25	Muy bien
\.


--
-- Data for Name: session_exercise; Type: TABLE DATA; Schema: test; Owner: postgres
--

COPY test.session_exercise (id_session, id_exercise, observation, correct) FROM stdin;
55	5	No organiz'o bien lo narrado	0
56	4	Bien hecho	1
57	6	prueba ejer 1.6	1
\.


--
-- Data for Name: tbl_adult; Type: TABLE DATA; Schema: test; Owner: postgres
--

COPY test.tbl_adult (id, name, birth_date) FROM stdin;
123456789	Jane Doe	1927-01-07
1234	Jhon Doe	1954-01-13
11223322	Prueba Adulto	1957-11-25
\.


--
-- Data for Name: tbl_user; Type: TABLE DATA; Schema: test; Owner: postgres
--

COPY test.tbl_user (id, name, email, apppassword, cellphone, birth_date) FROM stdin;
1000372279	Juan Pablo Angel	juan.angel@ucp.edu.co	4444	3112528170	2000-04-04
11111111	Rosario Iodice	rosario.iodice@ucp.edu.co	1234	3111111111	1990-01-01
11111112	Maria Luisa Nieto	luisa.nieto@ucp.edu.co	1234	3111111111	1990-01-01
11111113	Lida Patricia	lidapatriciar@gmail.com	1234	3111111111	1990-01-01
11111114	Andres Mauricio Martinez	andres.martinez@ucp.edu.co	1234	3111111111	1990-01-01
1234321123	Prueba	prueba@mail.com	1234	1234	2000-11-11
11223344	Sujeto Prueba	sujeto@prueba.com	1234	3112224455	1990-11-25
19283746	Prueba Usuario	user@ucp.edu.co	1234	12345	1992-11-25
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

SELECT pg_catalog.setval('test.session_id_seq', 57, true);


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
-- Name: exercise_media exercise_media_pkey; Type: CONSTRAINT; Schema: test; Owner: postgres
--

ALTER TABLE ONLY test.exercise_media
    ADD CONSTRAINT exercise_media_pkey PRIMARY KEY (id_session, id_media, id_exercise);


--
-- Name: exercise exercise_pkey; Type: CONSTRAINT; Schema: test; Owner: postgres
--

ALTER TABLE ONLY test.exercise
    ADD CONSTRAINT exercise_pkey PRIMARY KEY (id);


--
-- Name: media media_pkey; Type: CONSTRAINT; Schema: test; Owner: postgres
--

ALTER TABLE ONLY test.media
    ADD CONSTRAINT media_pkey PRIMARY KEY (id, id_exercise);


--
-- Name: session_exercise session_exercise_pkey; Type: CONSTRAINT; Schema: test; Owner: postgres
--

ALTER TABLE ONLY test.session_exercise
    ADD CONSTRAINT session_exercise_pkey PRIMARY KEY (id_session, id_exercise);


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
-- Name: session fk_adult; Type: FK CONSTRAINT; Schema: test; Owner: postgres
--

ALTER TABLE ONLY test.session
    ADD CONSTRAINT fk_adult FOREIGN KEY (id_adult) REFERENCES test.tbl_adult(id) NOT VALID;


--
-- Name: media fk_exercise; Type: FK CONSTRAINT; Schema: test; Owner: postgres
--

ALTER TABLE ONLY test.media
    ADD CONSTRAINT fk_exercise FOREIGN KEY (id_exercise) REFERENCES test.exercise(id) NOT VALID;


--
-- Name: exercise_media fk_session; Type: FK CONSTRAINT; Schema: test; Owner: postgres
--

ALTER TABLE ONLY test.exercise_media
    ADD CONSTRAINT fk_session FOREIGN KEY (id_session) REFERENCES test.session(id);


--
-- Name: session_exercise fk_session; Type: FK CONSTRAINT; Schema: test; Owner: postgres
--

ALTER TABLE ONLY test.session_exercise
    ADD CONSTRAINT fk_session FOREIGN KEY (id_session) REFERENCES test.session(id);


--
-- Name: session fk_user; Type: FK CONSTRAINT; Schema: test; Owner: postgres
--

ALTER TABLE ONLY test.session
    ADD CONSTRAINT fk_user FOREIGN KEY (id_user) REFERENCES test.tbl_user(id) NOT VALID;


--
-- PostgreSQL database dump complete
--

