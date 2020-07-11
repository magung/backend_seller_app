'use strict';
const connection = require('../database/conn');

module.exports = {
    insertTransaction: (data) => {
        return new Promise((resolve, reject) =>{
            connection.query(`INSERT INTO transaction set ?`, data, (err, result)=>{
                if(!err){resolve(result)}else{reject(err)}
            })
        })
    },

    allTransaction: (where = "") => {
        return new Promise((resolve, reject) => {
            let sql = "SELECT * FROM transaction WHERE 1=1 " + where
            connection.query( sql, (err, result) => {
                if(!err){resolve(result)}else{reject(err)}
            })
        })
    },

    getTransaction: (transaction_id) => {
        return new Promise((resolve, reject) => {
            let sql = "SELECT * FROM transaction WHERE transaction_id = ? "
            connection.query( sql, [transaction_id], (err, result) => {
                if(!err){resolve(result)}else{reject(err)}
            })
        })
    },

    deleteTransaction: (transaction_id) => {
        return new Promise((resolve, reject) => {
            let sql = "DELETE FROM transaction WHERE transaction_id = ? "
            connection.query( sql, [transaction_id], (err, result) => {
                if(!err){resolve(result)}else{reject(err)}
            })
        })
    },

    updateTransaction: (data, transaction_id) => {
        return new Promise((resolve, reject) =>{
            connection.query(`UPDATE transaction set ? WHERE transaction_id = ?`, [data, transaction_id], (err, result)=>{
                if(!err){resolve(result)}else{reject(err)}
            })
        })
    },
}