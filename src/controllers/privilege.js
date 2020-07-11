'use strict';
var response = require('../res');
var model = require('../models/privilege');
const moment = require('moment');
module.exports = {
	
	insertPrivilege: async (req, res, next) => {
        try{
            let data = {
                privilege : req.body.privilege
            }
    
            await model.insertPrivilege(data)
            .then(result => {
                data.privilege_id = result.insertId
                return response.dataManipulation(res, 200, "Success create privilege", data)
            })
            .catch(err=>{
                console.log(err)
                return response.dataManipulation(res, 500, "Failed create privilege")
            })
        } catch(e) {
            next(e)
        }
    },

    allPrivilege: async (req, res, next) => {
        try{
            await model.allPrivilege()
            .then(result => {
                return response.dataManipulation(res, 200, "Success get all privilege", result)
            })
            .catch(err=>{
                console.log(err)
                return response.dataManipulation(res, 500, "Failed get all privilege")
            })
        } catch(e) {
            next(e)
        }
    },

    getPrivilege: async (req, res, next) => {
        try{
            let privilege_id = parseInt(req.params.privilege_id)
            await model.getPrivilege(privilege_id)
            .then(result => {
                return response.dataManipulation(res, 200, "Success get privilege", result)
            })
            .catch(err=>{
                console.log(err)
                return response.dataManipulation(res, 500, "Failed get privilege")
            })
        } catch(e) {
            next(e)
        }
    },

    deletePrivilege: async (req, res, next) => {
        try{
            let privilege_id = parseInt(req.params.privilege_id)
            await model.deletePrivilege(privilege_id)
            .then(result => {
                if(result.affectedRows > 0){
					return response.dataManipulation(res, 200, "Success delete privilege")
				}else{
					return response.dataManipulation(res, 201, "Failed delete privilege")
				}
            })
            .catch(err=>{
                console.log(err)
                return response.dataManipulation(res, 500, "Failed delete privilege")
            })
        } catch(e) {
            next(e)
        }
    },

    updatePrivilege: async (req, res, next) => {
        try{
            let privilege_id = req.params.privilege_id
            let data = {
                privilege : req.body.privilege,
                updated_date : moment().format('YYYY-MM-DD HH:mm:ss')
            }
            await model.updatePrivilege(data, privilege_id)
            .then(result => {
                if(result.affectedRows > 0){
					return response.dataManipulation(res, 200, "Success update privilege", data)
				}else{
					return response.dataManipulation(res, 201, "Failed update privilege")
				}
            })
            .catch(err=>{
                console.log(err)
                return response.dataManipulation(res, 500, "Failed update privilege")
            })
        } catch(e) {
            next(e)
        }
    }
    
}