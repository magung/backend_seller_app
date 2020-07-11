'use strict';
const express = require('express')
const Route = express.Router();

var Controller = require('../controllers/color')
const Auth = require('../helpers/auth')

Route
 // url pages and implementation routes
 .get('/', Controller.all)
 .get('/:color_id', Controller.get)
 .post('/', Controller.insert)
 .delete('/:color_id', Controller.delete)
 .put('/:color_id', Controller.update)
 module.exports = Route