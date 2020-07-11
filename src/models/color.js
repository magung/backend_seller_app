'use strict';
const connection = require('../database/conn');

module.exports = {
    insert: (data) => {
        return new Promise((resolve, reject) =>{
            connection.query(`INSERT INTO color set ?`, data, (err, result)=>{
                if(!err){resolve(result)}else{reject(err)}
            })
        })
    },

    all: () => {
        return new Promise((resolve, reject) => {
            let sql = "SELECT * FROM color"
            connection.query( sql, (err, result) => {
                if(!err){resolve(result)}else{reject(err)}
            })
        })
    },

    get: (color_id) => {
        return new Promise((resolve, reject) => {
            let sql = "SELECT * FROM color WHERE color_id = ? "
            connection.query( sql, [color_id], (err, result) => {
                if(!err){resolve(result)}else{reject(err)}
            })
        })
    },

    delete: (color_id) => {
        return new Promise((resolve, reject) => {
            let sql = "DELETE FROM color WHERE color_id = ? "
            connection.query( sql, [color_id], (err, result) => {
                if(!err){resolve(result)}else{reject(err)}
            })
        })
    },

    update: (data, color_id) => {
        return new Promise((resolve, reject) =>{
            connection.query(`UPDATE color set ? WHERE color_id = ?`, [data, color_id], (err, result)=>{
                if(!err){resolve(result)}else{reject(err)}
            })
        })
    },
}