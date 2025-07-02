--
-- PostgreSQL database dump
--

-- Dumped from database version 15.7
-- Dumped by pg_dump version 16.3

-- Started on 2025-07-02 20:34:45

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
-- TOC entry 219 (class 1259 OID 17350)
-- Name: actors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.actors (
    id integer NOT NULL,
    name character varying,
    image_url text,
    age integer
);


ALTER TABLE public.actors OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 17349)
-- Name: actors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.actors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.actors_id_seq OWNER TO postgres;

--
-- TOC entry 3415 (class 0 OID 0)
-- Dependencies: 218
-- Name: actors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.actors_id_seq OWNED BY public.actors.id;


--
-- TOC entry 227 (class 1259 OID 17388)
-- Name: genres; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.genres (
    id integer NOT NULL,
    name character varying
);


ALTER TABLE public.genres OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 17387)
-- Name: genres_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.genres_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.genres_id_seq OWNER TO postgres;

--
-- TOC entry 3416 (class 0 OID 0)
-- Dependencies: 226
-- Name: genres_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.genres_id_seq OWNED BY public.genres.id;


--
-- TOC entry 215 (class 1259 OID 17332)
-- Name: movies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movies (
    id integer NOT NULL,
    name character varying,
    release_year integer,
    summary text,
    image_url text,
    trailer_url text,
    imdb_rating numeric(3,1),
    tr_summary text
);


ALTER TABLE public.movies OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 17358)
-- Name: movies_actors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movies_actors (
    movie_id integer NOT NULL,
    actor_id integer NOT NULL
);


ALTER TABLE public.movies_actors OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 17396)
-- Name: movies_genres; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movies_genres (
    movie_id integer NOT NULL,
    genre_id integer NOT NULL
);


ALTER TABLE public.movies_genres OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 17331)
-- Name: movies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.movies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.movies_id_seq OWNER TO postgres;

--
-- TOC entry 3417 (class 0 OID 0)
-- Dependencies: 214
-- Name: movies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.movies_id_seq OWNED BY public.movies.id;


--
-- TOC entry 225 (class 1259 OID 17378)
-- Name: raitings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.raitings (
    id integer NOT NULL,
    user_id integer,
    movie_id integer,
    series_id integer,
    raiting integer,
    comment text,
    country character varying,
    CONSTRAINT check_movie_series CHECK ((((movie_id IS NOT NULL) AND (series_id IS NULL)) OR ((movie_id IS NULL) AND (series_id IS NOT NULL))))
);


ALTER TABLE public.raitings OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 17377)
-- Name: raitings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.raitings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.raitings_id_seq OWNER TO postgres;

--
-- TOC entry 3418 (class 0 OID 0)
-- Dependencies: 224
-- Name: raitings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.raitings_id_seq OWNED BY public.raitings.id;


--
-- TOC entry 217 (class 1259 OID 17341)
-- Name: series; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.series (
    id integer NOT NULL,
    name character varying,
    release_year integer,
    summary text,
    image_url text,
    trailer_url text,
    imdb_rating numeric(3,1),
    end_year integer,
    total_seasons integer,
    total_episodes integer,
    tr_summary text
);


ALTER TABLE public.series OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 17363)
-- Name: series_actors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.series_actors (
    series_id integer NOT NULL,
    actor_id integer NOT NULL
);


ALTER TABLE public.series_actors OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 17407)
-- Name: series_genres; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.series_genres (
    series_id integer NOT NULL,
    genre_id integer NOT NULL
);


ALTER TABLE public.series_genres OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 17340)
-- Name: series_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.series_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.series_id_seq OWNER TO postgres;

--
-- TOC entry 3419 (class 0 OID 0)
-- Dependencies: 216
-- Name: series_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.series_id_seq OWNED BY public.series.id;


--
-- TOC entry 223 (class 1259 OID 17369)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying,
    email character varying,
    password character varying,
    language character varying
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 17368)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 3420 (class 0 OID 0)
-- Dependencies: 222
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 3216 (class 2604 OID 17353)
-- Name: actors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors ALTER COLUMN id SET DEFAULT nextval('public.actors_id_seq'::regclass);


--
-- TOC entry 3219 (class 2604 OID 17391)
-- Name: genres id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genres ALTER COLUMN id SET DEFAULT nextval('public.genres_id_seq'::regclass);


--
-- TOC entry 3214 (class 2604 OID 17335)
-- Name: movies id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies ALTER COLUMN id SET DEFAULT nextval('public.movies_id_seq'::regclass);


--
-- TOC entry 3218 (class 2604 OID 17381)
-- Name: raitings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.raitings ALTER COLUMN id SET DEFAULT nextval('public.raitings_id_seq'::regclass);


--
-- TOC entry 3215 (class 2604 OID 17344)
-- Name: series id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.series ALTER COLUMN id SET DEFAULT nextval('public.series_id_seq'::regclass);


--
-- TOC entry 3217 (class 2604 OID 17372)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3399 (class 0 OID 17350)
-- Dependencies: 219
-- Data for Name: actors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.actors (id, name, image_url, age) FROM stdin;
1	Emilia Clarke	https://media.themoviedb.org/t/p/w300_and_h450_bestv2/wb8VfDPGpyqcFltnRcJR1Wj3h4Z.jpg	\N
2	Kit Harington	https://media.themoviedb.org/t/p/w300_and_h450_bestv2/iCFQAQqb0SgvxEdVYhJtZLhM9kp.jpg	\N
3	Peter Dinklage	https://media.themoviedb.org/t/p/w300_and_h450_bestv2/9CAd7wr8QZyIN0E7nm8v1B6WkGn.jpg	\N
4	Lena Headey	https://media.themoviedb.org/t/p/w300_and_h450_bestv2/5SL4Y4alOYF9EahObfsb6GaDHg4.jpg	\N
5	Maisie Williams	https://media.themoviedb.org/t/p/w300_and_h450_bestv2/5RjD4dDpRDAhalFtvcUj7zdLWYB.jpg	\N
6	Matt Smith	https://media.themoviedb.org/t/p/w300_and_h450_bestv2/b3AYe7kkImkB35CoYwlUqHnJGF8.jpg	\N
7	Emma D'Arcy	https://media.themoviedb.org/t/p/w300_and_h450_bestv2/9Zlmb7VmtVCxkLq5yqFFRRxCaED.jpg	\N
8	Olivia Cooke	https://media.themoviedb.org/t/p/w300_and_h450_bestv2/7LYm4jGDq8IxAe4D6TTPkWwU0Ft.jpg	\N
9	Bryan Cranston	https://media.themoviedb.org/t/p/w300_and_h450_bestv2/aGSvZg7uITJveQtGHDcPNI6map1.jpg	\N
10	Aaron Paul	https://media.themoviedb.org/t/p/w300_and_h450_bestv2/8Ac9uuoYwZoYVAIJfRLzzLsGGJn.jpg	\N
11	Giancarlo Esposito	https://media.themoviedb.org/t/p/w300_and_h450_bestv2/rcXnr82TwDzU4ZGdBeNXfG0ZQnZ.jpg	\N
12	Cillian Murphy	https://media.themoviedb.org/t/p/w300_and_h450_bestv2/llkbyWKwpfowZ6C8peBjIV9jj99.jpg	\N
13	Paul Anderson	https://media.themoviedb.org/t/p/w300_and_h450_bestv2/nds5rTBZvJ4rEsP4N6OaoEgQDkW.jpg	\N
14	Sophie Rundle	https://media.themoviedb.org/t/p/w300_and_h450_bestv2/z9XtNoPy9IazsdPB1fCoI8KuZoG.jpg	\N
15	Neil Patrick Harris	https://media.themoviedb.org/t/p/w300_and_h450_bestv2/qZwbo23uaJU87NxE5RubbeeLTYh.jpg	\N
16	Josh Radnor	https://media.themoviedb.org/t/p/w300_and_h450_bestv2/rHx4D70iRUkka5kl9064kOvmSQs.jpg	\N
17	Jason Segel	https://media.themoviedb.org/t/p/w300_and_h450_bestv2/aG6tVNSbl1YEjN65G3luFYnWbUM.jpg	\N
18	Cobie Smulders	https://media.themoviedb.org/t/p/w300_and_h450_bestv2/1b0mYokcGsfFRge4bjXlS5ihtek.jpg	\N
19	Alyson Hannigan	https://media.themoviedb.org/t/p/w300_and_h450_bestv2/bO16z8rAzZWdjCga8dcbJ2AFAh2.jpg	\N
20	Yûki Kaji	https://media.themoviedb.org/t/p/w300_and_h450_bestv2/8wKdPV11IwowfwoqGqMMNt9hmp6.jpg	\N
21	Yui Ishikawa	https://media.themoviedb.org/t/p/w300_and_h450_bestv2/2y1y1W4q8UIR0Vbs4NNvc7722XT.jpg	\N
22	Hiroshi Kamiya	https://m.media-amazon.com/images/M/MV5BNTQxMDlhNTQtMmI0Zi00OWVhLWIzYzYtNGQ3OGJjZmZjNGJlXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg	\N
23	Cosmo Jarvis	https://media.themoviedb.org/t/p/w300_and_h450_bestv2/1kgghZ558CxZCJip5ufO6BAqUGp.jpg	\N
24	Anna Sawai	https://media.themoviedb.org/t/p/w300_and_h450_bestv2/6uFaCOupDTPRnTiedveTUvjOikC.jpg	\N
25	Hiroyuki Sanada	https://media.themoviedb.org/t/p/w300_and_h450_bestv2/SOwDxhGnRccP2lAtssQ7TxCzOe.jpg	\N
26	Victoria Pedretti	https://media.themoviedb.org/t/p/w300_and_h450_bestv2/dSrIMNn803L8fqqWjkCSRv4iOu1.jpg	\N
27	Michiel Huisman	https://media.themoviedb.org/t/p/w300_and_h450_bestv2/4QQp2HIrBubKSBZpSWLzI21fNzA.jpg	\N
28	Oliver Jackson-Cohen	https://media.themoviedb.org/t/p/w300_and_h450_bestv2/dd84B5U7Zd2kAh7is35Yhn1qTZK.jpg	\N
29	Andy Samberg	https://media.themoviedb.org/t/p/w300_and_h450_bestv2/jMXU5oG3i93SH1yhkpbBGskFiJl.jpg	\N
30	Melissa Fumero	https://media.themoviedb.org/t/p/w300_and_h450_bestv2/x4LpHhitsPjlyTLoDTDTm55OnHZ.jpg	\N
31	Terry Crews	https://media.themoviedb.org/t/p/w300_and_h450_bestv2/pxTY4SglLo5hFcMH00MxPeC5u55.jpg	\N
32	Stephanie Beatriz	https://media.themoviedb.org/t/p/w300_and_h450_bestv2/7gNPOlsVIdg7QQOv1gRfHjv1Sdb.jpg	\N
33	Matthew Fox	https://media.themoviedb.org/t/p/w300_and_h450_bestv2/6VIfueb4j3GCsIhxnstsXlY5C3Y.jpg	\N
34	Evangeline Lilly	https://media.themoviedb.org/t/p/w300_and_h450_bestv2/pJHX2jd7ytre3NQbF9nlyWUqxH3.jpg	\N
35	Jorge Garcia	https://media.themoviedb.org/t/p/w300_and_h450_bestv2/fcAzP3fCI2sOV8APKe0KFmG66uB.jpg	\N
36	Matthew McConaughey	https://media.themoviedb.org/t/p/w300_and_h450_bestv2/lCySuYjhXix3FzQdS4oceDDrXKI.jpg	\N
37	Anne Hathaway	https://media.themoviedb.org/t/p/w300_and_h450_bestv2/dUnrbrn2FeqfdpGRArPZeWPsS2g.jpg	\N
38	Jessica Chastain	https://media.themoviedb.org/t/p/w300_and_h450_bestv2/xRvRzxiiHhgUErl0yf9w8WariRE.jpg	\N
39	Emily Blunt	https://media.themoviedb.org/t/p/w300_and_h450_bestv2/zpJ7pupuNF3W0zTxm6yioGIoxbd.jpg	\N
40	Matt Damon	https://media.themoviedb.org/t/p/w300_and_h450_bestv2/At3JgvaNeEN4Z4ESKlhhes85Xo3.jpg	\N
41	Robert Downey Jr.	https://media.themoviedb.org/t/p/w300_and_h450_bestv2/5qHNjhtjMD4YWH3UP0rm4tKwxCL.jpg	\N
42	Hayden Christensen	https://media.themoviedb.org/t/p/w300_and_h450_bestv2/hqEgJYEUvZvL9ytmmiYBbbt63qd.jpg	\N
43	Natalie Portman	https://media.themoviedb.org/t/p/w300_and_h450_bestv2/edPU5HxncLWa1YkgRPNkSd68ONG.jpg	\N
44	Ewan McGregor	https://media.themoviedb.org/t/p/w300_and_h450_bestv2/q2UDxfwWnmXTB7khOUF3J9puBVP.jpg	\N
45	Viggo Mortensen	https://media.themoviedb.org/t/p/w300_and_h450_bestv2/vH5gVSpHAMhDaFWfh0Q7BG61O1y.jpg	\N
46	Elijah Wood	https://media.themoviedb.org/t/p/w300_and_h450_bestv2/7UKRbJBNG7mxBl2QQc5XsAh6F8B.jpg	\N
47	Ian McKellen	https://media.themoviedb.org/t/p/w300_and_h450_bestv2/5cnnnpnJG6TiYUSS7qgJheUZgnv.jpg	\N
48	Bill Skarsgård	https://media.themoviedb.org/t/p/w300_and_h450_bestv2/xBXLx1m0uzhXIbY3wN8lmPGeUHl.jpg	\N
49	Jaeden Martell	https://media.themoviedb.org/t/p/w300_and_h450_bestv2/29lQhfMR4nLUJROKq76x93NXPw1.jpg	\N
50	Finn Wolfhard	https://media.themoviedb.org/t/p/w300_and_h450_bestv2/5OVmquAk0W5BIsRlVKslEP497JD.jpg	\N
51	Christian Bale	https://media.themoviedb.org/t/p/w300_and_h450_bestv2/7Pxez9J8fuPd2Mn9kex13YALrCQ.jpg	\N
52	Heath Ledger	https://media.themoviedb.org/t/p/w300_and_h450_bestv2/5Y9HnYYa9jF4NunY9lSgJGjSe8E.jpg	\N
53	Michael Caine	https://media.themoviedb.org/t/p/w300_and_h450_bestv2/bVZRMlpjTAO2pJK6v90buFgVbSW.jpg	\N
54	Leonardo DiCaprio	https://media.themoviedb.org/t/p/w300_and_h450_bestv2/wo2hJpn04vbtmh0B9utCFdsQhxM.jpg	\N
55	Tom Hardy	https://media.themoviedb.org/t/p/w300_and_h450_bestv2/d81K0RH8UX7tZj49tZaQhZ9ewH.jpg	\N
56	Joseph Gordon-Levitt	https://media.themoviedb.org/t/p/w300_and_h450_bestv2/4U9G4YwTlIEbAymBaseltS38eH4.jpg	\N
57	Chris Evans	https://media.themoviedb.org/t/p/w300_and_h450_bestv2/3bOGNsHlrswhyW79uvIHH1V43JI.jpg	\N
58	Chris Hemsworth	https://media.themoviedb.org/t/p/w300_and_h450_bestv2/piQGdoIQOF3C1EI5cbYZLAW1gfj.jpg	\N
59	Scarlett Johansson	https://media.themoviedb.org/t/p/w300_and_h450_bestv2/8m21eocprLYuW0ywveIgThk6VM.jpg	\N
60	Liam Neeson	https://media.themoviedb.org/t/p/w300_and_h450_bestv2/sRLev3wJioBgun3ZoeAUFpkLy0D.jpg	\N
61	Ralph Fiennes	https://media.themoviedb.org/t/p/w300_and_h450_bestv2/u29BOqiV5GCQ8k8WUJM50i9xlBf.jpg	\N
62	Ben Kingsley	https://media.themoviedb.org/t/p/w300_and_h450_bestv2/vQtBqpF2HDdzbfXHDzR4u37i1Ac.jpg	\N
63	Russell Crowe	https://media.themoviedb.org/t/p/w300_and_h450_bestv2/rsxGCRtPu42uKDJZlz7qknvz8h6.jpg	\N
64	Joaquin Phoenix	https://media.themoviedb.org/t/p/w300_and_h450_bestv2/u38k3hQBDwNX0VA22aQceDp9Iyv.jpg	\N
65	Connie Nielsen	https://media.themoviedb.org/t/p/w300_and_h450_bestv2/lvQypTfeH2Gn2PTbzq6XkT2PLmn.jpg	\N
\.


--
-- TOC entry 3407 (class 0 OID 17388)
-- Dependencies: 227
-- Data for Name: genres; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.genres (id, name) FROM stdin;
9	Mystery
8	Horror
7	Fantasy
6	Drama
5	Comedy
4	Anime
3	Animation
2	Adventure
1	Action
14	History
13	War
12	Crime
11	Sport
10	Sci-Fi
15	Biography
16	Crime
17	Epic
18	Superhero
19	Romance
20	Sitcom
\.


--
-- TOC entry 3395 (class 0 OID 17332)
-- Dependencies: 215
-- Data for Name: movies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.movies (id, name, release_year, summary, image_url, trailer_url, imdb_rating, tr_summary) FROM stdin;
2	Oppenheimer	2023	A dramatization of the life story of J. Robert Oppenheimer, the physicist who had a large hand in the development of the atomic bombs that brought an end to World War II.	https://image.tmdb.org/t/p/w500/ptpr0kGAckfQkJeJIt8st5dglvd.jpg	https://www.youtube.com/embed/uYPbbksJxIg	8.3	II. Dünya Savaşı'nı sona erdiren atom bombalarının geliştirilmesinde büyük rol oynayan fizikçi J. Robert Oppenheimer’ın hayat hikâyesinin dramatik bir anlatımı.
10	Gladiator	2000	A former Roman General sets out to exact vengeance against the corrupt emperor who murdered his family and sent him into slavery.	https://image.tmdb.org/t/p/w500/ty8TGRuvJLPUmAR1H1nRIsgwvim.jpg	https://www.youtube.com/embed/P5ieIbInFpg	8.5	Eski bir Roma Generali, ailesini öldürüp onu köleliğe gönderen yozlaşmış imparatora karşı intikam almak için yola çıkar.
4	The Lord of the Rings: The Return of the King	2003	Gandalf and Aragorn lead the World of Men against Sauron's army to draw his gaze from Frodo and Sam as they approach Mount Doom with the One Ring.	https://image.tmdb.org/t/p/w500/rCzpDGLbOoPwLjy3OAm5NUPOTrC.jpg	https://www.youtube.com/embed/r5X-hFf6Bwo	9.0	Gandalf ve Aragorn, Frodo ile Sam’in Tek Yüzük’le birlikte Kıyamet Dağı’na yaklaşırken Sauron’un dikkatini onlardan uzaklaştırmak için İnsanlar Dünyası’nı Sauron’un ordusuna karşı savaşa liderlik eder.
5	It	2017	In the summer of 1989, a group of bullied kids band together to destroy a shape-shifting monster, which disguises itself as a clown and preys on the children of Derry, their small Maine town.	https://image.tmdb.org/t/p/w500/9E2y5Q7WlCVNEhP5GiVTjhEhx1o.jpg	https://www.youtube.com/embed/xKJmEC5ieOk	7.3	1989 yazında, zorbalığa uğrayan bir grup çocuk, küçük Maine kasabaları Derry’de çocukları avlayan ve palyaço kılığına giren şekil değiştiren bir canavarı yok etmek için güçlerini birleştirir.
3	Star Wars: Episode III - Revenge of the Sith	2005	As the Clone Wars nears its end, Obi-Wan Kenobi pursues a new threat, while Anakin Skywalker is lured by Chancellor Palpatine into a sinister plot for galactic domination.	https://media.themoviedb.org/t/p/w220_and_h330_face/xfSAoBEm9MNBjmlNcDYLvLSMlnq.jpg	https://www.youtube.com/embed/5UnjrG_N8hU	7.6	Klon Savaşları sona yaklaşırken, Obi-Wan Kenobi yeni bir tehdidin peşine düşerken, Anakin Skywalker Şansölye Palpatine tarafından galaksiyi ele geçirmeye yönelik karanlık bir planın içine çekilir.
1	Interstellar	2014	When Earth becomes uninhabitable in the future, a farmer and ex-NASA pilot, Joseph Cooper, is tasked to pilot a spacecraft, along with a team of researchers, to find a new planet for humans.	https://image.tmdb.org/t/p/w500/gEU2QniE6E77NI6lCU6MxlNBvIx.jpg	https://www.youtube.com/embed/zSWdZVtXT7E	8.7	Gelecekte Dünya yaşanamaz hale geldiğinde, çiftçi ve eski NASA pilotu Joseph Cooper, insanlık için yeni bir gezegen bulmak üzere bir grup araştırmacıyla birlikte bir uzay aracını pilotluk etmekle görevlendirilir.
6	The Dark Knight	2008	When a menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman, James Gordon and Harvey Dent must work together to put an end to the madness.	https://image.tmdb.org/t/p/w500/qJ2tW6WMUDux911r6m7haRef0WH.jpg	https://www.youtube.com/embed/EXeTwQWrcwY	9.0	Joker adında bir tehdit Gotham halkı üzerinde kaos ve yıkım yaratmaya başladığında, Batman, James Gordon ve Harvey Dent bu deliliğe son vermek için birlikte çalışmak zorunda kalır.
7	Inception	2010	A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O., but his tragic past may doom the project and his team to disaster.	https://image.tmdb.org/t/p/w500/edv5CZvWj09upOsy2Y6IwDhK8bt.jpg	https://www.youtube.com/embed/YoHD9XEInc0	8.8	Rüya paylaşım teknolojisini kullanarak kurumsal sırları çalan bir hırsıza, bu kez tersine bir görev verilir: bir CEO’nun zihnine bir fikir yerleştirmek. Ancak hırsızın trajik geçmişi, hem görevi hem de ekibini felakete sürükleyebilir.
8	Avengers: Endgame	2019	After the devastating events of Avengers: Sonsuzluk Savaşı (2018), the universe is in ruins. With the help of remaining allies, the Avengers assemble once more in order to reverse Thanos' actions and restore balance to the universe.	https://image.tmdb.org/t/p/w500/or06FN3Dka5tukK1e9sl16pB3iy.jpg	https://www.youtube.com/embed/TcMBFSGVi1c	8.4	Avengers: Sonsuzluk Savaşı (2018) filmindeki yıkıcı olayların ardından evren harap haldedir. Geriye kalan müttefiklerin yardımıyla Avengers ekibi, Thanos’un yaptıklarını geri almak ve evrende dengeyi yeniden sağlamak için bir kez daha bir araya gelir.
9	Schindler's List	1993	In German-occupied Poland during World War II, industrialist Oskar Schindler gradually becomes concerned for his Jewish workforce after witnessing their persecution by the Nazis.	https://image.tmdb.org/t/p/w500/c8Ass7acuOe4za6DhSattE359gr.jpg	https://www.youtube.com/embed/mxphAlJID9U	9.0	II. Dünya Savaşı sırasında Nazi işgali altındaki Polonya’da, sanayici Oskar Schindler, Yahudi işçilerine yönelik zulme tanık olduktan sonra onların güvenliği konusunda giderek endişelenmeye başlar.
\.


--
-- TOC entry 3400 (class 0 OID 17358)
-- Dependencies: 220
-- Data for Name: movies_actors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.movies_actors (movie_id, actor_id) FROM stdin;
1	36
1	37
1	38
2	12
2	39
2	40
3	42
3	43
3	44
4	45
4	46
4	47
5	48
5	49
5	50
6	51
6	52
6	53
7	54
7	55
7	56
8	41
8	57
8	58
9	60
9	61
9	62
10	65
10	64
10	63
2	41
8	59
\.


--
-- TOC entry 3408 (class 0 OID 17396)
-- Dependencies: 228
-- Data for Name: movies_genres; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.movies_genres (movie_id, genre_id) FROM stdin;
1	1
1	2
1	6
1	10
2	6
2	14
2	15
3	1
3	2
3	6
3	10
4	1
4	2
4	7
5	8
6	1
6	6
6	16
6	17
6	18
7	1
7	2
7	10
7	17
8	1
8	2
8	10
8	18
9	6
9	14
9	15
9	17
10	1
10	2
10	6
10	17
\.


--
-- TOC entry 3405 (class 0 OID 17378)
-- Dependencies: 225
-- Data for Name: raitings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.raitings (id, user_id, movie_id, series_id, raiting, comment, country) FROM stdin;
\.


--
-- TOC entry 3397 (class 0 OID 17341)
-- Dependencies: 217
-- Data for Name: series; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.series (id, name, release_year, summary, image_url, trailer_url, imdb_rating, end_year, total_seasons, total_episodes, tr_summary) FROM stdin;
2	Hose of the Dragon	2022	An internal succession war within House Targaryen at the height of its power, 172 years before the birth of Daenerys Targaryen.	https://image.tmdb.org/t/p/w500/z2yahl2uefxDCl0nogcRBstwruJ.jpg	https://www.youtube.com/embed/D0tnJ7TtA34	8.3	\N	2	27	Daenerys Targaryen’in doğumundan 172 yıl önce, Targaryen Hanesi'nin en güçlü döneminde yaşanan bir iç taht mücadelesi.
6	Shogun	2024	When a mysterious European ship is found marooned in a nearby Japanese fishing village, Lord Yoshii Toranaga discovers secrets that could tip the scales of power and devastate his enemies.	https://media.themoviedb.org/t/p/w220_and_h330_face/7O4iVfOMQmdCSxhOg1WnzG1AgYT.jpg	https://www.youtube.com/embed/yOixbB_G-54	8.6	2026	2	12	Gizemli bir Avrupa gemisi yakınlardaki bir Japon balıkçı köyünde karaya oturmuş halde bulunduğunda, Lord Yoshii Toranaga, güç dengelerini değiştirebilecek ve düşmanlarını yok edebilecek sırları keşfeder.
7	Peaky Blinders	2013	A gangster family epic set in 1900s England, centering on a gang who sew razor blades in the peaks of their caps, and their fierce boss Tommy Shelby.	https://media.themoviedb.org/t/p/w220_and_h330_face/vUUqzWa2LnHIVqkaKVlVGkVcZIW.jpg	https://www.youtube.com/embed/oVzVdvGIC7U	8.7	2022	6	36	1900’ler İngiltere’sinde geçen bir gangster ailesi destanı; şapkalarının siperliklerine jilet diken bir çeteyi ve onların karizmatik ve acımasız lideri Tommy Shelby’yi merkezine alır.
9	Lost	2004	The survivors of a plane crash are forced to work together in order to survive on a seemingly deserted tropical island.	https://media.themoviedb.org/t/p/w220_and_h330_face/og6S0aTZU6YUJAbqxeKjCa3kY1E.jpg	https://www.youtube.com/embed/KTu8iDynwNc	8.3	2010	6	121	Bir uçak kazasından sağ kurtulanlar, terkedilmiş gibi görünen tropik bir adada hayatta kalabilmek için birlikte çalışmak zorunda kalırlar.
4	Attack on Titan	2013	After his hometown is destroyed, young Eren Jaeger vows to cleanse the earth of the giant humanoid Titans that have brought humanity to the brink of extinction.	https://media.themoviedb.org/t/p/w220_and_h330_face/uAlgu4talmCw772hYT5vlnO6Asu.jpg	https://www.youtube.com/embed/MGRm4IzK1SQ	9.1	2023	4	98	Memleketi yok edildikten sonra genç Eren Jaeger, insanlığı yok olmanın eşiğine getiren dev insansı Titanları yeryüzünden silmeye ant içer.
3	How I Met Your Mother	2005	A father recounts to his children the journey he and his four best friends took leading up to him meeting their mother.	https://media.themoviedb.org/t/p/w220_and_h330_face/b34jPzmB0wZy7EjUZoleXOl2RRI.jpg	https://www.youtube.com/embed/cXj2kBTEW1A	8.3	2014	9	208	Bir baba, çocuklarına anneleriyle tanışmadan önce en iyi dört arkadaşıyla birlikte çıktığı yolculuğu anlatır.
5	Breaking Bad	2008	A chemistry teacher diagnosed with inoperable lung cancer turns to manufacturing and selling methamphetamine with a former student to secure his family's future.	https://image.tmdb.org/t/p/w500/ggFHVNu6YYI5L9pCfOacjizRGt.jpg	https://www.youtube.com/embed/HhesaQXLuRY	9.5	2013	5	92	Ameliyat edilemeyen akciğer kanseri teşhisi konulan bir kimya öğretmeni, ailesinin geleceğini güvence altına almak için eski bir öğrencisiyle birlikte metamfetamin üretip satmaya başlar.
1	Game of Thrones	2011	Nine noble families fight for control over the lands of Westeros, while an ancient enemy returns after being dormant for millennia	https://image.tmdb.org/t/p/w500/u3bZgnGQ9T01sWNhyveQz0wH0Hl.jpg	https://www.youtube.com/embed/KPLWWIOCOOQ	9.2	2019	8	74	Dokuz soylu aile, Westeros toprakları üzerinde hakimiyet kurmak için mücadele ederken, bin yıllardır uykuda olan kadim bir düşman yeniden ortaya çıkar.
8	The Haunting of Hill House	2018	Flashing between past and present, a fractured family confronts haunting memories of their old home and the terrifying events that drove them from it.	https://media.themoviedb.org/t/p/w220_and_h330_face/38PkhBGRQtmVx2drvPik3F42qHO.jpg	https://www.youtube.com/embed/Ce0RQq-rjPk	8.5	2018	1	10	Geçmiş ile günümüz arasında gidip gelen hikâyede, parçalanmış bir aile eski evlerine dair ürkütücü anılarla ve onları oradan kaçmaya zorlayan korkunç olaylarla yüzleşir.
10	Brooklyn Nine-Nine	2013	Comedy series following the exploits of Det. Jake Peralta and his diverse, lovable colleagues as they police the NYPD's 99th Precinct.	https://media.themoviedb.org/t/p/w220_and_h330_face/hgRMSOt7a1b8qyQR68vUixJPang.jpg	https://www.youtube.com/embed/sEOuJ4z5aTc	8.4	2021	8	153	Dedektif Jake Peralta ve onun çeşitli ve sevimli meslektaşlarının NYPD'nin 99. Karakolu'ndaki maceralarını konu alan bir komedi dizisi.
\.


--
-- TOC entry 3401 (class 0 OID 17363)
-- Dependencies: 221
-- Data for Name: series_actors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.series_actors (series_id, actor_id) FROM stdin;
10	29
9	35
9	34
9	33
8	28
8	27
8	26
7	14
7	13
7	12
6	25
6	24
6	23
5	11
5	10
5	9
4	22
4	21
4	20
3	19
3	18
3	17
3	16
3	15
2	8
2	7
2	6
1	5
1	4
1	3
1	2
1	1
10	31
10	30
10	32
\.


--
-- TOC entry 3409 (class 0 OID 17407)
-- Dependencies: 229
-- Data for Name: series_genres; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.series_genres (series_id, genre_id) FROM stdin;
1	17
1	7
1	6
1	1
1	2
2	1
2	2
2	6
2	4
2	17
3	5
3	6
3	19
4	4
4	6
4	1
4	2
4	17
5	6
5	17
5	12
6	1
6	2
6	6
6	13
6	17
7	6
7	16
8	6
8	8
8	9
9	2
9	6
9	7
9	10
9	9
3	20
10	5
10	12
10	20
\.


--
-- TOC entry 3403 (class 0 OID 17369)
-- Dependencies: 223
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, username, email, password, language) FROM stdin;
\.


--
-- TOC entry 3421 (class 0 OID 0)
-- Dependencies: 218
-- Name: actors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.actors_id_seq', 1, false);


--
-- TOC entry 3422 (class 0 OID 0)
-- Dependencies: 226
-- Name: genres_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.genres_id_seq', 1, false);


--
-- TOC entry 3423 (class 0 OID 0)
-- Dependencies: 214
-- Name: movies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.movies_id_seq', 1, false);


--
-- TOC entry 3424 (class 0 OID 0)
-- Dependencies: 224
-- Name: raitings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.raitings_id_seq', 1, false);


--
-- TOC entry 3425 (class 0 OID 0)
-- Dependencies: 216
-- Name: series_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.series_id_seq', 1, true);


--
-- TOC entry 3426 (class 0 OID 0)
-- Dependencies: 222
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- TOC entry 3226 (class 2606 OID 17357)
-- Name: actors actors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_pkey PRIMARY KEY (id);


--
-- TOC entry 3236 (class 2606 OID 17395)
-- Name: genres genres_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genres
    ADD CONSTRAINT genres_pkey PRIMARY KEY (id);


--
-- TOC entry 3228 (class 2606 OID 17362)
-- Name: movies_actors id_movies_actors; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies_actors
    ADD CONSTRAINT id_movies_actors PRIMARY KEY (movie_id, actor_id);


--
-- TOC entry 3238 (class 2606 OID 17400)
-- Name: movies_genres id_movies_genres; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies_genres
    ADD CONSTRAINT id_movies_genres PRIMARY KEY (movie_id, genre_id);


--
-- TOC entry 3230 (class 2606 OID 17367)
-- Name: series_actors id_series_actors; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.series_actors
    ADD CONSTRAINT id_series_actors PRIMARY KEY (series_id, actor_id);


--
-- TOC entry 3240 (class 2606 OID 17411)
-- Name: series_genres id_series_genres; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.series_genres
    ADD CONSTRAINT id_series_genres PRIMARY KEY (series_id, genre_id);


--
-- TOC entry 3222 (class 2606 OID 17339)
-- Name: movies movies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_pkey PRIMARY KEY (id);


--
-- TOC entry 3234 (class 2606 OID 17386)
-- Name: raitings raitings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.raitings
    ADD CONSTRAINT raitings_pkey PRIMARY KEY (id);


--
-- TOC entry 3224 (class 2606 OID 17348)
-- Name: series series_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.series
    ADD CONSTRAINT series_pkey PRIMARY KEY (id);


--
-- TOC entry 3232 (class 2606 OID 17376)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3241 (class 2606 OID 17417)
-- Name: movies_actors fk_actor_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies_actors
    ADD CONSTRAINT fk_actor_id FOREIGN KEY (actor_id) REFERENCES public.actors(id) NOT VALID;


--
-- TOC entry 3243 (class 2606 OID 17452)
-- Name: series_actors fk_actor_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.series_actors
    ADD CONSTRAINT fk_actor_id FOREIGN KEY (actor_id) REFERENCES public.actors(id) NOT VALID;


--
-- TOC entry 3248 (class 2606 OID 17427)
-- Name: movies_genres fk_genre_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies_genres
    ADD CONSTRAINT fk_genre_id FOREIGN KEY (genre_id) REFERENCES public.genres(id) NOT VALID;


--
-- TOC entry 3250 (class 2606 OID 17462)
-- Name: series_genres fk_genre_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.series_genres
    ADD CONSTRAINT fk_genre_id FOREIGN KEY (genre_id) REFERENCES public.genres(id) NOT VALID;


--
-- TOC entry 3242 (class 2606 OID 17412)
-- Name: movies_actors fk_movie_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies_actors
    ADD CONSTRAINT fk_movie_id FOREIGN KEY (movie_id) REFERENCES public.movies(id) NOT VALID;


--
-- TOC entry 3249 (class 2606 OID 17422)
-- Name: movies_genres fk_movie_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies_genres
    ADD CONSTRAINT fk_movie_id FOREIGN KEY (movie_id) REFERENCES public.movies(id) NOT VALID;


--
-- TOC entry 3245 (class 2606 OID 17437)
-- Name: raitings fk_movie_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.raitings
    ADD CONSTRAINT fk_movie_id FOREIGN KEY (movie_id) REFERENCES public.movies(id) NOT VALID;


--
-- TOC entry 3246 (class 2606 OID 17442)
-- Name: raitings fk_series_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.raitings
    ADD CONSTRAINT fk_series_id FOREIGN KEY (series_id) REFERENCES public.series(id) NOT VALID;


--
-- TOC entry 3244 (class 2606 OID 17447)
-- Name: series_actors fk_series_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.series_actors
    ADD CONSTRAINT fk_series_id FOREIGN KEY (series_id) REFERENCES public.series(id) NOT VALID;


--
-- TOC entry 3251 (class 2606 OID 17457)
-- Name: series_genres fk_series_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.series_genres
    ADD CONSTRAINT fk_series_id FOREIGN KEY (series_id) REFERENCES public.series(id) NOT VALID;


--
-- TOC entry 3247 (class 2606 OID 17432)
-- Name: raitings fk_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.raitings
    ADD CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES public.users(id) NOT VALID;


-- Completed on 2025-07-02 20:34:45

--
-- PostgreSQL database dump complete
--

