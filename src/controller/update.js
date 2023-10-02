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

async function initializePlayerData(req,res){
    const {x,y,energy} = req.query;
    let foo = await sequelize.query(`TRUNCATE TABLE player`);
    if(!foo){
        return res.status(500).send({msg:"error"}) //i forgor apa code yang bener buat server error
    }
    foo = await sequelize.query(`INSERT INTO player (x, y, energy) VALUES (:x, :y, :energy)`,{
        replacements:{
            x:x,
            y:y,
            energy:energy
        }
    })
    if(!foo){
        return res.status(500).send({msg:"error"})
    }
    return res.status(200).send("OK");
}

async function updatePlayer(req,res){
    //save x,y,energy values from player to db
    const {x,y,energy} = req.query;
    let foo = await sequelize.query(
        `UPDATE player SET x=:x, y=:y, energy=:energy`,{
            replacements:{
                x:x,
                y:y,
                energy:energy
            }
        }
    )
    if(!foo){
        return res.status(500).send({msg:"error"})
    }
    console.log("updated player!");
    return res.status(200).send("OK");
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
    getGold,
    initializePlayerData,
    updatePlayer
}






