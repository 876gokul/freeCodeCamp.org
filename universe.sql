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
-- Name: dust_cloud; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.dust_cloud (
    dust_cloud_id integer NOT NULL,
    name character varying(40) NOT NULL,
    ages_in_millions_of_years integer,
    galaxy_id integer
);


ALTER TABLE public.dust_cloud OWNER TO freecodecamp;

--
-- Name: dust_cloud_dust_cloud_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.dust_cloud_dust_cloud_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dust_cloud_dust_cloud_id_seq OWNER TO freecodecamp;

--
-- Name: dust_cloud_dust_cloud_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.dust_cloud_dust_cloud_id_seq OWNED BY public.dust_cloud.dust_cloud_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    ages_in_billions_of_years integer,
    description text NOT NULL,
    links text
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
    name character varying(40) NOT NULL,
    ages_in_millions_of_years integer,
    has_life boolean DEFAULT false,
    planet_id integer,
    nearest_planet_in_light_year numeric(5,2)
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
    ages_in_millions_of_years integer,
    description text NOT NULL,
    has_life boolean DEFAULT false,
    galaxy_id integer NOT NULL,
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
    ages_in_millions_of_years integer,
    description text NOT NULL,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_start_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_start_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_start_id_seq OWNER TO freecodecamp;

--
-- Name: star_start_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_start_id_seq OWNED BY public.star.star_id;


--
-- Name: dust_cloud dust_cloud_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dust_cloud ALTER COLUMN dust_cloud_id SET DEFAULT nextval('public.dust_cloud_dust_cloud_id_seq'::regclass);


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_start_id_seq'::regclass);


--
-- Data for Name: dust_cloud; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.dust_cloud VALUES (1, 'black bay', 1480, 1);
INSERT INTO public.dust_cloud VALUES (2, 'white Hyperion', 5219, 3);
INSERT INTO public.dust_cloud VALUES (3, 'titan cloud', 8972, 5);
INSERT INTO public.dust_cloud VALUES (4, 'milky bay', 1480, 7);
INSERT INTO public.dust_cloud VALUES (5, 'Hyperion', 6219, 4);
INSERT INTO public.dust_cloud VALUES (6, 'titan cloud 3', 6972, 6);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'IOK-1', 13, 'IOK-1 was discovered in 2006 a decade before GN-z11, the current oldest known galaxy, by a team of astronomers using Subaru telescope in Hawaii.', NULL);
INSERT INTO public.galaxy VALUES (2, 'GN-108036', 12, 'Galaxy GN-108036 was intially spotted by astronomers using Japans Subaru telescope in Hawaii in 2011.', NULL);
INSERT INTO public.galaxy VALUES (3, 'SXDF-NB1006-2', 12, 'SXDF-NB10062, another distant galaxy from the early days of universe was discovered in 2012 by scientists using the Subaru and Keck telescopes.', NULL);
INSERT INTO public.galaxy VALUES (4, 'z8_GND_5296', 13, 'The galaxy, labeled z8_GND_5296, was discovered in 2013 by a team of astronomers led by Dr. Steven Wilner from the Harvard-Smithsonian Center for Astrophysics.', NULL);
INSERT INTO public.galaxy VALUES (5, 'EGS-zs8-1', 13, 'Galaxy EGS-zs8-1 was discovered a few months before galaxy EGSY8p7 (which is further and older), which at the time made it the oldest galaxy in the observable universe', NULL);
INSERT INTO public.galaxy VALUES (6, 'EGSY8p7', 13, 'Until the discovery of galaxy GN-z11 in 2016 EGSY8p7 (also designated as (EGSY-2008532660)) was the oldest and most distant known object in the universe.', NULL);
INSERT INTO public.galaxy VALUES (7, 'Milky Way', 13, 'The galaxy conatining the Sun and its Solar System, and therfore Earth', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon apha', 456, false, 3, 8.32);
INSERT INTO public.moon VALUES (2, 'moon apha 3219', 579, false, 2, 80.32);
INSERT INTO public.moon VALUES (3, 'moon beta', 543, false, 1, 0.32);
INSERT INTO public.moon VALUES (4, 'Amalthea', 843, false, 9, 0.26);
INSERT INTO public.moon VALUES (5, 'Casllisto', 753, false, 9, 0.45);
INSERT INTO public.moon VALUES (6, 'Enceladus', 843, false, 10, 1.26);
INSERT INTO public.moon VALUES (7, 'Dione', 851, false, 10, 0.56);
INSERT INTO public.moon VALUES (8, 'Lapetus', 843, false, 10, 1.26);
INSERT INTO public.moon VALUES (9, 'Hyperion', 851, false, 10, 0.56);
INSERT INTO public.moon VALUES (10, 'Mimas', 843, false, 10, 1.26);
INSERT INTO public.moon VALUES (11, 'Phoebe', 851, false, 10, 0.56);
INSERT INTO public.moon VALUES (12, 'Titan', 843, false, 10, 1.26);
INSERT INTO public.moon VALUES (13, 'Rhea', 851, false, 10, 0.56);
INSERT INTO public.moon VALUES (14, 'Titan 2', 453, false, 11, 0.46);
INSERT INTO public.moon VALUES (15, 'Ariel', 851, false, 11, 0.56);
INSERT INTO public.moon VALUES (16, 'moon', 382, false, 5, 0.28);
INSERT INTO public.moon VALUES (17, 'Joma', 382, false, 3, 0.28);
INSERT INTO public.moon VALUES (18, 'abcd', 987, false, 6, 123.00);
INSERT INTO public.moon VALUES (20, 'abc', 987, false, 5, 123.00);
INSERT INTO public.moon VALUES (22, 'abcf', 987, false, 13, 567.00);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'planet abs', 1234, 'this planet is known as planet abs', false, 1, 1);
INSERT INTO public.planet VALUES (2, 'planet bsa', 7361, 'this planet is known as planet bsa', false, 5, 2);
INSERT INTO public.planet VALUES (3, 'planet pluto', 1293, 'this planet is known as planet pluto', false, 7, 3);
INSERT INTO public.planet VALUES (6, 'Mercury', 689, 'this planet is known as planet mercury', false, 7, 6);
INSERT INTO public.planet VALUES (7, 'Venus', 712, 'this planet is known as planet venus', false, 7, 6);
INSERT INTO public.planet VALUES (8, 'Mars', 843, 'this planet is known as planet mars', false, 7, 8);
INSERT INTO public.planet VALUES (9, 'Jupiter', 931, 'this planet is known as planet jupiter', false, 7, 7);
INSERT INTO public.planet VALUES (10, 'Saturn', 1038, 'this planet is known as planet Saturn', false, 7, 7);
INSERT INTO public.planet VALUES (11, 'Uranus', 1249, 'this planet is known as planet Uranus', false, 7, 8);
INSERT INTO public.planet VALUES (12, 'Neptune', 1249, 'this planet is known as planet Neptune', false, 7, 2);
INSERT INTO public.planet VALUES (5, 'Earth', 437, 'this planet is known as planet earth', true, 7, 6);
INSERT INTO public.planet VALUES (13, 'Beater', 12490, 'this planet is known as planet beater', false, 7, 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Methuselah', 13700, 'It is also known as HD 140283 is a metal-poor subgaint star about 190 light years away from the earth in the constellation Libra, near the boundary with Ophiuchus in the Milky Way Galaxy.', 7);
INSERT INTO public.star VALUES (2, 'Reese', 13530, 'It is also known as 2MASS J18082002-5104378 is an ultra metal-poor (UMP) binary star system, in the constellation Ara, about 1,950 ly from earth and is a single-lined spectroscopic binary (SB1).', 7);
INSERT INTO public.star VALUES (3, 'Population II star', 13840, 'BD+17 3248 is an old star located at a distance of roughly 968 light years in Galactic Halo', 7);
INSERT INTO public.star VALUES (6, 'Methuselah 2', 16700, 'It is also known as HD 140283 is a metal-poor subgaint star about 190 light years away from the earth in the constellation Libra, near the boundary with Ophiuchus in the Milky Way Galaxy.', 3);
INSERT INTO public.star VALUES (7, 'Reese 14', 14540, 'It is also known as 2MASS J18082002-5104378 is an ultra metal-poor (UMP) binary star system, in the constellation Ara, about 1,950 ly from earth and is a single-lined spectroscopic binary (SB1).', 4);
INSERT INTO public.star VALUES (8, 'Population I star', 13840, 'BD+17 3248 is an old star located at a distance of roughly 968 light years in Galactic Halo', 5);


--
-- Name: dust_cloud_dust_cloud_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.dust_cloud_dust_cloud_id_seq', 6, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_start_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_start_id_seq', 8, true);


--
-- Name: dust_cloud dust_cloud_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dust_cloud
    ADD CONSTRAINT dust_cloud_name_key UNIQUE (name);


--
-- Name: dust_cloud dust_cloud_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dust_cloud
    ADD CONSTRAINT dust_cloud_pkey PRIMARY KEY (dust_cloud_id);


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
-- Name: dust_cloud dust_cloud_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dust_cloud
    ADD CONSTRAINT dust_cloud_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

