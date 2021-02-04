--
-- PostgreSQL database dump
--

-- Dumped from database version 13.1
-- Dumped by pg_dump version 13.1

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
-- Name: branch; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.branch (
    branchno character(4) NOT NULL,
    street character varying(32),
    city character varying(32),
    postcode character varying(8)
);


ALTER TABLE public.branch OWNER TO postgres;

--
-- Name: client; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client (
    clientno character(4) NOT NULL,
    fname character varying(32),
    lname character varying(32),
    telno character varying(32),
    preftype character varying(5),
    maxrent integer,
    email character varying(50)
);


ALTER TABLE public.client OWNER TO postgres;

--
-- Name: privateowner; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.privateowner (
    ownerno character(4) NOT NULL,
    fname character varying(32),
    lname character varying(32),
    address character varying(50),
    telno character varying(32),
    email character varying(50),
    password character varying(8)
);


ALTER TABLE public.privateowner OWNER TO postgres;

--
-- Name: propertyforrent; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.propertyforrent (
    propertyno character(4) NOT NULL,
    street character varying(32),
    city character varying(32),
    postcode character varying(8),
    type character varying(5),
    rooms integer,
    rent integer,
    ownerno character(4),
    staffno character varying(4),
    branchno character(4)
);


ALTER TABLE public.propertyforrent OWNER TO postgres;

--
-- Name: registration; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.registration (
    reg_id integer NOT NULL,
    clientno character(4),
    branchno character(4),
    staffno character varying(4),
    datejoined date
);


ALTER TABLE public.registration OWNER TO postgres;

--
-- Name: staff; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.staff (
    staffno character varying(4) NOT NULL,
    fname character varying(32),
    lname character varying(32),
    "position" character varying(32),
    sex character(1),
    dob date,
    salary integer,
    branchno character(4)
);


ALTER TABLE public.staff OWNER TO postgres;

--
-- Name: viewing; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.viewing (
    view_id integer NOT NULL,
    clientno character(4),
    propertyno character(4),
    viewdate date,
    comment character varying(32)
);


ALTER TABLE public.viewing OWNER TO postgres;

--
-- Data for Name: branch; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.branch (branchno, street, city, postcode) FROM stdin;
B005	22 Deer Rd	London	SW1 4EH
B007	16 Argyll St	Aberdeen	AB2 3SU
B003	163 Main St	Glasgow	G11 9QX
B004	32 Manse Rd	Bristol	BS99 1NZ
B002	56 Clover Dr	London	NW10 6EU
\.


--
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client (clientno, fname, lname, telno, preftype, maxrent, email) FROM stdin;
CR76	John	Kay	0207-774-5632	Flat	425	john.kay@gmail.com
CR56	Aline	Stewart	0141-848-1825	Flat	350	astewart@hotmail.com
CR74	Mike	Ritchie	01475-392178	House	750	mritchie01@yahoo.co.uk
CR62	Mary	Tregear	01224-196720	Flat	600	maryt@hotmail.co.uk
\.


--
-- Data for Name: privateowner; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.privateowner (ownerno, fname, lname, address, telno, email, password) FROM stdin;
CO46	Joe	Keogh	2 Fergus Dr, Aberdeen AB2 7SX	01224-861212	jkeogh@lhh.com	********
CO87	Carol	Farrel	6 Achray St, Glasgow G32 9DX	0141-357-7419	cfarrel@gmail.com	********
CO40	Tina	Murphy	63 Well St, Glasgow G42	0141-943-1728	tinam@hotmail.com	********
CO93	Tony	Shaw	12 Park Pl, Glasgow G4 0QR	0141-225-7025	tony.shaw@ark.com	********
\.


--
-- Data for Name: propertyforrent; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.propertyforrent (propertyno, street, city, postcode, type, rooms, rent, ownerno, staffno, branchno) FROM stdin;
PA14	16 Holhead	Aberdeen	AB7 5SU	House	6	650	CO46	SA9	B007
PL94	6 Argyll St	London	NW2	Flat	4	400	CO87	SL41	B005
PG4 	6 Lawrence St	Glasgow	G11 9QX	Flat	3	350	CO40	\N	B003
PG36	2 Manor Rd	Glasgow	G32 4QX	Flat	3	375	CO93	SG37	B003
PG21	18 Dale Rd	Glasgow	G12	House	5	600	CO87	SG37	B003
PG16	5 Novar Dr	Glasgow	G12 9AX	Flat	4	450	CO93	SG14	B003
\.


--
-- Data for Name: registration; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.registration (reg_id, clientno, branchno, staffno, datejoined) FROM stdin;
1	CR76	B005	SL41	2013-01-02
2	CR56	B003	SG37	2012-04-11
3	CR74	B003	SG37	2011-11-16
4	CR62	B007	SA9	2012-03-07
\.


--
-- Data for Name: staff; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.staff (staffno, fname, lname, "position", sex, dob, salary, branchno) FROM stdin;
SL21	John	White	Manager	M	1945-10-01	30000	B005
SG37	Ann	Beech	Assistant	F	1960-11-10	12000	B003
SG14	David	Ford	Supervisor	M	1958-03-24	18000	B003
SA9	Mary	Howe	Assistant	F	1970-02-19	9000	B007
SG5	Susan	Brand	Manager	F	1940-06-03	24000	B003
SL41	Julie	Lee	Assistant	F	1965-06-13	9000	B005
\.


--
-- Data for Name: viewing; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.viewing (view_id, clientno, propertyno, viewdate, comment) FROM stdin;
1	CR56	PA14	2013-05-24	too small
2	CR76	PG4 	2013-04-20	too remote
3	CR56	PG4 	2013-05-26	\N
4	CR62	PA14	2013-05-14	no dining room
5	CR56	PG36	2013-04-28	\N
\.


--
-- Name: branch branch_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.branch
    ADD CONSTRAINT branch_pkey PRIMARY KEY (branchno);


--
-- Name: client client_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (clientno);


--
-- Name: privateowner privateowner_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.privateowner
    ADD CONSTRAINT privateowner_pkey PRIMARY KEY (ownerno);


--
-- Name: propertyforrent propertyforrent_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.propertyforrent
    ADD CONSTRAINT propertyforrent_pkey PRIMARY KEY (propertyno);


--
-- Name: registration registration_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registration
    ADD CONSTRAINT registration_pkey PRIMARY KEY (reg_id);


--
-- Name: staff staff_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_pkey PRIMARY KEY (staffno);


--
-- Name: viewing viewing_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.viewing
    ADD CONSTRAINT viewing_pkey PRIMARY KEY (view_id);


--
-- Name: propertyforrent propertyforrent_branchno_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.propertyforrent
    ADD CONSTRAINT propertyforrent_branchno_fkey FOREIGN KEY (branchno) REFERENCES public.branch(branchno);


--
-- Name: propertyforrent propertyforrent_ownerno_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.propertyforrent
    ADD CONSTRAINT propertyforrent_ownerno_fkey FOREIGN KEY (ownerno) REFERENCES public.privateowner(ownerno);


--
-- Name: propertyforrent propertyforrent_staffno_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.propertyforrent
    ADD CONSTRAINT propertyforrent_staffno_fkey FOREIGN KEY (staffno) REFERENCES public.staff(staffno);


--
-- Name: registration registration_branchno_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registration
    ADD CONSTRAINT registration_branchno_fkey FOREIGN KEY (branchno) REFERENCES public.branch(branchno);


--
-- Name: registration registration_clientno_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registration
    ADD CONSTRAINT registration_clientno_fkey FOREIGN KEY (clientno) REFERENCES public.client(clientno);


--
-- Name: registration registration_staffno_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registration
    ADD CONSTRAINT registration_staffno_fkey FOREIGN KEY (staffno) REFERENCES public.staff(staffno);


--
-- Name: staff staff_branchno_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_branchno_fkey FOREIGN KEY (branchno) REFERENCES public.branch(branchno);


--
-- Name: viewing viewing_clientno_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.viewing
    ADD CONSTRAINT viewing_clientno_fkey FOREIGN KEY (clientno) REFERENCES public.client(clientno);


--
-- Name: viewing viewing_propertyno_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.viewing
    ADD CONSTRAINT viewing_propertyno_fkey FOREIGN KEY (propertyno) REFERENCES public.propertyforrent(propertyno);


--
-- PostgreSQL database dump complete
--

