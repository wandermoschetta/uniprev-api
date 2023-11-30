var express = require('express');
var router = express.Router();

const { PrismaClient } = require('@prisma/client')
const prisma = new PrismaClient()

const config = require('../config.json');

router.get('/estados', async function(req, res, next) {
    let estado = await prisma.estado.findMany();
    
    res.json(estado);
});

router.get('/estado/:id', async function(req, res, next) {
    const { id } = req.params;
    let _status = 200;

    let estado = await prisma.estado.findUnique({
        where: {
            id: Number(id),
        },
    });
        
    if(estado == null){
        _status = 404; 
        estado  = {erro:_status,mensagem:"Estado não encontrado"};
    }
    
    res.status(_status).json(estado);
});

module.exports = router;