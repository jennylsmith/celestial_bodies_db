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
-- Name: delivery; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.delivery (
    delivery_id integer NOT NULL,
    name character varying(40) NOT NULL,
    description text,
    complete boolean,
    galaxy_id integer,
    address text,
    planet_id integer NOT NULL
);


ALTER TABLE public.delivery OWNER TO freecodecamp;

--
-- Name: deliveries_order_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.deliveries_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deliveries_order_id_seq OWNER TO freecodecamp;

--
-- Name: deliveries_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.deliveries_order_id_seq OWNED BY public.delivery.delivery_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    has_life boolean,
    age_in_millions_of_years numeric(4,1),
    distance_from_earth integer,
    description text,
    galaxy_type character varying(30),
    luminosity integer,
    mass integer
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
    name character varying(40) NOT NULL,
    age_in_millions_of_years numeric(4,1),
    mass integer,
    has_life boolean,
    planet_id integer
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
    name character varying(40) NOT NULL,
    planet_type character varying(30),
    mass integer,
    has_life boolean,
    age_in_millions_of_years numeric(4,1),
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(40) NOT NULL,
    mass integer,
    star_type character varying(30),
    age_in_millions_of_years numeric(4,1),
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
-- Name: delivery delivery_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.delivery ALTER COLUMN delivery_id SET DEFAULT nextval('public.deliveries_order_id_seq'::regclass);


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

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: delivery; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.delivery VALUES (1, 'farnsworth', 'fake poop', NULL, 1, '250 kyz dr, palm', 6);
INSERT INTO public.delivery VALUES (2, 'mother', 'anchovies', NULL, 3, '445 lop ave, oak', 1);
INSERT INTO public.delivery VALUES (3, 'calculon', 'crown', NULL, 5, '121 red st, redwood', 11);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'bear', true, 500.1, 53, 'tribbles', 'elliptical', 100000, 1000000000);
INSERT INTO public.galaxy VALUES (2, 'goat', false, 75.3, 11, 'fuzzy', 'spiral', 1000000, 680000000);
INSERT INTO public.galaxy VALUES (3, 'deer', true, 335.3, 111, 'forests', 'spiral', 3200000, 580000000);
INSERT INTO public.galaxy VALUES (4, 'stag', false, 330.0, 112, 'desert storms', 'ellipitical', 6700000, 1000000);
INSERT INTO public.galaxy VALUES (5, 'elk', true, 60.5, 15, 'dark, shadowy', 'spiral', 10000, 550000000);
INSERT INTO public.galaxy VALUES (6, 'marmot', true, 400.8, 248, 'pleasant', 'elliptical', 43000000, 9300000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'peony', 405.6, 100000000, false, 1);
INSERT INTO public.moon VALUES (2, 'daisy', 44.8, 1000000, false, 1);
INSERT INTO public.moon VALUES (3, 'violet', 602.4, 660000000, true, 2);
INSERT INTO public.moon VALUES (4, 'pansy', 42.0, 950000000, true, 2);
INSERT INTO public.moon VALUES (5, 'dahlia', 75.9, 100000000, true, 3);
INSERT INTO public.moon VALUES (6, 'blue bell', 333.6, 72000, true, 4);
INSERT INTO public.moon VALUES (7, 'fuschia', 30.8, 4800000, true, 4);
INSERT INTO public.moon VALUES (8, 'cosmo', 99.9, 57000, true, 5);
INSERT INTO public.moon VALUES (9, 'tulip', 55.6, 77000000, true, 5);
INSERT INTO public.moon VALUES (10, 'daffodil', 77.3, 8800000, true, 5);
INSERT INTO public.moon VALUES (11, 'aster', 900.2, 880000000, true, 6);
INSERT INTO public.moon VALUES (12, 'balsamroot', 409.8, 910000, true, 7);
INSERT INTO public.moon VALUES (13, 'lupine', 550.1, 160000000, true, 8);
INSERT INTO public.moon VALUES (14, 'bear grass', 25.8, 3300000, true, 8);
INSERT INTO public.moon VALUES (15, 'camas', 129.0, 49000000, true, 9);
INSERT INTO public.moon VALUES (16, 'fireweed', 100.4, 220000, true, 9);
INSERT INTO public.moon VALUES (17, 'columbine', 55.4, 18000, true, 9);
INSERT INTO public.moon VALUES (18, 'yarrow', 22.1, 360000, true, 10);
INSERT INTO public.moon VALUES (19, 'trillium', 90.8, 550000, true, 11);
INSERT INTO public.moon VALUES (20, 'phlox', 289.1, 17000000, true, 12);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'oak', 'gas giant', 500000, false, 300.1, 2);
INSERT INTO public.planet VALUES (2, 'maple', 'dwarf', 540000, false, 251.7, 2);
INSERT INTO public.planet VALUES (3, 'cedar', 'ice giant', 39000000, false, 400.2, 2);
INSERT INTO public.planet VALUES (5, 'aspen', 'ice giant', 63000000, true, 10.8, 1);
INSERT INTO public.planet VALUES (6, 'palm', 'dwarf', 380000000, true, 536.7, 1);
INSERT INTO public.planet VALUES (7, 'alder', 'Chthonian', 280000, true, 33.5, 3);
INSERT INTO public.planet VALUES (8, 'manzanita', 'lava', 4400000, true, 200.2, 3);
INSERT INTO public.planet VALUES (9, 'pine', 'rogue', 6600000, true, 44.1, 5);
INSERT INTO public.planet VALUES (10, 'bristlecone', 'protoplanet', 95000000, true, 501.4, 7);
INSERT INTO public.planet VALUES (11, 'redwood', 'terrestrial', 880000000, true, 449.0, 7);
INSERT INTO public.planet VALUES (12, 'fig', 'carbon', 26000000, true, 24.6, 7);
INSERT INTO public.planet VALUES (4, 'birch', 'helium', 67000, false, 20.1, 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'beetle', 44000000, 'red dwarf', 140.7, 1);
INSERT INTO public.star VALUES (2, 'mantis', 370000000, 'white dwarf', 77.1, 2);
INSERT INTO public.star VALUES (3, 'worm', 610000, 'o-type', 30.5, 3);
INSERT INTO public.star VALUES (4, 'caterpillar', 79000, 'a-type', 500.7, 4);
INSERT INTO public.star VALUES (5, 'ladybug', 9000000, 'protostar', 45.7, 5);
INSERT INTO public.star VALUES (7, 'dragonfly', 3800000, 'neutron', 239.2, 6);


--
-- Name: deliveries_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.deliveries_order_id_seq', 3, true);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: delivery deliveries_address_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.delivery
    ADD CONSTRAINT deliveries_address_key UNIQUE (address);


--
-- Name: delivery deliveries_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.delivery
    ADD CONSTRAINT deliveries_pkey PRIMARY KEY (delivery_id);


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
-- Name: galaxy name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT name UNIQUE (name);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: delivery deliveries_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.delivery
    ADD CONSTRAINT deliveries_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: delivery planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.delivery
    ADD CONSTRAINT planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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
-- PostgreSQL database dump complete
--

