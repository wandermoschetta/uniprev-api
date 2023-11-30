var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
var app = express();
const cors = require('cors');
const { urlBase } = require('./config.json');


var indexRouter = require('./routes/index');
var pessoaRouter = require('./routes/pessoa');
var paisRouter = require('./routes/pais');
var estadoRouter = require('./routes/estado');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(cors());


app.use(`${urlBase}`, indexRouter);
app.use(`${urlBase}`, pessoaRouter);
app.use(`${urlBase}`, paisRouter);
app.use(`${urlBase}`, estadoRouter);



app.use(function(req, res, next) {
  next(createError(404));
});
  
  
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};
  
  // render the error page
  res.status(err.status || 500);
  //res.render('error');
  res.json({erro:err.status, mensagem:"url não encontrada"});
});

  
module.exports = app;