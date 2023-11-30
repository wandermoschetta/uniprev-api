/*
  Warnings:

  - Added the required column `ibge` to the `Cidade` table without a default value. This is not possible if the table is not empty.
  - Added the required column `lat_lon` to the `Cidade` table without a default value. This is not possible if the table is not empty.
  - Added the required column `latitude` to the `Cidade` table without a default value. This is not possible if the table is not empty.
  - Added the required column `longitude` to the `Cidade` table without a default value. This is not possible if the table is not empty.
  - Added the required column `ddd` to the `Estado` table without a default value. This is not possible if the table is not empty.
  - Added the required column `ibge` to the `Estado` table without a default value. This is not possible if the table is not empty.
  - Added the required column `uf` to the `Estado` table without a default value. This is not possible if the table is not empty.
  - Added the required column `bacen` to the `Pais` table without a default value. This is not possible if the table is not empty.
  - Added the required column `nome_pt` to the `Pais` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Cidade" ADD COLUMN     "cod_tom" SMALLINT NOT NULL DEFAULT 0,
ADD COLUMN     "ibge" INTEGER NOT NULL,
ADD COLUMN     "lat_lon" VARCHAR(50) NOT NULL,
ADD COLUMN     "latitude" DOUBLE PRECISION NOT NULL,
ADD COLUMN     "longitude" DOUBLE PRECISION NOT NULL,
ALTER COLUMN "id" DROP DEFAULT;
DROP SEQUENCE "Cidade_id_seq";

-- AlterTable
ALTER TABLE "Estado" ADD COLUMN     "ddd" JSONB NOT NULL,
ADD COLUMN     "ibge" INTEGER NOT NULL,
ADD COLUMN     "uf" VARCHAR(5) NOT NULL,
ALTER COLUMN "id" DROP DEFAULT;
DROP SEQUENCE "Estado_id_seq";

-- AlterTable
ALTER TABLE "Pais" ADD COLUMN     "bacen" INTEGER NOT NULL,
ADD COLUMN     "nome_pt" VARCHAR(80) NOT NULL,
ALTER COLUMN "id" DROP DEFAULT;
DROP SEQUENCE "Pais_id_seq";
