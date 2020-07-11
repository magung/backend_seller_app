'use strict';
const express = require('express')
const Route = express.Router();

var Controller = require('../controllers/privilege')
const Auth = require('../helpers/auth')

Route
 // url pages and implementation routes
 .get('/', Controller.allPrivilege)
 .get('/:privilege_id', Controller.getPrivilege)
 .post('/', Controller.insertPrivilege)
 .delete('/:privilege_id', Controller.deletePrivilege)
 .put('/:privilege_id', Controller.updatePrivilege)
 module.exports = Route