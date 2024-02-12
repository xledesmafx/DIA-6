CREATE TABLE "rol" (
  "id_rol" int PRIMARY KEY,
  "descripcion" varchar
);

CREATE TABLE "usuario" (
  "id" int PRIMARY KEY,
  "username" varchar UNIQUE,
  "correo" varchar,
  "constrasenha" varchar,
  "biografia" varchar,
  "rol_id" int,
  "genero" char,
  "avatar" image
);

CREATE TABLE "comentarios" (
  "id" int PRIMARY KEY,
  "autor_id" int,
  "comentario" varchar,
  "fecha_comentario" datetime,
  "post" int
);

CREATE TABLE "categoria" (
  "id" int PRIMARY KEY,
  "descripcion" varchar
);

CREATE TABLE "post" (
  "id" int PRIMARY KEY,
  "titulo" varchar,
  "contenido" varchar,
  "descripcion" varchar,
  "categoria_id" int,
  "fecha_actualizacion" datetime
);

CREATE TABLE "post_usuario" (
  "id" int PRIMARY KEY,
  "id_post" int,
  "id_actor" int,
  "fecha_creacion" datetime
);

ALTER TABLE "usuario" ADD FOREIGN KEY ("rol_id") REFERENCES "rol" ("id_rol");

ALTER TABLE "comentarios" ADD FOREIGN KEY ("autor_id") REFERENCES "usuario" ("id");

ALTER TABLE "comentarios" ADD FOREIGN KEY ("post") REFERENCES "post" ("id");

ALTER TABLE "post" ADD FOREIGN KEY ("categoria_id") REFERENCES "categoria" ("descripcion");

ALTER TABLE "post_usuario" ADD FOREIGN KEY ("id_post") REFERENCES "post" ("id");

ALTER TABLE "post_usuario" ADD FOREIGN KEY ("id_actor") REFERENCES "usuario" ("id");
