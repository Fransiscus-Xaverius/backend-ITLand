const generateNewMap = () => {
    const dict = { tile: [], entity: [] };
    for (let i = 0; i < 100; i++) {
        dict.tile.push([]);
        dict.entity.push([]);
        for (let j = 0; j < 100; j++) {
            if (i === 0 || j === 0) {
                dict.tile[i].push("gravel");
                dict.entity[i].push("rock");
            } else {
                dict.tile[i].push(Math.round(Math.random()) ? "grass" : "sand");
                if (j !== 1 && i !== 1) {
                    const spawn = Math.floor(Math.random() * 101);
                    if (spawn < 40) {
                        dict.entity[i].push("rock");
                    } else if (spawn < 65) {
                        dict.entity[i].push("chest");
                    } else if (spawn < 85) {
                        dict.entity[i].push("iron_ore");
                    } else if (spawn < 95) {
                        dict.entity[i].push("silver_ore");
                    } else {
                        dict.entity[i].push("gold_ore");
                    }
                } else {
                    dict.entity[i].push("empty");
                }
            }
        }
    }
    return dict;
};

const generateToken = (value) => {
    return jwt.sign(value, JWT_SECRET, {
        expiresIn: '6h'
    });
}


module.exports = { generateNewMap, generateToken, sendJsonResponse, sendErrorResponse };