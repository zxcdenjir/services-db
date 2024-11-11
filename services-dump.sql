--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4
-- Dumped by pg_dump version 16.4

-- Started on 2024-11-11 10:10:18

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

--
-- TOC entry 5153 (class 1262 OID 5)
-- Name: postgres; Type: DATABASE; Schema: -; Owner: -
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';


\connect postgres

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

--
-- TOC entry 5154 (class 0 OID 0)
-- Dependencies: 5153
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- TOC entry 8 (class 2615 OID 33821)
-- Name: services; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA services;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 249 (class 1259 OID 33823)
-- Name: Accountant; Type: TABLE; Schema: services; Owner: -
--

CREATE TABLE services."Accountant" (
    "AccountantId" integer NOT NULL,
    "UserId" integer NOT NULL
);


--
-- TOC entry 248 (class 1259 OID 33822)
-- Name: Accountant_AccountantId_seq; Type: SEQUENCE; Schema: services; Owner: -
--

CREATE SEQUENCE services."Accountant_AccountantId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5155 (class 0 OID 0)
-- Dependencies: 248
-- Name: Accountant_AccountantId_seq; Type: SEQUENCE OWNED BY; Schema: services; Owner: -
--

ALTER SEQUENCE services."Accountant_AccountantId_seq" OWNED BY services."Accountant"."AccountantId";


--
-- TOC entry 250 (class 1259 OID 33832)
-- Name: Accountant_UserId_seq; Type: SEQUENCE; Schema: services; Owner: -
--

CREATE SEQUENCE services."Accountant_UserId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5156 (class 0 OID 0)
-- Dependencies: 250
-- Name: Accountant_UserId_seq; Type: SEQUENCE OWNED BY; Schema: services; Owner: -
--

ALTER SEQUENCE services."Accountant_UserId_seq" OWNED BY services."Accountant"."UserId";


--
-- TOC entry 252 (class 1259 OID 33842)
-- Name: Analisator; Type: TABLE; Schema: services; Owner: -
--

CREATE TABLE services."Analisator" (
    "AnalisatorId" integer NOT NULL,
    "OrderTimeStart" timestamp without time zone,
    "OrderTimeFinish" timestamp without time zone
);


--
-- TOC entry 251 (class 1259 OID 33841)
-- Name: Analisator_AnalisatorId_seq; Type: SEQUENCE; Schema: services; Owner: -
--

CREATE SEQUENCE services."Analisator_AnalisatorId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5157 (class 0 OID 0)
-- Dependencies: 251
-- Name: Analisator_AnalisatorId_seq; Type: SEQUENCE OWNED BY; Schema: services; Owner: -
--

ALTER SEQUENCE services."Analisator_AnalisatorId_seq" OWNED BY services."Analisator"."AnalisatorId";


--
-- TOC entry 254 (class 1259 OID 33850)
-- Name: Company; Type: TABLE; Schema: services; Owner: -
--

CREATE TABLE services."Company" (
    "CompanyId" integer NOT NULL,
    "Name" text,
    "Adress" text,
    "ITN" integer,
    "PaymentAccount" bigint,
    "BIC" integer
);


--
-- TOC entry 253 (class 1259 OID 33849)
-- Name: Company_CompanyId_seq; Type: SEQUENCE; Schema: services; Owner: -
--

CREATE SEQUENCE services."Company_CompanyId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5158 (class 0 OID 0)
-- Dependencies: 253
-- Name: Company_CompanyId_seq; Type: SEQUENCE OWNED BY; Schema: services; Owner: -
--

ALTER SEQUENCE services."Company_CompanyId_seq" OWNED BY services."Company"."CompanyId";


--
-- TOC entry 256 (class 1259 OID 33859)
-- Name: Insurance; Type: TABLE; Schema: services; Owner: -
--

CREATE TABLE services."Insurance" (
    "InsuranceId" integer NOT NULL,
    "InsuranceNumber" text,
    "InsuranceType" text,
    "CompanyId" integer NOT NULL
);


--
-- TOC entry 257 (class 1259 OID 33867)
-- Name: Insurance_CompanyId_seq; Type: SEQUENCE; Schema: services; Owner: -
--

CREATE SEQUENCE services."Insurance_CompanyId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5159 (class 0 OID 0)
-- Dependencies: 257
-- Name: Insurance_CompanyId_seq; Type: SEQUENCE OWNED BY; Schema: services; Owner: -
--

ALTER SEQUENCE services."Insurance_CompanyId_seq" OWNED BY services."Insurance"."CompanyId";


--
-- TOC entry 255 (class 1259 OID 33858)
-- Name: Insurance_InsuranceId_seq; Type: SEQUENCE; Schema: services; Owner: -
--

CREATE SEQUENCE services."Insurance_InsuranceId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5160 (class 0 OID 0)
-- Dependencies: 255
-- Name: Insurance_InsuranceId_seq; Type: SEQUENCE OWNED BY; Schema: services; Owner: -
--

ALTER SEQUENCE services."Insurance_InsuranceId_seq" OWNED BY services."Insurance"."InsuranceId";


--
-- TOC entry 284 (class 1259 OID 34069)
-- Name: Invoice; Type: TABLE; Schema: services; Owner: -
--

CREATE TABLE services."Invoice" (
    "InvoiceId" integer NOT NULL,
    "AccountantId" integer,
    "InsuranceId" integer
);


--
-- TOC entry 283 (class 1259 OID 34068)
-- Name: Invoice_InvoiceId_seq; Type: SEQUENCE; Schema: services; Owner: -
--

CREATE SEQUENCE services."Invoice_InvoiceId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5161 (class 0 OID 0)
-- Dependencies: 283
-- Name: Invoice_InvoiceId_seq; Type: SEQUENCE OWNED BY; Schema: services; Owner: -
--

ALTER SEQUENCE services."Invoice_InvoiceId_seq" OWNED BY services."Invoice"."InvoiceId";


--
-- TOC entry 259 (class 1259 OID 33869)
-- Name: LaboratoryAssistant; Type: TABLE; Schema: services; Owner: -
--

CREATE TABLE services."LaboratoryAssistant" (
    "AssistantId" integer NOT NULL,
    "UserId" integer NOT NULL,
    "ServiceId" integer NOT NULL
);


--
-- TOC entry 258 (class 1259 OID 33868)
-- Name: LaboratoryAssistant_AssistantId_seq; Type: SEQUENCE; Schema: services; Owner: -
--

CREATE SEQUENCE services."LaboratoryAssistant_AssistantId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5162 (class 0 OID 0)
-- Dependencies: 258
-- Name: LaboratoryAssistant_AssistantId_seq; Type: SEQUENCE OWNED BY; Schema: services; Owner: -
--

ALTER SEQUENCE services."LaboratoryAssistant_AssistantId_seq" OWNED BY services."LaboratoryAssistant"."AssistantId";


--
-- TOC entry 260 (class 1259 OID 33875)
-- Name: LaboratoryAssistant_ServiceId_seq; Type: SEQUENCE; Schema: services; Owner: -
--

CREATE SEQUENCE services."LaboratoryAssistant_ServiceId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5163 (class 0 OID 0)
-- Dependencies: 260
-- Name: LaboratoryAssistant_ServiceId_seq; Type: SEQUENCE OWNED BY; Schema: services; Owner: -
--

ALTER SEQUENCE services."LaboratoryAssistant_ServiceId_seq" OWNED BY services."LaboratoryAssistant"."ServiceId";


--
-- TOC entry 261 (class 1259 OID 33876)
-- Name: LaboratoryAssistant_UserId_seq; Type: SEQUENCE; Schema: services; Owner: -
--

CREATE SEQUENCE services."LaboratoryAssistant_UserId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5164 (class 0 OID 0)
-- Dependencies: 261
-- Name: LaboratoryAssistant_UserId_seq; Type: SEQUENCE OWNED BY; Schema: services; Owner: -
--

ALTER SEQUENCE services."LaboratoryAssistant_UserId_seq" OWNED BY services."LaboratoryAssistant"."UserId";


--
-- TOC entry 263 (class 1259 OID 33878)
-- Name: Order; Type: TABLE; Schema: services; Owner: -
--

CREATE TABLE services."Order" (
    "OrderId" integer NOT NULL,
    "OrderDate" date,
    "OrderStatus" text,
    "ServiceStatus" text,
    "CompletionTime" timestamp without time zone
);


--
-- TOC entry 286 (class 1259 OID 34233)
-- Name: OrderTransaction; Type: TABLE; Schema: services; Owner: -
--

CREATE TABLE services."OrderTransaction" (
    "OrderTransactionId" integer NOT NULL,
    "ServiceId" integer,
    "OrderId" integer
);


--
-- TOC entry 285 (class 1259 OID 34232)
-- Name: OrderTransaction_OrderTransactionId_seq; Type: SEQUENCE; Schema: services; Owner: -
--

CREATE SEQUENCE services."OrderTransaction_OrderTransactionId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5165 (class 0 OID 0)
-- Dependencies: 285
-- Name: OrderTransaction_OrderTransactionId_seq; Type: SEQUENCE OWNED BY; Schema: services; Owner: -
--

ALTER SEQUENCE services."OrderTransaction_OrderTransactionId_seq" OWNED BY services."OrderTransaction"."OrderTransactionId";


--
-- TOC entry 262 (class 1259 OID 33877)
-- Name: Order_OrderId_seq; Type: SEQUENCE; Schema: services; Owner: -
--

CREATE SEQUENCE services."Order_OrderId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5166 (class 0 OID 0)
-- Dependencies: 262
-- Name: Order_OrderId_seq; Type: SEQUENCE OWNED BY; Schema: services; Owner: -
--

ALTER SEQUENCE services."Order_OrderId_seq" OWNED BY services."Order"."OrderId";


--
-- TOC entry 265 (class 1259 OID 33888)
-- Name: Pasport; Type: TABLE; Schema: services; Owner: -
--

CREATE TABLE services."Pasport" (
    "PasportId" integer NOT NULL,
    "PasportSeries" text,
    "PasportNumber" integer,
    "PasportType" integer
);


--
-- TOC entry 314 (class 1259 OID 34629)
-- Name: PasportTypes; Type: TABLE; Schema: services; Owner: -
--

CREATE TABLE services."PasportTypes" (
    "PasportTypeId" integer NOT NULL,
    "PasportTypeName" text
);


--
-- TOC entry 313 (class 1259 OID 34628)
-- Name: PasportTypes_PasportTypeId_seq; Type: SEQUENCE; Schema: services; Owner: -
--

CREATE SEQUENCE services."PasportTypes_PasportTypeId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5167 (class 0 OID 0)
-- Dependencies: 313
-- Name: PasportTypes_PasportTypeId_seq; Type: SEQUENCE OWNED BY; Schema: services; Owner: -
--

ALTER SEQUENCE services."PasportTypes_PasportTypeId_seq" OWNED BY services."PasportTypes"."PasportTypeId";


--
-- TOC entry 264 (class 1259 OID 33887)
-- Name: Pasport_PasportId_seq; Type: SEQUENCE; Schema: services; Owner: -
--

CREATE SEQUENCE services."Pasport_PasportId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5168 (class 0 OID 0)
-- Dependencies: 264
-- Name: Pasport_PasportId_seq; Type: SEQUENCE OWNED BY; Schema: services; Owner: -
--

ALTER SEQUENCE services."Pasport_PasportId_seq" OWNED BY services."Pasport"."PasportId";


--
-- TOC entry 267 (class 1259 OID 33897)
-- Name: Patient; Type: TABLE; Schema: services; Owner: -
--

CREATE TABLE services."Patient" (
    "PatientId" integer NOT NULL,
    "UserId" integer NOT NULL,
    "Email" text,
    "PasportId" integer NOT NULL,
    "PhoneNumber" text,
    "InsuranceId" integer NOT NULL,
    "DateOfBirth" date
);


--
-- TOC entry 288 (class 1259 OID 34255)
-- Name: PatientTransaction; Type: TABLE; Schema: services; Owner: -
--

CREATE TABLE services."PatientTransaction" (
    "PatientTransactionId" integer NOT NULL,
    "PatientId" integer,
    "OrderId" integer
);


--
-- TOC entry 287 (class 1259 OID 34254)
-- Name: PatientTransaction_PatientTransactionId_seq; Type: SEQUENCE; Schema: services; Owner: -
--

CREATE SEQUENCE services."PatientTransaction_PatientTransactionId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5169 (class 0 OID 0)
-- Dependencies: 287
-- Name: PatientTransaction_PatientTransactionId_seq; Type: SEQUENCE OWNED BY; Schema: services; Owner: -
--

ALTER SEQUENCE services."PatientTransaction_PatientTransactionId_seq" OWNED BY services."PatientTransaction"."PatientTransactionId";


--
-- TOC entry 268 (class 1259 OID 33905)
-- Name: Patient_InsuranceId_seq; Type: SEQUENCE; Schema: services; Owner: -
--

CREATE SEQUENCE services."Patient_InsuranceId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5170 (class 0 OID 0)
-- Dependencies: 268
-- Name: Patient_InsuranceId_seq; Type: SEQUENCE OWNED BY; Schema: services; Owner: -
--

ALTER SEQUENCE services."Patient_InsuranceId_seq" OWNED BY services."Patient"."InsuranceId";


--
-- TOC entry 269 (class 1259 OID 33906)
-- Name: Patient_PasportId_seq; Type: SEQUENCE; Schema: services; Owner: -
--

CREATE SEQUENCE services."Patient_PasportId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5171 (class 0 OID 0)
-- Dependencies: 269
-- Name: Patient_PasportId_seq; Type: SEQUENCE OWNED BY; Schema: services; Owner: -
--

ALTER SEQUENCE services."Patient_PasportId_seq" OWNED BY services."Patient"."PasportId";


--
-- TOC entry 266 (class 1259 OID 33896)
-- Name: Patient_PatientId_seq; Type: SEQUENCE; Schema: services; Owner: -
--

CREATE SEQUENCE services."Patient_PatientId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5172 (class 0 OID 0)
-- Dependencies: 266
-- Name: Patient_PatientId_seq; Type: SEQUENCE OWNED BY; Schema: services; Owner: -
--

ALTER SEQUENCE services."Patient_PatientId_seq" OWNED BY services."Patient"."PatientId";


--
-- TOC entry 270 (class 1259 OID 33907)
-- Name: Patient_UserId_seq; Type: SEQUENCE; Schema: services; Owner: -
--

CREATE SEQUENCE services."Patient_UserId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5173 (class 0 OID 0)
-- Dependencies: 270
-- Name: Patient_UserId_seq; Type: SEQUENCE OWNED BY; Schema: services; Owner: -
--

ALTER SEQUENCE services."Patient_UserId_seq" OWNED BY services."Patient"."UserId";


--
-- TOC entry 272 (class 1259 OID 33909)
-- Name: ProvidedService; Type: TABLE; Schema: services; Owner: -
--

CREATE TABLE services."ProvidedService" (
    "ProvidedServiceId" integer NOT NULL,
    "ServiceId" integer NOT NULL,
    "AssistantId" integer NOT NULL,
    "CompletionTime" timestamp without time zone,
    "AnalisatorId" integer NOT NULL,
    "OrderId" integer
);


--
-- TOC entry 273 (class 1259 OID 33915)
-- Name: ProvidedService_AnalisatorId_seq; Type: SEQUENCE; Schema: services; Owner: -
--

CREATE SEQUENCE services."ProvidedService_AnalisatorId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5174 (class 0 OID 0)
-- Dependencies: 273
-- Name: ProvidedService_AnalisatorId_seq; Type: SEQUENCE OWNED BY; Schema: services; Owner: -
--

ALTER SEQUENCE services."ProvidedService_AnalisatorId_seq" OWNED BY services."ProvidedService"."AnalisatorId";


--
-- TOC entry 274 (class 1259 OID 33916)
-- Name: ProvidedService_AssistantId_seq; Type: SEQUENCE; Schema: services; Owner: -
--

CREATE SEQUENCE services."ProvidedService_AssistantId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5175 (class 0 OID 0)
-- Dependencies: 274
-- Name: ProvidedService_AssistantId_seq; Type: SEQUENCE OWNED BY; Schema: services; Owner: -
--

ALTER SEQUENCE services."ProvidedService_AssistantId_seq" OWNED BY services."ProvidedService"."AssistantId";


--
-- TOC entry 271 (class 1259 OID 33908)
-- Name: ProvidedService_ProvidedServiceId_seq; Type: SEQUENCE; Schema: services; Owner: -
--

CREATE SEQUENCE services."ProvidedService_ProvidedServiceId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5176 (class 0 OID 0)
-- Dependencies: 271
-- Name: ProvidedService_ProvidedServiceId_seq; Type: SEQUENCE OWNED BY; Schema: services; Owner: -
--

ALTER SEQUENCE services."ProvidedService_ProvidedServiceId_seq" OWNED BY services."ProvidedService"."ProvidedServiceId";


--
-- TOC entry 275 (class 1259 OID 33917)
-- Name: ProvidedService_ServiceId_seq; Type: SEQUENCE; Schema: services; Owner: -
--

CREATE SEQUENCE services."ProvidedService_ServiceId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5177 (class 0 OID 0)
-- Dependencies: 275
-- Name: ProvidedService_ServiceId_seq; Type: SEQUENCE OWNED BY; Schema: services; Owner: -
--

ALTER SEQUENCE services."ProvidedService_ServiceId_seq" OWNED BY services."ProvidedService"."ServiceId";


--
-- TOC entry 282 (class 1259 OID 34028)
-- Name: Services; Type: TABLE; Schema: services; Owner: -
--

CREATE TABLE services."Services" (
    "ServiceId" integer NOT NULL,
    "ServiceName" text,
    "ServiceCost" numeric,
    "DateClose" date,
    "avgDeviation" numeric
);


--
-- TOC entry 281 (class 1259 OID 34027)
-- Name: Services_ServiceId_seq; Type: SEQUENCE; Schema: services; Owner: -
--

CREATE SEQUENCE services."Services_ServiceId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5178 (class 0 OID 0)
-- Dependencies: 281
-- Name: Services_ServiceId_seq; Type: SEQUENCE OWNED BY; Schema: services; Owner: -
--

ALTER SEQUENCE services."Services_ServiceId_seq" OWNED BY services."Services"."ServiceId";


--
-- TOC entry 277 (class 1259 OID 33928)
-- Name: User; Type: TABLE; Schema: services; Owner: -
--

CREATE TABLE services."User" (
    "UserId" integer NOT NULL,
    "Login" text,
    "Password" text,
    "FullName" text,
    "UserType" integer NOT NULL
);


--
-- TOC entry 290 (class 1259 OID 34273)
-- Name: UserLoginHistory; Type: TABLE; Schema: services; Owner: -
--

CREATE TABLE services."UserLoginHistory" (
    "LoginHistoryId" integer NOT NULL,
    "UserId" integer,
    "LoginTime" timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    "LogoutTime" timestamp without time zone,
    "IPAddress" inet,
    "DeviceInfo" text
);


--
-- TOC entry 289 (class 1259 OID 34272)
-- Name: UserLoginHistory_LoginHistoryId_seq; Type: SEQUENCE; Schema: services; Owner: -
--

CREATE SEQUENCE services."UserLoginHistory_LoginHistoryId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5179 (class 0 OID 0)
-- Dependencies: 289
-- Name: UserLoginHistory_LoginHistoryId_seq; Type: SEQUENCE OWNED BY; Schema: services; Owner: -
--

ALTER SEQUENCE services."UserLoginHistory_LoginHistoryId_seq" OWNED BY services."UserLoginHistory"."LoginHistoryId";


--
-- TOC entry 279 (class 1259 OID 33937)
-- Name: UserTypes; Type: TABLE; Schema: services; Owner: -
--

CREATE TABLE services."UserTypes" (
    "TypeId" integer NOT NULL,
    "TypeName" text
);


--
-- TOC entry 278 (class 1259 OID 33936)
-- Name: UserTypes_TypeId_seq; Type: SEQUENCE; Schema: services; Owner: -
--

CREATE SEQUENCE services."UserTypes_TypeId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5180 (class 0 OID 0)
-- Dependencies: 278
-- Name: UserTypes_TypeId_seq; Type: SEQUENCE OWNED BY; Schema: services; Owner: -
--

ALTER SEQUENCE services."UserTypes_TypeId_seq" OWNED BY services."UserTypes"."TypeId";


--
-- TOC entry 276 (class 1259 OID 33927)
-- Name: User_UserId_seq; Type: SEQUENCE; Schema: services; Owner: -
--

CREATE SEQUENCE services."User_UserId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5181 (class 0 OID 0)
-- Dependencies: 276
-- Name: User_UserId_seq; Type: SEQUENCE OWNED BY; Schema: services; Owner: -
--

ALTER SEQUENCE services."User_UserId_seq" OWNED BY services."User"."UserId";


--
-- TOC entry 280 (class 1259 OID 33945)
-- Name: User_UserType_seq; Type: SEQUENCE; Schema: services; Owner: -
--

CREATE SEQUENCE services."User_UserType_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5182 (class 0 OID 0)
-- Dependencies: 280
-- Name: User_UserType_seq; Type: SEQUENCE OWNED BY; Schema: services; Owner: -
--

ALTER SEQUENCE services."User_UserType_seq" OWNED BY services."User"."UserType";


--
-- TOC entry 4888 (class 2604 OID 33826)
-- Name: Accountant AccountantId; Type: DEFAULT; Schema: services; Owner: -
--

ALTER TABLE ONLY services."Accountant" ALTER COLUMN "AccountantId" SET DEFAULT nextval('services."Accountant_AccountantId_seq"'::regclass);


--
-- TOC entry 4889 (class 2604 OID 33845)
-- Name: Analisator AnalisatorId; Type: DEFAULT; Schema: services; Owner: -
--

ALTER TABLE ONLY services."Analisator" ALTER COLUMN "AnalisatorId" SET DEFAULT nextval('services."Analisator_AnalisatorId_seq"'::regclass);


--
-- TOC entry 4890 (class 2604 OID 33853)
-- Name: Company CompanyId; Type: DEFAULT; Schema: services; Owner: -
--

ALTER TABLE ONLY services."Company" ALTER COLUMN "CompanyId" SET DEFAULT nextval('services."Company_CompanyId_seq"'::regclass);


--
-- TOC entry 4891 (class 2604 OID 33862)
-- Name: Insurance InsuranceId; Type: DEFAULT; Schema: services; Owner: -
--

ALTER TABLE ONLY services."Insurance" ALTER COLUMN "InsuranceId" SET DEFAULT nextval('services."Insurance_InsuranceId_seq"'::regclass);


--
-- TOC entry 4900 (class 2604 OID 34072)
-- Name: Invoice InvoiceId; Type: DEFAULT; Schema: services; Owner: -
--

ALTER TABLE ONLY services."Invoice" ALTER COLUMN "InvoiceId" SET DEFAULT nextval('services."Invoice_InvoiceId_seq"'::regclass);


--
-- TOC entry 4892 (class 2604 OID 33872)
-- Name: LaboratoryAssistant AssistantId; Type: DEFAULT; Schema: services; Owner: -
--

ALTER TABLE ONLY services."LaboratoryAssistant" ALTER COLUMN "AssistantId" SET DEFAULT nextval('services."LaboratoryAssistant_AssistantId_seq"'::regclass);


--
-- TOC entry 4893 (class 2604 OID 33881)
-- Name: Order OrderId; Type: DEFAULT; Schema: services; Owner: -
--

ALTER TABLE ONLY services."Order" ALTER COLUMN "OrderId" SET DEFAULT nextval('services."Order_OrderId_seq"'::regclass);


--
-- TOC entry 4901 (class 2604 OID 34236)
-- Name: OrderTransaction OrderTransactionId; Type: DEFAULT; Schema: services; Owner: -
--

ALTER TABLE ONLY services."OrderTransaction" ALTER COLUMN "OrderTransactionId" SET DEFAULT nextval('services."OrderTransaction_OrderTransactionId_seq"'::regclass);


--
-- TOC entry 4894 (class 2604 OID 33891)
-- Name: Pasport PasportId; Type: DEFAULT; Schema: services; Owner: -
--

ALTER TABLE ONLY services."Pasport" ALTER COLUMN "PasportId" SET DEFAULT nextval('services."Pasport_PasportId_seq"'::regclass);


--
-- TOC entry 4905 (class 2604 OID 34632)
-- Name: PasportTypes PasportTypeId; Type: DEFAULT; Schema: services; Owner: -
--

ALTER TABLE ONLY services."PasportTypes" ALTER COLUMN "PasportTypeId" SET DEFAULT nextval('services."PasportTypes_PasportTypeId_seq"'::regclass);


--
-- TOC entry 4895 (class 2604 OID 33900)
-- Name: Patient PatientId; Type: DEFAULT; Schema: services; Owner: -
--

ALTER TABLE ONLY services."Patient" ALTER COLUMN "PatientId" SET DEFAULT nextval('services."Patient_PatientId_seq"'::regclass);


--
-- TOC entry 4902 (class 2604 OID 34258)
-- Name: PatientTransaction PatientTransactionId; Type: DEFAULT; Schema: services; Owner: -
--

ALTER TABLE ONLY services."PatientTransaction" ALTER COLUMN "PatientTransactionId" SET DEFAULT nextval('services."PatientTransaction_PatientTransactionId_seq"'::regclass);


--
-- TOC entry 4896 (class 2604 OID 33912)
-- Name: ProvidedService ProvidedServiceId; Type: DEFAULT; Schema: services; Owner: -
--

ALTER TABLE ONLY services."ProvidedService" ALTER COLUMN "ProvidedServiceId" SET DEFAULT nextval('services."ProvidedService_ProvidedServiceId_seq"'::regclass);


--
-- TOC entry 4899 (class 2604 OID 34031)
-- Name: Services ServiceId; Type: DEFAULT; Schema: services; Owner: -
--

ALTER TABLE ONLY services."Services" ALTER COLUMN "ServiceId" SET DEFAULT nextval('services."Services_ServiceId_seq"'::regclass);


--
-- TOC entry 4897 (class 2604 OID 33931)
-- Name: User UserId; Type: DEFAULT; Schema: services; Owner: -
--

ALTER TABLE ONLY services."User" ALTER COLUMN "UserId" SET DEFAULT nextval('services."User_UserId_seq"'::regclass);


--
-- TOC entry 4903 (class 2604 OID 34276)
-- Name: UserLoginHistory LoginHistoryId; Type: DEFAULT; Schema: services; Owner: -
--

ALTER TABLE ONLY services."UserLoginHistory" ALTER COLUMN "LoginHistoryId" SET DEFAULT nextval('services."UserLoginHistory_LoginHistoryId_seq"'::regclass);


--
-- TOC entry 4898 (class 2604 OID 33940)
-- Name: UserTypes TypeId; Type: DEFAULT; Schema: services; Owner: -
--

ALTER TABLE ONLY services."UserTypes" ALTER COLUMN "TypeId" SET DEFAULT nextval('services."UserTypes_TypeId_seq"'::regclass);


--
-- TOC entry 5104 (class 0 OID 33823)
-- Dependencies: 249
-- Data for Name: Accountant; Type: TABLE DATA; Schema: services; Owner: -
--

INSERT INTO services."Accountant" VALUES (5, 5);
INSERT INTO services."Accountant" VALUES (6, 6);
INSERT INTO services."Accountant" VALUES (7, 7);
INSERT INTO services."Accountant" VALUES (8, 8);


--
-- TOC entry 5107 (class 0 OID 33842)
-- Dependencies: 252
-- Data for Name: Analisator; Type: TABLE DATA; Schema: services; Owner: -
--

INSERT INTO services."Analisator" VALUES (1, '2024-10-31 14:07:56.535754', '2024-10-31 15:07:56.535754');
INSERT INTO services."Analisator" VALUES (2, '2024-10-31 13:07:56.535754', '2024-10-31 14:07:56.535754');
INSERT INTO services."Analisator" VALUES (3, '2024-10-31 12:07:56.535754', '2024-10-31 13:07:56.535754');
INSERT INTO services."Analisator" VALUES (4, '2024-10-31 11:07:56.535754', '2024-10-31 12:07:56.535754');


--
-- TOC entry 5109 (class 0 OID 33850)
-- Dependencies: 254
-- Data for Name: Company; Type: TABLE DATA; Schema: services; Owner: -
--

INSERT INTO services."Company" VALUES (1, 'Company A', '123 Street, City', 1234567890, 1234567890123456, 123456);
INSERT INTO services."Company" VALUES (2, 'Company B', '456 Avenue, City', 987654321, 6543210987654321, 654321);


--
-- TOC entry 5111 (class 0 OID 33859)
-- Dependencies: 256
-- Data for Name: Insurance; Type: TABLE DATA; Schema: services; Owner: -
--

INSERT INTO services."Insurance" VALUES (1, 'INS-A-123', 'Health', 1);
INSERT INTO services."Insurance" VALUES (2, 'INS-B-456', 'Dental', 1);
INSERT INTO services."Insurance" VALUES (3, 'INS-C-789', 'Health', 2);
INSERT INTO services."Insurance" VALUES (4, 'INS-D-012', 'Dental', 2);


--
-- TOC entry 5139 (class 0 OID 34069)
-- Dependencies: 284
-- Data for Name: Invoice; Type: TABLE DATA; Schema: services; Owner: -
--

INSERT INTO services."Invoice" VALUES (5, 5, 1);
INSERT INTO services."Invoice" VALUES (6, 6, 2);
INSERT INTO services."Invoice" VALUES (7, 7, 3);
INSERT INTO services."Invoice" VALUES (8, 8, 4);


--
-- TOC entry 5114 (class 0 OID 33869)
-- Dependencies: 259
-- Data for Name: LaboratoryAssistant; Type: TABLE DATA; Schema: services; Owner: -
--

INSERT INTO services."LaboratoryAssistant" VALUES (1, 1, 1);
INSERT INTO services."LaboratoryAssistant" VALUES (2, 2, 2);
INSERT INTO services."LaboratoryAssistant" VALUES (3, 3, 3);
INSERT INTO services."LaboratoryAssistant" VALUES (4, 4, 4);


--
-- TOC entry 5118 (class 0 OID 33878)
-- Dependencies: 263
-- Data for Name: Order; Type: TABLE DATA; Schema: services; Owner: -
--

INSERT INTO services."Order" VALUES (1, '2024-08-31', 'Completed', 'Approved', '2024-09-30 16:00:58.13069');
INSERT INTO services."Order" VALUES (2, '2024-07-31', 'Completed', 'Approved', '2024-08-31 16:00:58.13069');
INSERT INTO services."Order" VALUES (3, '2024-06-30', 'Pending', 'Waiting', NULL);
INSERT INTO services."Order" VALUES (4, '2024-05-31', 'In Progress', 'In Progress', NULL);


--
-- TOC entry 5141 (class 0 OID 34233)
-- Dependencies: 286
-- Data for Name: OrderTransaction; Type: TABLE DATA; Schema: services; Owner: -
--

INSERT INTO services."OrderTransaction" VALUES (1, 1, 1);
INSERT INTO services."OrderTransaction" VALUES (2, 2, 2);
INSERT INTO services."OrderTransaction" VALUES (3, 3, 3);
INSERT INTO services."OrderTransaction" VALUES (4, 4, 4);


--
-- TOC entry 5120 (class 0 OID 33888)
-- Dependencies: 265
-- Data for Name: Pasport; Type: TABLE DATA; Schema: services; Owner: -
--

INSERT INTO services."Pasport" VALUES (1, 'AA', 123456, 2);
INSERT INTO services."Pasport" VALUES (2, 'BB', 654321, 1);
INSERT INTO services."Pasport" VALUES (3, 'CC', 112233, 2);
INSERT INTO services."Pasport" VALUES (4, 'DD', 445566, 1);


--
-- TOC entry 5147 (class 0 OID 34629)
-- Dependencies: 314
-- Data for Name: PasportTypes; Type: TABLE DATA; Schema: services; Owner: -
--

INSERT INTO services."PasportTypes" VALUES (1, 'International');
INSERT INTO services."PasportTypes" VALUES (2, 'National');


--
-- TOC entry 5122 (class 0 OID 33897)
-- Dependencies: 267
-- Data for Name: Patient; Type: TABLE DATA; Schema: services; Owner: -
--

INSERT INTO services."Patient" VALUES (11, 11, 'patient1@example.com', 1, '123-456-7890', 1, '1980-01-01');
INSERT INTO services."Patient" VALUES (12, 12, 'patient2@example.com', 2, '234-567-8901', 2, '1990-02-02');
INSERT INTO services."Patient" VALUES (13, 13, 'patient3@example.com', 3, '345-678-9012', 3, '2000-03-03');
INSERT INTO services."Patient" VALUES (14, 14, 'patient4@example.com', 4, '456-789-0123', 4, '1975-04-04');
INSERT INTO services."Patient" VALUES (15, 15, 'patient5@example.com', 1, '567-890-1234', 1, '1985-05-05');
INSERT INTO services."Patient" VALUES (16, 16, 'patient6@example.com', 2, '678-901-2345', 2, '1995-06-06');
INSERT INTO services."Patient" VALUES (17, 17, 'patient7@example.com', 3, '789-012-3456', 3, '2005-07-07');
INSERT INTO services."Patient" VALUES (18, 18, 'patient8@example.com', 4, '890-123-4567', 4, '1970-08-08');
INSERT INTO services."Patient" VALUES (19, 19, 'patient9@example.com', 1, '901-234-5678', 1, '1988-09-09');
INSERT INTO services."Patient" VALUES (20, 20, 'patient10@example.com', 2, '012-345-6789', 2, '1992-10-10');


--
-- TOC entry 5143 (class 0 OID 34255)
-- Dependencies: 288
-- Data for Name: PatientTransaction; Type: TABLE DATA; Schema: services; Owner: -
--

INSERT INTO services."PatientTransaction" VALUES (5, 11, 1);
INSERT INTO services."PatientTransaction" VALUES (6, 12, 2);
INSERT INTO services."PatientTransaction" VALUES (7, 13, 3);
INSERT INTO services."PatientTransaction" VALUES (8, 14, 4);


--
-- TOC entry 5127 (class 0 OID 33909)
-- Dependencies: 272
-- Data for Name: ProvidedService; Type: TABLE DATA; Schema: services; Owner: -
--

INSERT INTO services."ProvidedService" VALUES (5, 1, 1, '2024-09-30 16:08:00.657555', 1, 1);
INSERT INTO services."ProvidedService" VALUES (6, 2, 2, '2024-08-31 16:08:00.657555', 2, 2);
INSERT INTO services."ProvidedService" VALUES (7, 3, 3, NULL, 3, 3);
INSERT INTO services."ProvidedService" VALUES (8, 4, 4, NULL, 4, 4);


--
-- TOC entry 5137 (class 0 OID 34028)
-- Dependencies: 282
-- Data for Name: Services; Type: TABLE DATA; Schema: services; Owner: -
--

INSERT INTO services."Services" VALUES (1, 'Blood Test', 100.00, '2024-01-10', 0.2);
INSERT INTO services."Services" VALUES (2, 'X-Ray', 200.00, '2024-01-11', 0.5);
INSERT INTO services."Services" VALUES (3, 'MRI', 500.00, '2024-01-12', 0.3);
INSERT INTO services."Services" VALUES (4, 'CT Scan', 400.00, '2024-01-13', 0.4);
INSERT INTO services."Services" VALUES (5, 'Ultrasound', 150.00, '2024-01-14', 0.1);
INSERT INTO services."Services" VALUES (11, 'Blood Test', 50.0, '2023-01-01', 5.0);
INSERT INTO services."Services" VALUES (12, 'X-Ray', 100.0, '2023-02-01', 10.0);
INSERT INTO services."Services" VALUES (13, 'MRI Scan', 300.0, '2023-03-01', 15.0);
INSERT INTO services."Services" VALUES (14, 'CT Scan', 200.0, '2023-04-01', 12.0);


--
-- TOC entry 5132 (class 0 OID 33928)
-- Dependencies: 277
-- Data for Name: User; Type: TABLE DATA; Schema: services; Owner: -
--

INSERT INTO services."User" VALUES (1, 'assistant1', 'pass123', 'Assistant One', 1);
INSERT INTO services."User" VALUES (2, 'assistant2', 'pass123', 'Assistant Two', 1);
INSERT INTO services."User" VALUES (3, 'assistant3', 'pass123', 'Assistant Three', 1);
INSERT INTO services."User" VALUES (4, 'assistant4', 'pass123', 'Assistant Four', 1);
INSERT INTO services."User" VALUES (5, 'accountant1', 'pass123', 'Accountant One', 2);
INSERT INTO services."User" VALUES (6, 'accountant2', 'pass123', 'Accountant Two', 2);
INSERT INTO services."User" VALUES (7, 'accountant3', 'pass123', 'Accountant Three', 2);
INSERT INTO services."User" VALUES (8, 'accountant4', 'pass123', 'Accountant Four', 2);
INSERT INTO services."User" VALUES (9, 'admin1', 'pass123', 'Admin One', 3);
INSERT INTO services."User" VALUES (10, 'admin2', 'pass123', 'Admin Two', 3);
INSERT INTO services."User" VALUES (11, 'patient1', 'pass123', 'Patient One', 4);
INSERT INTO services."User" VALUES (12, 'patient2', 'pass123', 'Patient Two', 4);
INSERT INTO services."User" VALUES (13, 'patient3', 'pass123', 'Patient Three', 4);
INSERT INTO services."User" VALUES (14, 'patient4', 'pass123', 'Patient Four', 4);
INSERT INTO services."User" VALUES (15, 'patient5', 'pass123', 'Patient Five', 4);
INSERT INTO services."User" VALUES (16, 'patient6', 'pass123', 'Patient Six', 4);
INSERT INTO services."User" VALUES (17, 'patient7', 'pass123', 'Patient Seven', 4);
INSERT INTO services."User" VALUES (18, 'patient8', 'pass123', 'Patient Eight', 4);
INSERT INTO services."User" VALUES (19, 'patient9', 'pass123', 'Patient Nine', 4);
INSERT INTO services."User" VALUES (20, 'patient10', 'pass123', 'Patient Ten', 4);


--
-- TOC entry 5145 (class 0 OID 34273)
-- Dependencies: 290
-- Data for Name: UserLoginHistory; Type: TABLE DATA; Schema: services; Owner: -
--

INSERT INTO services."UserLoginHistory" VALUES (1, 1, '2024-10-30 16:10:23.228054', '2024-10-30 17:10:23.228054', '192.168.1.1', 'PC');
INSERT INTO services."UserLoginHistory" VALUES (2, 2, '2024-10-29 16:10:23.228054', '2024-10-29 17:10:23.228054', '192.168.1.2', 'Laptop');
INSERT INTO services."UserLoginHistory" VALUES (3, 3, '2024-10-28 16:10:23.228054', '2024-10-28 17:10:23.228054', '192.168.1.3', 'Tablet');
INSERT INTO services."UserLoginHistory" VALUES (4, 4, '2024-10-27 16:10:23.228054', '2024-10-27 17:10:23.228054', '192.168.1.4', 'Mobile');


--
-- TOC entry 5134 (class 0 OID 33937)
-- Dependencies: 279
-- Data for Name: UserTypes; Type: TABLE DATA; Schema: services; Owner: -
--

INSERT INTO services."UserTypes" VALUES (1, 'Assistant');
INSERT INTO services."UserTypes" VALUES (2, 'Accountant');
INSERT INTO services."UserTypes" VALUES (3, 'Admin');
INSERT INTO services."UserTypes" VALUES (4, 'Patient');


--
-- TOC entry 5183 (class 0 OID 0)
-- Dependencies: 248
-- Name: Accountant_AccountantId_seq; Type: SEQUENCE SET; Schema: services; Owner: -
--

SELECT pg_catalog.setval('services."Accountant_AccountantId_seq"', 4, true);


--
-- TOC entry 5184 (class 0 OID 0)
-- Dependencies: 250
-- Name: Accountant_UserId_seq; Type: SEQUENCE SET; Schema: services; Owner: -
--

SELECT pg_catalog.setval('services."Accountant_UserId_seq"', 1, false);


--
-- TOC entry 5185 (class 0 OID 0)
-- Dependencies: 251
-- Name: Analisator_AnalisatorId_seq; Type: SEQUENCE SET; Schema: services; Owner: -
--

SELECT pg_catalog.setval('services."Analisator_AnalisatorId_seq"', 4, true);


--
-- TOC entry 5186 (class 0 OID 0)
-- Dependencies: 253
-- Name: Company_CompanyId_seq; Type: SEQUENCE SET; Schema: services; Owner: -
--

SELECT pg_catalog.setval('services."Company_CompanyId_seq"', 2, true);


--
-- TOC entry 5187 (class 0 OID 0)
-- Dependencies: 257
-- Name: Insurance_CompanyId_seq; Type: SEQUENCE SET; Schema: services; Owner: -
--

SELECT pg_catalog.setval('services."Insurance_CompanyId_seq"', 1, false);


--
-- TOC entry 5188 (class 0 OID 0)
-- Dependencies: 255
-- Name: Insurance_InsuranceId_seq; Type: SEQUENCE SET; Schema: services; Owner: -
--

SELECT pg_catalog.setval('services."Insurance_InsuranceId_seq"', 8, true);


--
-- TOC entry 5189 (class 0 OID 0)
-- Dependencies: 283
-- Name: Invoice_InvoiceId_seq; Type: SEQUENCE SET; Schema: services; Owner: -
--

SELECT pg_catalog.setval('services."Invoice_InvoiceId_seq"', 8, true);


--
-- TOC entry 5190 (class 0 OID 0)
-- Dependencies: 258
-- Name: LaboratoryAssistant_AssistantId_seq; Type: SEQUENCE SET; Schema: services; Owner: -
--

SELECT pg_catalog.setval('services."LaboratoryAssistant_AssistantId_seq"', 4, true);


--
-- TOC entry 5191 (class 0 OID 0)
-- Dependencies: 260
-- Name: LaboratoryAssistant_ServiceId_seq; Type: SEQUENCE SET; Schema: services; Owner: -
--

SELECT pg_catalog.setval('services."LaboratoryAssistant_ServiceId_seq"', 1, false);


--
-- TOC entry 5192 (class 0 OID 0)
-- Dependencies: 261
-- Name: LaboratoryAssistant_UserId_seq; Type: SEQUENCE SET; Schema: services; Owner: -
--

SELECT pg_catalog.setval('services."LaboratoryAssistant_UserId_seq"', 1, false);


--
-- TOC entry 5193 (class 0 OID 0)
-- Dependencies: 285
-- Name: OrderTransaction_OrderTransactionId_seq; Type: SEQUENCE SET; Schema: services; Owner: -
--

SELECT pg_catalog.setval('services."OrderTransaction_OrderTransactionId_seq"', 4, true);


--
-- TOC entry 5194 (class 0 OID 0)
-- Dependencies: 262
-- Name: Order_OrderId_seq; Type: SEQUENCE SET; Schema: services; Owner: -
--

SELECT pg_catalog.setval('services."Order_OrderId_seq"', 4, true);


--
-- TOC entry 5195 (class 0 OID 0)
-- Dependencies: 313
-- Name: PasportTypes_PasportTypeId_seq; Type: SEQUENCE SET; Schema: services; Owner: -
--

SELECT pg_catalog.setval('services."PasportTypes_PasportTypeId_seq"', 2, true);


--
-- TOC entry 5196 (class 0 OID 0)
-- Dependencies: 264
-- Name: Pasport_PasportId_seq; Type: SEQUENCE SET; Schema: services; Owner: -
--

SELECT pg_catalog.setval('services."Pasport_PasportId_seq"', 4, true);


--
-- TOC entry 5197 (class 0 OID 0)
-- Dependencies: 287
-- Name: PatientTransaction_PatientTransactionId_seq; Type: SEQUENCE SET; Schema: services; Owner: -
--

SELECT pg_catalog.setval('services."PatientTransaction_PatientTransactionId_seq"', 8, true);


--
-- TOC entry 5198 (class 0 OID 0)
-- Dependencies: 268
-- Name: Patient_InsuranceId_seq; Type: SEQUENCE SET; Schema: services; Owner: -
--

SELECT pg_catalog.setval('services."Patient_InsuranceId_seq"', 1, false);


--
-- TOC entry 5199 (class 0 OID 0)
-- Dependencies: 269
-- Name: Patient_PasportId_seq; Type: SEQUENCE SET; Schema: services; Owner: -
--

SELECT pg_catalog.setval('services."Patient_PasportId_seq"', 1, false);


--
-- TOC entry 5200 (class 0 OID 0)
-- Dependencies: 266
-- Name: Patient_PatientId_seq; Type: SEQUENCE SET; Schema: services; Owner: -
--

SELECT pg_catalog.setval('services."Patient_PatientId_seq"', 30, true);


--
-- TOC entry 5201 (class 0 OID 0)
-- Dependencies: 270
-- Name: Patient_UserId_seq; Type: SEQUENCE SET; Schema: services; Owner: -
--

SELECT pg_catalog.setval('services."Patient_UserId_seq"', 1, false);


--
-- TOC entry 5202 (class 0 OID 0)
-- Dependencies: 273
-- Name: ProvidedService_AnalisatorId_seq; Type: SEQUENCE SET; Schema: services; Owner: -
--

SELECT pg_catalog.setval('services."ProvidedService_AnalisatorId_seq"', 1, false);


--
-- TOC entry 5203 (class 0 OID 0)
-- Dependencies: 274
-- Name: ProvidedService_AssistantId_seq; Type: SEQUENCE SET; Schema: services; Owner: -
--

SELECT pg_catalog.setval('services."ProvidedService_AssistantId_seq"', 1, false);


--
-- TOC entry 5204 (class 0 OID 0)
-- Dependencies: 271
-- Name: ProvidedService_ProvidedServiceId_seq; Type: SEQUENCE SET; Schema: services; Owner: -
--

SELECT pg_catalog.setval('services."ProvidedService_ProvidedServiceId_seq"', 8, true);


--
-- TOC entry 5205 (class 0 OID 0)
-- Dependencies: 275
-- Name: ProvidedService_ServiceId_seq; Type: SEQUENCE SET; Schema: services; Owner: -
--

SELECT pg_catalog.setval('services."ProvidedService_ServiceId_seq"', 1, false);


--
-- TOC entry 5206 (class 0 OID 0)
-- Dependencies: 281
-- Name: Services_ServiceId_seq; Type: SEQUENCE SET; Schema: services; Owner: -
--

SELECT pg_catalog.setval('services."Services_ServiceId_seq"', 14, true);


--
-- TOC entry 5207 (class 0 OID 0)
-- Dependencies: 289
-- Name: UserLoginHistory_LoginHistoryId_seq; Type: SEQUENCE SET; Schema: services; Owner: -
--

SELECT pg_catalog.setval('services."UserLoginHistory_LoginHistoryId_seq"', 4, true);


--
-- TOC entry 5208 (class 0 OID 0)
-- Dependencies: 278
-- Name: UserTypes_TypeId_seq; Type: SEQUENCE SET; Schema: services; Owner: -
--

SELECT pg_catalog.setval('services."UserTypes_TypeId_seq"', 1, false);


--
-- TOC entry 5209 (class 0 OID 0)
-- Dependencies: 276
-- Name: User_UserId_seq; Type: SEQUENCE SET; Schema: services; Owner: -
--

SELECT pg_catalog.setval('services."User_UserId_seq"', 20, true);


--
-- TOC entry 5210 (class 0 OID 0)
-- Dependencies: 280
-- Name: User_UserType_seq; Type: SEQUENCE SET; Schema: services; Owner: -
--

SELECT pg_catalog.setval('services."User_UserType_seq"', 1, false);


--
-- TOC entry 4907 (class 2606 OID 33828)
-- Name: Accountant Accountant_pkey; Type: CONSTRAINT; Schema: services; Owner: -
--

ALTER TABLE ONLY services."Accountant"
    ADD CONSTRAINT "Accountant_pkey" PRIMARY KEY ("AccountantId");


--
-- TOC entry 4909 (class 2606 OID 33847)
-- Name: Analisator Analisator_pkey; Type: CONSTRAINT; Schema: services; Owner: -
--

ALTER TABLE ONLY services."Analisator"
    ADD CONSTRAINT "Analisator_pkey" PRIMARY KEY ("AnalisatorId");


--
-- TOC entry 4911 (class 2606 OID 33857)
-- Name: Company Company_pkey; Type: CONSTRAINT; Schema: services; Owner: -
--

ALTER TABLE ONLY services."Company"
    ADD CONSTRAINT "Company_pkey" PRIMARY KEY ("CompanyId");


--
-- TOC entry 4913 (class 2606 OID 33866)
-- Name: Insurance Insurance_pkey; Type: CONSTRAINT; Schema: services; Owner: -
--

ALTER TABLE ONLY services."Insurance"
    ADD CONSTRAINT "Insurance_pkey" PRIMARY KEY ("InsuranceId");


--
-- TOC entry 4915 (class 2606 OID 33874)
-- Name: LaboratoryAssistant LaboratoryAssistant_pkey; Type: CONSTRAINT; Schema: services; Owner: -
--

ALTER TABLE ONLY services."LaboratoryAssistant"
    ADD CONSTRAINT "LaboratoryAssistant_pkey" PRIMARY KEY ("AssistantId");


--
-- TOC entry 4917 (class 2606 OID 33885)
-- Name: Order Order_pkey; Type: CONSTRAINT; Schema: services; Owner: -
--

ALTER TABLE ONLY services."Order"
    ADD CONSTRAINT "Order_pkey" PRIMARY KEY ("OrderId");


--
-- TOC entry 4919 (class 2606 OID 33895)
-- Name: Pasport Pasport_pkey; Type: CONSTRAINT; Schema: services; Owner: -
--

ALTER TABLE ONLY services."Pasport"
    ADD CONSTRAINT "Pasport_pkey" PRIMARY KEY ("PasportId");


--
-- TOC entry 4921 (class 2606 OID 33904)
-- Name: Patient Patient_pkey; Type: CONSTRAINT; Schema: services; Owner: -
--

ALTER TABLE ONLY services."Patient"
    ADD CONSTRAINT "Patient_pkey" PRIMARY KEY ("PatientId");


--
-- TOC entry 4923 (class 2606 OID 33914)
-- Name: ProvidedService ProvidedService_pkey; Type: CONSTRAINT; Schema: services; Owner: -
--

ALTER TABLE ONLY services."ProvidedService"
    ADD CONSTRAINT "ProvidedService_pkey" PRIMARY KEY ("ProvidedServiceId");


--
-- TOC entry 4929 (class 2606 OID 34035)
-- Name: Services Services_pkey; Type: CONSTRAINT; Schema: services; Owner: -
--

ALTER TABLE ONLY services."Services"
    ADD CONSTRAINT "Services_pkey" PRIMARY KEY ("ServiceId");


--
-- TOC entry 4937 (class 2606 OID 34281)
-- Name: UserLoginHistory UserLoginHistory_pkey; Type: CONSTRAINT; Schema: services; Owner: -
--

ALTER TABLE ONLY services."UserLoginHistory"
    ADD CONSTRAINT "UserLoginHistory_pkey" PRIMARY KEY ("LoginHistoryId");


--
-- TOC entry 4927 (class 2606 OID 33944)
-- Name: UserTypes UserTypes_pkey; Type: CONSTRAINT; Schema: services; Owner: -
--

ALTER TABLE ONLY services."UserTypes"
    ADD CONSTRAINT "UserTypes_pkey" PRIMARY KEY ("TypeId");


--
-- TOC entry 4925 (class 2606 OID 33935)
-- Name: User User_pkey; Type: CONSTRAINT; Schema: services; Owner: -
--

ALTER TABLE ONLY services."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY ("UserId");


--
-- TOC entry 4931 (class 2606 OID 34074)
-- Name: Invoice _Invoice__pk; Type: CONSTRAINT; Schema: services; Owner: -
--

ALTER TABLE ONLY services."Invoice"
    ADD CONSTRAINT "_Invoice__pk" PRIMARY KEY ("InvoiceId");


--
-- TOC entry 4933 (class 2606 OID 34238)
-- Name: OrderTransaction _OrderTransaction__pk; Type: CONSTRAINT; Schema: services; Owner: -
--

ALTER TABLE ONLY services."OrderTransaction"
    ADD CONSTRAINT "_OrderTransaction__pk" PRIMARY KEY ("OrderTransactionId");


--
-- TOC entry 4939 (class 2606 OID 34636)
-- Name: PasportTypes _PasportTypes__pk; Type: CONSTRAINT; Schema: services; Owner: -
--

ALTER TABLE ONLY services."PasportTypes"
    ADD CONSTRAINT "_PasportTypes__pk" PRIMARY KEY ("PasportTypeId");


--
-- TOC entry 4935 (class 2606 OID 34260)
-- Name: PatientTransaction _PatientTransaction__pk; Type: CONSTRAINT; Schema: services; Owner: -
--

ALTER TABLE ONLY services."PatientTransaction"
    ADD CONSTRAINT "_PatientTransaction__pk" PRIMARY KEY ("PatientTransactionId");


--
-- TOC entry 4959 (class 2606 OID 34282)
-- Name: UserLoginHistory UserLoginHistory_UserId_fkey; Type: FK CONSTRAINT; Schema: services; Owner: -
--

ALTER TABLE ONLY services."UserLoginHistory"
    ADD CONSTRAINT "UserLoginHistory_UserId_fkey" FOREIGN KEY ("UserId") REFERENCES services."User"("UserId");


--
-- TOC entry 4940 (class 2606 OID 33956)
-- Name: Accountant accountant_user_fk; Type: FK CONSTRAINT; Schema: services; Owner: -
--

ALTER TABLE ONLY services."Accountant"
    ADD CONSTRAINT accountant_user_fk FOREIGN KEY ("UserId") REFERENCES services."User"("UserId");


--
-- TOC entry 4941 (class 2606 OID 33971)
-- Name: Insurance insurance_company_fk; Type: FK CONSTRAINT; Schema: services; Owner: -
--

ALTER TABLE ONLY services."Insurance"
    ADD CONSTRAINT insurance_company_fk FOREIGN KEY ("CompanyId") REFERENCES services."Company"("CompanyId");


--
-- TOC entry 4953 (class 2606 OID 34095)
-- Name: Invoice invoice_accountant_fk; Type: FK CONSTRAINT; Schema: services; Owner: -
--

ALTER TABLE ONLY services."Invoice"
    ADD CONSTRAINT invoice_accountant_fk FOREIGN KEY ("AccountantId") REFERENCES services."Accountant"("AccountantId");


--
-- TOC entry 4954 (class 2606 OID 34090)
-- Name: Invoice invoice_insurance_fk; Type: FK CONSTRAINT; Schema: services; Owner: -
--

ALTER TABLE ONLY services."Invoice"
    ADD CONSTRAINT invoice_insurance_fk FOREIGN KEY ("InsuranceId") REFERENCES services."Insurance"("InsuranceId");


--
-- TOC entry 4942 (class 2606 OID 34037)
-- Name: LaboratoryAssistant laboratoryassistant_services_fk; Type: FK CONSTRAINT; Schema: services; Owner: -
--

ALTER TABLE ONLY services."LaboratoryAssistant"
    ADD CONSTRAINT laboratoryassistant_services_fk FOREIGN KEY ("ServiceId") REFERENCES services."Services"("ServiceId");


--
-- TOC entry 4943 (class 2606 OID 33981)
-- Name: LaboratoryAssistant laboratoryassistant_user_fk; Type: FK CONSTRAINT; Schema: services; Owner: -
--

ALTER TABLE ONLY services."LaboratoryAssistant"
    ADD CONSTRAINT laboratoryassistant_user_fk FOREIGN KEY ("UserId") REFERENCES services."User"("UserId");


--
-- TOC entry 4955 (class 2606 OID 34244)
-- Name: OrderTransaction ordertransaction_order_fk; Type: FK CONSTRAINT; Schema: services; Owner: -
--

ALTER TABLE ONLY services."OrderTransaction"
    ADD CONSTRAINT ordertransaction_order_fk FOREIGN KEY ("OrderId") REFERENCES services."Order"("OrderId");


--
-- TOC entry 4956 (class 2606 OID 34239)
-- Name: OrderTransaction ordertransaction_services_fk; Type: FK CONSTRAINT; Schema: services; Owner: -
--

ALTER TABLE ONLY services."OrderTransaction"
    ADD CONSTRAINT ordertransaction_services_fk FOREIGN KEY ("ServiceId") REFERENCES services."Services"("ServiceId");


--
-- TOC entry 4944 (class 2606 OID 34643)
-- Name: Pasport pasport_pasporttypes_fk; Type: FK CONSTRAINT; Schema: services; Owner: -
--

ALTER TABLE ONLY services."Pasport"
    ADD CONSTRAINT pasport_pasporttypes_fk FOREIGN KEY ("PasportType") REFERENCES services."PasportTypes"("PasportTypeId");


--
-- TOC entry 4945 (class 2606 OID 33991)
-- Name: Patient patient_insurance_fk; Type: FK CONSTRAINT; Schema: services; Owner: -
--

ALTER TABLE ONLY services."Patient"
    ADD CONSTRAINT patient_insurance_fk FOREIGN KEY ("InsuranceId") REFERENCES services."Insurance"("InsuranceId");


--
-- TOC entry 4946 (class 2606 OID 33996)
-- Name: Patient patient_pasport_fk; Type: FK CONSTRAINT; Schema: services; Owner: -
--

ALTER TABLE ONLY services."Patient"
    ADD CONSTRAINT patient_pasport_fk FOREIGN KEY ("PasportId") REFERENCES services."Pasport"("PasportId");


--
-- TOC entry 4947 (class 2606 OID 34001)
-- Name: Patient patient_user_fk; Type: FK CONSTRAINT; Schema: services; Owner: -
--

ALTER TABLE ONLY services."Patient"
    ADD CONSTRAINT patient_user_fk FOREIGN KEY ("UserId") REFERENCES services."User"("UserId");


--
-- TOC entry 4957 (class 2606 OID 34261)
-- Name: PatientTransaction patienttransaction_order_fk; Type: FK CONSTRAINT; Schema: services; Owner: -
--

ALTER TABLE ONLY services."PatientTransaction"
    ADD CONSTRAINT patienttransaction_order_fk FOREIGN KEY ("OrderId") REFERENCES services."Order"("OrderId");


--
-- TOC entry 4958 (class 2606 OID 34266)
-- Name: PatientTransaction patienttransaction_patient_fk; Type: FK CONSTRAINT; Schema: services; Owner: -
--

ALTER TABLE ONLY services."PatientTransaction"
    ADD CONSTRAINT patienttransaction_patient_fk FOREIGN KEY ("PatientId") REFERENCES services."Patient"("PatientId");


--
-- TOC entry 4948 (class 2606 OID 34006)
-- Name: ProvidedService providedservice_analisator_fk; Type: FK CONSTRAINT; Schema: services; Owner: -
--

ALTER TABLE ONLY services."ProvidedService"
    ADD CONSTRAINT providedservice_analisator_fk FOREIGN KEY ("AnalisatorId") REFERENCES services."Analisator"("AnalisatorId");


--
-- TOC entry 4949 (class 2606 OID 34011)
-- Name: ProvidedService providedservice_laboratoryassistant_fk; Type: FK CONSTRAINT; Schema: services; Owner: -
--

ALTER TABLE ONLY services."ProvidedService"
    ADD CONSTRAINT providedservice_laboratoryassistant_fk FOREIGN KEY ("AssistantId") REFERENCES services."LaboratoryAssistant"("AssistantId");


--
-- TOC entry 4950 (class 2606 OID 34227)
-- Name: ProvidedService providedservice_order_fk; Type: FK CONSTRAINT; Schema: services; Owner: -
--

ALTER TABLE ONLY services."ProvidedService"
    ADD CONSTRAINT providedservice_order_fk FOREIGN KEY ("OrderId") REFERENCES services."Order"("OrderId");


--
-- TOC entry 4951 (class 2606 OID 34042)
-- Name: ProvidedService providedservice_services_fk; Type: FK CONSTRAINT; Schema: services; Owner: -
--

ALTER TABLE ONLY services."ProvidedService"
    ADD CONSTRAINT providedservice_services_fk FOREIGN KEY ("ServiceId") REFERENCES services."Services"("ServiceId");


--
-- TOC entry 4952 (class 2606 OID 34021)
-- Name: User user_usertypes_fk; Type: FK CONSTRAINT; Schema: services; Owner: -
--

ALTER TABLE ONLY services."User"
    ADD CONSTRAINT user_usertypes_fk FOREIGN KEY ("UserType") REFERENCES services."UserTypes"("TypeId");


-- Completed on 2024-11-11 10:10:18

--
-- PostgreSQL database dump complete
--

