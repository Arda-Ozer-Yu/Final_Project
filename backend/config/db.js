const { Pool } = require('pg');
require('dotenv').config();


//database bilgileri
const pool = new Pool({
  host: process.env.DB_HOST,
  port: process.env.DB_PORT,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME,
});


//database bağlantı kontrolü
pool.connect()
  .then(() => console.log("Veritabanı bağlantısı başarılı"))
  .catch(err => console.error("Veritabanı bağlantı hatası:", err));

module.exports = pool;
