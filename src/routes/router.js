const express = require("express");
const { sendPosition, sendMap, sendEntity, sendPertanyaan, sendAll, getEntityFromDB } = require("../controller/map");
const login = require("../controller/login");
const {getGold} = require("../controller/update");

const router = express.Router();

router.post("/login", login);
router.post('/position', sendPosition);
router.get('/map', sendMap);
router.get('/entity', sendEntity);
router.get('/question', sendPertanyaan);
router.get('/', sendAll);

router.get('/ent', getEntityFromDB);

//update master
router.get("/gold", getGold);

module.exports = router;
