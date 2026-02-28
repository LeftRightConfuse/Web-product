const { createProducts, getProducts } = require("../services/productService");

exports.createProducts = async (req, res) => {
  try {
    const product = await createProducts (req.body, req.file.path);
    res.status(201).json(product);
  } catch (error) {
    console.error(error);
    // pass through status code if set (e.g. validation failure)
    const status = error.statusCode || 500;
    const message = error.message || "Failed to create product";
    res.status(status).json({ error: message });
  }
};

exports.getProducts = async (req, res) => {
  try {
    const products = await getProducts();
    res.json(products);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Failed to fetch products" });
  }
}