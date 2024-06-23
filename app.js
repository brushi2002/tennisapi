const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');

const app = express();
const port = process.env.PORT || 3000;
const Player = require('./controllers/player.controller.js');
const League = require('./controllers/league.controller.js');

const playerRouter = require('./routers/playerRouter.js')(Player)
const leagueRouter = require('./routers/leagueRouter.js')(League)

app.use(bodyParser.urlencoded({extended : true}));
app.use(bodyParser.json());

app.use(cors())

app.use('/api/players', playerRouter);
app.use('/api/leagues', leagueRouter);

app.get('/', (req, res) => {
  res.send('Welcome to my Nodemon API');
});

app.listen(port, () => {
  console.log(`Running on port ${port}`);
});
