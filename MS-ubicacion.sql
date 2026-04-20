CREATE TABLE IF NOT EXISTS "facultad" (
    "id" SERIAL PRIMARY KEY,
    "nombre" VARCHAR(150) NOT NULL,
    "abreviatura" VARCHAR(10),
    "activo" BOOLEAN DEFAULT TRUE
);

CREATE TABLE IF NOT EXISTS "modulo" (
    "id" SERIAL PRIMARY KEY,
    "numero_modulo" VARCHAR(20) NOT NULL,
    "facultad_id" INTEGER REFERENCES "facultad"("id") ON DELETE CASCADE,
    "activo" BOOLEAN DEFAULT TRUE
);

CREATE TABLE IF NOT EXISTS "ambiente" (
    "id" SERIAL PRIMARY KEY,
    "nombre_ambiente" VARCHAR(100) NOT NULL,
    "piso" INTEGER,
    "modulo_id" INTEGER REFERENCES "modulo"("id") ON DELETE CASCADE,
    "activo" BOOLEAN DEFAULT TRUE
);
