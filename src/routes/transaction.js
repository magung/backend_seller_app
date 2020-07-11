'use strict';
const express = require('express')
const Route = express.Router();

var Controller = require('../controllers/transaction')
const Auth = require('../helpers/auth')

Route
 // url pages and implementation routes
 .get('/', Controller.allTransaction)
 .get('/:transaction_id', Controller.getTransaction)
 .post('/', Auth.verifyToken, Controller.insertTransaction)
 .delete('/:transaction_id',  Auth.verifyToken, Controller.deleteTransaction)
 .put('/:transaction_id',  Auth.verifyToken, Controller.updateTransaction)
 module.exports = Route