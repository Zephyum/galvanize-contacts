--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 9.6.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: User; Type: TABLE; Schema: public; Owner: jamesdowe
--

CREATE TABLE "User" (
    id integer NOT NULL,
    first_name character varying,
    last_name character varying,
    date_of_birth date,
    biography character varying
);


ALTER TABLE "User" OWNER TO jamesdowe;

--
-- Name: User_id_seq; Type: SEQUENCE; Schema: public; Owner: jamesdowe
--

CREATE SEQUENCE "User_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "User_id_seq" OWNER TO jamesdowe;

--
-- Name: User_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jamesdowe
--

ALTER SEQUENCE "User_id_seq" OWNED BY "User".id;


--
-- Name: contact; Type: TABLE; Schema: public; Owner: jamesdowe
--

CREATE TABLE contact (
    id integer NOT NULL,
    type character varying,
    value character varying,
    user_id integer
);


ALTER TABLE contact OWNER TO jamesdowe;

--
-- Name: contact_id_seq; Type: SEQUENCE; Schema: public; Owner: jamesdowe
--

CREATE SEQUENCE contact_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE contact_id_seq OWNER TO jamesdowe;

--
-- Name: contact_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jamesdowe
--

ALTER SEQUENCE contact_id_seq OWNED BY contact.id;


--
-- Name: User id; Type: DEFAULT; Schema: public; Owner: jamesdowe
--

ALTER TABLE ONLY "User" ALTER COLUMN id SET DEFAULT nextval('"User_id_seq"'::regclass);


--
-- Name: contact id; Type: DEFAULT; Schema: public; Owner: jamesdowe
--

ALTER TABLE ONLY contact ALTER COLUMN id SET DEFAULT nextval('contact_id_seq'::regclass);


--
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: jamesdowe
--

COPY "User" (id, first_name, last_name, date_of_birth, biography) FROM stdin;
1	Kyle	Coberly	1961-02-18	Web app developer, business dork, amateur economist.
2	CJ	Reynolds	2031-04-28	Does the man have the moustache, or does the moustache have the man?
3	Danny	Fritz	1805-09-15	Definitely a human instructor, not a robot
4	Roberto	Ortega	2015-10-17	LLamas age faster than people.
\.


--
-- Name: User_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jamesdowe
--

SELECT pg_catalog.setval('"User_id_seq"', 1, true);


--
-- Data for Name: contact; Type: TABLE DATA; Schema: public; Owner: jamesdowe
--

COPY contact (id, type, value, user_id) FROM stdin;
1	email	Kyle.Coberly@galvanize.com	1
2	phone	911	1
3	email	CJ.Reynolds@galvanize.com	2
4	email	danny.fritz@galvanize.com	3
5	phone	0	3
6	email	roberto.ortega@galvanize.com	4
\.


--
-- Name: contact_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jamesdowe
--

SELECT pg_catalog.setval('contact_id_seq', 1, false);


--
-- Name: User User_pkey; Type: CONSTRAINT; Schema: public; Owner: jamesdowe
--

ALTER TABLE ONLY "User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);


--
-- Name: contact contact_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jamesdowe
--

ALTER TABLE ONLY contact
    ADD CONSTRAINT contact_user_id_fkey FOREIGN KEY (user_id) REFERENCES "User"(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

