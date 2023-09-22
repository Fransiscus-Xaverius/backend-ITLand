const express = require("express");
const sequelize = require("../database/db");
const { sendPosition, sendMap, sendEntity, sendPertanyaan, sendAll } = require("../controller/map");
const login = require("../controller/login");

const router = express.Router();

router.post("/login", login);
router.post('/position', sendPosition);
router.get('/map', sendMap);
router.get('/entity', sendEntity);
router.get('/question', sendPertanyaan);
router.get('/', sendAll);

module.exports = router;
