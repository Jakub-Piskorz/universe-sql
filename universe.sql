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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    stars bigint,
    age_in_million_years numeric(12,2),
    blackholes integer,
    description character varying(100),
    is_quasar boolean NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30),
    description character varying(100),
    planet_id integer NOT NULL,
    orbital_period_in_hours numeric(10,2),
    moon_siblings integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30),
    age_in_million_years numeric(12,2),
    has_life boolean NOT NULL,
    orbital_period_in_earth_hours numeric(12,2),
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planets_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planets_id_seq OWNER TO freecodecamp;

--
-- Name: planets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planets_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_million_years numeric(12,2),
    description character varying(100),
    star_type_id integer,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: star_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star_type (
    star_type_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description character varying(100),
    long_description text
);


ALTER TABLE public.star_type OWNER TO freecodecamp;

--
-- Name: star_type_star_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_type_star_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_type_star_type_id_seq OWNER TO freecodecamp;

--
-- Name: star_type_star_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_type_star_type_id_seq OWNED BY public.star_type.star_type_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planets_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: star_type star_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_type ALTER COLUMN star_type_id SET DEFAULT nextval('public.star_type_star_type_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100000000000, 10000.00, 1000000, 'very nice galaxy, humans live there.', false);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 200000000000, 20000.00, 2000000, 'very nice galaxy, will collide with Milky Way.', false);
INSERT INTO public.galaxy VALUES (3, 'ULAS J1342+0928', 300000000000, 30000.00, 3000000, 'very nice quasar I found on Wikipedia.', true);
INSERT INTO public.galaxy VALUES (4, 'Jebediath Way', 100000000000, 10000.00, 1000000, 'very nice galaxy, kerbals live there', false);
INSERT INTO public.galaxy VALUES (5, 'J0313-1806', 100000000000, 10000.00, 1000000, 'Most distant quasar according to Wikipedia.', true);
INSERT INTO public.galaxy VALUES (6, 'CTA-102', 100000000000, 43000.00, 1002500, 'Quasar with alien message according to some Soviet scientist.', true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 'Our moon is named Luna if you didn''t know', 3, 1000.00, 0);
INSERT INTO public.moon VALUES (2, 'Europa', 'Jupiter moon', 5, 2000.00, 79);
INSERT INTO public.moon VALUES (3, 'Ganimedes', 'Jupiter moon', 5, 2000.00, 79);
INSERT INTO public.moon VALUES (4, 'Io', 'Jupiter moon', 5, 2000.00, 79);
INSERT INTO public.moon VALUES (5, 'Kallisto', 'Jupiter moon', 5, 2000.00, 79);
INSERT INTO public.moon VALUES (6, 'Karpo', 'Jupiter moon', 5, 2000.00, 79);
INSERT INTO public.moon VALUES (7, 'Amaltea', 'Jupiter moon', 5, 2000.00, 79);
INSERT INTO public.moon VALUES (8, 'Ersa', 'Jupiter moon', 5, 2000.00, 79);
INSERT INTO public.moon VALUES (9, 'Eirene', 'Jupiter moon', 5, 2000.00, 79);
INSERT INTO public.moon VALUES (10, 'Mun', 'Kerbin moon', 9, 2000.00, 1);
INSERT INTO public.moon VALUES (11, 'Minmus', 'Kerbin moon', 9, 2000.00, 1);
INSERT INTO public.moon VALUES (12, 'Laythe', 'Jool moon', 9, 2000.00, 1);
INSERT INTO public.moon VALUES (13, 'Vall', 'Jool moon', 9, 2000.00, 1);
INSERT INTO public.moon VALUES (14, 'Tylo', 'Jool moon', 9, 2000.00, 1);
INSERT INTO public.moon VALUES (15, 'Bop', 'Jool moon', 9, 2000.00, 1);
INSERT INTO public.moon VALUES (16, 'Pol', 'Jool moon', 9, 2000.00, 1);
INSERT INTO public.moon VALUES (17, 'Gilly', 'Eve moon', 15, 5000.00, 0);
INSERT INTO public.moon VALUES (18, 'Ike', 'Duna moon', 14, 5000.00, 0);
INSERT INTO public.moon VALUES (19, 'Mimas', 'Saturn moon', 6, 5000.00, 82);
INSERT INTO public.moon VALUES (20, 'Tethys', 'Saturn moon', 6, 5000.00, 82);
INSERT INTO public.moon VALUES (21, 'Dione', 'Saturn moon', 6, 5000.00, 82);
INSERT INTO public.moon VALUES (22, 'Titan', 'Saturn moon', 6, 5000.00, 82);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 4600.00, false, 4000.00, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 4600.00, false, 4000.00, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 4600.00, true, 4000.00, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 4600.00, false, 4000.00, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 4600.00, false, 4000.00, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 4600.00, false, 4000.00, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 4600.00, false, 4000.00, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 4600.00, false, 4000.00, 1);
INSERT INTO public.planet VALUES (9, 'Kerbin', 4600.00, true, 4000.00, 3);
INSERT INTO public.planet VALUES (10, 'Moho', 4600.00, false, 4000.00, 3);
INSERT INTO public.planet VALUES (11, 'Dres', 4600.00, false, 4000.00, 3);
INSERT INTO public.planet VALUES (12, 'Jool', 4600.00, false, 4000.00, 3);
INSERT INTO public.planet VALUES (14, 'Duna', 5999.00, false, 5000.00, 3);
INSERT INTO public.planet VALUES (15, 'Eve', 5999.00, false, 5000.00, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 4600.00, 'Our star', 2, 1);
INSERT INTO public.star VALUES (3, 'Kerbol', 1100.00, 'Star where Kerbals live', 2, 4);
INSERT INTO public.star VALUES (4, 'Kerbol2', 1100.00, 'Star where Kerbals live', 2, 4);
INSERT INTO public.star VALUES (5, 'Kerbol3', 1100.00, 'Star where Kerbals live', 2, 4);
INSERT INTO public.star VALUES (6, 'Kerbol4', 1100.00, 'Star where Kerbals live', 2, 4);
INSERT INTO public.star VALUES (7, 'Kerbol5', 1100.00, 'Star where Kerbals live', 2, 4);


--
-- Data for Name: star_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star_type VALUES (1, 'White dwarf', NULL, NULL);
INSERT INTO public.star_type VALUES (2, 'Dwarf', NULL, NULL);
INSERT INTO public.star_type VALUES (3, 'Giant', NULL, NULL);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planets_id_seq', 15, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: star_type_star_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_type_star_type_id_seq', 3, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planets_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planets_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: star_type star_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_type
    ADD CONSTRAINT star_type_name_key UNIQUE (name);


--
-- Name: star_type star_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_type
    ADD CONSTRAINT star_type_pkey PRIMARY KEY (star_type_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star star_star_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_type_id_fkey FOREIGN KEY (star_type_id) REFERENCES public.star_type(star_type_id);


--
-- PostgreSQL database dump complete
--

