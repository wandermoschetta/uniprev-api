var express = require('express');
var router = express.Router();

const config = require('../config.json');


router.get('/', function(req, res, next) {
    res.status(200).json({message: "vc esta na home..."});
});


module.exports = router;