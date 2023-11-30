-- CreateTable
CREATE TABLE "Pais" (
    "id" SERIAL NOT NULL,
    "sigla" VARCHAR(5) NOT NULL,
    "nome" VARCHAR(80) NOT NULL,
    "ddi" VARCHAR(3) NOT NULL,

    CONSTRAINT "Pais_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Estado" (
    "id" SERIAL NOT NULL,
    "nome" VARCHAR(30) NOT NULL,
    "paisId" INTEGER NOT NULL,

    CONSTRAINT "Estado_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Cidade" (
    "id" SERIAL NOT NULL,
    "nome" VARCHAR(80) NOT NULL,
    "estadoId" INTEGER NOT NULL,
    "ddd" VARCHAR(3) NOT NULL,

    CONSTRAINT "Cidade_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Pessoa" (
    "id" SERIAL NOT NULL,
    "categoria" JSONB NOT NULL,
    "tipoPessoa" VARCHAR(10) NOT NULL,
    "nome" VARCHAR(255) NOT NULL,
    "numDocumento" VARCHAR(20) NOT NULL,
    "rg" VARCHAR(15) NOT NULL,
    "criado_em" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "atualizado_em" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Pessoa_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "EnderecoPessoa" (
    "id" SERIAL NOT NULL,
    "pessoaId" INTEGER NOT NULL,
    "tipo" VARCHAR(10) NOT NULL,
    "tipoLogradouro" VARCHAR(10) NOT NULL,
    "logradouro" VARCHAR(255) NOT NULL,
    "numLogradouro" VARCHAR(10) NOT NULL,
    "complemento" VARCHAR(30) NOT NULL,
    "bairro" VARCHAR(80) NOT NULL,
    "cep" VARCHAR(10) NOT NULL,
    "cidadeId" INTEGER NOT NULL,

    CONSTRAINT "EnderecoPessoa_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ContatoPessoa" (
    "id" SERIAL NOT NULL,
    "pessoaId" INTEGER NOT NULL,
    "tipo" TEXT NOT NULL,
    "obs" TEXT NOT NULL,
    "descricao" VARCHAR(255) NOT NULL,

    CONSTRAINT "ContatoPessoa_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Pessoa_nome_key" ON "Pessoa"("nome");

-- CreateIndex
CREATE UNIQUE INDEX "ContatoPessoa_descricao_key" ON "ContatoPessoa"("descricao");

-- AddForeignKey
ALTER TABLE "Estado" ADD CONSTRAINT "Estado_paisId_fkey" FOREIGN KEY ("paisId") REFERENCES "Pais"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Cidade" ADD CONSTRAINT "Cidade_estadoId_fkey" FOREIGN KEY ("estadoId") REFERENCES "Estado"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EnderecoPessoa" ADD CONSTRAINT "EnderecoPessoa_pessoaId_fkey" FOREIGN KEY ("pessoaId") REFERENCES "Pessoa"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EnderecoPessoa" ADD CONSTRAINT "EnderecoPessoa_cidadeId_fkey" FOREIGN KEY ("cidadeId") REFERENCES "Cidade"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ContatoPessoa" ADD CONSTRAINT "ContatoPessoa_pessoaId_fkey" FOREIGN KEY ("pessoaId") REFERENCES "Pessoa"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
