/*
  Warnings:

  - Added the required column `empresaId` to the `Pessoa` table without a default value. This is not possible if the table is not empty.

*/
-- CreateEnum
CREATE TYPE "TipoEmpresa" AS ENUM ('MATRIZ', 'FILIAL', 'GERENCIAL');

-- CreateEnum
CREATE TYPE "Status" AS ENUM ('ATIVO', 'CANCELADO');

-- AlterTable
ALTER TABLE "Pessoa" ADD COLUMN     "empresaId" INTEGER NOT NULL,
ADD COLUMN     "status" "Status" NOT NULL DEFAULT 'ATIVO';

-- CreateTable
CREATE TABLE "Empresa" (
    "id" SERIAL NOT NULL,
    "tipo" "TipoEmpresa" NOT NULL DEFAULT 'GERENCIAL',
    "status" "Status" NOT NULL DEFAULT 'ATIVO',
    "nomeEmpresarial" VARCHAR(255) NOT NULL,
    "nomeFantasia" VARCHAR(255) NOT NULL,
    "cnpj" VARCHAR(20) NOT NULL,
    "inscricaoMunicipal" VARCHAR(20) NOT NULL,
    "inscricaoEstadual" VARCHAR(20) NOT NULL,
    "telefone" VARCHAR(15) NOT NULL,
    "celular" VARCHAR(15) NOT NULL,
    "endereco" VARCHAR(255) NOT NULL,
    "numEndereco" VARCHAR(10) NOT NULL,
    "complemento" VARCHAR(30) NOT NULL,
    "bairro" VARCHAR(80) NOT NULL,
    "cep" VARCHAR(10) NOT NULL,
    "cidadeId" INTEGER NOT NULL,

    CONSTRAINT "Empresa_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Empresa_nomeEmpresarial_key" ON "Empresa"("nomeEmpresarial");

-- CreateIndex
CREATE UNIQUE INDEX "Empresa_nomeFantasia_key" ON "Empresa"("nomeFantasia");

-- CreateIndex
CREATE UNIQUE INDEX "Empresa_cnpj_key" ON "Empresa"("cnpj");

-- AddForeignKey
ALTER TABLE "Empresa" ADD CONSTRAINT "Empresa_cidadeId_fkey" FOREIGN KEY ("cidadeId") REFERENCES "Cidade"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Pessoa" ADD CONSTRAINT "Pessoa_empresaId_fkey" FOREIGN KEY ("empresaId") REFERENCES "Empresa"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
