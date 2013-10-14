
/**
 * Module dependencies.
 */

var express = require('express');
var routes = require('./routes');
var user = require('./routes/user');
var jadwal = require('./routes/jadwal');
var http = require('http');
var path = require('path');
var Sequelize = require('sequelize');
var db = require('./db');
var sequelize = new Sequelize('jadwal','root','',{  disableTableNameModification: true});
var models = db.models(sequelize,Sequelize);
var app = express();

// all environments
app.set('port', process.env.PORT || 3000);
app.set('views', __dirname + '/views');
app.set('view engine', 'jade');
app.use(express.favicon());
app.use(express.logger('dev'));
app.use(express.bodyParser());
app.use(express.methodOverride());
app.use(express.cookieParser('your secret here'));
app.use(express.session());
app.use(app.router);
app.use(express.static(path.join(__dirname, 'public')));
app.set('x','variableX');
// development only
if ('development' == app.get('env')) {
  app.use(express.errorHandler());
}
app.set('models',models);
app.get('/', routes.index);
app.get('/users', user.list);
app.get('/aktivitas', jadwal.aktivitas);
app.get('/jadwal', jadwal.list);

http.createServer(app).listen(app.get('port'), function(){
  console.log('Express server listening on port ' + app.get('port'));
});


