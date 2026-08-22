class Product {
  final int id;
  final String title;
  final String description;
  final double price;
  final double? originalPrice;
  final String discount;
  final double rating;
  final int reviewCount;
  final String imageUrl;
  final String category;
  final bool isFavorite;

  const Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    this.originalPrice,
    this.discount = '-20%',
    this.rating = 4.8,
    this.reviewCount = 128,
    required this.imageUrl,
    required this.category,
    this.isFavorite = false,
  });
}

final List<String> categories = [
  'All',
  'Phone',
  'Laptop',
  'Watch',
  'Headphone',
];

final List<Product> productList = [
  Product(
    id: 1,
    title: 'Google Pixel 7 Pro',
    description:
        'Google Pixel 7 Pro features a 6.7-inch LTPO OLED display, Google Tensor G2 processor, and an exceptional triple camera system with 5x optical zoom.',
    price: 899.00,
    originalPrice: 999.00,
    discount: '-20%',
    rating: 4.7,
    reviewCount: 145,
    imageUrl:
        'https://images.unsplash.com/photo-1598327105666-5b89351aff97?w=600&auto=format&fit=crop&q=80',
    category: 'Phone',
    isFavorite: false,
  ),
  Product(
    id: 2,
    title: 'Apple MacBook Air M2',
    description:
        'Experience power and portability with the new Apple MacBook Air M2. Features the revolutionary M2 chip, 13.6-inch Liquid Retina display, and all-day battery life.',
    price: 1199.00,
    originalPrice: 1399.00,
    discount: '-20%',
    rating: 4.9,
    reviewCount: 320,
    imageUrl:
        'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=600&auto=format&fit=crop&q=80',
    category: 'Laptop',
    isFavorite: true,
  ),
  Product(
    id: 3,
    title: 'Apple Watch Series 8',
    description:
        'Advanced health features including temperature sensing, Crash Detection, and Sleep Stages tracking to better understand your overall health.',
    price: 399.00,
    originalPrice: 499.00,
    discount: '-20%',
    rating: 4.8,
    reviewCount: 210,
    imageUrl:
        'https://images.unsplash.com/photo-1546868871-7041f2a55e12?w=600&auto=format&fit=crop&q=80',
    category: 'Watch',
    isFavorite: false,
  ),
  Product(
    id: 4,
    title: 'Sony WH-1000XM5',
    description:
        'Industry-leading noise canceling headphones with two processors and 8 microphones for unprecedented noise cancellation and crystal-clear call quality.',
    price: 349.00,
    originalPrice: 399.00,
    discount: '-20%',
    rating: 4.9,
    reviewCount: 450,
    imageUrl:
        'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=600&auto=format&fit=crop&q=80',
    category: 'Headphone',
    isFavorite: false,
  ),
  Product(
    id: 5,
    title: 'iPhone 15 Pro Max',
    description:
        'Forged in titanium and featuring the groundbreaking A17 Pro chip, customizable Action button, and the most powerful iPhone camera system ever.',
    price: 1199.00,
    originalPrice: 1299.00,
    discount: '-15%',
    rating: 4.9,
    reviewCount: 580,
    imageUrl:
        'https://images.unsplash.com/photo-1695048133142-1a20484d2569?w=600&auto=format&fit=crop&q=80',
    category: 'Phone',
    isFavorite: true,
  ),
  Product(
    id: 6,
    title: 'Dell XPS 15 9530',
    description:
        'High-performance creator laptop powered by 13th Gen Intel Core i7, NVIDIA GeForce RTX 4060 graphics, and stunning 3.5K OLED InfinityEdge touch display.',
    price: 1699.00,
    originalPrice: 1999.00,
    discount: '-20%',
    rating: 4.6,
    reviewCount: 95,
    imageUrl:
        'https://images.unsplash.com/photo-1593642632823-8f785ba67e45?w=600&auto=format&fit=crop&q=80',
    category: 'Laptop',
    isFavorite: false,
  ),
  Product(
    id: 7,
    title: 'Samsung Galaxy Watch 6',
    description:
        'Your daily wellness partner featuring customized heart rate zones, advanced sleep coaching, and a 20% larger display with thinner bezel.',
    price: 299.00,
    originalPrice: 349.00,
    discount: '-15%',
    rating: 4.7,
    reviewCount: 160,
    imageUrl:
        'https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=600&auto=format&fit=crop&q=80',
    category: 'Watch',
    isFavorite: false,
  ),
  Product(
    id: 8,
    title: 'AirPods Max',
    description:
        'Apple-designed dynamic driver provides high-fidelity audio. Active Noise Cancellation with Transparency mode and spatial audio with dynamic head tracking.',
    price: 479.00,
    originalPrice: 549.00,
    discount: '-15%',
    rating: 4.8,
    reviewCount: 310,
    imageUrl:
        'https://images.unsplash.com/photo-1546435770-a3e426bf472b?w=600&auto=format&fit=crop&q=80',
    category: 'Headphone',
    isFavorite: false,
  ),
  Product(
    id: 9,
    title: 'Samsung Galaxy S24 Ultra',
    description:
        'Galaxy AI is here. Meet Galaxy S24 Ultra, the ultimate form of Galaxy Ultra with a new titanium exterior and a 6.8-inch flat display with S Pen included.',
    price: 1299.00,
    originalPrice: 1419.00,
    discount: '-10%',
    rating: 4.9,
    reviewCount: 230,
    imageUrl:
        'https://images.unsplash.com/photo-1610945265064-0e34e5519bbf?w=600&auto=format&fit=crop&q=80',
    category: 'Phone',
    isFavorite: false,
  ),
  Product(
    id: 10,
    title: 'Bose QuietComfort Ultra',
    description:
        'Breakthrough spatialized audio for more immersive listening that makes your music feel realer than ever before with world-class noise cancellation.',
    price: 379.00,
    originalPrice: 429.00,
    discount: '-12%',
    rating: 4.8,
    reviewCount: 195,
    imageUrl:
        'https://images.unsplash.com/photo-1583394838336-acd977736f90?w=600&auto=format&fit=crop&q=80',
    category: 'Headphone',
    isFavorite: true,
  ),
];
