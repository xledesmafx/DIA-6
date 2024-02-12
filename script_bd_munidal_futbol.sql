CREATE TABLE "equipo" (
  "id_equipo" int PRIMARY KEY,
  "nombre" varchar,
  "nacionalidad" varchar,
  "grupo" int
);

CREATE TABLE "estadio" (
  "id_estadio" int PRIMARY KEY,
  "nombre" varchar,
  "capacidad" varchar,
  "ubicacion" varchar,
  "equipo" int
);

CREATE TABLE "grupo" (
  "id_grupo" int PRIMARY KEY,
  "nombre_grupo" varchar
);

CREATE TABLE "persona" (
  "id_persona" int PRIMARY KEY,
  "nombre" varchar,
  "apellido" varchar,
  "edad" varchar,
  "tipo_persona" int
);

CREATE TABLE "tipo_persona" (
  "id" int PRIMARY KEY,
  "descripcion" varchar
);

CREATE TABLE "partido_equipo" (
  "id" int PRIMARY KEY,
  "id_equipo" int,
  "id_partido" int,
  "resultado" int,
  "tarjetas" int
);

CREATE TABLE "partido" (
  "id" int PRIMARY KEY,
  "fecha" datetime,
  "estadio" int,
  "arbitro" int,
  "fase" int
);

CREATE TABLE "fases" (
  "id" int PRIMARY KEY,
  "fase" varchar
);

ALTER TABLE "equipo" ADD FOREIGN KEY ("grupo") REFERENCES "grupo" ("id_grupo");

ALTER TABLE "estadio" ADD FOREIGN KEY ("equipo") REFERENCES "equipo" ("id_equipo");

ALTER TABLE "persona" ADD FOREIGN KEY ("tipo_persona") REFERENCES "tipo_persona" ("id");

ALTER TABLE "partido_equipo" ADD FOREIGN KEY ("id_equipo") REFERENCES "equipo" ("id_equipo");

ALTER TABLE "partido_equipo" ADD FOREIGN KEY ("id_partido") REFERENCES "partido" ("id");

ALTER TABLE "partido" ADD FOREIGN KEY ("estadio") REFERENCES "estadio" ("id_estadio");

ALTER TABLE "partido" ADD FOREIGN KEY ("arbitro") REFERENCES "persona" ("id_persona");

ALTER TABLE "partido" ADD FOREIGN KEY ("fase") REFERENCES "fases" ("id");
