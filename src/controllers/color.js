'use strict';
var response = require('../res');
var model = require('../models/color');
const moment = require('moment');
module.exports = {
	
	insert: async (req, res, next) => {
        try{
            let data = {
                color_name : req.body.color_name
            }
    
            await model.insert(data)
            .then(result => {
                data.color_id = result.insertId
                return response.dataManipulation(res, 200, "Success create color", data)
            })
            .catch(err=>{
                console.log(err)
                return response.dataManipulation(res, 500, "Failed create color")
            })
        } catch(e) {
            next(e)
        }
    },

    all: async (req, res, next) => {
        try{
            await model.all()
            .then(result => {
                return response.dataManipulation(res, 200, "Success get all color", result)
            })
            .catch(err=>{
                console.log(err)
                return response.dataManipulation(res, 500, "Failed get all color")
            })
        } catch(e) {
            next(e)
        }
    },

    get: async (req, res, next) => {
        try{
            let color_id = parseInt(req.params.color_id)
            await model.get(color_id)
            .then(result => {
                return response.dataManipulation(res, 200, "Success get color", result)
            })
            .catch(err=>{
                console.log(err)
                return response.dataManipulation(res, 500, "Failed get color")
            })
        } catch(e) {
            next(e)
        }
    },

    delete: async (req, res, next) => {
        try{
            let color_id = parseInt(req.params.color_id)
            await model.delete(color_id)
            .then(result => {
                if(result.affectedRows > 0){
					return response.dataManipulation(res, 200, "Success delete color")
				}else{
					return response.dataManipulation(res, 201, "Failed delete color")
				}
            })
            .catch(err=>{
                console.log(err)
                return response.dataManipulation(res, 500, "Failed delete color")
            })
        } catch(e) {
            next(e)
        }
    },

    update: async (req, res, next) => {
        try{
            let color_id = req.params.color_id
            let data = {
                color_name : req.body.color_name
            }
            await model.update(data, color_id)
            .then(result => {
                if(result.affectedRows > 0){
					return response.dataManipulation(res, 200, "Success update color", data)
				}else{
					return response.dataManipulation(res, 201, "Failed update color")
				}
            })
            .catch(err=>{
                console.log(err)
                return response.dataManipulation(res, 500, "Failed update color")
            })
        } catch(e) {
            next(e)
        }
    }
    
}