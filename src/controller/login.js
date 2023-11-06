const sequelize = require("../database/db");
const { generateToken } = require("../utils/utils");
const bcrypt = require("bcrypt");

async function login(req, res) {
    const { username, password } = extractCredentials(req.body);

    try {
        const login = await authenticateUser(username);

        if (login) {
            //Biar bisa dibaca hashingnya dari php ke node js
            login.password = login.password.replace("$2y$", "$2a$");
            console.log(login)
            if (bcrypt.compareSync(password, login.password)) {
                const token = generateToken(login);
                return res.send({ token });
            }else{
                return res.status(200).send({ message: "pass" });
            }
        }else{
            return res.status(200).send({ message: "user" });
        }
    } catch (error) {
        console.error(error);
        return res.status(400).send(error);
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

async function authenticateUser(username) {
    const queryLogin = "SELECT * FROM users WHERE name = ?";
    const [login, loginMetadata] = await sequelize.query(queryLogin, {
        replacements: [username],
        type: sequelize.QueryTypes.SELECT,
    });
    return login;
}

module.exports = login;