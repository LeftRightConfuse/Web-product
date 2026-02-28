import { Product } from "../types/product";

const mockProducts: Product[] = [
  {
    id: 1,
    itemName: "iPhone 15 Pro 128GB",
    description: "A17 Pro Chip",
    price: 39900,
    image_url:
      "https://images.unsplash.com/photo-1695048133142-1a20484a4b0f",
    category: "Smartphone",
  },
  {
    id: 2,
    itemName: "Samsung Galaxy S24",
    description: "Flagship Android",
    price: 28900,
    image_url:
      "https://images.unsplash.com/photo-1610945265064-0e34e5519bbf",
    category: "Smartphone",
  },
  {
    id: 3,
    itemName: "MacBook Air",
    description: "13-inch Laptop",
    price: 38900,
    image_url:
      "https://images.unsplash.com/photo-1517336714731-489689fd1ca8",
    category: "Laptop",
  },
  {
    id: 4,
    itemName: "Gaming Laptop RTX",
    description: "High Performance",
    price: 45900,
    image_url:
      "https://images.unsplash.com/photo-1593642634524-b40b5baae6bb",
    category: "Laptop",
  },
  {
    id: 5,
    itemName: "iPad Pro",
    description: "11-inch Tablet",
    price: 39900,
    image_url:
      "https://images.unsplash.com/photo-1587829741301-dc798b83add3",
    category: "Tablet",
  },
  {
    id: 6,
    itemName: "Android Tablet",
    description: "Snapdragon Powered",
    price: 10990,
    image_url:
      "https://images.unsplash.com/photo-1544244015-0df4b3ffc6b0",
    category: "Tablet",
  },
  {
    id: 7,
    itemName: "Apple Watch",
    description: "Smart Watch",
    price: 15900,
    image_url:
      "https://images.unsplash.com/photo-1510017803434-a899398421b3",
    category: "Wearable",
  },
  {
    id: 8,
    itemName: "Galaxy Watch",
    description: "Fitness Tracker",
    price: 10900,
    image_url:
      "https://images.unsplash.com/photo-1579586337278-3befd40fd17a",
    category: "Wearable",
  },
  {
    id: 9,
    itemName: "Sony Headphones",
    description: "Noise Cancelling",
    price: 12900,
    image_url:
      "https://images.unsplash.com/photo-1518441902112-fb8c5a2d28c6",
    category: "Audio",
  },
  {
    id: 10,
    itemName: "Wireless Earbuds",
    description: "Bluetooth 5.3",
    price: 8990,
    image_url:
      "https://images.unsplash.com/photo-1585386959984-a41552231658",
    category: "Audio",
  },
  {
    id: 11,
    itemName: "PlayStation 5",
    description: "Next Gen Console",
    price: 18900,
    image_url:
      "https://images.unsplash.com/photo-1606813907291-d86efa9b94db",
    category: "Gaming",
  },
  {
    id: 12,
    itemName: "Nintendo Switch",
    description: "Portable Console",
    price: 11900,
    image_url:
      "https://images.unsplash.com/photo-1605902711622-cfb43c44367f",
    category: "Gaming",
  },
  {
    id: 13,
    itemName: "Wireless Mouse",
    description: "Ergonomic Design",
    price: 3990,
    image_url:
      "https://images.unsplash.com/photo-1587829741301-1c8c42b4d7d1",
    category: "Accessory",
  },
  {
    id: 14,
    itemName: "Mechanical Keyboard",
    description: "RGB Backlight",
    price: 4990,
    image_url:
      "https://images.unsplash.com/photo-1511467687858-23d96c32e4ae",
    category: "Accessory",
  },
  {
    id: 15,
    itemName: "SSD NVMe 1TB",
    description: "Gen4 Speed",
    price: 3990,
    image_url:
      "https://images.unsplash.com/photo-1587202372775-e229f172b9d7",
    category: "Storage",
  },
];

export async function getProducts(): Promise<Product[]> {
  try {
    const res = await fetch(
      `${process.env.NEXT_PUBLIC_API_URL}/api/items`
    );

    if (!res.ok) throw new Error("Backend not ready");

    return await res.json();
  } catch (error) {
    console.warn("Using mock data instead");
    return mockProducts;
  }
}