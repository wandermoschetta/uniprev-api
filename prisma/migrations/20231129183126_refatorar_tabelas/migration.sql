/*
  Warnings:

  - Changed the type of `tipo` on the `ContatoPessoa` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- CreateEnum
CREATE TYPE "TipoContato" AS ENUM ('CELULAR', 'TELEFONE', 'EMAIL', 'REDE_SOCIAL');

-- DropForeignKey
ALTER TABLE "Empresa" DROP CONSTRAINT "Empresa_cidadeId_fkey";

-- AlterTable
ALTER TABLE "Cidade" ALTER COLUMN "ddd" DROP NOT NULL,
ALTER COLUMN "cod_tom" DROP NOT NULL,
ALTER COLUMN "ibge" DROP NOT NULL,
ALTER COLUMN "lat_lon" DROP NOT NULL,
ALTER COLUMN "latitude" DROP NOT NULL,
ALTER COLUMN "longitude" DROP NOT NULL;

-- AlterTable
ALTER TABLE "ContatoPessoa" DROP COLUMN "tipo",
ADD COLUMN     "tipo" "TipoContato" NOT NULL,
ALTER COLUMN "obs" DROP NOT NULL;

-- AlterTable
ALTER TABLE "Empresa" ALTER COLUMN "tipo" SET DEFAULT 'FILIAL',
ALTER COLUMN "nomeFantasia" DROP NOT NULL,
ALTER COLUMN "inscricaoMunicipal" DROP NOT NULL,
ALTER COLUMN "inscricaoEstadual" DROP NOT NULL,
ALTER COLUMN "telefone" DROP NOT NULL,
ALTER COLUMN "celular" DROP NOT NULL,
ALTER COLUMN "endereco" DROP NOT NULL,
ALTER COLUMN "numEndereco" DROP NOT NULL,
ALTER COLUMN "complemento" DROP NOT NULL,
ALTER COLUMN "bairro" DROP NOT NULL,
ALTER COLUMN "cep" DROP NOT NULL,
ALTER COLUMN "cidadeId" DROP NOT NULL;

-- AlterTable
ALTER TABLE "EnderecoPessoa" ALTER COLUMN "numLogradouro" DROP NOT NULL,
ALTER COLUMN "numLogradouro" SET DEFAULT 'S/N',
ALTER COLUMN "complemento" DROP NOT NULL;

-- AlterTable
ALTER TABLE "Estado" ALTER COLUMN "ddd" DROP NOT NULL,
ALTER COLUMN "ibge" DROP NOT NULL;

-- AlterTable
ALTER TABLE "Pais" ALTER COLUMN "sigla" DROP NOT NULL,
ALTER COLUMN "nome" DROP NOT NULL,
ALTER COLUMN "ddi" DROP NOT NULL,
ALTER COLUMN "bacen" DROP NOT NULL;

-- AlterTable
ALTER TABLE "Pessoa" ALTER COLUMN "tipoPessoa" DROP NOT NULL,
ALTER COLUMN "numDocumento" DROP NOT NULL,
ALTER COLUMN "rg" DROP NOT NULL;

-- AddForeignKey
ALTER TABLE "Empresa" ADD CONSTRAINT "Empresa_cidadeId_fkey" FOREIGN KEY ("cidadeId") REFERENCES "Cidade"("id") ON DELETE SET NULL ON UPDATE CASCADE;
