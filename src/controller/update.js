const sequelize = require("../database/db");
const jwt = require("jsonwebtoken");
const { JWT_SECRET } = require("../config/env.json");
const axios = require("axios");

//jwt verification can be implemented with a function but this will do for now.

async function updateGold(req,res){
    const token = req.body.token;
    const gold = req.body.gold;
    let userdata;
    try {
        userdata = jwt.verify(token, JWT_SECRET);
    } catch (error) {
        return res.status(401).send({message:"Token tidak valid"})
    }

}

async function getGold(req,res){
    const token = req.header("token");
    let userdata;
    try {
        userdata = jwt.verify(token, JWT_SECRET);
    } catch (error) {
        console.log(error);
        return res.status(401).send({message:"Token tidak valid"})
    }
    let username= userdata.name;
    console.log(username);
    let url = "http://localhost:8000/gold";
    url+=`?username=${username}`;
    let result = await axios.get(url);
    console.log(result.data.gold);
    return res.status(200).send("done");

}

async function registerGold(req,res){
    const token = req.body.token;
    let userdata;
    try {
        userdata = jwt.verify(token, JWT_SECRET);
    } catch (error) {
        return res.status(401).send({message:"Token tidak valid"})
    }

}

module.exports = {
    getGold
}






