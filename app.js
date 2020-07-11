require('dotenv').config()
var express =require('express');
var cors = require('cors');
var app = express();
var bodyParser=require('body-parser');
var logger = require('morgan');
app.use(cors());
var port = process.env.SERVER_PORT || 3000;

app.use(logger('dev'));
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

let path = './src/routes/'
var routes = require(path + 'routes');
var routeUsers = require(path + 'users');
var routePrivilege = require(path + 'privilege');
var routeTransaction = require(path + 'transaction');
var routeProduct = require(path + 'product');
var routeColor = require(path + 'color');

app.use('/color', routeColor);
app.use('/product', routeProduct);
app.use('/transaction', routeTransaction);
app.use('/privilege', routePrivilege);
app.use('/user', routeUsers);
app.use('/', routes);

app.listen(port);
module.exports.rootPath = __dirname
console.log("Started on server http://localhost:"+port);