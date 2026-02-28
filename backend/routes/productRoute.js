const express = require("express");
const { createProducts, getProducts } = require("../controllers/productController");
const multer = require("multer");

const upload = multer({ dest: "uploads/" });
const router = express.Router();

router.post("/createproduct", upload.single("image"), createProducts);
router.get("/getallproducts", getProducts);


module.exports = router;
