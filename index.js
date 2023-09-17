const express = require('express');
const cors = require('cors');
const { send } = require('express/lib/response');
const app = express();

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

const sendPertanyaan = (req, res) => {
    console.log(`IN ${counterIN++}`);
    return res.status(200).send(JSON.stringify("Ini pertanyaan"));
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