var express = require('express');
var router = express.Router();

const { PrismaClient } = require('@prisma/client')
const prisma = new PrismaClient()

const config = require('../config.json');


router.get('/pais', async function(req, res, next) {
    let pais = await prisma.pais.findMany();
    
    res.json(pais);
});

router.get('/pais/:id', async function(req, res, next) {
    const { id } = req.params;
    let _status = 200;

    let pais = await prisma.pais.findUnique({
        where: {
            id: Number(id),
        },
    });
        
    if(pais == null){
        _status = 404; 
        pais  = {erro:_status,mensagem:"Pais não encontrado"};
    }
    
    res.status(_status).json(pais);
});

module.exports = router;