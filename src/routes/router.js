const express = require("express");
const sequelize = require("../database/db");
const login = require("../controller/login");
const { sendPosition, sendMap, sendEntity, sendPertanyaan, sendAll } = require("../utils/utils");


const router = express.Router();

router.post("/login", login);
router.post('/position', sendPosition);
router.get('/map', sendMap);
router.get('/entity', sendEntity);
router.get('/question', sendPertanyaan);
router.get('/', cors(), sendAll);

module.exports = router;
