import { Product } from "../types/product";

type Props = {
  product: Product;
};

export default function ProductCard({ product }: Props) {
  return (
    <div className="bg-gradient-to-br from-gray-900 to-gray-800 
                    rounded-2xl p-5 shadow-2xl 
                    border border-gray-700
                    hover:scale-105 transition duration-300">

      <div className="mb-3">
        <span className="text-xs px-3 py-1 rounded-full bg-gray-700 border border-gray-600">
          {product.category}
        </span>
      </div>

      <div className="relative w-full h-56 mb-4 rounded-xl overflow-hidden bg-white flex items-center justify-center">
        <img
          src={product.image_url}
          alt={product.itemName}
          className="max-h-full max-w-full object-contain"
        />
      </div>

      <h2 className="text-lg font-semibold">{product.itemName}</h2>

      {product.description && (
        <p className="text-sm text-gray-400 mt-2">
          {product.description}
        </p>
      )}

      <p className="text-2xl font-bold text-green-400 mt-3">
        ฿{product.price.toLocaleString()}
      </p>
    </div>
  );
}