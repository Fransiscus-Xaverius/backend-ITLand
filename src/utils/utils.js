const sequelize = require("../database/db");

const FullMap = generateNewMap();

module.exports = {
    sendAll: (req, res) => {
        return res.status(200).send(JSON.stringify(dict.map));
    },
    sendMap: (req, res) => {
        console.log(`IN ${counterIN++}`);
        return res.status(200).send(JSON.stringify(FullMap.tile));
    },
    sendEntity: (req, res) => {
        return res.status(200).send(JSON.stringify(FullMap.entity));
    },
    getPertanyaanCount: async function () {
        let count = await sequelize.query(
            `Select COUNT(*) as count from question`
        )
        return count[0][0].count;
    },
    sendPertanyaan: async (req, res) => {
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
    },
    sendPosition: (req, res) => {
        let posX = req.header("x");
        let posY = req.header("y");
    },

    generateNewMap: () => {
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
                    // if (Math.round(Math.random()) && (j != 1 && i != 1)) {
                    //     dict.entity[i].push("rock");
                    // }
                    // else {
                    //     if(Math.round(Math.random()) && (j != 1 && i != 1)){
                    //         dict.entity[i].push("chest");
                    //     }
                    //     else{
                    //         dict.entity[i].push("empty");
                    //     }
                    // }
                    if (j != 1 && i != 1) {
                        if (Math.round(Math.random())) {
                            const spawn = Math.floor(Math.random() * 101);
                            if (spawn < 40) {
                                dict.entity[i].push("rock");
                            }
                            else if (spawn >= 50 && spawn < 65) {
                                dict.entity[i].push("chest");
                            }
                            else if (spawn >= 65 && spawn < 85) {
                                dict.entity[i].push("iron_ore")
                            }
                            else if (spawn >= 85 && spawn < 95) {
                                dict.entity[i].push("silver_ore")
                            }
                            else {
                                dict.entity[i].push("gold_ore")
                            }
                        }
                        else {
                            dict.entity[i].push('empty')
                        }
                    }
                    else {
                        dict.entity[i].push('empty')
                    }
                }
            }
        }
        return dict;
    }

}