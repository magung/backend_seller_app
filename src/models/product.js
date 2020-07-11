'use strict';
const connection = require('../database/conn');

module.exports = {
    insertProduct: (data) => {
        return new Promise((resolve, reject) =>{
            connection.query(`INSERT INTO product set ?`, data, (err, result)=>{
                if(!err){resolve(result)}else{reject(err)}
            })
        })
    },

    allProduct: (where = "") => {
        return new Promise((resolve, reject) => {
            let sql = "SELECT * FROM product WHERE 1=1 " + where
            connection.query( sql, (err, result) => {
                if(!err){resolve(result)}else{reject(err)}
            })
        })
    },

    getProduct: (product_id) => {
        return new Promise((resolve, reject) => {
            let sql = "SELECT * FROM product WHERE product_id = ? "
            connection.query( sql, [product_id], (err, result) => {
                if(!err){resolve(result)}else{reject(err)}
            })
        })
    },

    deleteProduct: (product_id) => {
        return new Promise((resolve, reject) => {
            let sql = "DELETE FROM product WHERE product_id = ? "
            connection.query( sql, [product_id], (err, result) => {
                if(!err){resolve(result)}else{reject(err)}
            })
        })
    },

    updateProduct: (data, product_id) => {
        return new Promise((resolve, reject) =>{
            connection.query(`UPDATE product set ? WHERE product_id = ?`, [data, product_id], (err, result)=>{
                if(!err){resolve(result)}else{reject(err)}
            })
        })
    }
}