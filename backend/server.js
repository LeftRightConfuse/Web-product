const express = require("express");
const mysql = require("mysql2");
const cors = require("cors");

const productRoutes = require("./routes/productRoute");
const app = express();
app.use(cors());
app.use(express.json());

app.use("/products", productRoutes);

const db = mysql.createConnection({
  host: "mysql",
  user: "root",
  password: "root",
  database: "price_db",
});

// attempt to connect with retry on failure (depends_on only waits for container, not service readiness)
function connectWithRetry() {
  db.connect((err) => {
    if (err) {
      console.error("MySQL connection error:", err.message);
      console.log("Retrying in 2 seconds...");
      setTimeout(connectWithRetry, 2000);
    } else {
      console.log("Connected to MySQL");
    }
  });
}

connectWithRetry();

// handle unexpected errors and auto-reconnect
db.on("error", (err) => {
  console.error("MySQL error event:", err);
  if (err.code === "PROTOCOL_CONNECTION_LOST") {
    console.log("Reconnecting to MySQL...");
    connectWithRetry();
  }
});

app.get("/", (req, res) => {
  res.send("Backend is running");
});

app.listen(5000, () => {
  console.log("Server running on port 5000");
});
