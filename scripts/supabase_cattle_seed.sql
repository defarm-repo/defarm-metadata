-- SQL script to create a cattle table and populate it with 1000 fake records
-- Localized between Mato Grosso do Sul (MS) and São Paulo (SP) states in Brazil

-- Drop table if it exists
DROP TABLE IF EXISTS public.cattle;

CREATE TABLE public.cattle (
    id SERIAL PRIMARY KEY,
    species TEXT NOT NULL,
    breed TEXT NOT NULL,
    sex TEXT NOT NULL,
    birth_date DATE NOT NULL,
    own_farm BOOLEAN NOT NULL,
    ear_tag TEXT,
    rfid TEXT,
    sisbov TEXT,
    internal_id TEXT,
    owner_name TEXT,
    cpf_cnpj TEXT,
    property_name TEXT,
    establishment_code TEXT,
    exploracao_pecuaria TEXT,
    state_registration TEXT,
    mapa_code TEXT,
    municipality TEXT,
    state CHAR(2),
    geolocation TEXT
);

INSERT INTO public.cattle (
    species, breed, sex, birth_date, own_farm, ear_tag, rfid, sisbov,
    internal_id, owner_name, cpf_cnpj, property_name,
    establishment_code, exploracao_pecuaria, state_registration,
    mapa_code, municipality, state, geolocation
)
SELECT
    'cattle' AS species,
    (ARRAY['Nelore','Angus','Brahman','Gir','Guzera'])[floor(random()*5)+1] AS breed,
    (ARRAY['male','female','castrated'])[floor(random()*3)+1] AS sex,
    (DATE '2019-01-01' + (trunc(random()*1500)::INT) * INTERVAL '1 day')::DATE AS birth_date,
    (random() > 0.5) AS own_farm,
    lpad(trunc(random()*1000000)::text, 6, '0') AS ear_tag,
    lpad(trunc(random()*10000000000)::text, 10, '0') AS rfid,
    'BR' || lpad(trunc(random()*1000000)::text, 6, '0') AS sisbov,
    'BOI-' || gs AS internal_id,
    'Fazenda ' || (ARRAY['Boa Esperança','São José','Santa Rita','Verde Vale'])[floor(random()*4)+1] AS owner_name,
    lpad(trunc(random()*100000000000)::text, 11, '0') AS cpf_cnpj,
    'Fazenda ' || (ARRAY['Boa Esperança','São José','Santa Rita','Verde Vale'])[floor(random()*4)+1] AS property_name,
    'BR' || lpad(trunc(random()*1000000)::text, 6, '0') AS establishment_code,
    (ARRAY['Corte','Leite'])[floor(random()*2)+1] AS exploracao_pecuaria,
    'SP-' || lpad(trunc(random()*100000)::text, 6, '0') AS state_registration,
    'MAPA-' || lpad(trunc(random()*10000)::text, 4, '0') AS mapa_code,
    CASE WHEN random() > 0.5
         THEN (ARRAY['Campo Grande','Dourados','Três Lagoas'])[floor(random()*3)+1]
         ELSE (ARRAY['Ribeirão Preto','Campinas','São Paulo'])[floor(random()*3)+1]
    END AS municipality,
    CASE WHEN random() > 0.5 THEN 'MS' ELSE 'SP' END AS state,
    CASE WHEN random() > 0.5
         THEN ( (random()*7 - 24)::numeric(6,4) || ', ' || (random()*6 - 56)::numeric(6,4) )
         ELSE ( (random()*6 - 25)::numeric(6,4) || ', ' || (random()*9 - 53)::numeric(6,4) )
    END AS geolocation
FROM generate_series(1,1000) AS gs;
