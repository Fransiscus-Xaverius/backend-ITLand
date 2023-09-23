const jwt = require("jsonwebtoken");
const { JWT_SECRET } = require("../config/env.json");
const sequelize = require("../database/db");
const { generateToken } = require("../utils/utils");

async function login(req, res) {
    const { username, password } = extractCredentials(req.body);

    try {
        const login = await authenticateUser(username, password);
        if (login) {
            const token = generateToken(login);
            console.log(token);
            return res.send({ token });
        }
    } catch (error) {
        console.error(error);
    }
}

function extractCredentials(body) {
    let { username, password } = body;
    if (username.value) {
        username = username.value;
    }
    if (password.value) {
        password = password.value;
    }
    return { username, password };
}

async function authenticateUser(username, password) {
    const queryLogin = "SELECT * FROM users WHERE name = ? AND password = ?";
    const [login, loginMetadata] = await sequelize.query(queryLogin, {
        replacements: [username, password],
        type: sequelize.QueryTypes.SELECT,
    });
    return login;
}

module.exports = login;