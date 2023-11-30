-- AlterTable
CREATE SEQUENCE estado_id_seq;
ALTER TABLE "Estado" ALTER COLUMN "id" SET DEFAULT nextval('estado_id_seq');
ALTER SEQUENCE estado_id_seq OWNED BY "Estado"."id";

-- AlterTable
CREATE SEQUENCE pais_id_seq;
ALTER TABLE "Pais" ALTER COLUMN "id" SET DEFAULT nextval('pais_id_seq');
ALTER SEQUENCE pais_id_seq OWNED BY "Pais"."id";
