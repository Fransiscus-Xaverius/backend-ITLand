const sequelize = require("../database/db");
const { generateNewMap } = require("../utils/utils");

const FullMap = generateNewMap();

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
    sendPosition
}