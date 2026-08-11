--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: astronomer; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.astronomer (
    astronomer_id integer NOT NULL,
    name character varying(60) NOT NULL,
    nationality character varying(50) NOT NULL,
    birth_year integer,
    main_discovery text,
    is_alive boolean
);


ALTER TABLE public.astronomer OWNER TO freecodecamp;

--
-- Name: astronomer_astronomer_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.astronomer_astronomer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.astronomer_astronomer_id_seq OWNER TO freecodecamp;

--
-- Name: astronomer_astronomer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.astronomer_astronomer_id_seq OWNED BY public.astronomer.astronomer_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_type character varying(30) NOT NULL,
    description text,
    age_in_millions_of_years integer,
    distance_from_earth numeric(15,2),
    has_life boolean,
    is_spherical boolean
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
    name character varying(50) NOT NULL,
    planet_id integer NOT NULL,
    description text,
    age_in_millions_of_years integer,
    radius_in_km numeric(10,2),
    is_spherical boolean,
    has_life boolean
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
    name character varying(50) NOT NULL,
    star_id integer NOT NULL,
    planet_type character varying(30),
    description text,
    age_in_millions_of_years integer,
    distance_from_earth numeric(15,2),
    has_life boolean,
    is_spherical boolean
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
    name character varying(50) NOT NULL,
    galaxy_id integer NOT NULL,
    star_type character varying(30),
    description text,
    age_in_millions_of_years integer,
    distance_from_earth numeric(15,2),
    has_life boolean,
    is_spherical boolean
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
-- Name: astronomer astronomer_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronomer ALTER COLUMN astronomer_id SET DEFAULT nextval('public.astronomer_astronomer_id_seq'::regclass);


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

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: astronomer; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.astronomer VALUES (1, 'Galileo Galilei', 'Italian', 1564, 'Observed the four largest moons of Jupiter.', false);
INSERT INTO public.astronomer VALUES (2, 'Edwin Hubble', 'American', 1889, 'Showed that the universe is expanding.', false);
INSERT INTO public.astronomer VALUES (3, 'Caroline Herschel', 'German', 1750, 'Discovered several comets and nebulae.', false);
INSERT INTO public.astronomer VALUES (4, 'Vera Rubin', 'American', 1928, 'Found evidence for dark matter in galaxy rotation.', false);
INSERT INTO public.astronomer VALUES (5, 'Jocelyn Bell Burnell', 'British', 1943, 'Discovered the first radio pulsars.', true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Barred Spiral', 'The galaxy that contains our Solar System.', 13600, 0.00, true, false);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Barred Spiral', 'Nearest large galaxy, on a collision course with the Milky Way.', 10010, 2537000.00, false, false);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 'Third largest member of the Local Group.', 13000, 2730000.00, false, false);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 'Irregular', 'A satellite galaxy of the Milky Way visible from the south.', 13000, 163000.00, false, false);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Lenticular', 'Bright galaxy with a large bulge and a dark dust lane.', 13250, 29350000.00, false, true);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 'Spiral', 'Interacting grand-design spiral galaxy in Canes Venatici.', 12000, 23000000.00, false, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 3, 'The only natural satellite of Earth.', 4530, 1737.40, true, false);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 'The larger and closer of the two Martian moons.', 4500, 11.27, false, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 'The smaller, outer moon of Mars.', 4500, 6.20, false, false);
INSERT INTO public.moon VALUES (4, 'Io', 5, 'The most volcanically active body in the Solar System.', 4500, 1821.60, true, false);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 'An icy moon with a probable subsurface ocean.', 4500, 1560.80, true, false);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 'The largest moon in the Solar System.', 4500, 2634.10, true, false);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 'A heavily cratered Galilean moon.', 4500, 2410.30, true, false);
INSERT INTO public.moon VALUES (8, 'Amalthea', 5, 'A small, reddish inner moon of Jupiter.', 4500, 83.50, false, false);
INSERT INTO public.moon VALUES (9, 'Himalia', 5, 'The largest member of the Himalia group.', 4500, 69.80, false, false);
INSERT INTO public.moon VALUES (10, 'Titan', 6, 'The only moon known to have a dense atmosphere.', 4500, 2574.70, true, false);
INSERT INTO public.moon VALUES (11, 'Rhea', 6, 'The second largest moon of Saturn.', 4500, 763.80, true, false);
INSERT INTO public.moon VALUES (12, 'Iapetus', 6, 'Famous for its two-tone coloring.', 4500, 734.50, true, false);
INSERT INTO public.moon VALUES (13, 'Dione', 6, 'An icy moon marked with bright ice cliffs.', 4500, 561.40, true, false);
INSERT INTO public.moon VALUES (14, 'Tethys', 6, 'An icy moon with a giant canyon system.', 4500, 531.10, true, false);
INSERT INTO public.moon VALUES (15, 'Enceladus', 6, 'Ejects water plumes from its south pole.', 4500, 252.10, true, false);
INSERT INTO public.moon VALUES (16, 'Mimas', 6, 'Dominated by the huge Herschel crater.', 4500, 198.20, true, false);
INSERT INTO public.moon VALUES (17, 'Titania', 7, 'The largest moon of Uranus.', 4500, 788.40, true, false);
INSERT INTO public.moon VALUES (18, 'Oberon', 7, 'The outermost major moon of Uranus.', 4500, 761.40, true, false);
INSERT INTO public.moon VALUES (19, 'Umbriel', 7, 'The darkest of the major Uranian moons.', 4500, 584.70, true, false);
INSERT INTO public.moon VALUES (20, 'Ariel', 7, 'The brightest moon of Uranus.', 4500, 578.90, true, false);
INSERT INTO public.moon VALUES (21, 'Miranda', 7, 'Has one of the most varied surfaces known.', 4500, 235.80, true, false);
INSERT INTO public.moon VALUES (22, 'Triton', 8, 'A large moon orbiting Neptune backwards.', 4500, 1353.40, true, false);
INSERT INTO public.moon VALUES (23, 'Nereid', 8, 'Has one of the most eccentric orbits known.', 4500, 178.50, false, false);
INSERT INTO public.moon VALUES (24, 'Proteus', 8, 'One of the darkest objects in the Solar System.', 4500, 210.00, false, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'Terrestrial', 'Smallest planet and closest to the Sun.', 4503, 0.61, false, true);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'Terrestrial', 'Hottest planet, wrapped in thick clouds of acid.', 4503, 0.28, false, true);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Terrestrial', 'The only planet known to support life.', 4543, 0.00, true, true);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'Terrestrial', 'The red planet, target of many rover missions.', 4603, 0.52, false, true);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'Gas Giant', 'Largest planet in the Solar System.', 4603, 4.20, false, true);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'Gas Giant', 'Famous for its extensive ring system.', 4503, 8.52, false, true);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 'Ice Giant', 'An ice giant that rotates on its side.', 4503, 18.21, false, true);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 'Ice Giant', 'The farthest known planet from the Sun.', 4503, 29.06, false, true);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 2, 'Exoplanet', 'An exoplanet in the habitable zone of Proxima Centauri.', 4850, 4.24, false, true);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri c', 2, 'Super Earth', 'A cold super-Earth orbiting Proxima Centauri.', 4850, 4.24, false, true);
INSERT INTO public.planet VALUES (11, 'Proxima Centauri d', 2, 'Exoplanet', 'A small candidate planet close to its star.', 4850, 4.24, false, true);
INSERT INTO public.planet VALUES (12, 'Vega Prime', 7, 'Gas Giant', 'A hypothetical gas giant used for modelling.', 400, 25.04, false, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'Yellow Dwarf', 'The star at the center of our Solar System.', 4600, 0.00, false, true);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 'Red Dwarf', 'The closest known star to the Sun.', 4850, 4.24, false, true);
INSERT INTO public.star VALUES (3, 'Sirius', 1, 'Main Sequence', 'The brightest star in the night sky.', 242, 8.60, false, true);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, 'Red Supergiant', 'A red supergiant in Orion expected to go supernova.', 10, 642.50, false, false);
INSERT INTO public.star VALUES (5, 'Rigel', 1, 'Blue Supergiant', 'The brightest star in the constellation Orion.', 8, 863.00, false, true);
INSERT INTO public.star VALUES (6, 'R136a1', 4, 'Blue Hypergiant', 'One of the most massive stars ever discovered.', 2, 163000.00, false, true);
INSERT INTO public.star VALUES (7, 'Vega', 1, 'Main Sequence', 'A bright, rapidly rotating star in Lyra.', 455, 25.04, false, false);


--
-- Name: astronomer_astronomer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.astronomer_astronomer_id_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 27, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: astronomer astronomer_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronomer
    ADD CONSTRAINT astronomer_name_key UNIQUE (name);


--
-- Name: astronomer astronomer_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronomer
    ADD CONSTRAINT astronomer_pkey PRIMARY KEY (astronomer_id);


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

