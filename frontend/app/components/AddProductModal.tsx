"use client";

import { useState } from "react";
import { Product } from "../types/product";
import { createProduct } from "../services/productService";

type Props = {
  onClose: () => void;
  onAdd: (product: Product) => void;
};

const categories = [
  { id: 1, en: "Electronics" },
  { id: 2, en: "Appliances" },
  { id: 3, en: "Furniture" },
  { id: 4, en: "Fashion" },
  { id: 5, en: "Toys & Games" },
  { id: 6, en: "Books & Learning" },
  { id: 7, en: "Beauty & Personal Care" },
  { id: 8, en: "Food & Beverages" },
  { id: 9, en: "Sports & Outdoor" },
];

export default function AddProductModal({ onClose, onAdd }: Props) {
  const [name, setName] = useState("");
  const [description, setDescription] = useState("");
  const [price, setPrice] = useState(0);
  const [typeId, setTypeId] = useState(1);
  const [imageFile, setImageFile] = useState<File | null>(null);

  const handleSubmit = async () => {
    if (!imageFile) {
      alert("Please select an image");
      return;
    }

    try {
      const formData = new FormData();

      formData.append("image", imageFile);
      formData.append("name", name);
      formData.append("description", description);
      formData.append("price", price.toString());
      formData.append("type_id", typeId.toString());

      const result = await createProduct(formData);

      const selected = categories.find((c) => c.id === typeId);

      const newProduct: Product = {
        id: result.id || Date.now(),
        itemName: name,
        description,
        price,
        image_url: result.image_url || "", // backend ควรส่งกลับมา
        category: selected?.en || "Other",
        type_id: typeId,
      };

      onAdd(newProduct);
      onClose();
    } catch (err) {
      console.error(err);
      alert("Upload failed");
    }
  };

  return (
    <div className="fixed inset-0 bg-black/70 flex justify-center items-center z-50">
      <div className="bg-gray-900 p-8 rounded-2xl w-full max-w-lg border border-gray-700 space-y-4">

        <h2 className="text-2xl font-bold text-center">
          Add New Product
        </h2>

        <input
          type="text"
          placeholder="Product Name"
          className="w-full p-3 rounded-lg bg-gray-800"
          onChange={(e) => setName(e.target.value)}
        />

        <input
          type="text"
          placeholder="Description"
          className="w-full p-3 rounded-lg bg-gray-800"
          onChange={(e) => setDescription(e.target.value)}
        />

        <input
          type="number"
          placeholder="Price"
          className="w-full p-3 rounded-lg bg-gray-800"
          onChange={(e) => setPrice(Number(e.target.value))}
        />

        {/* 🔥 File Upload */}
        <input
          type="file"
          accept="image/*"
          className="w-full p-3 rounded-lg bg-gray-800"
          onChange={(e) =>
            setImageFile(e.target.files ? e.target.files[0] : null)
          }
        />

        <select
          className="w-full p-3 rounded-lg bg-gray-800"
          onChange={(e) => setTypeId(Number(e.target.value))}
        >
          {categories.map((cat) => (
            <option key={cat.id} value={cat.id}>
              {cat.en}
            </option>
          ))}
        </select>

        <div className="flex justify-between pt-4">
          <button
            onClick={onClose}
            className="px-4 py-2 bg-gray-700 rounded-lg"
          >
            Cancel
          </button>

          <button
            onClick={handleSubmit}
            className="px-4 py-2 bg-green-500 text-black rounded-lg"
          >
            Upload
          </button>
        </div>
      </div>
    </div>
  );
}