const sequelize = require("../database/db");
const jwt = require("jsonwebtoken");
const { JWT_SECRET } = require("../config/env.json");
const axios = require("axios");

//jwt verification can be implemented with a function but this will do for now.

async function updateGold(req,res){
    const token = req.header("token");
    const gold = req.query.gold;
    let userdata;
    try {
        userdata = jwt.verify(token, JWT_SECRET);
    } catch (error) {
        return res.status(401).send({message:"Token tidak valid"})
    }

    const username = userdata.name;
    const url = `http://localhost:8000/transaction?username=${username}&gold=${gold}`;
    let result = await axios.get(url);
    console.log(result.data);
    

}

async function playerDefined(){
    let foo = await sequelize.query(
        `select COUNT(*) as count from player`,{
        }
    )
    let count =  foo[0][0].count;
    if(count==0) return false;
    return true;
}

async function getPlayer(req,res){
    let player = {
        x : 1,
        y: 1,
        gold: 500
    }

    let [result, metadata] = await sequelize.query(`SELECT * from player`);
    player.x = result[0].x;
    player.y = result[0].y;
    player.gold = result[0].gold;
    return res.status(200).send(result[0]);
}

async function initializePlayerData(req,res){
    const {x,y,energy} = req.query;
    const defined = await playerDefined();
    if(!defined){
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
    updatePlayer,
    getPlayer,
    updateGold
}






