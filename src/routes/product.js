'use strict';
const express = require('express')
const Route = express.Router();

var Controller = require('../controllers/product')
const Auth = require('../helpers/auth')

Route
 // url pages and implementation routes
 .get('/', Controller.allProduct)
 .get('/:product_id', Controller.getProduct)
 .post('/', Auth.verifyToken, Controller.insertProduct)
 .delete('/:product_id', Controller.deleteProduct)
 .put('/:product_id', Controller.updateProduct)
 module.exports = Route