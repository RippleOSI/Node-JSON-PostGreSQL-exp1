--
-- PostgreSQL database dump
--

-- Dumped from database version 11.3
-- Dumped by pg_dump version 11.3

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

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: headings; Type: TABLE; Schema: public; Owner: dmitry
--

CREATE TABLE public.headings (
    id integer NOT NULL,
    patientid integer NOT NULL,
    heading character varying,
    data jsonb,
    created_at date
);


ALTER TABLE public.headings OWNER TO dmitry;

--
-- Name: headings_id_seq; Type: SEQUENCE; Schema: public; Owner: dmitry
--

CREATE SEQUENCE public.headings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.headings_id_seq OWNER TO dmitry;

--
-- Name: headings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dmitry
--

ALTER SEQUENCE public.headings_id_seq OWNED BY public.headings.id;


--
-- Name: headings id; Type: DEFAULT; Schema: public; Owner: dmitry
--

ALTER TABLE ONLY public.headings ALTER COLUMN id SET DEFAULT nextval('public.headings_id_seq'::regclass);


--
-- Data for Name: headings; Type: TABLE DATA; Schema: public; Owner: dmitry
--

COPY public.headings (id, patientid, heading, data, created_at) FROM stdin;
\.


--
-- Name: headings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dmitry
--

SELECT pg_catalog.setval('public.headings_id_seq', 7, true);


--
-- Name: headings headings_pk; Type: CONSTRAINT; Schema: public; Owner: dmitry
--

ALTER TABLE ONLY public.headings
    ADD CONSTRAINT headings_pk PRIMARY KEY (id);


--
-- Name: headings_id_uindex; Type: INDEX; Schema: public; Owner: dmitry
--

CREATE UNIQUE INDEX headings_id_uindex ON public.headings USING btree (id);


--
-- PostgreSQL database dump complete
--

