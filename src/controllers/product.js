'use strict';
var response = require('../res');
var model = require('../models/product');
var modelColor = require('../models/color');
const moment = require('moment');
const fs = require('fs')
const app = require('../../app')
module.exports = {
	
	insertProduct: async (req, res, next) => {
        try{
            let data = {
                product_name : req.body.product_name,
                category_id : req.body.category_id,
                price : req.body.price,
                spesification : req.body.spesification,
                warranty_id : req.body.warranty_id,
                color_id : req.body.color_id,
                picture : req.file.filename,
                notes : req.body.notes,
                store_id : req.body.store_id,
                period_id: req.body.period_id
            }

            if(data.warranty_id == 1 && data.period_id != 1){
                return response.dataManipulation(res, 201, "Failed create product, because period and warranty not match")
            }
    
            await model.insertProduct(data)
            .then(result => {
                data.product_id = result.insertId
                return response.dataManipulation(res, 200, "Success create product", data)
            })
            .catch(err=>{
                console.log(err)
                return response.dataManipulation(res, 500, "Failed create product")
            })
        } catch(e) {
            next(e)
        }
    },

    allProduct: async (req, res, next) => {
        try{
            let sortBy = req.query.sort_by || ' created_date '
            let sort = req.query.sort || ' DESC '
            let limit = parseInt(req.query.limit) || 10
            let page = parseInt(req.query.page) || 1
            let skip = (page - 1) * limit
            let search = req.query.search
            let store_id = req.query.store_id
    
            let where = ""
            if(search){
                where += ` AND created_date LIKE "%${search}%"`
            }
            if(store_id){
                where += ` AND store_id = ` + store_id
            }
            where += " ORDER BY " + sortBy + " " + sort + " LIMIT " + skip + ", " + limit
            await model.allProduct(where)
            .then(async result => {
                for(let key = 0; key < result.length;key++){
                    let color_id = result[key].color_id.split(',')
                    let color = []
                    for(let i =0; i< color_id.length; i++){
                        await modelColor.get(color_id[i])
                        .then(res => {
                            color.push(res[0])
                        })
                    }
                    result[key].color = color
                }
                return response.dataManipulation(res, 200, "Success get all product", result)
            })
            .catch(err=>{
                console.log(err)
                return response.dataManipulation(res, 500, "Failed get all product")
            })
        } catch(e) {
            next(e)
        }
    },

    getProduct: async (req, res, next) => {
        try{
            let product_id = parseInt(req.params.product_id)
            await model.getProduct(product_id)
            .then(async result => {
                let color_id = result[0].color_id.split(',')
                let color = []
                for(let i =0; i< color_id.length; i++){
                    await modelColor.get(color_id[i])
                    .then(res => {
                        color.push(res[0])
                    })
                }
                result[0].color = color
                return response.dataManipulation(res, 200, "Success get product", result[0])
            })
            .catch(err=>{
                console.log(err)
                return response.dataManipulation(res, 500, "Failed get product")
            })
        } catch(e) {
            next(e)
        }
    },

    deleteProduct: async (req, res, next) => {
        try{
            let product_id = parseInt(req.params.product_id)
            await model.getProduct(product_id)
            .then(async result => {
                fs.unlinkSync(app.rootPath + '/uploads/image_product/' + result[0].picture)
            })
            await model.deleteProduct(product_id)
            .then(result => {
                if(result.affectedRows > 0){
					return response.dataManipulation(res, 200, "Success delete product")
				}else{
					return response.dataManipulation(res, 201, "Failed delete product")
				}
            })
            .catch(err=>{
                console.log(err)
                return response.dataManipulation(res, 500, "Failed delete product")
            })
        } catch(e) {
            next(e)
        }
    },

    updateProduct: async (req, res, next) => {
        try{
            let product_id = req.params.product_id
            let data = {
                updated_date : moment().format('YYYY-MM-DD HH:mm:ss')
            }
            if(req.body.product_name) {
                data.product_name = req.body.product_name
            }
            if(req.body.category_id) {
                data.category_id = req.body.category_id
            }
            if(req.body.price) {
                data.price = req.body.price
            }
            if(req.body.spesification) {
                data.spesification = req.body.spesification
            }
            if(req.body.warranty_id) {
                data.warranty_id = req.body.warranty_id
            }
            if(req.body.color_id) {
                data.color_id = req.body.color_id
            }
            if(req.body.period_id){
                data.period_id = req.body.period_id
                if(data.warranty_id == 1 && data.period_id != 1){
                    return response.dataManipulation(res, 201, "Failed update product, because period and warranty not match")
                }
            }
            if(req.file) {
                await model.getProduct(product_id)
                .then(async result => {
                    fs.unlinkSync(app.rootPath + '/uploads/image_product/' + result[0].picture)
                })
                data.picture = req.file.filename
            }
            if(req.body.notes) {
                data.notes = req.body.notes
            }
            if(req.body.store_id) {
                data.store_id = req.body.store_id
            }
            await model.updateProduct(data, product_id)
            .then(result => {
                if(result.affectedRows > 0){
					return response.dataManipulation(res, 200, "Success update product", data)
				}else{
					return response.dataManipulation(res, 201, "Failed update product")
				}
            })
            .catch(err=>{
                console.log(err)
                return response.dataManipulation(res, 500, "Failed update product")
            })
        } catch(e) {
            next(e)
        }
    },
    
}