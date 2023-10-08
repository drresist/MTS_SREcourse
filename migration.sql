CREATE DATABASE weather1
    WITH OWNER postgres
    ENCODING 'UTF-8'
    TABLESPACE  pg_default
    CONNECTION LIMIT  -1;

\c weather2;
create table if not exists public.cities
(
    id   bigserial,
    name varchar(255)
    );

create table if not exists public.forecast
(
    id          bigserial,
    "cityId"    bigint,
    "dateTime"  bigint,
    temperature integer,
    summary     text
);

