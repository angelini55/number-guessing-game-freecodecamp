--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE users;
--
-- Name: users; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE users WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE users OWNER TO freecodecamp;

\connect users

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

SET default_table_access_method = heap;

--
-- Name: number_guess; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.number_guess (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer DEFAULT 0,
    best_game integer
);


ALTER TABLE public.number_guess OWNER TO freecodecamp;

--
-- Name: number_guess_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.number_guess_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.number_guess_user_id_seq OWNER TO freecodecamp;

--
-- Name: number_guess_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.number_guess_user_id_seq OWNED BY public.number_guess.user_id;


--
-- Name: number_guess user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.number_guess ALTER COLUMN user_id SET DEFAULT nextval('public.number_guess_user_id_seq'::regclass);


--
-- Data for Name: number_guess; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.number_guess VALUES (29, 'user_1691606873713', 1, 405);
INSERT INTO public.number_guess VALUES (28, 'user_1691606873714', 4, 432);
INSERT INTO public.number_guess VALUES (79, 'user_1691608342476', 2, 348);
INSERT INTO public.number_guess VALUES (31, 'user_1691606935211', 1, 812);
INSERT INTO public.number_guess VALUES (78, 'user_1691608342477', 5, 11);
INSERT INTO public.number_guess VALUES (30, 'user_1691606935212', 4, 312);
INSERT INTO public.number_guess VALUES (64, 'user_1691607115185', 1, 794);
INSERT INTO public.number_guess VALUES (63, 'user_1691607115186', 3, 592);
INSERT INTO public.number_guess VALUES (66, 'Francisco', 0, NULL);
INSERT INTO public.number_guess VALUES (68, 'user_1691607268938', 1, 411);
INSERT INTO public.number_guess VALUES (67, 'user_1691607268939', 4, 171);
INSERT INTO public.number_guess VALUES (70, 'user_1691607368245', 2, 94);
INSERT INTO public.number_guess VALUES (69, 'user_1691607368246', 5, 90);
INSERT INTO public.number_guess VALUES (71, 'Sora', 0, NULL);
INSERT INTO public.number_guess VALUES (73, 'user_1691607793841', 2, 311);
INSERT INTO public.number_guess VALUES (72, 'user_1691607793842', 5, 393);
INSERT INTO public.number_guess VALUES (65, 'Angelo', 1, 4);
INSERT INTO public.number_guess VALUES (75, 'user_1691608273520', 2, 817);
INSERT INTO public.number_guess VALUES (74, 'user_1691608273521', 5, 9);
INSERT INTO public.number_guess VALUES (77, 'user_1691608286876', 2, 263);
INSERT INTO public.number_guess VALUES (76, 'user_1691608286877', 5, 194);


--
-- Name: number_guess_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.number_guess_user_id_seq', 79, true);


--
-- Name: number_guess number_guess_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.number_guess
    ADD CONSTRAINT number_guess_pkey PRIMARY KEY (user_id);


--
-- Name: number_guess number_guess_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.number_guess
    ADD CONSTRAINT number_guess_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--