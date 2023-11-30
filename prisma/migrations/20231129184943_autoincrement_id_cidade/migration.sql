-- AlterTable
CREATE SEQUENCE cidade_id_seq;
ALTER TABLE "Cidade" ALTER COLUMN "id" SET DEFAULT nextval('cidade_id_seq');
ALTER SEQUENCE cidade_id_seq OWNED BY "Cidade"."id";
