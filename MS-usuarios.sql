CREATE TABLE IF NOT EXISTS "rol" (
    "id" SERIAL PRIMARY KEY,
    "nombre_rol" VARCHAR(50) NOT NULL,
    "activo" BOOLEAN DEFAULT TRUE
);

CREATE TABLE IF NOT EXISTS "usuarios" (
    "id" SERIAL PRIMARY KEY,
    "nombres" VARCHAR(100) NOT NULL,
    "apellidos" VARCHAR(100) NOT NULL,
    "telefono" VARCHAR(20),
    "correo" VARCHAR(100) UNIQUE NOT NULL,
    "password" VARCHAR(255) NOT NULL,
    "rol_id" INTEGER REFERENCES "rol"("id") ON DELETE SET NULL,
    "facultad_id" INTEGER,
    "activo" BOOLEAN DEFAULT TRUE
);

INSERT INTO "rol" (nombre_rol) VALUES ('Decano'), ('Encargado de Mantenimiento'), ('Estudiante');
