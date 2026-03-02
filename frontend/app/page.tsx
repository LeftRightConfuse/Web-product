"use client";

import { useEffect, useState } from "react";
import { Product } from "./types/product";
import { getProducts } from "./services/productService";
import ProductGrid from "./components/ProductGrid";
import SearchBar from "./components/SearchBar";
import CategoryFilter from "./components/CategoryFilter";
import AddProductModal from "./components/AddProductModal";

export default function Page() {
  const [products, setProducts] = useState<Product[]>([]);
  const [search, setSearch] = useState("");
  const [selectedCategory, setSelectedCategory] = useState("All");
  const [loading, setLoading] = useState(true);
  const [showModal, setShowModal] = useState(false);

  useEffect(() => {
    getProducts()
      .then((data) => setProducts(data))
      .catch((err) => console.error(err))
      .finally(() => setLoading(false));
  }, []);

  const handleAddProduct = (product: Product) => {
  setProducts((prev) => [...prev, product]);
};
  const categories = [
    "All",
    ...new Set(products.map((p) => p.category)),
  ];

  const filteredProducts = products.filter((product) => {
    const matchSearch = product.itemName
      .toLowerCase()
      .includes(search.toLowerCase());

    const matchCategory =
      selectedCategory === "All" ||
      product.category === selectedCategory;

    return matchSearch && matchCategory;
  });

  if (loading) {
    return (
      <div className="min-h-screen flex items-center justify-center text-white bg-black">
        Loading...
      </div>
    );
  }

  return (
    <main className="min-h-screen bg-gradient-to-br from-black via-gray-900 to-black text-white p-8">
      <h1 className="text-4xl font-bold text-center mb-8">
        🔥 Price Compare
      </h1>
      <div className="flex justify-center mb-6">
  <button
    onClick={() => setShowModal(true)}
    className="px-6 py-3 bg-green-500 text-black rounded-xl font-semibold hover:bg-green-400"
  >
    + เพิ่มสินค้า
  </button>
</div>
      <SearchBar value={search} onChange={setSearch} />

      <CategoryFilter
        categories={categories}
        selected={selectedCategory}
        onSelect={setSelectedCategory}
      />

      <ProductGrid products={filteredProducts} />
      {showModal && (
  <AddProductModal
    onClose={() => setShowModal(false)}
    onAdd={handleAddProduct}
  />
)}
    </main>
  );
}