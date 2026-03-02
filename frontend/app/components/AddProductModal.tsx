"use client";

import { useState } from "react";
import { Product } from "../types/product";
import ProductCard from "./ProductCard";

type Props = {
  onClose: () => void;
  onAdd: (product: Product) => void;
};

export default function AddProductModal({ onClose, onAdd }: Props) {
  const [step, setStep] = useState<"form" | "preview">("form");

  const [formData, setFormData] = useState({
    itemName: "",
    description: "",
    price: 0,
    image_url: "",
    category: "",
  });

  const handleConfirm = () => {
    const newProduct: Product = {
      id: Date.now(),
      ...formData,
    };

    onAdd(newProduct);
    onClose();
  };

  return (
    <div className="fixed inset-0 bg-black/70 flex justify-center items-center z-50">
      <div className="bg-gray-900 p-8 rounded-2xl w-full max-w-lg border border-gray-700 space-y-4">

        <h2 className="text-2xl font-bold text-center">
          {step === "form" ? "เพิ่มสินค้าใหม่" : "Preview สินค้า"}
        </h2>

        {step === "form" && (
          <>
            <input
              type="text"
              placeholder="ชื่อสินค้า"
              className="w-full p-3 rounded-lg bg-gray-800 border border-gray-700"
              value={formData.itemName}
              onChange={(e) =>
                setFormData({ ...formData, itemName: e.target.value })
              }
            />

            <input
              type="text"
              placeholder="รายละเอียดสินค้า"
              className="w-full p-3 rounded-lg bg-gray-800 border border-gray-700"
              value={formData.description}
              onChange={(e) =>
                setFormData({ ...formData, description: e.target.value })
              }
            />

            <input
              type="number"
              placeholder="ราคา (บาท)"
              className="w-full p-3 rounded-lg bg-gray-800 border border-gray-700"
              value={formData.price}
              onChange={(e) =>
                setFormData({ ...formData, price: Number(e.target.value) })
              }
            />

            <input
              type="text"
              placeholder="URL รูปภาพ"
              className="w-full p-3 rounded-lg bg-gray-800 border border-gray-700"
              value={formData.image_url}
              onChange={(e) =>
                setFormData({ ...formData, image_url: e.target.value })
              }
            />

            <input
              type="text"
              placeholder="หมวดหมู่ (เช่น Smartphone)"
              className="w-full p-3 rounded-lg bg-gray-800 border border-gray-700"
              value={formData.category}
              onChange={(e) =>
                setFormData({ ...formData, category: e.target.value })
              }
            />

            <div className="flex justify-between pt-4">
              <button
                onClick={onClose}
                className="px-4 py-2 bg-gray-700 rounded-lg"
              >
                ยกเลิก
              </button>

              <button
                onClick={() => setStep("preview")}
                className="px-4 py-2 bg-blue-500 text-black rounded-lg"
              >
                ดูตัวอย่าง
              </button>
            </div>
          </>
        )}

        {step === "preview" && (
          <>
            <ProductCard
              product={{
                id: 0,
                ...formData,
              }}
            />

            <div className="flex justify-between pt-4">
              <button
                onClick={() => setStep("form")}
                className="px-4 py-2 bg-gray-700 rounded-lg"
              >
                แก้ไข
              </button>

              <button
                onClick={handleConfirm}
                className="px-4 py-2 bg-green-500 text-black rounded-lg"
              >
                ยืนยันเพิ่มสินค้า
              </button>
            </div>
          </>
        )}
      </div>
    </div>
  );
}