type Props = {
  value: string;
  onChange: (value: string) => void;
};

export default function SearchBar({ value, onChange }: Props) {
  return (
    <div className="max-w-xl mx-auto mb-6">
      <input
        type="text"
        placeholder="ค้นหาสินค้า..."
        value={value}
        onChange={(e) => onChange(e.target.value)}
        className="w-full p-4 rounded-xl bg-gray-800 border border-gray-700 
                   focus:outline-none focus:ring-2 focus:ring-green-500"
      />
    </div>
  );
}