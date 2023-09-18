const express = require('express');
const cors = require('cors');
const { send } = require('express/lib/response');
const app = express();
const sql = require('mysql2');
const sequelize = require('sequelize');

const conn = new sequelize("db_game", "root", "",{
    host:"localhost",
    port: 3306,
    dialect: "mysql"
});

app.listen(3000, function () {
    console.log('CORS-enabled web server listening on port 3000');
    console.log(generateNewMap().tile);
})

let counterIN = 0;

const generateNewMap = () => {
    let dict = {
        tile: [],
        entity: []
    };

    for (let i = 0; i < 100; i++) {
        dict.tile.push([])
        dict.entity.push([])
        for (let j = 0; j < 100; j++) {
            if (i == 0 || j == 0) {
                dict.tile[i].push("gravel");
                dict.entity[i].push("rock");
            }
            else {
                if (Math.round(Math.random())) {
                    dict.tile[i].push("grass");
                }
                else {
                    if (Math.round(Math.random())) {
                        dict.tile[i].push("sand");
                    }
                    else {
                        dict.tile[i].push("gravel");
                    }
                }
                if (Math.round(Math.random()) && (j != 1 && i != 1)) {
                    dict.entity[i].push("rock");
                }
                else {
                    dict.entity[i].push("empty");
                }
            }
        }
    }
    return dict;
}

const FullMap = generateNewMap();

const sendAll = (req,res)=>{
    return res.status(200).send(JSON.stringify(dict.map));
}

const sendMap = (req, res) => {
    console.log(`IN ${counterIN++}`);
    return res.status(200).send(JSON.stringify(FullMap.tile));
}

const sendEntity = (req,res) =>{
    return res.status(200).send(JSON.stringify(FullMap.entity));
}

async function getPertanyaanCount(){
    let count = await conn.query(
        `Select COUNT(*) as count from question`
    )

    return count[0][0].count;
}

const sendPertanyaan = async (req, res) => {
    const countPertanyaan = await getPertanyaanCount();
    let RNG = Math.floor(Math.random() * (countPertanyaan-1));
    let id = `q_${RNG}`;
    let [result,metadata] = await conn.query(
        `select * from question where id=:id`,{
            replacements:{
                id:id
            }
        }
    )
    return res.status(200).send(result[0]);
}

const sendPosition=(req,res)=>{
    let posX = req.header("x");
    let posY = req.header("y");
}

app.use(cors())
app.post('/position', sendPosition);
app.get('/map', sendMap);
app.get('/entity', sendEntity);
app.get('/question', sendPertanyaan);
app.get('/', cors(), sendAll);