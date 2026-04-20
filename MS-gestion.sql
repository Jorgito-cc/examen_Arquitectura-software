CREATE TABLE IF NOT EXISTS "asignacion" (
    "id" SERIAL PRIMARY KEY,
    "fecha_asignacion" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "detalle_problema_id" INTEGER, -- Atributo de referencia (Reporte de Problemas)
    "usuario_id" INTEGER,           -- Atributo de referencia (Usuarios - Técnico)
    "activo" BOOLEAN DEFAULT TRUE
);

CREATE TABLE IF NOT EXISTS "historial_estados" (
    "id" SERIAL PRIMARY KEY,
    "tipo" VARCHAR(50) NOT NULL,    -- Ej: Cambio de Estado, Comentario
    "estado" VARCHAR(50) NOT NULL,  -- Ej: Asignado, En Proceso, Resuelto
    "fecha_cambio" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "comentario_tecnico" TEXT,
    "asignacion_id" INTEGER REFERENCES "asignacion"("id") ON DELETE CASCADE,
    "activo" BOOLEAN DEFAULT TRUE
);

CREATE TABLE IF NOT EXISTS "evidencia" (
    "id" SERIAL PRIMARY KEY,
    "url_archivo" VARCHAR(255) NOT NULL,
    "momento" VARCHAR(20) NOT NULL, -- Antes, Despues
    "asignacion_id" INTEGER REFERENCES "asignacion"("id") ON DELETE CASCADE,
    "activo" BOOLEAN DEFAULT TRUE
);
