PGDMP         7                z           postgres    14.2    14.4 
    ?           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ?           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ?           1262    14672    postgres    DATABASE     ]   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.UTF-8';
    DROP DATABASE postgres;
                postgres    false            ?           0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                   postgres    false    4231            ?           0    0    SCHEMA public    ACL     ?   REVOKE ALL ON SCHEMA public FROM rdsadmin;
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;
                   postgres    false    3            ?            1259    16407    Items    TABLE     R   CREATE TABLE public."Items" (
    name text,
    count integer,
    id integer
);
    DROP TABLE public."Items";
       public         heap    postgres    false            ?            1259    16402    items    TABLE     P   CREATE TABLE public.items (
    name text,
    count integer,
    id integer
);
    DROP TABLE public.items;
       public         heap    postgres    false            ?          0    16407    Items 
   TABLE DATA           2   COPY public."Items" (name, count, id) FROM stdin;
    public          postgres    false    210   h       ?          0    16402    items 
   TABLE DATA           0   COPY public.items (name, count, id) FROM stdin;
    public          postgres    false    209   ?       ?   K   x?s,(?I-?45?4?rJ??bN3N#.?ļ?|NKKNc???????Ԣ?L?JC?R.???LN#SSNS?=... ?/C      ?      x?????? ? ?     