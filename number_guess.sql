--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer DEFAULT 0,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (2, 'user_1737466794671', 2, 509);
INSERT INTO public.users VALUES (1, 'user_1737466794672', 5, 87);
INSERT INTO public.users VALUES (3, 'Elena', 0, NULL);
INSERT INTO public.users VALUES (13, 'user_1737468434216', 2, 745);
INSERT INTO public.users VALUES (23, 'user_1737469206612', 2, 481);
INSERT INTO public.users VALUES (5, 'user_1737466907703', 2, 353);
INSERT INTO public.users VALUES (12, 'user_1737468434217', 5, 209);
INSERT INTO public.users VALUES (33, 'user_1737471643109', 2, 454);
INSERT INTO public.users VALUES (4, 'user_1737466907704', 5, 6);
INSERT INTO public.users VALUES (22, 'user_1737469206613', 5, 187);
INSERT INTO public.users VALUES (7, 'user_1737466954873', 2, 76);
INSERT INTO public.users VALUES (15, 'user_1737468580174', 2, 549);
INSERT INTO public.users VALUES (6, 'user_1737466954874', 5, 292);
INSERT INTO public.users VALUES (14, 'user_1737468580175', 5, 172);
INSERT INTO public.users VALUES (32, 'user_1737471643110', 5, 120);
INSERT INTO public.users VALUES (25, 'user_1737469936677', 2, 17);
INSERT INTO public.users VALUES (9, 'user_1737468071242', 2, 462);
INSERT INTO public.users VALUES (8, 'user_1737468071243', 5, 83);
INSERT INTO public.users VALUES (24, 'user_1737469936678', 5, 319);
INSERT INTO public.users VALUES (17, 'user_1737468623218', 2, 314);
INSERT INTO public.users VALUES (11, 'user_1737468312164', 2, 210);
INSERT INTO public.users VALUES (16, 'user_1737468623219', 5, 86);
INSERT INTO public.users VALUES (10, 'user_1737468312165', 5, 458);
INSERT INTO public.users VALUES (27, 'user_1737471125032', 2, 328);
INSERT INTO public.users VALUES (19, 'user_1737468814504', 2, 51);
INSERT INTO public.users VALUES (26, 'user_1737471125033', 5, 270);
INSERT INTO public.users VALUES (18, 'user_1737468814505', 5, 14);
INSERT INTO public.users VALUES (21, 'user_1737468912232', 2, 215);
INSERT INTO public.users VALUES (20, 'user_1737468912233', 5, 21);
INSERT INTO public.users VALUES (29, 'user_1737471148488', 2, 16);
INSERT INTO public.users VALUES (28, 'user_1737471148489', 5, 263);
INSERT INTO public.users VALUES (31, 'user_1737471575781', 2, 434);
INSERT INTO public.users VALUES (30, 'user_1737471575782', 5, 176);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 33, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

