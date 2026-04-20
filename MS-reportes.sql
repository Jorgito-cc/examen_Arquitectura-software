CREATE TABLE IF NOT EXISTS "reportador" (
    "id" SERIAL PRIMARY KEY,
    "nombres" VARCHAR(100) NOT NULL,
    "apellidos" VARCHAR(100) NOT NULL,
    "correo" VARCHAR(100) NOT NULL,
    "tipo_reportador" VARCHAR(50) NOT NULL, -- Estudiante, Docente, Administrativo
    "activo" BOOLEAN DEFAULT TRUE
);

CREATE TABLE IF NOT EXISTS "tipo_incidencia" (
    "id" SERIAL PRIMARY KEY,
    "nombre_tipo" VARCHAR(100) NOT NULL, -- Eléctrico, Mobiliario, Paredes, etc.
    "activo" BOOLEAN DEFAULT TRUE
);

CREATE TABLE IF NOT EXISTS "nota_problemas" (
    "id" SERIAL PRIMARY KEY,
    "fecha_envio" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "reportador_id" INTEGER REFERENCES "reportador"("id") ON DELETE SET NULL,
    "activo" BOOLEAN DEFAULT TRUE
);

CREATE TABLE IF NOT EXISTS "detalle_problema" (
    "id" SERIAL PRIMARY KEY,
    "descripcion" TEXT NOT NULL,
    "estado_actual" VARCHAR(50) NOT NULL DEFAULT 'Pendiente',
    "ambiente_id" INTEGER, -- Atributo de referencia (Ubicación)
    "nota_id" INTEGER REFERENCES "nota_problemas"("id") ON DELETE CASCADE,
    "tipo_incidencia_id" INTEGER REFERENCES "tipo_incidencia"("id") ON DELETE SET NULL,
    "activo" BOOLEAN DEFAULT TRUE
);

INSERT INTO "tipo_incidencia" (nombre_tipo) VALUES ('Eléctrico'), ('Mobiliario'), ('Sanitario'), ('Infraestructura');
