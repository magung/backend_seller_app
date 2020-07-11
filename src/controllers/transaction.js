'use strict';
var response = require('../res');
var model = require('../models/transaction');
var modelProduct = require('../models/product');
const moment = require('moment');
module.exports = {
	
	insertTransaction: async (req, res, next) => {
        try{
            let data = {
                price : req.body.price,
                product_id : req.body.product_id,
                created_date : moment().format('YYYY-MM-DD HH:mm:ss'),
                payment_id : req.body.payment_id,
                customer_id : req.body.customer_id,
                notes : req.body.notes,
                store_id: req.body.store_id
                // picture : req.body.picture
            }
    
            await model.insertTransaction(data)
            .then(result => {
                data.transaction_id = result.insertId
                return response.dataManipulation(res, 200, "Success create transaction", data)
            })
            .catch(err=>{
                console.log(err)
                return response.dataManipulation(res, 500, "Failed create transaction")
            })
        } catch(e) {
            next(e)
        }
    },

    allTransaction: async (req, res, next) => {
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
                where += ` AND tr.created_date LIKE "%${search}%"`
            }
            if(store_id){
                where += ` AND tr.store_id = ` + store_id
            }
            where += " ORDER BY " + sortBy + " " + sort + " LIMIT " + skip + ", " + limit
            await model.allTransaction(where)
            .then(result => {
                return response.dataManipulation(res, 200, "Success get all transaction", result)
            })
            .catch(err=>{
                console.log(err)
                return response.dataManipulation(res, 500, "Failed get all transaction")
            })
        } catch(e) {
            next(e)
        }
    },

    getTransaction: async (req, res, next) => {
        try{
            let transaction_id = parseInt(req.params.transaction_id)
            await model.getTransaction(transaction_id)
            .then(async result => {
                let product_id = result[0].product_id.split(',')
                let product = []
                for(let i =0; i< product_id.length; i++){
                    await modelProduct.getProduct(product_id[i])
                    .then(res => {
                        product.push(res[0])
                    })
                }
                result[0].product = product
                return response.dataManipulation(res, 200, "Success get transaction", result[0])
            })
            .catch(err=>{
                console.log(err)
                return response.dataManipulation(res, 500, "Failed get transaction")
            })
        } catch(e) {
            next(e)
        }
    },

    deleteTransaction: async (req, res, next) => {
        try{
            let transaction_id = parseInt(req.params.transaction_id)
            await model.deleteTransaction(transaction_id)
            .then(result => {
                if(result.affectedRows > 0){
					return response.dataManipulation(res, 200, "Success delete transaction")
				}else{
					return response.dataManipulation(res, 201, "Failed delete transaction")
				}
            })
            .catch(err=>{
                console.log(err)
                return response.dataManipulation(res, 500, "Failed delete transaction")
            })
        } catch(e) {
            next(e)
        }
    },

    updateTransaction: async (req, res, next) => {
        try{
            let transaction_id = req.params.transaction_id
            let data = {
                updated_date : moment().format('YYYY-MM-DD HH:mm:ss')
            }
            if(req.body.price) {
                data.price = req.body.price
            }
            if(req.body.product_id) {
                data.product_id = req.body.product_id
            }
            if(req.body.payment_id) {
                data.payment_id = req.body.payment_id
            }
            if(req.body.customer_id) {
                data.customer_id = req.body.customer_id
            }
            if(req.body.notes) {
                data.notes = req.body.notes
            }
            if(req.body.store_id) {
                data.store_id = req.body.store_id
            }
            await model.updateTransaction(data, transaction_id)
            .then(result => {
                if(result.affectedRows > 0){
					return response.dataManipulation(res, 200, "Success update transaction", data)
				}else{
					return response.dataManipulation(res, 201, "Failed update transaction")
				}
            })
            .catch(err=>{
                console.log(err)
                return response.dataManipulation(res, 500, "Failed update transaction")
            })
        } catch(e) {
            next(e)
        }
    }
    
}