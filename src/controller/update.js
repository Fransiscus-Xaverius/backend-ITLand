const sequelize = require("../database/db");
const jwt = require("jsonwebtoken");
const { JWT_SECRET, MASTER_API_URL } = require("../config/env.json");
const axios = require("axios");

//jwt verification can be implemented with a function but this will do for now.

async function updateGold(req, res) {
    const token = req.header("token");
    const gold = req.query.gold;
    let userdata;
    try {
        userdata = jwt.verify(token, JWT_SECRET);
    } catch (error) {
        return res.status(401).send({ message: "Token tidak valid" })
    }

    const username = userdata.name;

    const url = `${MASTER_API_URL}/gold?username=${username}&amount=${gold}`;
    let result = await axios.post(url);

    return res.status(200).send({ msg: "OK" });
}

async function Attack(req, res) {
    const username = req.query.username;
    const gold = req.query.gold;
    const url = `${MASTER_API_URL}/gold?username=${username}&amount=${gold}`;
    let result = await axios.post(url);
    return res.status(200).send({ msg: "OK" });
}

async function playerDefined() {
    let foo = await sequelize.query(
        `select COUNT(*) as count from player`, {
        }
    )
    let count = foo[0][0].count;
    console.log("player data : " + count);
    if (count == 0) return false;

    foo = await sequelize.query(
        `select COUNT(*) as count from inventory`, {}
    )
    let inven = foo[0][0].count;    

    if(inven==0||count==0) return false;

    return true;
}

async function getPlayer(req, res) {
    let player = {
        x: 1,
        y: 1,
        gold: 500
    }

    let [result, metadata] = await sequelize.query(`SELECT * from player`);
    console.log(result[0]);
    // player.x = result[0].x;
    // player.y = result[0].y;
    // player.gold = result[0].gold;
    return res.status(200).send(result[0]);
}

async function initializePlayerData(req, res) {
    const { x, y, energy, username } = req.query;
    const defined = await playerDefined();
    if (!defined) {
        foo = await sequelize.query(`INSERT INTO player (x, y, energy) VALUES (:x, :y, :energy)`, {
            replacements: {
                x: x,
                y: y,
                energy: energy
            }
        })
        if (!foo) {
            return res.status(500).send({ msg: "error" })
        }

        foo = await sequelize.query(`INSERT INTO inventory (username, B1_amount, B2_amount, B3_amount, pickaxeLevel, shovelLevel, swordLevel) VALUES (:username, 0, 0, 0, 0, 0, 0)`, {
            replacements:{
                username:username
            }
        })

        if(!foo) return res.status(500).send({msg:"error"});

        return res.status(200).send("OK");
    }

    return res.status(200).send("OK");
}

async function sendInventory(req,res){
    const {username} = req.query;
    let foo = await sequelize.query(
        `SELECT * from inventory where username=:username`,{
            replacements:{
                username:username
            }
        }
    )
    if(!foo){
        return res.status(500).send({msg:"error"});
    }
    return res.status(200).send(foo[0][0]);
}

async function updateInventory(req,res){
    const {username, B1_amount, B2_amount, B3_amount, pickaxeLevel, shovelLevel, swordLevel} = req.body;
    let foo = await sequelize.query(
        `UPDATE inventory set B1_amount=:B1_amount, B2_amount=:B2_amount, B3_amount=:B3_amount, pickaxeLevel=:pickaxeLevel, shovelLevel=:shovelLevel, swordLevel=:swordLevel where username=:username`,{
            replacements:{
                username:username,
                B1_amount:B1_amount,
                B2_amount:B2_amount,
                B3_amount:B3_amount,
                pickaxeLevel:pickaxeLevel,
                shovelLevel:shovelLevel,
                swordLevel:swordLevel
            }
        }
    )
    if(!foo){
        console.log("ERROR UPDATING INVENTORY");
        return res.status(500).send({msg:"error updating inventory"})
    }
    return res.status(200).send("OK");
}

async function updatePlayer(req, res) {
    //save x,y,energy values from player to db
    const { x, y, energy } = req.query;
    let foo = await sequelize.query(
        `UPDATE player SET x=:x, y=:y, energy=:energy`, {
        replacements: {
            x: x,
            y: y,
            energy: energy
        }
    }
    )
    if (!foo) {
        return res.status(500).send({ msg: "error" })
    }
    // console.log("updated player!");
    return res.status(200).send("OK");
}

async function getGold(req, res) {
    const token = req.header("token");
    let userdata;
    try {
        userdata = jwt.verify(token, JWT_SECRET);
    } catch (error) {
        console.log(error);
        return res.status(401).send({ message: "Token tidak valid" })
    }
    let username = userdata.name;
    // console.log(username);
    let url = `${MASTER_API_URL}/gold`;
    url += `?username=${username}`;
    let result = await axios.get(url);
    if(result.data["SUM(gold)"]){
        return res.status(200).send({ gold: result.data["SUM(gold)"] });
    }
    return res.status(200).send({gold:0});
}

async function registerGold(req, res) {
    const token = req.body.token;
    let userdata;
    try {
        userdata = jwt.verify(token, JWT_SECRET);
    } catch (error) {
        return res.status(401).send({ message: "Token tidak valid" })
    }

}

module.exports = {
    getGold,
    initializePlayerData,
    updatePlayer,
    getPlayer,
    updateGold,
    Attack,
    updateInventory,
    sendInventory
}






