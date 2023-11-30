var express = require('express');
var router = express.Router();


router.get('/pessoas', function(req, res, next) {
    res.status(200).json({message: "vc esta na pessoas..."});
});


module.exports = router;