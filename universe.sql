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
    age_in_m_years integer,
    description text,
    galaxy_type character varying(60),
    name character varying(60) NOT NULL,
    dist_from_earth_mly numeric(10,2)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(60) NOT NULL,
    size_in_earth_mass numeric(16,12),
    dist_from_earth_mil_km numeric(15,8),
    description text,
    is_spherical boolean,
    planet_id integer NOT NULL
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
    name character varying(60) NOT NULL,
    size_earth_mass numeric(16,8),
    dist_from_earth_ly numeric(16,8),
    description text,
    has_life boolean,
    star_id integer NOT NULL
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
-- Name: satelite; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.satelite (
    satelite_id integer NOT NULL,
    name character varying(60),
    planet_id integer,
    moon_id integer,
    star_id integer,
    galaxy_id integer NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.satelite OWNER TO freecodecamp;

--
-- Name: satelite_satelite_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.satelite_satelite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.satelite_satelite_id_seq OWNER TO freecodecamp;

--
-- Name: satelite_satelite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.satelite_satelite_id_seq OWNED BY public.satelite.satelite_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(60) NOT NULL,
    age_in_m_years integer,
    dist_from_earth_ly numeric(15,5),
    description text,
    galaxy_id integer NOT NULL,
    star_type character varying(60)
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: satelite satelite_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satelite ALTER COLUMN satelite_id SET DEFAULT nextval('public.satelite_satelite_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (2, 13600, 'Includes the Solar System', 'SB', 'Milky Way', 0.00);
INSERT INTO public.galaxy VALUES (3, 13700, 'One of the oldest most distant galaxies', 'SA', 'Cosmos Redshift 7', 12900.00);
INSERT INTO public.galaxy VALUES (4, 13700, 'A nearly perfect ring of young blue stars circle a yellow older nucleus', 'RP', 'Hoags Object', 612.80);
INSERT INTO public.galaxy VALUES (5, 13700, 'the nearest galaxy to earth', 'SA', 'Andromeda Galaxy', 2.50);
INSERT INTO public.galaxy VALUES (6, 5000, 'the largest known spiral galaxy', 'SB', 'NGC 6872', 212.00);
INSERT INTO public.galaxy VALUES (7, 13700, 'Currently being ripped to pieces', 'dlrr', 'Comet Galaxy', 3200.00);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'The Moon', 0.012300000000, 0.38440000, 'Earths only natural satelite', true, 5);
INSERT INTO public.moon VALUES (2, 'Phobos', 0.000000001784, 77.79560000, 'The innermost and largest moon of Mars', false, 6);
INSERT INTO public.moon VALUES (3, 'Deimos', 0.000000000247, 77.60000000, 'The smallest outermost moon of Mars', false, 6);
INSERT INTO public.moon VALUES (4, 'Io', 0.015000000000, 715.00000000, 'forth largest moon in the solar system', true, 7);
INSERT INTO public.moon VALUES (5, 'Europa', 0.008000000000, 715.00000000, 'Smallest of Jupiters galilean moons', true, 7);
INSERT INTO public.moon VALUES (6, 'Ganymede', 0.025000000000, 715.00000000, 'The largest moon in the solra system', true, 7);
INSERT INTO public.moon VALUES (7, 'Callisto', 0.018000000000, 715.00000000, 'Has 99% the diamiter of Mercury but only third its mass', true, 7);
INSERT INTO public.moon VALUES (8, 'Rhea', 0.000390000000, 746.00000000, 'Second largest moon of Saturn', true, 8);
INSERT INTO public.moon VALUES (9, 'Haze', 0.000002961000, 746.00000000, 'The first non-round moon discoverd, has a sponge like apperance', false, 8);
INSERT INTO public.moon VALUES (10, 'Iapetus', 0.000314500000, 746.00000000, 'A relativly low density bodu made up mostly of ice', true, 8);
INSERT INTO public.moon VALUES (11, 'Titan', 0.022500000000, 746.00000000, 'The only object apart from earth known to have liquid water', true, 8);
INSERT INTO public.moon VALUES (12, 'Mimas', 0.000006300000, 745.00000000, 'The smallest astronomical body know to rounded due to self-gravitation', true, 8);
INSERT INTO public.moon VALUES (13, 'Enceladus', 0.000018000000, 745.00000000, 'One of the most reflective bodies in the Solar System', true, 8);
INSERT INTO public.moon VALUES (14, 'Tethys', 0.000103000000, 745.00000000, 'Has the lowest density of all mayor moons in the Solar System', true, 8);
INSERT INTO public.moon VALUES (15, 'Dione', 0.000183400000, 745.00000000, 'Has an atmospher made of oxygen ions', true, 8);
INSERT INTO public.moon VALUES (16, 'Titania', 0.000568900000, 2600.00000000, 'The largest moon of Uranus', true, 9);
INSERT INTO public.moon VALUES (17, 'Oberon', 0.000514700000, 2600.00000000, 'Likely formed from the accretion disk that surounded Uranus', true, 9);
INSERT INTO public.moon VALUES (18, 'Umbriel', 0.000213400000, 2600.00000000, 'The darkest of Uranus moons', true, 9);
INSERT INTO public.moon VALUES (19, 'Ariel', 0.000209300000, 2600.00000000, 'The 4th largest of the 27 known moons of Uranus', true, 9);
INSERT INTO public.moon VALUES (20, 'Triton', 0.003590000000, 4500.00000000, 'Neptuns largest moon thought to have been a dwarf planet', true, 10);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (3, 'Mercury', 0.05500000, 0.00001638, 'Closest planet to the Sun', false, 1);
INSERT INTO public.planet VALUES (4, 'Venus', 0.82500000, 0.00000440, 'Earths sister planet', false, 1);
INSERT INTO public.planet VALUES (5, 'Earth', 1.00000000, 0.00000000, 'Home', true, 1);
INSERT INTO public.planet VALUES (6, 'Mars', 0.10700000, 0.00000577, '4th planet from the Sun and second smallest', false, 1);
INSERT INTO public.planet VALUES (7, 'Jupiter', 317.80000000, 0.00001581, 'Largest planet in the Solar System', false, 1);
INSERT INTO public.planet VALUES (8, 'Saturn', 95.15900000, 0.00012680, 'Farthest planet from Earth still visible by human eye', false, 1);
INSERT INTO public.planet VALUES (9, 'Uranus', 14.53600000, 0.00027340, 'The coldest known planet in the Solar System', false, 1);
INSERT INTO public.planet VALUES (10, 'Neptun', 17.14700000, 0.00048130, 'Most distant known planet in the Solar System', false, 1);
INSERT INTO public.planet VALUES (11, 'Proxima Centauri B', 1.07000000, 4.20000000, 'Potentialy an earth-like planet', NULL, 6);
INSERT INTO public.planet VALUES (12, 'Proxima Centauri D', 0.26000000, 4.20000000, 'A candidate exoplanet, the closest known planet to earth', NULL, 6);
INSERT INTO public.planet VALUES (14, 'Candidate 1', 35.00000000, 4.37000000, 'Belived to be a gas giant', false, 5);
INSERT INTO public.planet VALUES (15, 'Tau Ceti e', 3.93000000, 11.91200000, 'Belived to be a Venus-like planet', false, 5);


--
-- Data for Name: satelite; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.satelite VALUES (1, 'Hubble Space Telescope', 5, NULL, NULL, 2, 'Capable of taking ohotos unhinderd by earths atmospher');
INSERT INTO public.satelite VALUES (2, 'MAVEN', 6, NULL, NULL, 2, 'The probe is analyzing the upper atmospher and ionospher of Mars');
INSERT INTO public.satelite VALUES (3, 'ARTEMIS-P1', NULL, 1, NULL, 2, '1 of 2 satelites orbiting the moon as part of the THEMIS mission');
INSERT INTO public.satelite VALUES (4, 'ARTEMIS-P2', NULL, 1, NULL, 2, '1 of 2 satelites orbiting the moon as part of the THEMIS mission');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'sun', 4600, 0.00000, 'Its THE sun', 2, 'G2V');
INSERT INTO public.star VALUES (2, 'Rigel', 8, 860.00000, 'the brightest star in Orion', 2, 'B8la');
INSERT INTO public.star VALUES (3, 'Vega', 455, 25.04000, 'the brightest stare in Lyra', 2, 'A0Va');
INSERT INTO public.star VALUES (4, 'Polaris', 70, 323.00000, 'Also known as the North Star', 2, 'F7lb');
INSERT INTO public.star VALUES (5, 'Alpha Centauri A', 4850, 4.37000, 'One of the closest stars', 2, 'G2V');
INSERT INTO public.star VALUES (6, 'Proxima Centauri', 4850, 4.24650, 'The nearest known star to the Sun', 2, 'M5.5Ve');
INSERT INTO public.star VALUES (7, 'Alpha Centauri B', 4850, 4.37000, 'Alpha Centauri A and B  form a binary star sysem', 2, 'K1V');
INSERT INTO public.star VALUES (8, 'Tau Ceti', 5800, 11.91200, 'Sun like star known to have several planets', 2, 'G8V');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 48, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 15, true);


--
-- Name: satelite_satelite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.satelite_satelite_id_seq', 4, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


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
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: satelite satelite_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satelite
    ADD CONSTRAINT satelite_name_key UNIQUE (name);


--
-- Name: satelite satelite_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satelite
    ADD CONSTRAINT satelite_pkey PRIMARY KEY (satelite_id);


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
-- PostgreSQL database dump complete
--

