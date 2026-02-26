"use client"

import { useEffect, useState } from "react";

type Product = {
  product_id: number;
  productName: string;
  price: number;
  description: string;
  type_id: number;
};

export default function Home() {
  
  return (
    <div>
      <h1>Price Comparison App</h1>
    </div>
  );
}