'use strict';
const connection = require('../database/conn')

module.exports = {
    register: (data, password)=>{
        return new Promise((resolve, reject)=>{
            //validation for email or username if already exist
            let regis = `INSERT INTO user SET ? , password = ?`;
            let qemail = `SELECT user_id FROM user WHERE email = ?`;

            connection.query(qemail, data.email, (err, result)=>{
                if (result.length > 0) {
                    reject(err),
                    console.log(err)
                } else {
                    connection.query(regis, [data, password], (err, result)=>{
                        if (!err) {
                            resolve(result)
                        } else {
                            reject(err)
                        }
                    })
                }
            })
            
        })
    },
   
    loginUser:(email, password)=>{
        return new Promise((resolve, reject)=>{
            let sql = "SELECT user_id, name, email, privilege_id FROM user WHERE email = ? AND password = ? "
            connection.query(sql, [email, password], (err, result)=>{
                if(!err){resolve(result)}else{reject(err)}
            })
        })
    },

    getUser:(where = "", data = [])=>{
        return new Promise((resolve, reject)=>{
            let sql = "SELECT usr.user_id, usr.name, usr.email, usr.privilege_id, prv.privilege, usr.picture " +
                        "FROM user usr LEFT JOIN privilege prv ON prv.privilege_id = usr.privilege_id WHERE 1=1 " + where

            connection.query(sql, data, (err, result)=>{
                if(!err){resolve(result)}else{reject(err)}
            })
        })
    },

    updateUser:(data, id)=>{
        return new Promise((resolve, reject)=>{
            connection.query(`UPDATE user set ? WHERE user_id = ? `, [data, id], (err, result)=>{
                if(!err){resolve(result)}else{reject(err)}
            })
        })
    },

    deleteUser:(id)=>{
        return new Promise((resolve, reject)=>{
            connection.query(`DELETE FROM user WHERE user_id = ?`, id, (err, result)=>{
                if(!err){resolve(result)}else{reject(err)}
            })
        })
    }
}