const express = require('express');
const cors = require('cors');
// const { send } = require('express/lib/response');
const app = express();
// const sql = require('mysql2');
// const sequelize = require('sequelize');
const router = require('./src/routes/router');
// const { generateNewMap } = require('./src/utils/utils');

app.use(express.urlencoded({ extended: true }));
app.use(express.json());

app.use(cors());
app.use("/", router);


app.listen(3000, function () {
    console.log('CORS-enabled web server listening on port 3000');
    // console.log(generateNewMap().tile);
})

let counterIN = 0;

// const FullMap = generateNewMap();


// app.post('/position', sendPosition);
// app.get('/map', sendMap);
// app.get('/entity', sendEntity);
// app.get('/question', sendPertanyaan);
// app.get('/', cors(), sendAll);