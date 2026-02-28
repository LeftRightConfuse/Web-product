type Props = {
  categories: string[];
  selected: string;
  onSelect: (category: string) => void;
};

export default function CategoryFilter({
  categories,
  selected,
  onSelect,
}: Props) {
  return (
    <div className="flex justify-center gap-4 mb-10 flex-wrap">
      {categories.map((category) => (
        <button
          key={category}
          onClick={() => onSelect(category)}
          className={`px-4 py-2 rounded-full border transition
            ${
              selected === category
                ? "bg-green-500 text-black border-green-500"
                : "bg-gray-800 border-gray-600 hover:border-green-400"
            }`}
        >
          {category}
        </button>
      ))}
    </div>
  );
}