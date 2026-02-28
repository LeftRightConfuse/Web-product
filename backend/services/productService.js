const db = require("../db");
const cloudinary = require("../cloudinary");

exports.createProducts = async (data, filePath) => {
  let uploadResult;
  try {
    uploadResult = await cloudinary.uploader.upload(filePath);
  } catch (err) {
    console.error("Cloudinary upload failed:", err);
    // rethrow so controller returns 500 with message
    throw new Error("Image upload failed");
  }

  // sanitize and validate the price field; users may submit strings like "฿54,900" or "54,900"
  let price = data.price;
  if (typeof price !== "number") {
    // remove any non-numeric characters except dot and minus
    const cleaned = String(price).replace(/[^0-9.\-]/g, "");
    price = parseFloat(cleaned);
  }
  if (isNaN(price)) {
    const err = new Error("Invalid price value");
    err.statusCode = 400;
    throw err;
  }

  // also ensure type_id is a number
  let typeId = data.type_id;
  if (typeof typeId !== "number") {
    typeId = parseInt(typeId, 10);
  }

  const [result] = await db.execute(
    "INSERT INTO products (image_url, name, price, description, type_id) VALUES (?, ?, ?, ?, ?)",
    [uploadResult.secure_url, data.name, price, data.description, typeId],
  );
  return {
    id: result.insertId,
    image_url: uploadResult.secure_url,
    ...data,
    price,
    type_id: typeId,
  };
};
exports.getProducts = async () => {
  const [rows] = await db.execute("SELECT * FROM products");
  return rows;
}
