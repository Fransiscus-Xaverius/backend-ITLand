const { JWT_SECRET } = require("../config/env.json");
const sequelize = require("../database/db");
const jwt = require("jsonwebtoken");

//query = INSERT INTO `entity` (`entity_name`, `x`, `y`) VALUES ('Rock', '0', '0');

entities = {
    1: "empty",
    2: "empty",
    3: "empty",
    4: "empty",
    5: "empty",
    6: "empty",
    7: "empty",
    8: "empty",
    9: "empty",
    10: "empty",
    11: "empty",
    12: "empty",
    13: "empty",
    14: "empty",
    15: "empty",
    16: "empty",
    17: "empty",
    18: "empty",
    19: "empty",
    20: "empty",
    21: "empty",
    22: "empty",
    23: "empty",
    24: "empty",
    25: "empty",
    26: "chest",
    27: "chest",
    28: "chest",
    29: "chest",
    30: "chest",
    31: "chest",
    32: "chest",
    33: "chest",
    34: "chest",
    35: "chest",
    36: "chest",
    37: "chest",
    38: "medium_chest",
    39: "medium_chest",
    40: "medium_chest",
    41: "medium_chest",
    42: "medium_chest",
    43: "medium_chest",
    44: "medium_chest",
    45: "medium_chest",
    46: "big_chest",
    47: "big_chest",
    48: "big_chest",
    49: "rock",
    50: "rock",
    51: "rock",
    52: "rock",
    53: "rock",
    54: "rock",
    55: "rock",
    56: "rock",
    57: "rock",
    58: "rock",
    59: "rock",
    60: "rock",
    61: "rock",
    62: "rock",
    63: "rock",
    64: "rock",
    65: "rock",
    66: "rock",
    67: "rock",
    68: "rock",
    69: "iron_ore",
    70: "iron_ore",
    71: "iron_ore",
    72: "iron_ore",
    73: "iron_ore",
    74: "iron_ore",
    75: "iron_ore",
    76: "iron_ore",
    77: "iron_ore",
    78: "iron_ore",
    79: "iron_ore",
    80: "iron_ore",
    81: "iron_ore",
    82: "iron_ore",
    83: "iron_ore",
    84: "silver_ore",
    85: "silver_ore",
    86: "silver_ore",
    87: "silver_ore",
    88: "silver_ore",
    89: "silver_ore",
    90: "silver_ore",
    91: "silver_ore",
    92: "silver_ore",
    93: "silver_ore",
    94: "silver_ore",
    95: "silver_ore",
    96: "silver_ore",
    97: "gold_ore",
    98: "gold_ore",
    99: "gold_ore",
    100: "gold_ore",
};



const functions = {
    generateNewMap: async () => {
        let dict = {
            tile: [],
            entity: []
        };
        console.log("generating map");
        //tile generation
        for(let i=0;i<100;i++){
            dict.tile.push([])
            for(let j=0;j<100;j++){
                if(i==0||j==0||j==99||i==99){
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
                else{
                    const random = Math.floor(Math.random() * 100) + 1;
                    if(random<=40){
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
                    }
                    else if(random<=80){
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
                    }
                    else if(random<=95){
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
                    else{
                        dict.tile[i].push("granite");
                        let foo = await sequelize.query(
                            `INSERT INTO tile (tile_name, x, y) VALUES (:tile_name, :x, :y)`,{
                                replacements:{
                                    tile_name:"granite",
                                    x:j,
                                    y:i
                                }
                            }
                        )
                    }
                }
            }
        }

        //entity generation
        for(let i=0;i<100;i++){
            dict.entity.push([])
            for(let j=0;j<100;j++){
                if(i==0||j==0||j==99||i==99){
                    dict.entity[i].push("obsidian");
                    let foo = await sequelize.query(
                        `INSERT INTO entity (entity_name, x, y) VALUES (:entity_name, :x, :y)`,{
                            replacements:{
                                entity_name:"obsidian",
                                x:j,
                                y:i
                            }
                        }
                    )
                }
                else if(i==1||j==1||j==98||i==98){
                    dict.entity[i].push("empty");
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
                else{
                    const random = Math.floor(Math.random() * 100) + 1;
                    dict.entity[i].push(entities[random]);
                    let foo = await sequelize.query(
                        `INSERT INTO entity (entity_name, x, y) VALUES (:entity_name, :x, :y)`,{
                            replacements:{
                                entity_name:entities[random],
                                x:j,
                                y:i
                            }
                        }
                    )
                }
            }
        }
        console.log("map generated");
        return dict;
    },
    generateToken: (value) => {
        return jwt.sign(value, JWT_SECRET, {
            expiresIn: '6h'
        });
    }

}

module.exports = functions