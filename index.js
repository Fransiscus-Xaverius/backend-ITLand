const express = require('express');
const cors = require('cors');

const app = express();
const router = require('./src/routes/router');

app.use(express.urlencoded({ extended: true }));
app.use(express.json());

app.use(cors());
app.use('/', router);

const server = app.listen(3000, () => {
    console.log(`Server listening on port ${server.address().port}`);
});

module.exports = server;