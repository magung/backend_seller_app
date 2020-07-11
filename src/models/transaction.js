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
            let sql = `SELECT tr.*, py.payment_name, cs.customer_name, st.store_name FROM transaction tr
                        INNER JOIN payment py ON tr.payment_id = py.payment_id
                        INNER JOIN customer cs ON tr.customer_id = cs.customer_id
                        INNER JOIN store st ON tr.store_id = st.store_id
                        WHERE 1=1 ` + where
            connection.query( sql, (err, result) => {
                if(!err){resolve(result)}else{reject(err)}
            })
        })
    },

    getTransaction: (transaction_id) => {
        return new Promise((resolve, reject) => {
            let sql = `SELECT tr.*, py.payment_name, cs.customer_name, st.store_name FROM transaction tr
                        INNER JOIN payment py ON tr.payment_id = py.payment_id
                        INNER JOIN customer cs ON tr.customer_id = cs.customer_id
                        INNER JOIN store st ON tr.store_id = st.store_id 
                        WHERE tr.transaction_id = ? `
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