const express = require('express');
const cors = require('cors');
require('dotenv').config();
const app = express();
const port = process.env.PORT || 5000;

const pool = require('./config/db');

app.use(cors());
app.use(express.json());


//api kontrolü
app.get('/', (req, res) => {
  res.send('API çalışıyor!');
});


//api routes
const actorsRoute = require('./routes/actors');
const moviesRoute = require('./routes/movies');
const seriesRoute = require('./routes/series');

app.use('/actors', actorsRoute);
app.use('/movies', moviesRoute);
app.use('/series', seriesRoute);


//database bağlantı kontrolü
pool.query('SELECT NOW()', (err, result) => {
  if (err) {
    console.error('Veritabanı bağlantı hatası:', err);
  } else {
    console.log('Veritabanına bağlanıldı:', result.rows[0]);
  }
});


//port bilgisi
app.listen(port, () => {
  console.log(`Sunucu ${port} portunda çalışıyor`);
});
