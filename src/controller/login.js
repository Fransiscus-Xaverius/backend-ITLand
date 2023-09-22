const sequelize = require("sequelize");
const jwt = require("jsonwebtoken");
const { JWT_SECRET } = require("../config/env.json")

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
        const queryLogin = "SELECT * FROM users WHERE (username = ? and password = ?)";
        const [login, loginMetadata] = await sequelize.query(queryLogin, {
            replacements: [username, username],
            type: sequelize.QueryTypes.SELECT,
        });
        if (login) {
            const token = jwt.sign(login, JWT_SECRET, {
                expiresIn: '6h'
            })
            return res.send(token);
        }
    } catch (error) {

    }
}

module.exports = login;