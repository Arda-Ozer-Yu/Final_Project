const express = require('express');
const router = express.Router();
const pool = require('../config/db');


//database sorgusu
router.get('/', async (req, res) => {
  try {
    const result = await pool.query('SELECT * FROM actors');
    res.json(result.rows);
  } catch (err) {


    //sunucu bağlantısı kontrolü
    console.error(err.message);
    res.status(500).send('Sunucu hatası');
  }
});

module.exports = router;
