--
-- PostgreSQL database cluster dump
--

-- Started on 2026-04-08 23:09:30

\restrict bh8Gu0OuKVmjCJZyUvtf8e3FbASQqpnhULIJ5zoDjPCFGm9FvjVW6Cbfxj5XWKC

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:Rzj8COuNbFnMu6A+To0FAw==$bR60ly4LEnwKqb6bkQXKkvWJMiU/q++FEz58JkAd19g=:xlKcng1IE0Cfjuk43qfIYsd73zoNcdlErPtsl63MrNs=';
CREATE ROLE rl_administrator;
ALTER ROLE rl_administrator WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:3KDyWU72Y+kTO+1pCi9HeA==$iPkT5225o0ObtxTwqZA/DL1q0Q5mXaYq352g7jwBN9w=:veGPbSMAFfKW7QbZFg4dItJeetVHTSCYSevZThBgk7w=';
CREATE ROLE rl_cashier;
ALTER ROLE rl_cashier WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:33fYEWy/kVqvTz9GWnx6JQ==$sa91GZsEio/suTVhvmaoqodC937C5TA9ewPlpvCRdgM=:/2x1St/vZLBaxO9j3FbNHkBw5/WCK6DW/6bBZeDVC6s=';
CREATE ROLE rl_customer;
ALTER ROLE rl_customer WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:B01bvhpK73hA5esFbtVmPw==$QypJE8EvOqtxLwacXhfxJGIHPmjNQWARi4bMXKoIHjE=:R/MuCkbBDvBmtW0UVh0P7ozeX35erG9qoox67/Fe6k8=';
CREATE ROLE rl_sales_manager;
ALTER ROLE rl_sales_manager WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:vgTgh2xpPNE2ZQhZZznTOw==$T7ectRmHN/2s6EDcL+oHct5zicWMGdiHUpqz2tX+Na0=:91JxGrY81cxvhSGKx99G3ksh0XmLik8tmF55LbIjXoU=';
CREATE ROLE rl_supplier;
ALTER ROLE rl_supplier WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:kjYxcXo4d6+Y8UzFi7vslQ==$S9GLSBYAggW8zkc0Rk/Pax6wue8bCFDixqCG2qKPXwU=:M3t5Sif/ZKmWOBWYavWeIbufAB0gUtsg9OM5qwKN2uQ=';
CREATE ROLE rl_supply_manager;
ALTER ROLE rl_supply_manager WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:EFq/VakQ74mCfgEYvccM0A==$2dCvCOGNFkeAwCY5S98EtCJ5g4+ky1YwtxwB6lCljiQ=:+snH/FOBDWjTQCiFscxASbvMVCs5OJn4GOtSByXHhwc=';

--
-- User Configurations
--








\unrestrict bh8Gu0OuKVmjCJZyUvtf8e3FbASQqpnhULIJ5zoDjPCFGm9FvjVW6Cbfxj5XWKC

--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

\restrict un3rcggV4ZNi1OjuaRaSrTkTZUwxuYKtgll1gz1Is3lnWdbhRaYXf6eeyEoYerG

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.1

-- Started on 2026-04-08 23:09:30

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

-- Completed on 2026-04-08 23:09:30

--
-- PostgreSQL database dump complete
--

\unrestrict un3rcggV4ZNi1OjuaRaSrTkTZUwxuYKtgll1gz1Is3lnWdbhRaYXf6eeyEoYerG

--
-- Database "Music_Store_db" dump
--

--
-- PostgreSQL database dump
--

\restrict w62pZ6szbXQGTM6orDBqePJn0mk9mQ3WGV5cp6A2thgD9V0OmGGLxPEkOgHutsq

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.1

-- Started on 2026-04-08 23:09:31

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 5049 (class 1262 OID 16388)
-- Name: Music_Store_db; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "Music_Store_db" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';


ALTER DATABASE "Music_Store_db" OWNER TO postgres;

\unrestrict w62pZ6szbXQGTM6orDBqePJn0mk9mQ3WGV5cp6A2thgD9V0OmGGLxPEkOgHutsq
\connect "Music_Store_db"
\restrict w62pZ6szbXQGTM6orDBqePJn0mk9mQ3WGV5cp6A2thgD9V0OmGGLxPEkOgHutsq

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 224 (class 1255 OID 24641)
-- Name: country_delete(integer); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.country_delete(IN p_id_country integer)
    LANGUAGE plpgsql
    AS $$ begin delete from Country where ID_Country = p_ID_Country; end; $$;


ALTER PROCEDURE public.country_delete(IN p_id_country integer) OWNER TO postgres;

--
-- TOC entry 222 (class 1255 OID 24639)
-- Name: country_insert(character varying); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.country_insert(IN p_name_country character varying)
    LANGUAGE plpgsql
    AS $$ begin insert into Country (Name_Country) values (p_Name_Country); end; $$;


ALTER PROCEDURE public.country_insert(IN p_name_country character varying) OWNER TO postgres;

--
-- TOC entry 223 (class 1255 OID 24640)
-- Name: country_update(integer, character varying); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.country_update(IN p_id_country integer, IN p_name_country character varying)
    LANGUAGE plpgsql
    AS $$ begin update Country set Name_Country = p_Name_Country where ID_Country = p_ID_Country; end; $$;


ALTER PROCEDURE public.country_update(IN p_id_country integer, IN p_name_country character varying) OWNER TO postgres;

--
-- TOC entry 241 (class 1255 OID 24658)
-- Name: customer_delete(character varying); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.customer_delete(IN p_customer_login character varying)
    LANGUAGE plpgsql
    AS $$ begin delete from Customer where Customer_Login = p_Customer_Login; end; $$;


ALTER PROCEDURE public.customer_delete(IN p_customer_login character varying) OWNER TO postgres;

--
-- TOC entry 239 (class 1255 OID 24656)
-- Name: customer_insert(character varying, character varying, character varying, character varying, character varying); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.customer_insert(IN p_customer_login character varying, IN p_passport_data character varying, IN p_address character varying, IN p_phone character varying, IN p_bank_card character varying)
    LANGUAGE plpgsql
    AS $$ begin insert into Customer (Customer_Login, Passport_Data, Address, Phone, Bank_Card) values (p_Customer_Login, p_Passport_Data, p_Address, p_Phone, p_Bank_Card); end; $$;


ALTER PROCEDURE public.customer_insert(IN p_customer_login character varying, IN p_passport_data character varying, IN p_address character varying, IN p_phone character varying, IN p_bank_card character varying) OWNER TO postgres;

--
-- TOC entry 240 (class 1255 OID 24657)
-- Name: customer_update(character varying, character varying, character varying, character varying, character varying, character varying); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.customer_update(IN p_customer_login_old character varying, IN p_customer_login_new character varying, IN p_passport_data character varying, IN p_address character varying, IN p_phone character varying, IN p_bank_card character varying)
    LANGUAGE plpgsql
    AS $$ begin update Customer set Customer_Login = p_Customer_Login_New, Passport_Data = p_Passport_Data, Address = p_Address, Phone = p_Phone, Bank_Card = p_Bank_Card where Customer_Login = p_Customer_Login_Old; end; $$;


ALTER PROCEDURE public.customer_update(IN p_customer_login_old character varying, IN p_customer_login_new character varying, IN p_passport_data character varying, IN p_address character varying, IN p_phone character varying, IN p_bank_card character varying) OWNER TO postgres;

--
-- TOC entry 238 (class 1255 OID 24655)
-- Name: employee_delete(character varying); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.employee_delete(IN p_employee_login character varying)
    LANGUAGE plpgsql
    AS $$ begin delete from Employee where Employee_Login = p_Employee_Login; end; $$;


ALTER PROCEDURE public.employee_delete(IN p_employee_login character varying) OWNER TO postgres;

--
-- TOC entry 237 (class 1255 OID 24654)
-- Name: employee_insert(character varying, character varying); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.employee_insert(IN p_employee_login character varying, IN p_personal_file_n character varying)
    LANGUAGE plpgsql
    AS $$ begin insert into Employee (Employee_Login, Personal_File_N) values (p_Employee_Login, p_Personal_File_N); end; $$;


ALTER PROCEDURE public.employee_insert(IN p_employee_login character varying, IN p_personal_file_n character varying) OWNER TO postgres;

--
-- TOC entry 251 (class 1255 OID 24668)
-- Name: estimate_item_insert(integer, integer, integer, numeric); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.estimate_item_insert(IN p_id_supply_estimate integer, IN p_id_instrument integer, IN p_quantity integer, IN p_item_price numeric)
    LANGUAGE plpgsql
    AS $$ begin insert into Estimate_Item (ID_Supply_Estimate, ID_Instrument, Quantity, Item_Price) values (p_ID_Supply_Estimate, p_ID_Instrument, p_Quantity, p_Item_Price); end; $$;


ALTER PROCEDURE public.estimate_item_insert(IN p_id_supply_estimate integer, IN p_id_instrument integer, IN p_quantity integer, IN p_item_price numeric) OWNER TO postgres;

--
-- TOC entry 252 (class 1255 OID 24669)
-- Name: estimate_item_update(integer, integer, integer, integer, numeric); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.estimate_item_update(IN p_id_estimate_item integer, IN p_id_supply_estimate integer, IN p_id_instrument integer, IN p_quantity integer, IN p_item_price numeric)
    LANGUAGE plpgsql
    AS $$ begin update Estimate_Item set ID_Supply_Estimate = p_ID_Supply_Estimate, ID_Instrument = p_ID_Instrument, Quantity = p_Quantity, Item_Price = p_Item_Price where ID_Estimate_Item = p_ID_Estimate_Item; end; $$;


ALTER PROCEDURE public.estimate_item_update(IN p_id_estimate_item integer, IN p_id_supply_estimate integer, IN p_id_instrument integer, IN p_quantity integer, IN p_item_price numeric) OWNER TO postgres;

--
-- TOC entry 247 (class 1255 OID 24664)
-- Name: instrument_delete(integer); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.instrument_delete(IN p_id_instrument integer)
    LANGUAGE plpgsql
    AS $$ begin delete from Instrument where ID_Instrument = p_ID_Instrument; end; $$;


ALTER PROCEDURE public.instrument_delete(IN p_id_instrument integer) OWNER TO postgres;

--
-- TOC entry 245 (class 1255 OID 24662)
-- Name: instrument_insert(character varying, integer, integer, character varying, character varying, integer, integer, numeric); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.instrument_insert(IN p_article character varying, IN p_id_instrument_type integer, IN p_id_country integer, IN p_brand_model character varying, IN p_frequency_range character varying, IN p_id_material integer, IN p_quantity integer, IN p_price numeric)
    LANGUAGE plpgsql
    AS $$ begin insert into Instrument (Article, ID_Instrument_Type, ID_Country, Brand_Model, Frequency_Range, ID_Material, Quantity, Price) values (p_Article, p_ID_Instrument_Type, p_ID_Country, p_Brand_Model, p_Frequency_Range, p_ID_Material, p_Quantity, p_Price); end; $$;


ALTER PROCEDURE public.instrument_insert(IN p_article character varying, IN p_id_instrument_type integer, IN p_id_country integer, IN p_brand_model character varying, IN p_frequency_range character varying, IN p_id_material integer, IN p_quantity integer, IN p_price numeric) OWNER TO postgres;

--
-- TOC entry 221 (class 1255 OID 24638)
-- Name: instrument_type_delete(integer); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.instrument_type_delete(IN p_id_instrument_type integer)
    LANGUAGE plpgsql
    AS $$ begin delete from Instrument_Type where ID_Instrument_Type = p_ID_Instrument_Type; end; $$;


ALTER PROCEDURE public.instrument_type_delete(IN p_id_instrument_type integer) OWNER TO postgres;

--
-- TOC entry 219 (class 1255 OID 24636)
-- Name: instrument_type_insert(character varying); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.instrument_type_insert(IN p_name_instrument_type character varying)
    LANGUAGE plpgsql
    AS $$ begin insert into Instrument_Type (Name_Instrument_Type) values (p_Name_Instrument_Type); end; $$;


ALTER PROCEDURE public.instrument_type_insert(IN p_name_instrument_type character varying) OWNER TO postgres;

--
-- TOC entry 220 (class 1255 OID 24637)
-- Name: instrument_type_update(integer, character varying); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.instrument_type_update(IN p_id_instrument_type integer, IN p_name_instrument_type character varying)
    LANGUAGE plpgsql
    AS $$ begin update Instrument_Type set Name_Instrument_Type = p_Name_Instrument_Type where ID_Instrument_Type = p_ID_Instrument_Type; end; $$;


ALTER PROCEDURE public.instrument_type_update(IN p_id_instrument_type integer, IN p_name_instrument_type character varying) OWNER TO postgres;

--
-- TOC entry 246 (class 1255 OID 24663)
-- Name: instrument_update(integer, character varying, integer, integer, character varying, character varying, integer, integer, numeric); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.instrument_update(IN p_id_instrument integer, IN p_article character varying, IN p_id_instrument_type integer, IN p_id_country integer, IN p_brand_model character varying, IN p_frequency_range character varying, IN p_id_material integer, IN p_quantity integer, IN p_price numeric)
    LANGUAGE plpgsql
    AS $$ begin update Instrument set Article = p_Article, ID_Instrument_Type = p_ID_Instrument_Type, ID_Country = p_ID_Country, Brand_Model = p_Brand_Model, Frequency_Range = p_Frequency_Range, ID_Material = p_ID_Material, Quantity = p_Quantity, Price = p_Price where ID_Instrument = p_ID_Instrument; end; $$;


ALTER PROCEDURE public.instrument_update(IN p_id_instrument integer, IN p_article character varying, IN p_id_instrument_type integer, IN p_id_country integer, IN p_brand_model character varying, IN p_frequency_range character varying, IN p_id_material integer, IN p_quantity integer, IN p_price numeric) OWNER TO postgres;

--
-- TOC entry 227 (class 1255 OID 24644)
-- Name: material_delete(integer); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.material_delete(IN p_id_material integer)
    LANGUAGE plpgsql
    AS $$ begin delete from Material where ID_Material = p_ID_Material; end; $$;


ALTER PROCEDURE public.material_delete(IN p_id_material integer) OWNER TO postgres;

--
-- TOC entry 225 (class 1255 OID 24642)
-- Name: material_insert(character varying); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.material_insert(IN p_name_material character varying)
    LANGUAGE plpgsql
    AS $$ begin insert into Material (Name_Material) values (p_Name_Material); end; $$;


ALTER PROCEDURE public.material_insert(IN p_name_material character varying) OWNER TO postgres;

--
-- TOC entry 226 (class 1255 OID 24643)
-- Name: material_update(integer, character varying); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.material_update(IN p_id_material integer, IN p_name_material character varying)
    LANGUAGE plpgsql
    AS $$ begin update Material set Name_Material = p_Name_Material where ID_Material = p_ID_Material; end; $$;


ALTER PROCEDURE public.material_update(IN p_id_material integer, IN p_name_material character varying) OWNER TO postgres;

--
-- TOC entry 272 (class 1255 OID 24678)
-- Name: order_item_delete(integer); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.order_item_delete(IN p_id_order_item integer)
    LANGUAGE plpgsql
    AS $$ begin delete from Order_Item where ID_Order_Item = p_ID_Order_Item; end; $$;


ALTER PROCEDURE public.order_item_delete(IN p_id_order_item integer) OWNER TO postgres;

--
-- TOC entry 270 (class 1255 OID 24676)
-- Name: order_item_insert(integer, integer, integer, numeric); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.order_item_insert(IN p_id_purchase_order integer, IN p_id_instrument integer, IN p_quantity integer, IN p_item_price numeric)
    LANGUAGE plpgsql
    AS $$ begin insert into Order_Item (ID_Purchase_Order, ID_Instrument, Quantity, Item_Price) values (p_ID_Purchase_Order, p_ID_Instrument, p_Quantity, p_Item_Price); end; $$;


ALTER PROCEDURE public.order_item_insert(IN p_id_purchase_order integer, IN p_id_instrument integer, IN p_quantity integer, IN p_item_price numeric) OWNER TO postgres;

--
-- TOC entry 271 (class 1255 OID 24677)
-- Name: order_item_update(integer, integer, integer, integer, numeric); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.order_item_update(IN p_id_order_item integer, IN p_id_purchase_order integer, IN p_id_instrument integer, IN p_quantity integer, IN p_item_price numeric)
    LANGUAGE plpgsql
    AS $$ begin update Order_Item set ID_Purchase_Order = p_ID_Purchase_Order, ID_Instrument = p_ID_Instrument, Quantity = p_Quantity, Item_Price = p_Item_Price where ID_Order_Item = p_ID_Order_Item; end; $$;


ALTER PROCEDURE public.order_item_update(IN p_id_order_item integer, IN p_id_purchase_order integer, IN p_id_instrument integer, IN p_quantity integer, IN p_item_price numeric) OWNER TO postgres;

--
-- TOC entry 230 (class 1255 OID 24647)
-- Name: post_delete(integer); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.post_delete(IN p_id_post integer)
    LANGUAGE plpgsql
    AS $$ begin delete from Post where ID_Post = p_ID_Post; end; $$;


ALTER PROCEDURE public.post_delete(IN p_id_post integer) OWNER TO postgres;

--
-- TOC entry 228 (class 1255 OID 24645)
-- Name: post_insert(character varying); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.post_insert(IN p_name_post character varying)
    LANGUAGE plpgsql
    AS $$ begin insert into Post (Name_Post) values (p_Name_Post); end; $$;


ALTER PROCEDURE public.post_insert(IN p_name_post character varying) OWNER TO postgres;

--
-- TOC entry 229 (class 1255 OID 24646)
-- Name: post_update(integer, character varying); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.post_update(IN p_id_post integer, IN p_name_post character varying)
    LANGUAGE plpgsql
    AS $$ begin update Post set Name_Post = p_Name_Post where ID_Post = p_ID_Post; end; $$;


ALTER PROCEDURE public.post_update(IN p_id_post integer, IN p_name_post character varying) OWNER TO postgres;

--
-- TOC entry 269 (class 1255 OID 24675)
-- Name: purchase_order_delete(integer); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.purchase_order_delete(IN p_id_purchase_order integer)
    LANGUAGE plpgsql
    AS $$ begin delete from Purchase_Order where ID_Purchase_Order = p_ID_Purchase_Order; end; $$;


ALTER PROCEDURE public.purchase_order_delete(IN p_id_purchase_order integer) OWNER TO postgres;

--
-- TOC entry 266 (class 1255 OID 24673)
-- Name: purchase_order_insert(character varying, character varying, integer, numeric); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.purchase_order_insert(IN p_order_number character varying, IN p_customer_login character varying, IN p_id_status integer, IN p_total_amount numeric)
    LANGUAGE plpgsql
    AS $$ begin insert into Purchase_Order (Order_Number, Customer_Login, ID_Status, Total_Amount) values (p_Order_Number, p_Customer_Login, p_ID_Status, p_Total_Amount); end; $$;


ALTER PROCEDURE public.purchase_order_insert(IN p_order_number character varying, IN p_customer_login character varying, IN p_id_status integer, IN p_total_amount numeric) OWNER TO postgres;

--
-- TOC entry 268 (class 1255 OID 24674)
-- Name: purchase_order_update(integer, character varying, character varying, integer, numeric); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.purchase_order_update(IN p_id_purchase_order integer, IN p_order_number character varying, IN p_customer_login character varying, IN p_id_status integer, IN p_total_amount numeric)
    LANGUAGE plpgsql
    AS $$ begin update Purchase_Order set Order_Number = p_Order_Number, Customer_Login = p_Customer_Login, ID_Status = p_ID_Status, Total_Amount = p_Total_Amount where ID_Purchase_Order = p_ID_Purchase_Order; end; $$;


ALTER PROCEDURE public.purchase_order_update(IN p_id_purchase_order integer, IN p_order_number character varying, IN p_customer_login character varying, IN p_id_status integer, IN p_total_amount numeric) OWNER TO postgres;

--
-- TOC entry 275 (class 1255 OID 24681)
-- Name: purchase_receipt_delete(integer); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.purchase_receipt_delete(IN p_id_purchase_receipt integer)
    LANGUAGE plpgsql
    AS $$ begin delete from Purchase_Receipt where ID_Purchase_Receipt = p_ID_Purchase_Receipt; end; $$;


ALTER PROCEDURE public.purchase_receipt_delete(IN p_id_purchase_receipt integer) OWNER TO postgres;

--
-- TOC entry 273 (class 1255 OID 24679)
-- Name: purchase_receipt_insert(character varying, integer, character varying, numeric, numeric, character varying); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.purchase_receipt_insert(IN p_receipt_number character varying, IN p_id_purchase_order integer, IN p_payment_type character varying, IN p_amount_paid numeric, IN p_change_amount numeric, IN p_employee_login character varying)
    LANGUAGE plpgsql
    AS $$ begin insert into Purchase_Receipt (Receipt_Number, ID_Purchase_Order, Payment_Type, Amount_Paid, Change_Amount, Employee_Login) values (p_Receipt_Number, p_ID_Purchase_Order, p_Payment_Type, p_Amount_Paid, p_Change_Amount, p_Employee_Login); end; $$;


ALTER PROCEDURE public.purchase_receipt_insert(IN p_receipt_number character varying, IN p_id_purchase_order integer, IN p_payment_type character varying, IN p_amount_paid numeric, IN p_change_amount numeric, IN p_employee_login character varying) OWNER TO postgres;

--
-- TOC entry 274 (class 1255 OID 24680)
-- Name: purchase_receipt_update(integer, character varying, integer, character varying, numeric, numeric, character varying); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.purchase_receipt_update(IN p_id_purchase_receipt integer, IN p_receipt_number character varying, IN p_id_purchase_order integer, IN p_payment_type character varying, IN p_amount_paid numeric, IN p_change_amount numeric, IN p_employee_login character varying)
    LANGUAGE plpgsql
    AS $$ begin update Purchase_Receipt set Receipt_Number = p_Receipt_Number, ID_Purchase_Order = p_ID_Purchase_Order, Payment_Type = p_Payment_Type, Amount_Paid = p_Amount_Paid, Change_Amount = p_Change_Amount, Employee_Login = p_Employee_Login where ID_Purchase_Receipt = p_ID_Purchase_Receipt; end; $$;


ALTER PROCEDURE public.purchase_receipt_update(IN p_id_purchase_receipt integer, IN p_receipt_number character varying, IN p_id_purchase_order integer, IN p_payment_type character varying, IN p_amount_paid numeric, IN p_change_amount numeric, IN p_employee_login character varying) OWNER TO postgres;

--
-- TOC entry 233 (class 1255 OID 24650)
-- Name: status_delete(integer); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.status_delete(IN p_id_status integer)
    LANGUAGE plpgsql
    AS $$ begin delete from Status where ID_Status = p_ID_Status; end; $$;


ALTER PROCEDURE public.status_delete(IN p_id_status integer) OWNER TO postgres;

--
-- TOC entry 231 (class 1255 OID 24648)
-- Name: status_insert(character varying); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.status_insert(IN p_name_status character varying)
    LANGUAGE plpgsql
    AS $$ begin insert into Status (Name_Status) values (p_Name_Status); end; $$;


ALTER PROCEDURE public.status_insert(IN p_name_status character varying) OWNER TO postgres;

--
-- TOC entry 232 (class 1255 OID 24649)
-- Name: status_update(integer, character varying); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.status_update(IN p_id_status integer, IN p_name_status character varying)
    LANGUAGE plpgsql
    AS $$ begin update Status set Name_Status = p_Name_Status where ID_Status = p_ID_Status; end; $$;


ALTER PROCEDURE public.status_update(IN p_id_status integer, IN p_name_status character varying) OWNER TO postgres;

--
-- TOC entry 244 (class 1255 OID 24661)
-- Name: supplier_delete(integer); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.supplier_delete(IN p_id_supplier integer)
    LANGUAGE plpgsql
    AS $$ begin delete from Supplier where ID_Supplier = p_ID_Supplier; end; $$;


ALTER PROCEDURE public.supplier_delete(IN p_id_supplier integer) OWNER TO postgres;

--
-- TOC entry 242 (class 1255 OID 24659)
-- Name: supplier_insert(character varying, character varying, character varying, character varying, character varying, character varying); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.supplier_insert(IN p_full_name_supplier character varying, IN p_legal_address character varying, IN p_phone character varying, IN p_bik character varying, IN p_okpo character varying, IN p_responsible_login character varying)
    LANGUAGE plpgsql
    AS $$ begin insert into Supplier (Full_Name_Supplier, Legal_Address, Phone, BIK, OKPO, Responsible_Login) values (p_Full_Name_Supplier, p_Legal_Address, p_Phone, p_BIK, p_OKPO, p_Responsible_Login); end; $$;


ALTER PROCEDURE public.supplier_insert(IN p_full_name_supplier character varying, IN p_legal_address character varying, IN p_phone character varying, IN p_bik character varying, IN p_okpo character varying, IN p_responsible_login character varying) OWNER TO postgres;

--
-- TOC entry 243 (class 1255 OID 24660)
-- Name: supplier_update(integer, character varying, character varying, character varying, character varying, character varying, character varying); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.supplier_update(IN p_id_supplier integer, IN p_full_name_supplier character varying, IN p_legal_address character varying, IN p_phone character varying, IN p_bik character varying, IN p_okpo character varying, IN p_responsible_login character varying)
    LANGUAGE plpgsql
    AS $$ begin update Supplier set Full_Name_Supplier = p_Full_Name_Supplier, Legal_Address = p_Legal_Address, Phone = p_Phone, BIK = p_BIK, OKPO = p_OKPO, Responsible_Login = p_Responsible_Login where ID_Supplier = p_ID_Supplier; end; $$;


ALTER PROCEDURE public.supplier_update(IN p_id_supplier integer, IN p_full_name_supplier character varying, IN p_legal_address character varying, IN p_phone character varying, IN p_bik character varying, IN p_okpo character varying, IN p_responsible_login character varying) OWNER TO postgres;

--
-- TOC entry 250 (class 1255 OID 24667)
-- Name: supply_estimate_delete(integer); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.supply_estimate_delete(IN p_id_supply_estimate integer)
    LANGUAGE plpgsql
    AS $$ begin delete from Supply_Estimate where ID_Supply_Estimate = p_ID_Supply_Estimate; end; $$;


ALTER PROCEDURE public.supply_estimate_delete(IN p_id_supply_estimate integer) OWNER TO postgres;

--
-- TOC entry 248 (class 1255 OID 24665)
-- Name: supply_estimate_insert(character varying, integer, integer, numeric); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.supply_estimate_insert(IN p_estimate_number character varying, IN p_id_supplier integer, IN p_id_status integer, IN p_total_amount numeric)
    LANGUAGE plpgsql
    AS $$ begin insert into Supply_Estimate (Estimate_Number, ID_Supplier, ID_Status, Total_Amount) values (p_Estimate_Number, p_ID_Supplier, p_ID_Status, p_Total_Amount); end; $$;


ALTER PROCEDURE public.supply_estimate_insert(IN p_estimate_number character varying, IN p_id_supplier integer, IN p_id_status integer, IN p_total_amount numeric) OWNER TO postgres;

--
-- TOC entry 249 (class 1255 OID 24666)
-- Name: supply_estimate_update(integer, character varying, integer, integer, numeric); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.supply_estimate_update(IN p_id_supply_estimate integer, IN p_estimate_number character varying, IN p_id_supplier integer, IN p_id_status integer, IN p_total_amount numeric)
    LANGUAGE plpgsql
    AS $$ begin update Supply_Estimate set Estimate_Number = p_Estimate_Number, ID_Supplier = p_ID_Supplier, ID_Status = p_ID_Status, Total_Amount = p_Total_Amount where ID_Supply_Estimate = p_ID_Supply_Estimate; end; $$;


ALTER PROCEDURE public.supply_estimate_update(IN p_id_supply_estimate integer, IN p_estimate_number character varying, IN p_id_supplier integer, IN p_id_status integer, IN p_total_amount numeric) OWNER TO postgres;

--
-- TOC entry 265 (class 1255 OID 24672)
-- Name: supply_receipt_delete(integer); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.supply_receipt_delete(IN p_id_supply_receipt integer)
    LANGUAGE plpgsql
    AS $$ begin delete from Supply_Receipt where ID_Supply_Receipt = p_ID_Supply_Receipt; end; $$;


ALTER PROCEDURE public.supply_receipt_delete(IN p_id_supply_receipt integer) OWNER TO postgres;

--
-- TOC entry 257 (class 1255 OID 24670)
-- Name: supply_receipt_insert(character varying, integer, numeric, character varying); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.supply_receipt_insert(IN p_receipt_number character varying, IN p_id_supply_estimate integer, IN p_amount_paid numeric, IN p_employee_login character varying)
    LANGUAGE plpgsql
    AS $$ begin insert into Supply_Receipt (Receipt_Number, ID_Supply_Estimate, Amount_Paid, Employee_Login) values (p_Receipt_Number, p_ID_Supply_Estimate, p_Amount_Paid, p_Employee_Login); end; $$;


ALTER PROCEDURE public.supply_receipt_insert(IN p_receipt_number character varying, IN p_id_supply_estimate integer, IN p_amount_paid numeric, IN p_employee_login character varying) OWNER TO postgres;

--
-- TOC entry 258 (class 1255 OID 24671)
-- Name: supply_receipt_update(integer, character varying, integer, numeric, character varying); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.supply_receipt_update(IN p_id_supply_receipt integer, IN p_receipt_number character varying, IN p_id_supply_estimate integer, IN p_amount_paid numeric, IN p_employee_login character varying)
    LANGUAGE plpgsql
    AS $$ begin update Supply_Receipt set Receipt_Number = p_Receipt_Number, ID_Supply_Estimate = p_ID_Supply_Estimate, Amount_Paid = p_Amount_Paid, Employee_Login = p_Employee_Login where ID_Supply_Receipt = p_ID_Supply_Receipt; end; $$;


ALTER PROCEDURE public.supply_receipt_update(IN p_id_supply_receipt integer, IN p_receipt_number character varying, IN p_id_supply_estimate integer, IN p_amount_paid numeric, IN p_employee_login character varying) OWNER TO postgres;

--
-- TOC entry 236 (class 1255 OID 24653)
-- Name: user_profile_delete(character varying); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.user_profile_delete(IN p_up_login character varying)
    LANGUAGE plpgsql
    AS $$ begin delete from User_Profile where UP_Login = p_UP_Login; end; $$;


ALTER PROCEDURE public.user_profile_delete(IN p_up_login character varying) OWNER TO postgres;

--
-- TOC entry 234 (class 1255 OID 24651)
-- Name: user_profile_insert(character varying, character varying, character varying, character varying, character varying); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.user_profile_insert(IN p_up_login character varying, IN p_up_password character varying, IN p_u_surname character varying, IN p_u_name character varying, IN p_u_patronymic character varying)
    LANGUAGE plpgsql
    AS $$ begin insert into User_Profile (UP_Login, UP_Password, U_Surname, U_Name, U_Patronymic) values (p_UP_Login, p_UP_Password, p_U_Surname, p_U_Name, p_U_Patronymic); end; $$;


ALTER PROCEDURE public.user_profile_insert(IN p_up_login character varying, IN p_up_password character varying, IN p_u_surname character varying, IN p_u_name character varying, IN p_u_patronymic character varying) OWNER TO postgres;

--
-- TOC entry 235 (class 1255 OID 24652)
-- Name: user_profile_update(character varying, character varying, character varying, character varying, character varying, character varying); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.user_profile_update(IN p_up_login_old character varying, IN p_up_login_new character varying, IN p_up_password character varying, IN p_u_surname character varying, IN p_u_name character varying, IN p_u_patronymic character varying)
    LANGUAGE plpgsql
    AS $$ begin update User_Profile set UP_Login = p_UP_Login_New, UP_Password = p_UP_Password, U_Surname = p_U_Surname, U_Name = p_U_Name, U_Patronymic = p_U_Patronymic where UP_Login = p_UP_Login_Old; end; $$;


ALTER PROCEDURE public.user_profile_update(IN p_up_login_old character varying, IN p_up_login_new character varying, IN p_up_password character varying, IN p_u_surname character varying, IN p_u_name character varying, IN p_u_patronymic character varying) OWNER TO postgres;

--
-- TOC entry 5050 (class 0 OID 0)
-- Dependencies: 5049
-- Name: DATABASE "Music_Store_db"; Type: ACL; Schema: -; Owner: postgres
--

GRANT CONNECT ON DATABASE "Music_Store_db" TO rl_customer;
GRANT CONNECT ON DATABASE "Music_Store_db" TO rl_sales_manager;
GRANT CONNECT ON DATABASE "Music_Store_db" TO rl_supply_manager;
GRANT CONNECT ON DATABASE "Music_Store_db" TO rl_cashier;
GRANT CONNECT ON DATABASE "Music_Store_db" TO rl_administrator;
GRANT CONNECT ON DATABASE "Music_Store_db" TO rl_supplier;


-- Completed on 2026-04-08 23:09:31

--
-- PostgreSQL database dump complete
--

\unrestrict w62pZ6szbXQGTM6orDBqePJn0mk9mQ3WGV5cp6A2thgD9V0OmGGLxPEkOgHutsq

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

\restrict VhBuqyYvb7wKthInNMLP7UkRFwFk4eQVeqk86b3aBfGaw4beYPPSIbuxQHVR570

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.1

-- Started on 2026-04-08 23:09:31

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 234 (class 1255 OID 24577)
-- Name: structure_create(); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.structure_create()
    LANGUAGE plpgsql
    AS $$
begin
    -- pokupatelya
    create table if not exists pokupatelya (
        id_pokupatelya int not null constraint PK_pokupatelya primary key,
        login_pokupatelya varchar(50) not null,
        familiya_pokupatelya varchar(100) not null,
        imya_pokupatelya varchar(100) not null,
        otchestvo_pokupatelya varchar(100),
        seriya_pasporta varchar(4),
        nomer_pasporta varchar(6),
        gorod varchar(100),
        ulitsa varchar(200),
        telefon varchar(20),
        bankovskaya_karta varchar(19)
    );
    create index if not exists idx_pokupatelya_id on pokupatelya(id_pokupatelya);
    create index if not exists idx_pokupatelya_login on pokupatelya(login_pokupatelya);
    create index if not exists idx_pokupatelya_fio on pokupatelya(familiya_pokupatelya, imya_pokupatelya, otchestvo_pokupatelya);
    
    -- sotrudnika
    create table if not exists sotrudnika (
        id_sotrudnika int not null constraint PK_sotrudnika primary key,
        sotrudnika varchar(50) not null,
        familiya_sotrudnika varchar(100) not null,
        imya_sotrudnika varchar(100) not null,
        otchestvo_sotrudnika varchar(100),
        parol varchar(100) not null
    );
    create index if not exists idx_sotrudnika_id on sotrudnika(id_sotrudnika);
    create index if not exists idx_sotrudnika_fio on sotrudnika(familiya_sotrudnika, imya_sotrudnika, otchestvo_sotrudnika);
    
    -- postavshika
    create table if not exists postavshika (
        id_postavshika int not null constraint PK_postavshika primary key,
        nomer_smetry varchar(12) not null,
        data_vremya_sozdaniya timestamp not null,
        status varchar(50) not null
    );
    create index if not exists idx_postavshika_id on postavshika(id_postavshika);
    create index if not exists idx_postavshika_nomer on postavshika(nomer_smetry);
    
    -- zakaza
    create table if not exists zakaza (
        id_zakaza int not null constraint PK_zakaza primary key,
        zakaza varchar(20) not null,
        nomer_zakaza varchar(20) not null,
        nomer_cheka varchar(20),
        status varchar(50),
        id_pokupatelya int not null constraint FK_zakaza_pokupatelya references pokupatelya(id_pokupatelya),
        itogovaya_stoimost decimal(10,2)
    );
    create index if not exists idx_zakaza_id on zakaza(id_zakaza);
    create index if not exists idx_zakaza_nomer on zakaza(nomer_zakaza);
    
    -- smeta
    create table if not exists smeta (
        id_smeta int not null constraint PK_smeta primary key,
        smeta varchar(12) not null,
        nomer_smetry varchar(12) not null,
        data_vremya timestamp not null,
        status varchar(50) not null,
        id_postavshika int not null constraint FK_smeta_postavshika references postavshika(id_postavshika)
    );
    create index if not exists idx_smeta_id on smeta(id_smeta);
    create index if not exists idx_smeta_nomer on smeta(nomer_smetry);
    
    -- position_smeta
    create table if not exists position_smeta (
        id_position_smeta int not null constraint PK_position_smeta primary key,
        kolichestvo integer not null,
        stoimost_pozitsii decimal(10,2) not null,
        smeta varchar(12) not null,
        id_smeta int not null constraint FK_position_smeta_smeta references smeta(id_smeta),
        instrument varchar(12) not null
    );
    create index if not exists idx_position_smeta_id on position_smeta(id_position_smeta);
    
    -- chek_zakaza
    create table if not exists chek_zakaza (
        id_chek_zakaza int not null constraint PK_chek_zakaza primary key,
        nomer_cheka varchar(20) not null,
        data_vremya timestamp not null,
        summa decimal(10,2) not null,
        id_sotrudnika int not null constraint FK_chek_zakaza_sotrudnik references sotrudnika(id_sotrudnika),
        id_zakaza int not null constraint FK_chek_zakaza_zakaz references zakaza(id_zakaza)
    );
    create index if not exists idx_chek_zakaza_id on chek_zakaza(id_chek_zakaza);
    create index if not exists idx_chek_zakaza_nomer on chek_zakaza(nomer_cheka);
    
    -- cheka_smeta
    create table if not exists cheka_smeta (
        id_cheka_smeta int not null constraint PK_cheka_smeta primary key,
        nomer_cheka varchar(20) not null,
        data_vremya timestamp not null,
        summa decimal(10,2) not null,
        id_sotrudnika int not null constraint FK_cheka_smeta_sotrudnik references sotrudnika(id_sotrudnika),
        id_smeta int not null constraint FK_cheka_smeta_smeta references smeta(id_smeta)
    );
    create index if not exists idx_cheka_smeta_id on cheka_smeta(id_cheka_smeta);
    create index if not exists idx_cheka_smeta_nomer on cheka_smeta(nomer_cheka);
    
    -- postavka
    create table if not exists postavka (
        id_postavka int not null constraint PK_postavka primary key,
        postavka varchar(20) not null,
        nomer_cheka varchar(20) not null,
        itogo_summa decimal(10,2) not null,
        vnes_summa decimal(10,2) not null,
        data_vremya timestamp not null,
        id_sotrudnika int not null constraint FK_postavka_sotrudnik references sotrudnika(id_sotrudnika),
        id_smeta int not null constraint FK_postavka_smeta references smeta(id_smeta)
    );
    create index if not exists idx_postavka_id on postavka(id_postavka);
    create index if not exists idx_postavka_nomer_cheka on postavka(nomer_cheka);
    
    -- Instrument
    create table if not exists Instrument (
        id_instrument int not null constraint PK_instrument primary key,
        artikul varchar(12) not null,
        vid_instrumenta varchar(50) not null,
        strana_proizvoditel varchar(50),
        marka_model varchar(100),
        diapazon_chastot varchar(100),
        material text,
        kolichestvo integer not null,
        cena decimal(10,2) not null,
        id_position_smeta int constraint FK_instrument_position references position_smeta(id_position_smeta),
        id_zakaza int constraint FK_instrument_zakaz references zakaza(id_zakaza)
    );
    create index if not exists idx_instrument_id on Instrument(id_instrument);
    create index if not exists idx_instrument_artikul on Instrument(artikul);
    create index if not exists idx_instrument_vid on Instrument(vid_instrumenta);
    
    -- GRANTS для rl_manager_zakupok
    grant select, insert, update on pokupatelya to rl_manager_zakupok;
    grant select, insert, update on postavshika to rl_manager_zakupok;
    grant select, insert, update on zakaza to rl_manager_zakupok;
    grant select, insert, update on smeta to rl_manager_zakupok;
    grant select, insert, update on position_smeta to rl_manager_zakupok;
    grant select, insert on cheka_smeta to rl_manager_zakupok;
    grant select, insert, update on postavka to rl_manager_zakupok;
    grant select, insert, update on Instrument to rl_manager_zakupok;
    
    -- GRANTS для rl_kassir
    grant select on pokupatelya to rl_kassir;
    grant select, insert on zakaza to rl_kassir;
    grant select, insert on chek_zakaza to rl_kassir;
    
    -- GRANTS для rl_skladskoy
    grant select on zakaza to rl_skladskoy;
    grant select on position_smeta to rl_skladskoy;
    grant select, insert on postavka to rl_skladskoy;
    grant select, insert, update on Instrument to rl_skladskoy;
    
    -- GRANTS для rl_administrator
    grant all privileges on pokupatelya to rl_administrator;
    grant all privileges on sotrudnika to rl_administrator;
    grant all privileges on postavshika to rl_administrator;
    grant all privileges on zakaza to rl_administrator;
    grant all privileges on smeta to rl_administrator;
    grant all privileges on position_smeta to rl_administrator;
    grant all privileges on chek_zakaza to rl_administrator;
    grant all privileges on cheka_smeta to rl_administrator;
    grant all privileges on postavka to rl_administrator;
    grant all privileges on Instrument to rl_administrator;
    
end;
$$;


ALTER PROCEDURE public.structure_create() OWNER TO postgres;

--
-- TOC entry 233 (class 1255 OID 24578)
-- Name: structure_re_create(); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.structure_re_create()
    LANGUAGE plpgsql
    AS $$
begin
    revoke all privileges on pokupatelya from rl_manager_zakupok;
    revoke all privileges on postavshika from rl_manager_zakupok;
    revoke all privileges on zakaza from rl_manager_zakupok;
    revoke all privileges on smeta from rl_manager_zakupok;
    revoke all privileges on position_smeta from rl_manager_zakupok;
    revoke all privileges on cheka_smeta from rl_manager_zakupok;
    revoke all privileges on postavka from rl_manager_zakupok;
    revoke all privileges on Instrument from rl_manager_zakupok;
    
    revoke all privileges on pokupatelya from rl_kassir;
    revoke all privileges on zakaza from rl_kassir;
    revoke all privileges on chek_zakaza from rl_kassir;
    
    revoke all privileges on zakaza from rl_skladskoy;
    revoke all privileges on position_smeta from rl_skladskoy;
    revoke all privileges on postavka from rl_skladskoy;
    revoke all privileges on Instrument from rl_skladskoy;
    
    revoke all privileges on pokupatelya from rl_administrator;
    revoke all privileges on sotrudnika from rl_administrator;
    revoke all privileges on postavshika from rl_administrator;
    revoke all privileges on zakaza from rl_administrator;
    revoke all privileges on smeta from rl_administrator;
    revoke all privileges on position_smeta from rl_administrator;
    revoke all privileges on chek_zakaza from rl_administrator;
    revoke all privileges on cheka_smeta from rl_administrator;
    revoke all privileges on postavka from rl_administrator;
    revoke all privileges on Instrument from rl_administrator;

    drop index if exists idx_pokupatelya_id;
    drop index if exists idx_pokupatelya_login;
    drop index if exists idx_pokupatelya_fio;
    drop index if exists idx_sotrudnika_id;
    drop index if exists idx_sotrudnika_fio;
    drop index if exists idx_postavshika_id;
    drop index if exists idx_postavshika_nomer;
    drop index if exists idx_zakaza_id;
    drop index if exists idx_zakaza_nomer;
    drop index if exists idx_smeta_id;
    drop index if exists idx_smeta_nomer;
    drop index if exists idx_position_smeta_id;
    drop index if exists idx_chek_zakaza_id;
    drop index if exists idx_chek_zakaza_nomer;
    drop index if exists idx_cheka_smeta_id;
    drop index if exists idx_cheka_smeta_nomer;
    drop index if exists idx_postavka_id;
    drop index if exists idx_postavka_nomer_cheka;
    drop index if exists idx_instrument_id;
    drop index if exists idx_instrument_artikul;
    drop index if exists idx_instrument_vid;

    drop table if exists Instrument cascade;
    drop table if exists postavka cascade;
    drop table if exists cheka_smeta cascade;
    drop table if exists chek_zakaza cascade;
    drop table if exists position_smeta cascade;
    drop table if exists smeta cascade;
    drop table if exists zakaza cascade;
    drop table if exists postavshika cascade;
    drop table if exists sotrudnika cascade;
    drop table if exists pokupatelya cascade;

    call Structure_Create();
    
end;
$$;


ALTER PROCEDURE public.structure_re_create() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 219 (class 1259 OID 24591)
-- Name: pokupatelya; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pokupatelya (
    id_pokupatelya integer NOT NULL,
    login_pokupatelya character varying(50) NOT NULL,
    familiya_pokupatelya character varying(100) NOT NULL,
    imya_pokupatelya character varying(100) NOT NULL,
    otchestvo_pokupatelya character varying(100),
    seriya_pasporta character varying(4),
    nomer_pasporta character varying(6),
    gorod character varying(100),
    ulitsa character varying(200),
    telefon character varying(20),
    bankovskaya_karta character varying(19)
);


ALTER TABLE public.pokupatelya OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 24611)
-- Name: sotrudnika; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sotrudnika (
    id_sotrudnika integer NOT NULL,
    sotrudnika character varying(50) NOT NULL,
    familiya_sotrudnika character varying(100) NOT NULL,
    imya_sotrudnika character varying(100) NOT NULL,
    otchestvo_sotrudnika character varying(100),
    parol character varying(100) NOT NULL
);


ALTER TABLE public.sotrudnika OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 24621)
-- Name: zakaza; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.zakaza (
    id_zakaza integer NOT NULL,
    zakaza character varying(20) NOT NULL,
    nomer_zakaza character varying(20) NOT NULL,
    nomer_cheka character varying(20),
    status character varying(50),
    id_pokupatelya integer NOT NULL,
    itogovaya_stoimost numeric(10,2)
);


ALTER TABLE public.zakaza OWNER TO postgres;

--
-- TOC entry 5020 (class 0 OID 24591)
-- Dependencies: 219
-- Data for Name: pokupatelya; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pokupatelya (id_pokupatelya, login_pokupatelya, familiya_pokupatelya, imya_pokupatelya, otchestvo_pokupatelya, seriya_pasporta, nomer_pasporta, gorod, ulitsa, telefon, bankovskaya_karta) FROM stdin;
\.


--
-- TOC entry 5021 (class 0 OID 24611)
-- Dependencies: 220
-- Data for Name: sotrudnika; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sotrudnika (id_sotrudnika, sotrudnika, familiya_sotrudnika, imya_sotrudnika, otchestvo_sotrudnika, parol) FROM stdin;
\.


--
-- TOC entry 5022 (class 0 OID 24621)
-- Dependencies: 221
-- Data for Name: zakaza; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.zakaza (id_zakaza, zakaza, nomer_zakaza, nomer_cheka, status, id_pokupatelya, itogovaya_stoimost) FROM stdin;
\.


--
-- TOC entry 4867 (class 2606 OID 24601)
-- Name: pokupatelya pk_pokupatelya; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pokupatelya
    ADD CONSTRAINT pk_pokupatelya PRIMARY KEY (id_pokupatelya);


--
-- TOC entry 4869 (class 2606 OID 24620)
-- Name: sotrudnika pk_sotrudnika; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sotrudnika
    ADD CONSTRAINT pk_sotrudnika PRIMARY KEY (id_sotrudnika);


--
-- TOC entry 4871 (class 2606 OID 24629)
-- Name: zakaza pk_zakaza; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.zakaza
    ADD CONSTRAINT pk_zakaza PRIMARY KEY (id_zakaza);


--
-- TOC entry 4865 (class 1259 OID 24635)
-- Name: idx_pokupatelya_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_pokupatelya_id ON public.pokupatelya USING btree (id_pokupatelya);


--
-- TOC entry 4872 (class 2606 OID 24630)
-- Name: zakaza fk_zakaza_pokupatelya; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.zakaza
    ADD CONSTRAINT fk_zakaza_pokupatelya FOREIGN KEY (id_pokupatelya) REFERENCES public.pokupatelya(id_pokupatelya);


-- Completed on 2026-04-08 23:09:32

--
-- PostgreSQL database dump complete
--

\unrestrict VhBuqyYvb7wKthInNMLP7UkRFwFk4eQVeqk86b3aBfGaw4beYPPSIbuxQHVR570

-- Completed on 2026-04-08 23:09:32

--
-- PostgreSQL database cluster dump complete
--

