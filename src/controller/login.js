const jwt = require("jsonwebtoken");
const { JWT_SECRET } = require("../config/env.json");
const sequelize = require("../database/db");

async function login(req, res) {
    console.log(req.body);
    let { username, password } = req.body;
    if (username.value) {
        username = username.value;
    }
    if (password.value) {
        password = password.value;
    }

    try {
        const queryLogin = "SELECT * FROM users WHERE name = ? AND password = ?";
        const [login, loginMetadata] = await sequelize.query(queryLogin, {
            replacements: [username, password],
            type: sequelize.QueryTypes.SELECT,
        });
        // console.log("Login : " + login);
        // console.log("LoginStringify : " + JSON.stringify(login));
        if (login) {
            const token = jwt.sign(login, JWT_SECRET, {
                expiresIn: '6h'
            })
            console.log(token);
            return res.send({ "token": token });
        }
        // if (login) {
        //     req.session = login;
        // }
    } catch (error) {
        console.error(error);
    }
}

module.exports = login;