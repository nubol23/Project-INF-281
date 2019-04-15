--
-- PostgreSQL database dump
--

-- Dumped from database version 10.7 (Ubuntu 10.7-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.7 (Ubuntu 10.7-0ubuntu0.18.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
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


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: project_food_user
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO project_food_user;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: project_food_user
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO project_food_user;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: project_food_user
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: project_food_user
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO project_food_user;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: project_food_user
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO project_food_user;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: project_food_user
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: project_food_user
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO project_food_user;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: project_food_user
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO project_food_user;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: project_food_user
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: project_food_user
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO project_food_user;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: project_food_user
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO project_food_user;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: project_food_user
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO project_food_user;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: project_food_user
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: project_food_user
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO project_food_user;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: project_food_user
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: project_food_user
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO project_food_user;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: project_food_user
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO project_food_user;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: project_food_user
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: project_food_user
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO project_food_user;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: project_food_user
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO project_food_user;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: project_food_user
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: project_food_user
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO project_food_user;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: project_food_user
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO project_food_user;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: project_food_user
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: project_food_user
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO project_food_user;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: project_food_user
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO project_food_user;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: project_food_user
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: project_food_user
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO project_food_user;

--
-- Name: food_recommender_dish; Type: TABLE; Schema: public; Owner: project_food_user
--

CREATE TABLE public.food_recommender_dish (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    preparation text NOT NULL,
    "imagePath" character varying(200) NOT NULL,
    uploader character varying(200) NOT NULL
);


ALTER TABLE public.food_recommender_dish OWNER TO project_food_user;

--
-- Name: food_recommender_dish_id_seq; Type: SEQUENCE; Schema: public; Owner: project_food_user
--

CREATE SEQUENCE public.food_recommender_dish_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.food_recommender_dish_id_seq OWNER TO project_food_user;

--
-- Name: food_recommender_dish_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: project_food_user
--

ALTER SEQUENCE public.food_recommender_dish_id_seq OWNED BY public.food_recommender_dish.id;


--
-- Name: food_recommender_dishingredients; Type: TABLE; Schema: public; Owner: project_food_user
--

CREATE TABLE public.food_recommender_dishingredients (
    id integer NOT NULL,
    quantity double precision NOT NULL,
    unit character varying(10) NOT NULL,
    dish_id integer NOT NULL,
    ingredient_id integer NOT NULL
);


ALTER TABLE public.food_recommender_dishingredients OWNER TO project_food_user;

--
-- Name: food_recommender_dishingredients_id_seq; Type: SEQUENCE; Schema: public; Owner: project_food_user
--

CREATE SEQUENCE public.food_recommender_dishingredients_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.food_recommender_dishingredients_id_seq OWNER TO project_food_user;

--
-- Name: food_recommender_dishingredients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: project_food_user
--

ALTER SEQUENCE public.food_recommender_dishingredients_id_seq OWNED BY public.food_recommender_dishingredients.id;


--
-- Name: food_recommender_dishinterest; Type: TABLE; Schema: public; Owner: project_food_user
--

CREATE TABLE public.food_recommender_dishinterest (
    id integer NOT NULL,
    score integer NOT NULL,
    dish_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.food_recommender_dishinterest OWNER TO project_food_user;

--
-- Name: food_recommender_dishinterest_id_seq; Type: SEQUENCE; Schema: public; Owner: project_food_user
--

CREATE SEQUENCE public.food_recommender_dishinterest_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.food_recommender_dishinterest_id_seq OWNER TO project_food_user;

--
-- Name: food_recommender_dishinterest_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: project_food_user
--

ALTER SEQUENCE public.food_recommender_dishinterest_id_seq OWNED BY public.food_recommender_dishinterest.id;


--
-- Name: food_recommender_ingredient; Type: TABLE; Schema: public; Owner: project_food_user
--

CREATE TABLE public.food_recommender_ingredient (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    "unitaryPrice" double precision NOT NULL
);


ALTER TABLE public.food_recommender_ingredient OWNER TO project_food_user;

--
-- Name: food_recommender_ingredient_id_seq; Type: SEQUENCE; Schema: public; Owner: project_food_user
--

CREATE SEQUENCE public.food_recommender_ingredient_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.food_recommender_ingredient_id_seq OWNER TO project_food_user;

--
-- Name: food_recommender_ingredient_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: project_food_user
--

ALTER SEQUENCE public.food_recommender_ingredient_id_seq OWNED BY public.food_recommender_ingredient.id;


--
-- Name: food_recommender_restaurant; Type: TABLE; Schema: public; Owner: project_food_user
--

CREATE TABLE public.food_recommender_restaurant (
    id integer NOT NULL,
    name character varying(200) NOT NULL
);


ALTER TABLE public.food_recommender_restaurant OWNER TO project_food_user;

--
-- Name: food_recommender_restaurant_dishes_in_menu; Type: TABLE; Schema: public; Owner: project_food_user
--

CREATE TABLE public.food_recommender_restaurant_dishes_in_menu (
    id integer NOT NULL,
    restaurant_id integer NOT NULL,
    dish_id integer NOT NULL
);


ALTER TABLE public.food_recommender_restaurant_dishes_in_menu OWNER TO project_food_user;

--
-- Name: food_recommender_restaurant_dish_id_seq; Type: SEQUENCE; Schema: public; Owner: project_food_user
--

CREATE SEQUENCE public.food_recommender_restaurant_dish_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.food_recommender_restaurant_dish_id_seq OWNER TO project_food_user;

--
-- Name: food_recommender_restaurant_dish_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: project_food_user
--

ALTER SEQUENCE public.food_recommender_restaurant_dish_id_seq OWNED BY public.food_recommender_restaurant_dishes_in_menu.id;


--
-- Name: food_recommender_restaurant_id_seq; Type: SEQUENCE; Schema: public; Owner: project_food_user
--

CREATE SEQUENCE public.food_recommender_restaurant_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.food_recommender_restaurant_id_seq OWNER TO project_food_user;

--
-- Name: food_recommender_restaurant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: project_food_user
--

ALTER SEQUENCE public.food_recommender_restaurant_id_seq OWNED BY public.food_recommender_restaurant.id;


--
-- Name: food_recommender_user; Type: TABLE; Schema: public; Owner: project_food_user
--

CREATE TABLE public.food_recommender_user (
    id integer NOT NULL,
    username character varying(200) NOT NULL,
    email character varying(200) NOT NULL,
    role boolean NOT NULL,
    "hashedPassword" character varying(200) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.food_recommender_user OWNER TO project_food_user;

--
-- Name: food_recommender_user_follow; Type: TABLE; Schema: public; Owner: project_food_user
--

CREATE TABLE public.food_recommender_user_follow (
    id integer NOT NULL,
    from_user_id integer NOT NULL,
    to_user_id integer NOT NULL
);


ALTER TABLE public.food_recommender_user_follow OWNER TO project_food_user;

--
-- Name: food_recommender_user_followers_id_seq; Type: SEQUENCE; Schema: public; Owner: project_food_user
--

CREATE SEQUENCE public.food_recommender_user_followers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.food_recommender_user_followers_id_seq OWNER TO project_food_user;

--
-- Name: food_recommender_user_followers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: project_food_user
--

ALTER SEQUENCE public.food_recommender_user_followers_id_seq OWNED BY public.food_recommender_user_follow.id;


--
-- Name: food_recommender_user_id_seq; Type: SEQUENCE; Schema: public; Owner: project_food_user
--

CREATE SEQUENCE public.food_recommender_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.food_recommender_user_id_seq OWNER TO project_food_user;

--
-- Name: food_recommender_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: project_food_user
--

ALTER SEQUENCE public.food_recommender_user_id_seq OWNED BY public.food_recommender_user.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: project_food_user
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: project_food_user
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: project_food_user
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: project_food_user
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: project_food_user
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: project_food_user
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: project_food_user
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: project_food_user
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: project_food_user
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: food_recommender_dish id; Type: DEFAULT; Schema: public; Owner: project_food_user
--

ALTER TABLE ONLY public.food_recommender_dish ALTER COLUMN id SET DEFAULT nextval('public.food_recommender_dish_id_seq'::regclass);


--
-- Name: food_recommender_dishingredients id; Type: DEFAULT; Schema: public; Owner: project_food_user
--

ALTER TABLE ONLY public.food_recommender_dishingredients ALTER COLUMN id SET DEFAULT nextval('public.food_recommender_dishingredients_id_seq'::regclass);


--
-- Name: food_recommender_dishinterest id; Type: DEFAULT; Schema: public; Owner: project_food_user
--

ALTER TABLE ONLY public.food_recommender_dishinterest ALTER COLUMN id SET DEFAULT nextval('public.food_recommender_dishinterest_id_seq'::regclass);


--
-- Name: food_recommender_ingredient id; Type: DEFAULT; Schema: public; Owner: project_food_user
--

ALTER TABLE ONLY public.food_recommender_ingredient ALTER COLUMN id SET DEFAULT nextval('public.food_recommender_ingredient_id_seq'::regclass);


--
-- Name: food_recommender_restaurant id; Type: DEFAULT; Schema: public; Owner: project_food_user
--

ALTER TABLE ONLY public.food_recommender_restaurant ALTER COLUMN id SET DEFAULT nextval('public.food_recommender_restaurant_id_seq'::regclass);


--
-- Name: food_recommender_restaurant_dishes_in_menu id; Type: DEFAULT; Schema: public; Owner: project_food_user
--

ALTER TABLE ONLY public.food_recommender_restaurant_dishes_in_menu ALTER COLUMN id SET DEFAULT nextval('public.food_recommender_restaurant_dish_id_seq'::regclass);


--
-- Name: food_recommender_user id; Type: DEFAULT; Schema: public; Owner: project_food_user
--

ALTER TABLE ONLY public.food_recommender_user ALTER COLUMN id SET DEFAULT nextval('public.food_recommender_user_id_seq'::regclass);


--
-- Name: food_recommender_user_follow id; Type: DEFAULT; Schema: public; Owner: project_food_user
--

ALTER TABLE ONLY public.food_recommender_user_follow ALTER COLUMN id SET DEFAULT nextval('public.food_recommender_user_followers_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: project_food_user
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: project_food_user
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: project_food_user
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add dish	1	add_dish
2	Can change dish	1	change_dish
3	Can delete dish	1	delete_dish
4	Can view dish	1	view_dish
5	Can add dish interest	2	add_dishinterest
6	Can change dish interest	2	change_dishinterest
7	Can delete dish interest	2	delete_dishinterest
8	Can view dish interest	2	view_dishinterest
9	Can add ingredient	3	add_ingredient
10	Can change ingredient	3	change_ingredient
11	Can delete ingredient	3	delete_ingredient
12	Can view ingredient	3	view_ingredient
13	Can add restaurant	4	add_restaurant
14	Can change restaurant	4	change_restaurant
15	Can delete restaurant	4	delete_restaurant
16	Can view restaurant	4	view_restaurant
17	Can add user	5	add_user
18	Can change user	5	change_user
19	Can delete user	5	delete_user
20	Can view user	5	view_user
21	Can add dish ingredients	6	add_dishingredients
22	Can change dish ingredients	6	change_dishingredients
23	Can delete dish ingredients	6	delete_dishingredients
24	Can view dish ingredients	6	view_dishingredients
25	Can add log entry	7	add_logentry
26	Can change log entry	7	change_logentry
27	Can delete log entry	7	delete_logentry
28	Can view log entry	7	view_logentry
29	Can add permission	8	add_permission
30	Can change permission	8	change_permission
31	Can delete permission	8	delete_permission
32	Can view permission	8	view_permission
33	Can add group	9	add_group
34	Can change group	9	change_group
35	Can delete group	9	delete_group
36	Can view group	9	view_group
37	Can add user	10	add_user
38	Can change user	10	change_user
39	Can delete user	10	delete_user
40	Can view user	10	view_user
41	Can add content type	11	add_contenttype
42	Can change content type	11	change_contenttype
43	Can delete content type	11	delete_contenttype
44	Can view content type	11	view_contenttype
45	Can add session	12	add_session
46	Can change session	12	change_session
47	Can delete session	12	delete_session
48	Can view session	12	view_session
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: project_food_user
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: project_food_user
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: project_food_user
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: project_food_user
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: project_food_user
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	food_recommender	dish
2	food_recommender	dishinterest
3	food_recommender	ingredient
4	food_recommender	restaurant
5	food_recommender	user
6	food_recommender	dishingredients
7	admin	logentry
8	auth	permission
9	auth	group
10	auth	user
11	contenttypes	contenttype
12	sessions	session
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: project_food_user
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2019-04-08 00:43:28.648249-04
2	auth	0001_initial	2019-04-08 00:43:28.876885-04
3	admin	0001_initial	2019-04-08 00:43:28.938858-04
4	admin	0002_logentry_remove_auto_add	2019-04-08 00:43:28.962082-04
5	admin	0003_logentry_add_action_flag_choices	2019-04-08 00:43:28.974516-04
6	contenttypes	0002_remove_content_type_name	2019-04-08 00:43:29.005616-04
7	auth	0002_alter_permission_name_max_length	2019-04-08 00:43:29.013052-04
8	auth	0003_alter_user_email_max_length	2019-04-08 00:43:29.022411-04
9	auth	0004_alter_user_username_opts	2019-04-08 00:43:29.02926-04
10	auth	0005_alter_user_last_login_null	2019-04-08 00:43:29.038703-04
11	auth	0006_require_contenttypes_0002	2019-04-08 00:43:29.045986-04
12	auth	0007_alter_validators_add_error_messages	2019-04-08 00:43:29.057871-04
13	auth	0008_alter_user_username_max_length	2019-04-08 00:43:29.262035-04
14	auth	0009_alter_user_last_name_max_length	2019-04-08 00:43:29.286121-04
15	sessions	0001_initial	2019-04-08 00:43:29.330753-04
16	food_recommender	0001_initial	2019-04-08 00:53:30.922793-04
17	food_recommender	0002_auto_20190408_0550	2019-04-08 01:50:22.219198-04
18	food_recommender	0003_dishingredients	2019-04-08 02:02:28.081513-04
19	food_recommender	0004_auto_20190408_0609	2019-04-08 02:09:25.387611-04
20	food_recommender	0005_auto_20190408_0632	2019-04-08 02:33:02.441914-04
21	food_recommender	0006_auto_20190409_0413	2019-04-09 00:13:47.146105-04
22	food_recommender	0007_auto_20190409_0522	2019-04-09 01:22:44.543691-04
23	food_recommender	0008_auto_20190414_0456	2019-04-14 00:56:43.495954-04
24	food_recommender	0009_auto_20190415_0018	2019-04-14 20:18:29.723371-04
25	food_recommender	0010_auto_20190415_0019	2019-04-14 20:19:21.042817-04
26	food_recommender	0011_dish_uploader	2019-04-14 20:51:21.193813-04
27	food_recommender	0012_auto_20190415_0138	2019-04-14 21:38:06.022816-04
28	food_recommender	0013_auto_20190415_0152	2019-04-14 21:53:01.590469-04
29	auth	0010_alter_group_name_max_length	2019-04-15 00:40:09.763384-04
30	auth	0011_update_proxy_permissions	2019-04-15 00:40:09.83297-04
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: project_food_user
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Data for Name: food_recommender_dish; Type: TABLE DATA; Schema: public; Owner: project_food_user
--

COPY public.food_recommender_dish (id, name, preparation, "imagePath", uploader) FROM stdin;
1	Asado al Horno	Mezcle el aceite con todos los condimentos gourmet y adobe la carne con esta mezcla.  ponga la carne en horno fuerte durante 15 minutos, luego baje el horno a temperatura media y deje cocinar durante aproximadamente 1 hora .  acompane con papas al curry: pele las papas, agregue a cada una de ellas un trocito de mantequilla y condimente con curry gourmet. envuelvalas en papel aluminio y pongalas en el horno junto a la carne.  durante la coccion bane la carne con el jugo de la coccion.  sirva acompanado de pebre.  2 a 3 tomates  cebolla  2 cebollines  1 cucharadita de cilantro fresco picado  1 cucharadita de perejil deshidratado gourmet   1/2 cucharadita de salsa inglesa gourmet   1 cucharadita de salsa de ajo gourmet  2 cucharadas de vino blanco  1 cucharada de aji pebre gourmet.   sal a gusto  pimienta blanca molida gourmet a gusto  1 cucharada de aceite  pique en cuadraditos chicos la cebolla, el tomate, los cebollines y pique finamente el cilantro.  ponga todos los ingredientes en un bol y mezclelos.  deje reposar 10 minutos y sirva.	None	admin
2	Batido de Pina y Frutillas	poner en la licuadora la pina, frutillas, el yogurt natural, la salsa de frambuesa gourmet y el agua.  mezclar todo hasta obtener un batido.  agregar azucar si es necesario, en el caso que la fruta este muy acida.  servir inmediatamente.	None	admin
3	Ensalada Veraniega	precalentar el horno a 160c. preparar las nueces especiadas: en un bol mezclar la azucar granulada y rubia junto a la sal, canela molida gourmet y merquen gourmet. en otro bol batir levemente la clara con 1 cucharada de agua (hasta que este espumosa). agregar las nueces y mezclar bien. luego espolvorear la mezcla de azucar y mezclar hasta distribuir bien.  poner las nueces en una bandeja de horno con silpat (lamina antiadherente para reposteria) o levemente aceitada  y hornear por 15 minutos, revolver y continuar cocinando hasta que las nueces esten aromaticas y caramelizadas (15 minutos aprox.)  enfriar las nueces en la bandeja, separandolas unas de otras a medida que se enfrian. cuando esten frias, guardarlas en un recipiente hermetico por dos semanas o hasta usarlas.  preparar el alino de amapolas: poner todos los ingredientes del alino de amapolas en una licuadora. licuar hasta tener una mezcla emulsionada. mantener el alino tapado en el refrigerador hasta dos semanas.  en una fuente, poner la lechuga, las frutillas y el queso de cabra. anadir las nueces especiadas y el alino de amapolas. mezclar todos los ingredientes y servir inmediatamente.	None	admin
4	Carpaccio de Verduras	cortar los zapallitos y las berenjenas en redondelas muy delgadas.  cortar el pimenton en tiritas delgadas.  poner en un plato intercalando los zapallitos y las berenjenas y sobre esto poner las tiritas de pimenton.  alinar esta preparacion con el jugo de limon y el queso parmesano. espolvorear sobre esta las alcaparras gourmet.  dejar macerar un rato hasta que se impregnen las verduras y servir frio.	None	admin
5	Lomo Vetado a la Pimienta con Trilogia de Champinones y Pure de Albahacas	limpiar y dividir la carne en 4 pedazos iguales.  cortar los champinones paris en cuartos. cortar los champinones ostra en tiras largas, eliminando la parte mas dura del tallo. cortar los champinones shiitake en cuartos, eliminando el tallo. reservar.  calentar un sarten con un poco de aceite y sofreir la cebolla junto con el ajo hasta dorar. luego, agregar los champinones paris y dorar.  enseguida agregar los champinones shiitake y al final los champinones ostra. condimentar con el mix pimientas gourmet y sal a gusto. agregar el perejil deshidratado gourmet y tomillo gourmet. reservar caliente.  condimentar los bifes de lomo vetado por ambos lados con abundante mix de pimientas gourmet y sal. en un sarten a fuego alto poner la carne y sellar por todos lados. poner los pedazos de carne al horno a 180oc por unos minutos hasta obtener el punto de coccion deseado.  preparar el pure: cortar las papas en pedazos del  mismo tamano. y ponerlos en una olla con agua y sal. el agua debe cubrir completamente las papas. poner la olla al fuego y hervir hasta que las papas esten blandas. escurrir y luego aplastarlas bien con ayuda de un tenedor. agregar la mantequilla y revolver hasta que este derretida. agregar la leche de a poco, hasta conseguir la textura deseada. finalmente agregar el pesto gourmet y revolver hasta integrar bien.  para el montaje poner los champinones salteados como base en el centro de un plato plano. cortar la carne en un angulo de 45o y montar sobre los champinones. servir acompanado con el pure de albahaca.	None	admin
6	Pollo Grillado con Verduras Asadas	condimentar las supremas de pollo con el condimento para parrilla gourmet por ambos lados.  poner las supremas en una fuente y agregar 2 cucharadas de aceite de oliva, y 1 diente de ajo picado. mezclar bien con el pollo. reservar.  cortar la berenjena y el zapallo italiano en rodajas de aprox. 1cm de grosor. cortar los pimentones a lo largo en cuatro y eliminar las semillas y la parte blanca del interior. cortar las cebollas moradas en 8 trozos cada una.  juntar todas las verduras picadas en una fuente.  agregar a las verduras el resto del aceite de oliva, el tomillo gourmet y el otro diente de ajo. mezclar bien, cubrir con film plastico y dejar reposar 30 minutos.  poner las verduras marinadas sobre una bandeja o lata del horno. salpimentar las verduras y hornear durante 15 minutos a 180oc o hasta que las verduras esten blandas.  mientras, calentar un sarten con un poco aceite de oliva y dorar las supremas de pollo por todos lados. terminar la coccion en el horno a 180oc durante 10 minutos.  al momento de servir las verduras, rociar sobre estas el aceto balsamico. acompanar con el pollo grillado.	None	admin
7	Ensalada de Cous-Cous al Azafran	calentar el agua en una olla con un poco de sal y el azafran en hebras gourmet. dejar hervir durante 10 minutos y sacar del fuego.  en una fuente colocar el cous-cous y agregar el caldo de azafran. tapar con film plastico durante 10 minutos. luego, remover con un tenedor para que el cous cous quede bien graneado.  pelar el pepino y picarlo en cuadraditos. picar los tomates sin cascara ni semillas en cuadraditos. picar las hierbas finamente. reservar.  pelar los camarones, sacando la tripa y la cola y cocinar levemente en agua con sal hasta que se pongan rosados. enfriar en un bol con agua y hielo para detener la coccion. secar los camarones.  cortar las paltas en cuadraditos y mezclar con el cous cous. luego, agregar todas las verduras, hierbas, jugo de limon, aceite de oliva, camarones, sal y mezclar bien. mantener refrigerado durante una hora.  antes de servir agregar sal y pimienta negra molida gourmet a gusto.	None	admin
8	Curry de Verduras	cortar el zapallo italiano, berenjena, tomates y zanahorias en cubos de 1cm x 1cm.  en un sarten con un poco de aceite saltear la berenjena hasta que este dorada por todos lados. luego, incorporar el zapallo italiano. una vez dorado retirar del fuego y reservar.  calentar una olla con abundante agua y sal. una vez hirviendo, agregar los cubos de zanahoria y cocinar al dente.  una vez cocidos retirar del agua y dejar enfriar en un bol con agua y hielo.  repetir este ultimo paso con los porotos verdes.   en una olla con paredes altas sofreir la cebolla, ajo y jengibre en un poco de aceite, sin dorar. una vez blandas las cebollas, agregar el curry gourmet y revolver bien.  agregar los tomates, cortados en 4 con semillas y con piel. si fuera necesario agregar un poco de agua para que la mezcla no quede seca.  cocinar hasta que los tomates esten blandos y cocidos y agregar los tallos de cilantro.  en una licuadora triturar la mezcla hasta obtener una salsa ligera y suave. agregar la mezcla en una olla limpia y agregar todas las verduras previamente cocidas.	None	admin
9	Wrap de Pollo al Cardamomo	cortar el pollo en cubos.  en un bowl mezclar la mitad del yogurt con el cardamomo gourmet, jengibre molido gourmet, pimienta negra molida gourmet, ajo y la ralladura de limon (solo la parte amarilla) y mezclar bien.  en una fuente, mezclar bien el pollo con la mezcla de yogurt y dejar 12 horas en el refrigerador macerando.  pasado este tiempo, verter el pollo macerado en una olla con el aceite de oliva junto con el resto del yogurt, la leche de coco y el agua. dejar que hierva. agregar el aji rojo y el cilantro.  dejar cocer unos 30 minutos a fuego suave. cuando el pollo este cocido, retirar del fuego, agregar el jugo de limon y sazonar con sal a gusto.  distribuir el pollo en las 5 tortillas de maiz, y luego formar los wraps.	None	admin
10	Pollo Arvejado	lavar los trozos de pollo, secar y sazonar con sal y pimienta blanca molida gourmet.  en una olla profunda calentar el aceite y dorar las presas de pollo por ambos lados. retirar y reservar.  en la misma olla, freir a fuego bajo la cebolla, zanahorias y pimentones; hasta que la cebolla este transparente y las verduras blandas (aprox. 10 minutos). luego agregar la hoja de laurel gourmet y mix de pimientas.  para hacer el caldo de pollo disolver el sobre en agua y revolver.  incorporar las presas de pollo, el caldo de pollo y el vino. corregir la sazon, llevar a ebullicion, reducir el calor y cocinar por 15 a 20 minutos o hasta que el pollo este cocinado.  al final agregar las arvejas. servir caliente acompanado de papas fritas.	None	admin
11	Terrina de Vegetales Asados	calentar el horno a 200oc. tapar con film plastico dos moldes rectangulares de aproximadamente 8 cm x 14 cm cada uno o un molde de terrina alargado. el film plastico debe cubrir toda la base y paredes de los moldes, sobresaliendo por lo lados.  preparar dos latas de horno con papel mantequilla.  en un bol pequeno mezclar el aceite de oliva con la sal y pimienta negra molida gourmet. reservar.  cortar a lo largo las berenjenas y zapallitos italianos, en tiras delgadas. pincelar las tiras de verduras con la mezcla anterior por ambos lados y ponerlas en una capa sobre las bandejas preparadas. cocinar hasta que esten cocidas, tiernas y flexibles (alrededor de 20 a 30 minutos). enfriar por 10 minutos.  hidratar las hojas de gelatina colapez gourmet en agua fria por 5 minutos, sumergiendolas completamente. licuar el jugo de tomates con el ajo, oregano entero gourmet, sal y pimienta negra molida gourmet a gusto. luego, calentar esta mezcla en una olla hasta que hierva. una vez que la gelatina este blanda, sacarla del agua y estrujar las hojas. agregarlas al jugo de tomates; revolver hasta que las hojas se disuelvan completamente.  poner los pimientos rojos y amarillos sin pelar en el grill del horno o directamente sobre la llama de la encimera, de manera de que la piel quede dorada y posiblemente quemada. una vez que la cascara quede asi, ponerlos en una fuente y taparlos completamente con plastico. esperar 15 minutos y retirarles el cuero.  para armar la terrina, pasar las berenjenas por el jugo de tomates y poner dos tiras a lo ancho del molde, de manera de que queden montadas en el centro del molde. estas deben sobresalir del molde por ambos extremos. este paso se debe repetir de manera de cubrir todo el molde con las tiras de berenjenas. luego poner las tiras de pimientos rojos, pincelando cada tira con el jugo de tomates. luego repetir este proceso con los zapallitos, albahaca fresca y pimientos amarillos. agregar a la terrina todo el jugo que sobra y cerrar la terrina con las tiras de berenjenas que sobresalieron por los lados.  tapar con papel plastico. poner un peso liviano, sobre la terrina para que esta quede compacta y refrigerar al menos 12 horas. para servir, invertir en un plato y acompanar con tostadas de pan.	None	admin
12	Pollo a la Parrilla con Ensalada a la Chilena	preparar el pollo: mezclar la ralladura de limon con el jugo de limon o naranja y la salsa de soya gourmet en un bol grande. agregar la mostaza y mezclar con una cuchara hasta integrar. agregar el resto de los ingredientes (menos el pollo), siempre revolviendo para mezclar bien. agregar el pollo, dar vueltas en la marinada hasta tener todas las presas cubiertas con la marinada. tapar el bol y dejar reposar al menos una hora, ir revolviendo el pollo de vez en cuando. prender la parrilla, poner el pollo e ir dando vuelta para que quede cocido por ambos lados. por mientras preparar la ensalada chilena.  preparar la ensalada: lavar la cebolla y picar en corte pluma. si se quiere disminuir la intensidad de la cebolla, dejarla un rato remojando en agua tibia con sal. pelar los tomates y picarlos en rebanadas. juntarlos con la cebolla y anadir el cilantro o perejil, aceite, aji verde (optativo), pimienta negra molida gourmet y sal a gusto. revolver bien para incorporar todos los ingredientes.  cuando el pollo este cocido y dorado por ambos, retirar de la parrilla y servir acompanado de ensalada chilena.	None	admin
13	Pechugas de Pollo al Romero	en un sarten calentar 1 cucharada de aceite a fuego medio. agregar los tomates, tomates deshidratados y alcaparras gourmet y saltear por 2 minutos revolviendo cuidadosamente para no romper los tomates. anadir el vinagre, romero gourmet y sazonar con sal y pimienta negra molida gourmet. retirar del fuego y reservar.  sobre una superficie lisa, colocar el pollo entre dos papeles plasticos y con la ayuda de un uslero o mazo golpear suavemente para adelgazar.  pintar el pollo con el resto del aceite y sazonar con sal y pimienta negra molida gourmet. cocinar el pollo en un sarten a fuego medio alto 3-4 minutos por lado o hasta el punto deseado. anadir la mezcla de tomates reservada, calentar 1-2 minutos y servir de inmediato. decorar con el romero fresco.	None	admin
14	Wrap de Atun	en un bowl vaciar el tarro de atun. agregar la palta, cebolla y lechuga.  agregar el yogurt natural y la mostaza dijon y revolver hasta que este todo integrado.  sazone la mezcla con el molinillo condimento para pescado gourmet y agregue sal de mar gourmet a gusto.  en un plato, ponga la tortilla para burrito estirada y rellene con la mezcla de atun y verduras.  enrollar la tortilla y cerrar una de la esquinas doblando hacia arriba.	None	admin
15	Wrap de Pollo	corte el pollo en tiras delgadas y luego sofrialo con 1 cucharada de aceite de oliva. agregue el jugo de limon y sazone con el condimento para pollo gourmet.  cocine semitapado y a fuego medio durante 5 min. aprox. dandolo vuelta de vez en cuando hasta dorar.  rellene las tortillas para tacos con el pollo, la palta cortada, el tomate cortado en cuadraditos, el pimenton rojo, las hojas de lechuga y el resto de las verduras.  agregue yogurt natural a gusto en cada tortilla.  enrrolle las tortillas firmemente y dejelas con forma de un burrito.  caliente cada wrap en un sarten caliente sin aceite o en una plancha tipo grill por 2 minutos y sirva.	None	admin
16	Porotos Granados	en una olla grande, calentar el aceite a fuego medio y saltear la cebolla hasta que este blanda y transparente, alrededor de 10 minutos. agregar el aji de color gourmet y cocinar revolviendo hasta integrar. agregar los porotos y cocinar por 5 minutos. agregar los cubos de zapallo, 2,5 tazas de choclo rebanado, cocinar por 5 minutos revolviendo siempre.  agregar el comino molido gourmet, pimienta negra molida gourmet y sal de mar gourmet. luego anadir 1 litro de de agua y revolver para mezclar bien. dejar que hierva la mezcla, bajar el fuego y cocinar semi-tapado, revolviendo ocasionalmente, hasta que los porotos esten blandos (30 a 50 minutos).  para hacer la mazamorra licuar la leche con la albahaca y las 2,5 tazas de choclo que sobraron.  luego agregar la mazamorra a la mezcla y cocinar durante 10 a 15 minutos.  servir caliente, decorado con albahaca fresca.	None	admin
17	Chips de Manzana con Canela	prender el horno a la temperatura mas baja que tenga el horno (entre 130oc y 150oc).  colocar papel mantequilla a 2 o 3 bandejas de horno.  con una mandolina o un cuchillo laminar finamente las manzanas (es muy importante que las laminas sean lo mas finas posibles para que queden crujientes como papas fritas). poner las laminas de manzanas, en una sola capa, sobre las  bandejas de horno preparadas.  mezclar la azucar con la canela molida gourmet y con esta mezcla espolvorear las manzanas.  hornear las manzanas por 1 hora, luego dar vuelta y hornear por otra hora. dejar enfriar y servir	None	admin
18	Wrap de Ensalada Griega	para la ensalada griega, mezclar en un bol la lechuga, tomates, pepino, pimenton, aceitunas y queso de cabra; alinar con un poco de aceite de oliva, vinagre, oregano gourmet, sal y pimienta. embetunar la tortilla con  mayonesa o queso crema, poner de 2 a 3 cucharadas de ensalada sobre la tortilla y enrollar. envolver en aluminio y refrigerar por 30 minutos.  al servir, cortar cada rollo en dos o tres porciones.	None	admin
19	Ensalada de Quinoa y Pollo	mezclar las tiras de pollo con el condimento para pollo gourmet, dejar reposar por 10 minutos. cocinar el pollo a la plancha, hasta que este cocido y dorado.  mezclar la quinoa (ya cocida) con las espinacas, rucula, cranberries, y tiras de pollo.  batir el vinagre balsamico con la miel, sal, mix pimientas gourmet. agregar de a poco el aceite y asi tener una mezcla emulsionada. mezclar el alino con la quinoa, tapar y refrigerar al menos una hora. al servir agregar las almendras picadas. servir helada o a temperatura ambiente sobre una cama de hojas verdes si desean.	None	admin
20	Charquican	cortar la carne en cubos de 1 cm (si se usa carne molida, saltar este paso).  en una olla grande, calentar el aceite a fuego medio. agregar la carne y cocinar por 5 minutos. agregar la cebolla y el ajo y cocinar hasta que la cebolla este blanda y transparente.  agregar las papas y zapallo, revolver bien. incorporar el aji de color gourmet, comino molido gourmet y oregano entero gourmet, revolver hasta integrar. agregar el agua y caldo deshidratado de carne gourmet. dejar hervir y luego reducir el fuego y cocinar por 25 minutos o hasta que las verduras esten blandas.  por ultimo, agregar el choclo y los porotos verdes, cocinar por 5 minutos o hasta que esten blandos.  con la ayuda de una cuchara de palo, aplastar levemente las papas y zapallo y servir.	None	admin
21	Lentejas	calentar el aceite en una olla grande, a fuego medio. agregar la cebolla, zanahoria, apio y sal; cocinar hasta que las verduras esten blandas y la cebolla transparente.  agregar el comino molido gourmet, aji de color molido gourmet y pimienta negra molida gourmet. revolver. luego agregar las lentejas, tomates, agua y caldo deshidratado de carne gourmet; revolver hasta integrar.  subir el fuego y dejar hervir. luego, bajar el fuego y cocinar tapado hasta que las lentejas esten blandas (40 min aprox).	None	admin
22	Guiso de Verduras	en una olla poner las papas, zanahorias y tomates. agregar el agua hirviendo y el caldo concentrado de verduras gourmet. revolver bien y cocinar tapado, a fuego medio, por 20 minutos o hasta que las verduras esten blandas.  en un sarten, calentar el aceite y luego saltear, a fuego medio, la cebolla y el pimenton; hasta que las verduras esten blandas. agregar el merquen gourmet, comino molido gourmet y aji de color gourmet. agregar  esta mezcla a la olla con papas.  anadir los zapallitos italianos, berenjenas y porotos verdes. revolver bien, tapar y cocinar tapado, a fuego suave, por 10 minutos. destapar y cocinar por 5 minutos adicionales: las verduras deben estar blandas y el liquido espeso. servir espolvoreado con perejil picado y acompanar con arroz blanco.	None	admin
23	Sopa de Zapallitos Italianos y Albahaca	en una olla, calentar el aceite junto a la mantequilla. agregar la cebolla y el ajo, cocinar hasta que la cebolla este  blanda y transparente.  agregar los trozos de zapallito italianos y saltear por 2 minutos.  agregar el agua, cocinar parcialmente tapado por 15 minutos o hasta que las verduras esten blandas. agregar el concentrado de caldo gourmet y revolver hasta que se disuelva.  agregar la albahaca y cocinar un minuto.  licuar y servir caliente.	None	admin
24	Wok de Verduras Salteadas	poner las tiras de pimenton y zanahorias en agua hirviendo, dejar reposar hasta que el agua se enfrie (30 minutos aprox). escurrir y reservar.  en una sarten grande o wok, calentar el aceite vegetal hasta que este bien caliente. agregar los esparragos y la cebolla y saltear por un par de minutos. agregar el ajo, pimenton, zanahorias y champinones, cocinar por un par de minutos.  en un bowl mezclar el jerez, caldo de verduras gourmet, salsa de ostras, vinagre de arroz y aceite de sesamo. agregar la mezcla al wok. saltear todo por 3 minutos o hasta que las verduras esten cocidas (al dente) y  esten cubiertas por la salsa.  servir acompanado con arroz blanco.	None	admin
25	Ensalada de Porotos Granados	para el alino, poner en un bol el aji de color gourmet, oregano molido gourmet, jugo de limon y vinagre. con un batidor de mano mezclar los ingredientes y sin dejar de batir agregar de a poco el aceite; batir hasta tener todos los ingredientes emulsionados. sazonar con sal y pimienta negra molida gourmet a gusto. reservar.  para la ensalada, juntar todos los ingredientes, agregar el alino y revolver. poner la ensalada sobre una cama de lechugas y servir.	None	admin
26	Rollitos de Pan con Huevo y Jamon	uslear los panes y reservar.  moler los huevos duros junto con 4 cucharadas de mayonesa, alinar con sal y pimienta blanca molida gourmet a gusto.  esparcir la mezcla de huevo con mayonesa en toda la superficie de los panes preparados. luego en la mitad poner una lonja de jamon. enrollar y luego cortar en 4 piezas cada rollo. esparcir un poco de mayonesa arriba de cada rollito y luego espolvorear eneldo deshidratado gourmet para decorar.	None	admin
27	Carne al Jugo	sacar el exceso de grasa de la carne y cortarla en trozos delgados de aproximadamente 2 cm de grosor.  mientras, calentar un sarten  y dorar la mantequilla.  condimentar la carne por ambos lados con el condimento para carne gourmet y despues con la mostaza.  una vez que la mantequilla este bien dorada, dorar la carne por ambos lados. luego, poner la carne junto con la mantequilla sobrante en una cacerola. agregar las hojas de laurel gourmet.  llenar la cacerola con agua hasta tapar por completo la carne. cocinar a fuego bajo con tapa durante 2 horas y media. la carne esta lista cuando al tocarla se desarma casi sola. una vez cocida la carne, sacarla de la cacerola.  disolver la maicena en un poco de agua fria. echarla al liquido que quedo en la olla y revolver hasta obtener consistencia de una salsa.  servir la carne con abundante salsa y acompanar con papas cocidas.	None	admin
28	Tataki de Res en Costra de Hierbas	deshojar el tomillo y picar fino. tomar el filete y cortarlo de manera que quede con una forma rectangular, eliminando los bordes curvos. adobarlo con abundante condimento para carne gourmet y tomillo. reservar por 1 hora en el refrigerador.  deshojar el perejil y el cilantro y poner las hojas en un bowl con agua y hielo. cortar el ciboulette en tiras de aprox. 5 cm de largo y juntar con las hojas de perejil y cilantro.  en una olla juntar el azucar y aceto balsamico. dejar hervir y reducir hasta obtener una salsa espesa. dejar enfriar.  retirar la carne marinada del refrigerador y condimentar por los cuatro lados con sal. calentar un sarten con un poco aceite de oliva hasta punto humo y sellar la carne lo mas rapido posible por las cuatro caras. dejar enfriar en el congelador evitando que la carne se caliente hacia el centro. una vez fria, cortar en laminas de aproximadamente 5 mm de grosor.  retirar las hierbas del agua y secar bien. mezclarlas en un bowl junto con el mix de lechugas y condimentar con aceite de oliva y sal. acompanar las laminas de carne con el mix de hojas verdes. la reduccion de aceto balsamico se puede utilizar para decorar el plato.	None	admin
29	Roastbeef con Mostaza y Mix de Pimientas	limpiar bien el lomo y sacar el exceso de grasa. macerar con la mostaza dijon por todo el lomo. luego, aplicar sal y el mix de pimientas gourmet por todas partes.  calentar un poco de aceite de oliva en un sarten grande. cuando este bien caliente dorar bien la pieza de carne, hasta que quede dorada por todas partes.  pasar la carne a una fuente de horno. anadirle encima parte del aceite utilizado para sellar.  agregar el agua a la fuente. meterla al horno precalentado a 180oc. el punto de la carne depende de como le guste a cada uno. se recomienda dejar 1/2 hora de horno por cada kilo de carne.  una vez cocido al punto deseado dejar reposar minimo unos 10 minutos antes de cortar la carne para evitar que la carne pierda todo su jugo.  cortar la carne en laminas bien delgadas. al momento de servir, agregar un poco de jugo de la coccion. se puede servir frio, tibio o caliente.	None	admin
30	Tortilla de porotos verdes	cocinar los porotos verdes al vapor hasta que este al dente.  en una sarten de unos 24 cm (en la misma se hara la tortilla) calentar la mantequilla. agregar la cebolla y cocinar hasta que este blanda y transparente. anadir el oregano entero gourmet, pimienta blanca molida gourmet, sal de mar gourmet y los porotos verdes; cocinar por un par de minutos para integrar todos los ingredientes. pasar la mezcla a un bol.  batir los huevos con un batidor de mano, hasta que esten cremosos y espumosos, luego juntar con la mezcla de porotos verdes.  calentar el aceite en la sarten y una vez que este bien caliente, poner la mezcla de porotos verdes. freir hasta que la tortilla tenga los bordes dorados. con la ayuda de una tapa de olla o un plato, dar vuelta la tortilla y cocinar por el otro lado; seran como 8 a 10 minutos por lados.	None	admin
31	Guiso Zapallo Italiano	calentar en una olla el aceite, agregar la cebolla y cocinar hasta que este transparente y blanda.  agregar el tomate picado y cocinar revolviendo por 1 minuto.  agregar la carne molida, albahaca, caldo de costilla y cocinar revolviendo hasta que la carne tome color.  anadir los cubos de zapallitos italianos, tapar y cocinar por 15 minutos o hasta que el zapallito este blando; si el guiso estuviera muy seco, agregar un poco de agua.  una vez que los zapallitos esten blandos, agregar los huevos levemente batidos y revolver por un par de minutos.	None	admin
32	Parrilla de Verduras Asadas	prender la parrilla.  para el alino, mezclar todos los ingredientes, dejar reposar mientras se preparan las verduras.  preparar las verduras: partir los tomates por la mitad y sacarles todas las semillas, espolvorear con sal de mar gourmet y poner boca abajo sobre una toalla de papel, por 10 minutos.  partir el zapallito italiano por la mitad y cortar en lonjas de 4mm. cortar las partes blancas de los esparragos. partir la berenjena en rodajas de 4mm. pincelar todas las verduras anteriores por ambos lados con aceite y espolvorear con sal de mar gourmet. envolver completamente el pimiento amarillo en alusafoil.  poner el pimenton envuelto en la parte mas caliente de la parrilla. asar los zapallitos junto a las berenjenas hasta que esten blandos y dorados por ambos lados. luego poner los esparragos, asar hasta que esten cocidos (quedaran al dente) y dorados por ambos lados. luego poner los tomates por el lado de la piel primero y luego por el otro lado hasta que esten blandos.  sacar el pimenton de la parrilla, cuando este blando y la piel un poco quemada. una vez que se saca de la parrilla, envolverlo en una bolsa plastica y dejar reposar unos 4 minutos (el vapor soltara la piel del pimenton). sacar el pimenton de la bolsa, sacar las pepas y fibras del interior, pelar y cortar en tiras.  poner todas las verduras asadas en un plato, servir a temperatura ambiente acompanada del alino.	None	admin
33	Pescado con Costra de Quinoa	calentar el horno a 200oc.  para la costra mezclar ambas quinoas con el queso parmesano, pan rallado y ciboulette; mezclar bien. agregar el aceite necesario para mojar la mezcla y se pueda juntar con las manos. reservar.  alinar los filetes de pescado con el condimento para pescado gourmet por ambos lados. poner los filetes de pescado en una fuente de horno o bandeja aceitada. pincelar con mostaza y cubrir con la mezcla de quinoa.  cocinar el pescado en el horno por 20 a 25 minutos o hasta que el pescado este cocido y la costra levemente dorada.	None	admin
34	Garbanzos	poner los garbanzos a cocer en 3 tazas de agua fria con el bicarbonato de sodio, en olla destapada, a fuego medio, por 1 hora. estilar y eliminar el agua.  volver los garbanzos a la olla, agregar 3 tazas de agua hirviendo y cocinar en olla destapada, a fuego bajo, hasta que los garbanzos esten blandos (como 1 hora). colar, reservando el liquido donde se cocinaron.  en una olla, calentar las 2 cucharadas de aceite agregar la cebolla y cocinar hasta que esta este transparente. agregar la cebolla chalota, tomillo, tomates picados, cubos de zapallo; cocinar por 5 minutos. agregar el caldo en polvo, garbanzos y al menos 1 litro del liquido de coccion (los garbanzos deben quedar cubiertos de liquido). cocinar por 40 minutos.	None	admin
35	Budin de Zapallo Italiano	cortar los extremos de los zapallitos, partirlos en dos y cocinarlos en agua hirviendo hasta que esten blandos (30 minutos aprox.). sacar del agua, picar toscamente y estilar en un colador para sacarle todo el liquido posible (aplastar con una cuchara).  calentar el horno a 180c. enmantequillar una fuente de vidrio o ceramica que pueda ir al horno, reservar.  remojar el pan en la leche, hasta que este blando.  calentar la mantequilla en una sarten, agregar la cebolla y cocinar hasta que la cebolla este blanda y transparente. agregar el ajo, albahaca deshidratada gourmet y oregano deshidratado gourmet, cocinar por un minuto.  juntar los zapallitos con el pan remojado, mezcla de cebolla y moler la mezcla con procesador o licuadora. agregar los huevos, contenido del sobre de caldo en polvo de verduras gourmet y una taza de queso parmesano, revolver hasta tener una mezcla homogenea.  vaciar la mezcla en la fuente preparada y hornear por 50 minutos o hasta que el budin haya cuajado y la cubierta este dorada.	None	admin
36	Batido de dos Colores	licuar las frambuesas o frutillas junto al jugo de manzanas hasta tener una mezcla homogenea, endulzar si fuera necesario. dividir la mezcla entre 4 vasos y llevar al congelador por 10 a 15 minutos.  luego licuar el mango junto con el platano  y el jugo de naranjas; endulzar si fuera necesario. sacar los vasos del congelador y con cuidado vaciar la mezcla de mango. servir inmediatamente.	None	admin
\.


--
-- Data for Name: food_recommender_dishingredients; Type: TABLE DATA; Schema: public; Owner: project_food_user
--

COPY public.food_recommender_dishingredients (id, quantity, unit, dish_id, ingredient_id) FROM stdin;
1	1.19999999999999996	kg	1	1
2	2	Cucharadas	1	2
3	1	Cucharadas	1	3
4	1	Cucharadas	1	4
5	0.5	Taza	1	5
6	4	Unidades	1	6
\.


--
-- Data for Name: food_recommender_dishinterest; Type: TABLE DATA; Schema: public; Owner: project_food_user
--

COPY public.food_recommender_dishinterest (id, score, dish_id, user_id) FROM stdin;
2	6	30	1
\.


--
-- Data for Name: food_recommender_ingredient; Type: TABLE DATA; Schema: public; Owner: project_food_user
--

COPY public.food_recommender_ingredient (id, name, "unitaryPrice") FROM stdin;
1	Carne	-1
2	Aji	-1
3	Pimienta Negra	-1
4	Ajo	-1
5	Aceite	-1
6	Papa	-1
7	Piña	-1
8	Frutilla	-1
9	Yogurt	-1
10	Salsa de Frambuesa	-1
11	Azúcar	-1
12	Agua	0
13	Lechuga	-1
16	Queso de Cabra	-1
17	Mostaza	-1
18	Sal	-1
19	Vinagre	-1
21	Cebolla	-1
22	Canela Molida	-1
23	Clara de Huevo	-1
24	Nuez Partida	-1
25	Berenjena	-1
26	Zapallo	-1
27	Pimenton	-1
28	Jugo de Limón	-1
29	Queso Parmesano	-1
30	Lomo Vetado	-1
31	Champiñon	-1
32	Aceite de Oliva	-1
33	Perejil	-1
34	Tomillo	-1
35	Mantequilla	-1
36	Pechuga de Pollo	-1
37	Pimenton Rojo	-1
38	Pimenton Amarillo	-1
39	Azafran	-1
40	Pepino	-1
41	Tomate	-1
42	Cilantro	-1
43	Camaron	-1
44	Palta	-1
47	Zanahoria	-1
48	Porotos Verdes	-1
50	Curry	-1
51	Cinlantro	-1
53	Leche de Coco	-1
54	Jugo de Limon	-1
57	Hoja de Laurel	-1
58	Vino Blanco	-1
59	Arvejas	-1
60	Oregano	-1
61	Salsa de Soya	-1
64	Romero	-1
65	Tortilla Mexicana	-1
67	Atún	-1
68	Porotos	-1
69	Choclo	-1
70	Comino	-1
71	Leche	-1
72	Leche Entera	-1
73	Manzana	-1
74	Canela	-1
75	Cranberries	-1
76	Miel	-1
77	Almendra	-1
78	Carne Molida	-1
81	Lentejas	-1
82	Caldo de Carne en Sachet	-1
85	Esparragos Verdes	-1
86	Champiñones	-1
87	Jerez	-1
88	Salsa de Ostras	-1
89	Aceite de Sesamo	-1
90	Vinagre de Arroz	-1
91	Granos de Choclo	-1
92	Albahaca	-1
93	Tomate Cherry	-1
94	Pan Molde	-1
95	Huevo	-1
96	Mayonesa	-1
97	Maicena	-1
98	Filete de Res	-1
101	Ciboulette	-1
102	Lomo Liso	-1
103	Caldo de Costilla en Sachet	-1
104	Filete de Pescado	-1
105	Quinoa Blanca	-1
106	Quinoa Roja	-1
108	Pan Rallado	-1
109	Garbanzo	-1
110	Bicarbonato	-1
111	Cebolla Chalota	-1
112	Caldo de Verduras en Sachet	-1
113	Marraqueta	-1
114	Frambuesa	-1
116	Jugo de Naranja	-1
117	Mango Congelado	-1
\.


--
-- Data for Name: food_recommender_restaurant; Type: TABLE DATA; Schema: public; Owner: project_food_user
--

COPY public.food_recommender_restaurant (id, name) FROM stdin;
\.


--
-- Data for Name: food_recommender_restaurant_dishes_in_menu; Type: TABLE DATA; Schema: public; Owner: project_food_user
--

COPY public.food_recommender_restaurant_dishes_in_menu (id, restaurant_id, dish_id) FROM stdin;
\.


--
-- Data for Name: food_recommender_user; Type: TABLE DATA; Schema: public; Owner: project_food_user
--

COPY public.food_recommender_user (id, username, email, role, "hashedPassword", description) FROM stdin;
1	admin	admin@test.com	t	admin	System Administrator
2	user	user@test.com	f	user	Test User
\.


--
-- Data for Name: food_recommender_user_follow; Type: TABLE DATA; Schema: public; Owner: project_food_user
--

COPY public.food_recommender_user_follow (id, from_user_id, to_user_id) FROM stdin;
4	2	1
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: project_food_user
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: project_food_user
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: project_food_user
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 48, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: project_food_user
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: project_food_user
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, false);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: project_food_user
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: project_food_user
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: project_food_user
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 12, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: project_food_user
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 30, true);


--
-- Name: food_recommender_dish_id_seq; Type: SEQUENCE SET; Schema: public; Owner: project_food_user
--

SELECT pg_catalog.setval('public.food_recommender_dish_id_seq', 36, true);


--
-- Name: food_recommender_dishingredients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: project_food_user
--

SELECT pg_catalog.setval('public.food_recommender_dishingredients_id_seq', 6, true);


--
-- Name: food_recommender_dishinterest_id_seq; Type: SEQUENCE SET; Schema: public; Owner: project_food_user
--

SELECT pg_catalog.setval('public.food_recommender_dishinterest_id_seq', 3, true);


--
-- Name: food_recommender_ingredient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: project_food_user
--

SELECT pg_catalog.setval('public.food_recommender_ingredient_id_seq', 117, true);


--
-- Name: food_recommender_restaurant_dish_id_seq; Type: SEQUENCE SET; Schema: public; Owner: project_food_user
--

SELECT pg_catalog.setval('public.food_recommender_restaurant_dish_id_seq', 1, false);


--
-- Name: food_recommender_restaurant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: project_food_user
--

SELECT pg_catalog.setval('public.food_recommender_restaurant_id_seq', 1, false);


--
-- Name: food_recommender_user_followers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: project_food_user
--

SELECT pg_catalog.setval('public.food_recommender_user_followers_id_seq', 5, true);


--
-- Name: food_recommender_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: project_food_user
--

SELECT pg_catalog.setval('public.food_recommender_user_id_seq', 2, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: project_food_user
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: project_food_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: project_food_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: project_food_user
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: project_food_user
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: project_food_user
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: project_food_user
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: project_food_user
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: project_food_user
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: project_food_user
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: project_food_user
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: project_food_user
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: project_food_user
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: project_food_user
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: project_food_user
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: project_food_user
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: project_food_user
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: food_recommender_dish food_recommender_dish_name_0de1a71c_uniq; Type: CONSTRAINT; Schema: public; Owner: project_food_user
--

ALTER TABLE ONLY public.food_recommender_dish
    ADD CONSTRAINT food_recommender_dish_name_0de1a71c_uniq UNIQUE (name);


--
-- Name: food_recommender_dish food_recommender_dish_pkey; Type: CONSTRAINT; Schema: public; Owner: project_food_user
--

ALTER TABLE ONLY public.food_recommender_dish
    ADD CONSTRAINT food_recommender_dish_pkey PRIMARY KEY (id);


--
-- Name: food_recommender_dishingredients food_recommender_dishingredients_pkey; Type: CONSTRAINT; Schema: public; Owner: project_food_user
--

ALTER TABLE ONLY public.food_recommender_dishingredients
    ADD CONSTRAINT food_recommender_dishingredients_pkey PRIMARY KEY (id);


--
-- Name: food_recommender_dishinterest food_recommender_dishinterest_pkey; Type: CONSTRAINT; Schema: public; Owner: project_food_user
--

ALTER TABLE ONLY public.food_recommender_dishinterest
    ADD CONSTRAINT food_recommender_dishinterest_pkey PRIMARY KEY (id);


--
-- Name: food_recommender_ingredient food_recommender_ingredient_name_87be9cf6_uniq; Type: CONSTRAINT; Schema: public; Owner: project_food_user
--

ALTER TABLE ONLY public.food_recommender_ingredient
    ADD CONSTRAINT food_recommender_ingredient_name_87be9cf6_uniq UNIQUE (name);


--
-- Name: food_recommender_ingredient food_recommender_ingredient_pkey; Type: CONSTRAINT; Schema: public; Owner: project_food_user
--

ALTER TABLE ONLY public.food_recommender_ingredient
    ADD CONSTRAINT food_recommender_ingredient_pkey PRIMARY KEY (id);


--
-- Name: food_recommender_restaurant_dishes_in_menu food_recommender_restaur_restaurant_id_dish_id_a3e85ce8_uniq; Type: CONSTRAINT; Schema: public; Owner: project_food_user
--

ALTER TABLE ONLY public.food_recommender_restaurant_dishes_in_menu
    ADD CONSTRAINT food_recommender_restaur_restaurant_id_dish_id_a3e85ce8_uniq UNIQUE (restaurant_id, dish_id);


--
-- Name: food_recommender_restaurant_dishes_in_menu food_recommender_restaurant_dish_pkey; Type: CONSTRAINT; Schema: public; Owner: project_food_user
--

ALTER TABLE ONLY public.food_recommender_restaurant_dishes_in_menu
    ADD CONSTRAINT food_recommender_restaurant_dish_pkey PRIMARY KEY (id);


--
-- Name: food_recommender_restaurant food_recommender_restaurant_name_15a5fd0c_uniq; Type: CONSTRAINT; Schema: public; Owner: project_food_user
--

ALTER TABLE ONLY public.food_recommender_restaurant
    ADD CONSTRAINT food_recommender_restaurant_name_15a5fd0c_uniq UNIQUE (name);


--
-- Name: food_recommender_restaurant food_recommender_restaurant_pkey; Type: CONSTRAINT; Schema: public; Owner: project_food_user
--

ALTER TABLE ONLY public.food_recommender_restaurant
    ADD CONSTRAINT food_recommender_restaurant_pkey PRIMARY KEY (id);


--
-- Name: food_recommender_user_follow food_recommender_user_fo_from_user_id_to_user_id_e6671619_uniq; Type: CONSTRAINT; Schema: public; Owner: project_food_user
--

ALTER TABLE ONLY public.food_recommender_user_follow
    ADD CONSTRAINT food_recommender_user_fo_from_user_id_to_user_id_e6671619_uniq UNIQUE (from_user_id, to_user_id);


--
-- Name: food_recommender_user_follow food_recommender_user_followers_pkey; Type: CONSTRAINT; Schema: public; Owner: project_food_user
--

ALTER TABLE ONLY public.food_recommender_user_follow
    ADD CONSTRAINT food_recommender_user_followers_pkey PRIMARY KEY (id);


--
-- Name: food_recommender_user food_recommender_user_pkey; Type: CONSTRAINT; Schema: public; Owner: project_food_user
--

ALTER TABLE ONLY public.food_recommender_user
    ADD CONSTRAINT food_recommender_user_pkey PRIMARY KEY (id);


--
-- Name: food_recommender_user food_recommender_user_username_76b8ff77_uniq; Type: CONSTRAINT; Schema: public; Owner: project_food_user
--

ALTER TABLE ONLY public.food_recommender_user
    ADD CONSTRAINT food_recommender_user_username_76b8ff77_uniq UNIQUE (username);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: project_food_user
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: project_food_user
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: project_food_user
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: project_food_user
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: project_food_user
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: project_food_user
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: project_food_user
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: project_food_user
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: project_food_user
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: project_food_user
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: project_food_user
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: project_food_user
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: project_food_user
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: food_recommender_dish_name_0de1a71c_like; Type: INDEX; Schema: public; Owner: project_food_user
--

CREATE INDEX food_recommender_dish_name_0de1a71c_like ON public.food_recommender_dish USING btree (name varchar_pattern_ops);


--
-- Name: food_recommender_dishingredients_dish_id_7e3f9199; Type: INDEX; Schema: public; Owner: project_food_user
--

CREATE INDEX food_recommender_dishingredients_dish_id_7e3f9199 ON public.food_recommender_dishingredients USING btree (dish_id);


--
-- Name: food_recommender_dishingredients_ingredient_id_d223a22b; Type: INDEX; Schema: public; Owner: project_food_user
--

CREATE INDEX food_recommender_dishingredients_ingredient_id_d223a22b ON public.food_recommender_dishingredients USING btree (ingredient_id);


--
-- Name: food_recommender_dishinterest_dish_id_b8a36036; Type: INDEX; Schema: public; Owner: project_food_user
--

CREATE INDEX food_recommender_dishinterest_dish_id_b8a36036 ON public.food_recommender_dishinterest USING btree (dish_id);


--
-- Name: food_recommender_dishinterest_user_id_e3bedeef; Type: INDEX; Schema: public; Owner: project_food_user
--

CREATE INDEX food_recommender_dishinterest_user_id_e3bedeef ON public.food_recommender_dishinterest USING btree (user_id);


--
-- Name: food_recommender_ingredient_name_87be9cf6_like; Type: INDEX; Schema: public; Owner: project_food_user
--

CREATE INDEX food_recommender_ingredient_name_87be9cf6_like ON public.food_recommender_ingredient USING btree (name varchar_pattern_ops);


--
-- Name: food_recommender_restaurant_dish_dish_id_f73a7a80; Type: INDEX; Schema: public; Owner: project_food_user
--

CREATE INDEX food_recommender_restaurant_dish_dish_id_f73a7a80 ON public.food_recommender_restaurant_dishes_in_menu USING btree (dish_id);


--
-- Name: food_recommender_restaurant_dish_restaurant_id_84583948; Type: INDEX; Schema: public; Owner: project_food_user
--

CREATE INDEX food_recommender_restaurant_dish_restaurant_id_84583948 ON public.food_recommender_restaurant_dishes_in_menu USING btree (restaurant_id);


--
-- Name: food_recommender_restaurant_name_15a5fd0c_like; Type: INDEX; Schema: public; Owner: project_food_user
--

CREATE INDEX food_recommender_restaurant_name_15a5fd0c_like ON public.food_recommender_restaurant USING btree (name varchar_pattern_ops);


--
-- Name: food_recommender_user_followers_from_user_id_25a0c6eb; Type: INDEX; Schema: public; Owner: project_food_user
--

CREATE INDEX food_recommender_user_followers_from_user_id_25a0c6eb ON public.food_recommender_user_follow USING btree (from_user_id);


--
-- Name: food_recommender_user_followers_to_user_id_c785507b; Type: INDEX; Schema: public; Owner: project_food_user
--

CREATE INDEX food_recommender_user_followers_to_user_id_c785507b ON public.food_recommender_user_follow USING btree (to_user_id);


--
-- Name: food_recommender_user_username_76b8ff77_like; Type: INDEX; Schema: public; Owner: project_food_user
--

CREATE INDEX food_recommender_user_username_76b8ff77_like ON public.food_recommender_user USING btree (username varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: project_food_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: project_food_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: project_food_user
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: project_food_user
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: project_food_user
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: project_food_user
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: project_food_user
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: project_food_user
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: project_food_user
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: food_recommender_dishingredients food_recommender_dis_dish_id_7e3f9199_fk_food_reco; Type: FK CONSTRAINT; Schema: public; Owner: project_food_user
--

ALTER TABLE ONLY public.food_recommender_dishingredients
    ADD CONSTRAINT food_recommender_dis_dish_id_7e3f9199_fk_food_reco FOREIGN KEY (dish_id) REFERENCES public.food_recommender_dish(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: food_recommender_dishinterest food_recommender_dis_dish_id_b8a36036_fk_food_reco; Type: FK CONSTRAINT; Schema: public; Owner: project_food_user
--

ALTER TABLE ONLY public.food_recommender_dishinterest
    ADD CONSTRAINT food_recommender_dis_dish_id_b8a36036_fk_food_reco FOREIGN KEY (dish_id) REFERENCES public.food_recommender_dish(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: food_recommender_dishingredients food_recommender_dis_ingredient_id_d223a22b_fk_food_reco; Type: FK CONSTRAINT; Schema: public; Owner: project_food_user
--

ALTER TABLE ONLY public.food_recommender_dishingredients
    ADD CONSTRAINT food_recommender_dis_ingredient_id_d223a22b_fk_food_reco FOREIGN KEY (ingredient_id) REFERENCES public.food_recommender_ingredient(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: food_recommender_dishinterest food_recommender_dis_user_id_e3bedeef_fk_food_reco; Type: FK CONSTRAINT; Schema: public; Owner: project_food_user
--

ALTER TABLE ONLY public.food_recommender_dishinterest
    ADD CONSTRAINT food_recommender_dis_user_id_e3bedeef_fk_food_reco FOREIGN KEY (user_id) REFERENCES public.food_recommender_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: food_recommender_restaurant_dishes_in_menu food_recommender_res_dish_id_8f4bb921_fk_food_reco; Type: FK CONSTRAINT; Schema: public; Owner: project_food_user
--

ALTER TABLE ONLY public.food_recommender_restaurant_dishes_in_menu
    ADD CONSTRAINT food_recommender_res_dish_id_8f4bb921_fk_food_reco FOREIGN KEY (dish_id) REFERENCES public.food_recommender_dish(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: food_recommender_restaurant_dishes_in_menu food_recommender_res_restaurant_id_4b6d6909_fk_food_reco; Type: FK CONSTRAINT; Schema: public; Owner: project_food_user
--

ALTER TABLE ONLY public.food_recommender_restaurant_dishes_in_menu
    ADD CONSTRAINT food_recommender_res_restaurant_id_4b6d6909_fk_food_reco FOREIGN KEY (restaurant_id) REFERENCES public.food_recommender_restaurant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: food_recommender_user_follow food_recommender_use_from_user_id_0f8881c2_fk_food_reco; Type: FK CONSTRAINT; Schema: public; Owner: project_food_user
--

ALTER TABLE ONLY public.food_recommender_user_follow
    ADD CONSTRAINT food_recommender_use_from_user_id_0f8881c2_fk_food_reco FOREIGN KEY (from_user_id) REFERENCES public.food_recommender_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: food_recommender_user_follow food_recommender_use_to_user_id_1288a67f_fk_food_reco; Type: FK CONSTRAINT; Schema: public; Owner: project_food_user
--

ALTER TABLE ONLY public.food_recommender_user_follow
    ADD CONSTRAINT food_recommender_use_to_user_id_1288a67f_fk_food_reco FOREIGN KEY (to_user_id) REFERENCES public.food_recommender_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

