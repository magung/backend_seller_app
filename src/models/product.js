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
            let sql = `SELECT pr.*, ct.category_name, wr.warranty_name, st.store_name, prd.period_name FROM product pr 
                        INNER JOIN category ct ON pr.category_id = ct.category_id
                        INNER JOIN warranty wr ON pr.warranty_id = wr.warranty_id
                        INNER JOIN store st ON pr.store_id = st.store_id
                        INNER JOIN period prd ON pr.period_id = prd.period_id
                        WHERE 1=1 ` + where
            connection.query( sql, (err, result) => {
                if(!err){resolve(result)}else{reject(err)}
            })
        })
    },

    getProduct: (product_id) => {
        return new Promise((resolve, reject) => {
            let sql = `SELECT pr.*, ct.category_name, wr.warranty_name, st.store_name, prd.period_name FROM product pr  
                        INNER JOIN category ct ON pr.category_id = ct.category_id
                        INNER JOIN warranty wr ON pr.warranty_id = wr.warranty_id
                        INNER JOIN store st ON pr.store_id = st.store_id
                        INNER JOIN period prd ON pr.period_id = prd.period_id
                        WHERE product_id = ? `
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