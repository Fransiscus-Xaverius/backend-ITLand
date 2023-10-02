const express = require("express");
const { sendPosition, sendMap, sendEntity, sendPertanyaan, sendAll, removeEntity} = require("../controller/map");
const login = require("../controller/login");
const {getGold, initializePlayerData, updatePlayer} = require("../controller/update");

const router = express.Router();

router.post("/login", login);
router.post('/position', sendPosition);
router.get('/map', sendMap);
router.get('/entity', sendEntity);
router.get('/question', sendPertanyaan);
router.get('/', sendAll);
router.delete("/entity", removeEntity)

//update master
router.get("/gold", getGold); //get gold
router.put("/player", updatePlayer); //update player position in local db
router.post("/player", initializePlayerData) //initialize player values in local db

module.exports = router;
