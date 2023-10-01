const { JWT_SECRET } = require("../config/env.json");
const sequelize = require("../database/db");
const jwt = require("jsonwebtoken");

//query = INSERT INTO `entity` (`entity_name`, `x`, `y`) VALUES ('Rock', '0', '0');

const functions = {
    generateNewMap: async () => {
        let dict = {
            tile: [],
            entity: []
        };

        let deleteAll = await sequelize.query(`TRUNCATE TABLE entity`)
        deleteAll = await sequelize.query(`TRUNCATE TABLE tile`)
        for (let i = 0; i < 100; i++) {
            dict.tile.push([])
            dict.entity.push([])
            for (let j = 0; j < 100; j++) {
                if (i == 0 || j == 0) {
                    dict.tile[i].push("gravel");
                    let foo = await sequelize.query(
                        `INSERT INTO tile (tile_name, x, y) VALUES (:tile_name, :x, :y)`,{
                            replacements:{
                                tile_name:"gravel",
                                x:j,
                                y:i
                            }
                        }
                    )
                    dict.entity[i].push("rock");
                    foo = await sequelize.query(
                        `INSERT INTO entity (entity_name, x, y) VALUES (:entity_name, :x, :y)`,{
                            replacements:{
                                entity_name:"rock",
                                x:j,
                                y:i
                            }
                        }
                    )
                } else {
                    if (Math.round(Math.random())) {
                        dict.tile[i].push("grass");
                        let foo = await sequelize.query(
                            `INSERT INTO tile (tile_name, x, y) VALUES (:tile_name, :x, :y)`,{
                                replacements:{
                                    tile_name:"grass",
                                    x:j,
                                    y:i
                                }
                            }
                        )
                    } else {
                        if (Math.round(Math.random())) {
                            dict.tile[i].push("sand");
                            let foo = await sequelize.query(
                                `INSERT INTO tile (tile_name, x, y) VALUES (:tile_name, :x, :y)`,{
                                    replacements:{
                                        tile_name:"sand",
                                        x:j,
                                        y:i
                                    }
                                }
                            )
                        } else {
                            dict.tile[i].push("gravel");
                            let foo = await sequelize.query(
                                `INSERT INTO tile (tile_name, x, y) VALUES (:tile_name, :x, :y)`,{
                                    replacements:{
                                        tile_name:"gravel",
                                        x:j,
                                        y:i
                                    }
                                }
                            )
                        }
                    }
                    if (j != 1 && i != 1) {
                        if (Math.round(Math.random())) {
                            const spawn = Math.floor(Math.random() * 101);
                            if (spawn < 40) {
                                dict.entity[i].push("rock");
                                let foo = await sequelize.query(
                                    `INSERT INTO entity (entity_name, x, y) VALUES (:entity_name, :x, :y)`,{
                                        replacements:{
                                            entity_name:"rock",
                                            x:j,
                                            y:i
                                        }
                                    }
                                )
                            } else if (spawn >= 50 && spawn < 65) {
                                dict.entity[i].push("chest");
                                let foo = await sequelize.query(
                                    `INSERT INTO entity (entity_name, x, y) VALUES (:entity_name, :x, :y)`,{
                                        replacements:{
                                            entity_name:"chest",
                                            x:j,
                                            y:i
                                        }
                                    }
                                )
                            } else if (spawn >= 65 && spawn < 85) {
                                dict.entity[i].push("iron_ore")
                                let foo = await sequelize.query(
                                    `INSERT INTO entity (entity_name, x, y) VALUES (:entity_name, :x, :y)`,{
                                        replacements:{
                                            entity_name:"iron_ore",
                                            x:j,
                                            y:i
                                        }
                                    }
                                )
                            } else if (spawn >= 85 && spawn < 95) {
                                dict.entity[i].push("silver_ore")
                                let foo = await sequelize.query(
                                    `INSERT INTO entity (entity_name, x, y) VALUES (:entity_name, :x, :y)`,{
                                        replacements:{
                                            entity_name:"silver_ore",
                                            x:j,
                                            y:i
                                        }
                                    }
                                )
                            } else {
                                dict.entity[i].push("gold_ore")
                                let foo = await sequelize.query(
                                    `INSERT INTO entity (entity_name, x, y) VALUES (:entity_name, :x, :y)`,{
                                        replacements:{
                                            entity_name:"gold_ore",
                                            x:j,
                                            y:i
                                        }
                                    }
                                )
                            }
                        } else {
                            dict.entity[i].push('empty')
                            let foo = await sequelize.query(
                                `INSERT INTO entity (entity_name, x, y) VALUES (:entity_name, :x, :y)`,{
                                    replacements:{
                                        entity_name:"empty",
                                        x:j,
                                        y:i
                                    }
                                }
                            )
                        }
                    } else {
                        dict.entity[i].push('empty')
                        let foo = await sequelize.query(
                            `INSERT INTO entity (entity_name, x, y) VALUES (:entity_name, :x, :y)`,{
                                replacements:{
                                    entity_name:"empty",
                                    x:j,
                                    y:i
                                }
                            }
                        )
                    }
                }
            }
        }
        return dict;
    },
    generateToken: (value) => {
        return jwt.sign(value, JWT_SECRET, {
            expiresIn: '6h'
        });
    }

}

module.exports = functions