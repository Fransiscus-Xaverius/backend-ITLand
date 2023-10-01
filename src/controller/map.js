const sequelize = require("../database/db");
const { generateNewMap } = require("../utils/utils");

// let FullMap = await generateNewMap();

let FullMap;

(async() => {
    FullMap = await getEntityFromDB();
})();

async function getEntityFromDB(){
    let dict = {
        tile: [],
        entity: []
    };
    for (let i = 0; i < 100; i++) {
        dict.tile.push([])
        dict.entity.push([])
        let entities = await sequelize.query(
            `select * from entity where y=:y`,{
                replacements:{
                    y:i
                }
            }
        )
        let tiles = await sequelize.query(
            `select * from tile where y=:y`,{
                replacements:{
                    y:i
                }
            }
        )
        for (let j = 0; j < 100; j++) {
            dict.entity[i].push(entities[0][j].entity_name);
            dict.tile[i].push(tiles[0][j].tile_name);
        }
    }
    console.log(dict.tile);
    return dict;
}

const sendAll = (req, res) => {
    return res.status(200).send(JSON.stringify(dict.map));
}

const sendMap = (req, res) => {
    return res.status(200).send(JSON.stringify(FullMap.tile));
}

const sendEntity = (req, res) => {
    return res.status(200).send(JSON.stringify(FullMap.entity));
}

const getPertanyaanCount = async function () {
    let count = await sequelize.query(
        `Select COUNT(*) as count from question`
    )
    return count[0][0].count;
}

const sendPertanyaan = async (req, res) => {
    const countPertanyaan = await getPertanyaanCount();
    console.log(countPertanyaan);
    let RNG = Math.round(Math.random() * (countPertanyaan - 1));

    let id = `q_${RNG}`;
    let [result, metadata] = await sequelize.query(
        `select * from question where id=:id`, {
        replacements: {
            id: id
        }
    }
    )
    return res.status(200).send(result[0]);
}

const sendPosition = (req, res) => {
    let posX = req.header("x");
    let posY = req.header("y");
}

module.exports = {
    sendAll,
    sendMap,
    sendEntity,
    sendPertanyaan,
    sendPosition,
    getEntityFromDB
}