import { Product } from "../types/product";

const CATEGORY_MAP: Record<number, string> = {
  1: "Electronics",
  2: "Appliances",
  3: "Furniture",
  4: "Fashion",
  5: "Toys",
  6: "Books",
  7: "Beauty",
  8: "Food",
  9: "Sports",
};

export async function getProducts(): Promise<Product[]> {
  const res = await fetch("http://172.16.8.219:5001/products/getallproducts", {
    cache: "no-store",
  });

  if (!res.ok) {
    throw new Error("Failed to fetch products");
  }

  const data = await res.json();

  return data.map((item: any) => ({
    id: item.id,
    itemName: item.name,
    description: item.description,
    price: Number(item.price),
    image_url: item.image_url,
    category: CATEGORY_MAP[item.type_id] || "Other",
    type_id: item.type_id,
  }));
}

export async function createProduct(formData: FormData) {
  const res = await fetch(
    "http://172.16.8.219:5001/products/createproduct",
    {
      method: "POST",
      body: formData, 
    }
  );

  if (!res.ok) {
    throw new Error("Failed to create product");
  }

  return res.json();
}
