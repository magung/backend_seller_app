'use strict';
const connection = require('../database/conn');

module.exports = {
    insertPrivilege: (data) => {
        return new Promise((resolve, reject) =>{
            connection.query(`INSERT INTO privilege set ?`, data, (err, result)=>{
                if(!err){resolve(result)}else{reject(err)}
            })
        })
    },

    allPrivilege: () => {
        return new Promise((resolve, reject) => {
            let sql = "SELECT privilege_id, privilege FROM privilege"
            connection.query( sql, (err, result) => {
                if(!err){resolve(result)}else{reject(err)}
            })
        })
    },

    getPrivilege: (privilege_id) => {
        return new Promise((resolve, reject) => {
            let sql = "SELECT privilege_id, privilege FROM privilege WHERE privilege_id = ? "
            connection.query( sql, [privilege_id], (err, result) => {
                if(!err){resolve(result)}else{reject(err)}
            })
        })
    },

    deletePrivilege: (privilege_id) => {
        return new Promise((resolve, reject) => {
            let sql = "DELETE FROM privilege WHERE privilege_id = ? "
            connection.query( sql, [privilege_id], (err, result) => {
                if(!err){resolve(result)}else{reject(err)}
            })
        })
    },

    updatePrivilege: (data, privilege_id) => {
        return new Promise((resolve, reject) =>{
            connection.query(`UPDATE privilege set ? WHERE privilege_id = ?`, [data, privilege_id], (err, result)=>{
                if(!err){resolve(result)}else{reject(err)}
            })
        })
    },
}