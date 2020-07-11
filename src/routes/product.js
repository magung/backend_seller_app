'use strict';
const express = require('express')
const Route = express.Router();
const app = require('../../app')
const multer = require('multer');
const moment = require('moment');
var Controller = require('../controllers/product')
const Auth = require('../helpers/auth')
//Multer
const storage = multer.diskStorage({
    destination: function(req, file, cb){
        cb(null, './uploads/image_product')
    },
    filename: function(req, file, cb){
        cb(null, moment().format('YYYY-MM-DD HH:mm:ss') + " - "+file.originalname)
    }
});
const upload = multer({storage})

Route
 // url pages and implementation routes
 .get('/image/:name', (req, res) => {
    res.sendFile(app.rootPath + '/uploads/image_product/' + req.params.name)
})
 .get('/', Controller.allProduct)
 .get('/:product_id', Controller.getProduct)
 .post('/', Auth.verifyToken, upload.single('picture'), Controller.insertProduct)
 .delete('/:product_id', Controller.deleteProduct)
 .put('/:product_id', Auth.verifyToken, upload.single('picture'), Controller.updateProduct)
 module.exports = Route