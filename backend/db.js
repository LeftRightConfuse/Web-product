const mysql = require("mysql2/promise");

const db = mysql.createPool({
  host: "mysql",
  user: "root",
  password: "root",
  database: "price_db",
  waitForConnections: true,
  connectionLimit: 10,
});

module.exports = db;