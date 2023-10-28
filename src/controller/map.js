const sequelize = require("../database/db");
const { generateNewMap } = require("../utils/utils");

let FullMap;

(async() => {
    let exists = await mapExists();
    if(exists){
        FullMap = await getEntityFromDB();
    }
    else{
        FullMap = await generateNewMap();
    }
})();

async function mapExists(){
    let foo = await sequelize.query(
        `select COUNT(*) as count from entity`,{
        }
    )
    let count =  foo[0][0].count;
    if(count==0) return false;
    return true;
}

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
    console.log(dict.entity);
    return dict;
}

const sendAll = (req, res) => {
    return res.status(200).send(JSON.stringify(dict.map));
}

const sendMap = async (req, res) => {
    return res.status(200).send(JSON.stringify(FullMap.tile));
}

const removeEntity = async (req,res) =>{
    const {x,y} = req.query;
    
    //save the grid change to DB. this is just in-case of a power outage or if the local backend API needs to be restarted
    let foo = await sequelize.query(
        `UPDATE entity SET entity_name=:entity_name WHERE x=:x and y=:y`,{
            replacements:{
                entity_name:"empty",
                x:x,
                y:y
            }
        }
    )

    FullMap.entity[y][x] = "empty";

    if(foo){
        return res.status(200).send({msg:"Done"})
    }
    return res.status(500).send({MSG:"Error server"});
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
    getEntityFromDB,
    removeEntity
}