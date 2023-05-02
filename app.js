const express = require('express');
const cors = require('cors');

const app = express();
const playerRouter = express.Router();
const port = process.env.PORT || 3000;
const Player = require('./controllers/player.controller.js');

app.use(cors())
playerRouter.get('/', Player.findAll)
playerRouter.get('/:name', Player.findAll)
playerRouter.post('/register', Player.Save)
  //.get((req, res) => {
  //  Player.findAll(err) => {
  //    if(err){
  //      res.send(err);
  //    }

  //  };
    // const response = { hello: "This is my API"};

    //res.json(response);
  //});

app.use('/api/players', playerRouter);

app.get('/', (req, res) => {
  res.send('Welcome to my Nodemon API');
});

app.listen(port, () => {
  console.log(`Running on port ${port}`);
});
