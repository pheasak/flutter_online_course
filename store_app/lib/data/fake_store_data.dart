import 'models/product_model.dart';

/// Pre-populated mock data based on https://fakestoreapi.com/
final List<String> mockCategories = [
  'All',
  'electronics',
  'jewelery',
  "men's clothing",
  "women's clothing",
];

final List<Product> mockProducts = [
  Product(
    id: 1,
    title: 'Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops',
    price: 109.95,
    description:
        'Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday essentials in the main compartment.',
    category: "men's clothing",
    image: 'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_t.png',
    rating: const Rating(rate: 3.9, count: 120),
  ),
  Product(
    id: 2,
    title: 'Mens Casual Premium Slim Fit T-Shirts',
    price: 22.30,
    description:
        'Slim-fitting style, contrast raglan long sleeve, three-button henley placket, light weight & soft fabric for breathable and comfortable wearing. Great for casual fashion wear.',
    category: "men's clothing",
    image:
        'https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_t.png',
    rating: const Rating(rate: 4.1, count: 259),
  ),
  Product(
    id: 3,
    title: 'Mens Cotton Jacket',
    price: 55.99,
    description:
        'Great outerwear jackets for Spring/Autumn/Winter, suitable for many occasions, such as working, hiking, camping, mountain/rock climbing, cycling, traveling or other outdoors.',
    category: "men's clothing",
    image: 'https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_t.png',
    rating: const Rating(rate: 4.7, count: 500),
  ),
  Product(
    id: 4,
    title: 'Mens Casual Slim Fit',
    price: 15.99,
    description:
        'The color could be slightly different between on the screen and in practice. Please note that body builds vary by person, therefore, detailed size information should be reviewed.',
    category: "men's clothing",
    image: 'https://fakestoreapi.com/img/71YXzeOuslL._AC_UY879_t.png',
    rating: const Rating(rate: 2.1, count: 430),
  ),
  Product(
    id: 5,
    title:
        'John Hardy Women\'s Legends Naga Gold & Silver Dragon Station Chain Bracelet',
    price: 695.00,
    description:
        'From our Legends Collection, the Naga was inspired by the mythical water dragon that protects the ocean\'s pearl. Wear facing inward to be bestowed with love and abundance.',
    category: 'jewelery',
    image: 'https://fakestoreapi.com/img/71pWzhdJNwL._AC_UL640_QL65_ML3_t.png',
    rating: const Rating(rate: 4.6, count: 400),
  ),
  Product(
    id: 6,
    title: 'Solid Gold Petite Micropave',
    price: 168.00,
    description:
        'Satisfaction Guaranteed. Return or exchange any order within 30 days. Designed and sold by Hafeez Center in the United States. Satisfaction Guaranteed.',
    category: 'jewelery',
    image: 'https://fakestoreapi.com/img/61sbMiUnoGL._AC_UL640_QL65_ML3_t.png',
    rating: const Rating(rate: 3.9, count: 70),
  ),
  Product(
    id: 7,
    title: 'White Gold Plated Princess Diamond Ring',
    price: 9.99,
    description:
        'Classic Created Wedding Engagement Solitaire Diamond Promise Ring for Her. Gifts to spoil your love more for Engagement, Wedding, Anniversary, Valentine\'s Day.',
    category: 'jewelery',
    image: 'https://fakestoreapi.com/img/71YAIFU48IL._AC_UL640_QL65_ML3_t.png',
    rating: const Rating(rate: 3.0, count: 400),
  ),
  Product(
    id: 8,
    title: 'Pierced Owl Rose Gold Plated Stainless Steel Double Flared Tunnel Plug',
    price: 10.99,
    description:
        'Rose Gold Plated Double Flared Tunnel Plug Earrings. Made of 316L Stainless Steel for sensitive ears with a smooth polished finish.',
    category: 'jewelery',
    image: 'https://fakestoreapi.com/img/51UDEzMJVpL._AC_UL640_QL65_ML3_t.png',
    rating: const Rating(rate: 1.9, count: 100),
  ),
  Product(
    id: 9,
    title: 'WD 2TB Elements Portable External Hard Drive - USB 3.0',
    price: 64.00,
    description:
        'USB 3.0 and USB 2.0 Compatibility Fast data transfers Improve PC Performance High Capacity; Compatibility Formatted NTFS for Windows 10, Windows 8.1, Windows 7.',
    category: 'electronics',
    image: 'https://fakestoreapi.com/img/61IBBVJvSDL._AC_SY879_t.png',
    rating: const Rating(rate: 3.3, count: 203),
  ),
  Product(
    id: 10,
    title: 'SanDisk SSD PLUS 1TB Internal SSD - SATA III 6 Gb/s',
    price: 109.00,
    description:
        'Easy upgrade for faster boot up, shutdown, application load and response. Boosts burst write performance, making it ideal for typical PC workloads.',
    category: 'electronics',
    image: 'https://fakestoreapi.com/img/61U7T1koQqL._AC_SX679_t.png',
    rating: const Rating(rate: 2.9, count: 470),
  ),
  Product(
    id: 11,
    title:
        'Silicon Power 256GB SSD 3D NAND A55 SLC Cache Performance Boost SATA III 2.5',
    price: 109.00,
    description:
        '3D NAND flash are applied to deliver high transfer speeds. Remarkable transfer speed that enables faster bootup and improved overall system performance.',
    category: 'electronics',
    image: 'https://fakestoreapi.com/img/71kWymZ+c+L._AC_SX679_t.png',
    rating: const Rating(rate: 4.8, count: 319),
  ),
  Product(
    id: 12,
    title: 'WD 4TB Gaming Drive Works with Playstation 4 Portable External Hard Drive',
    price: 114.00,
    description:
        'Expand your PS4 gaming experience, Play anywhere Fast and easy, setup Sleek design with high capacity, 3-year manufacturer\'s limited warranty.',
    category: 'electronics',
    image: 'https://fakestoreapi.com/img/61mtL65D4cL._AC_SX679_t.png',
    rating: const Rating(rate: 4.8, count: 400),
  ),
  Product(
    id: 13,
    title: 'Acer SB220Q bi 21.5 inches Full HD (1920 x 1080) IPS Ultra-Thin',
    price: 599.00,
    description:
        '21.5 inches Full HD widescreen IPS display. AMD Radeon FreeSync technology. 75Hz refresh rate using HDMI port. Ultra-thin zero-frame design.',
    category: 'electronics',
    image: 'https://fakestoreapi.com/img/81QpkIctqPL._AC_SX679_t.png',
    rating: const Rating(rate: 2.9, count: 250),
  ),
  Product(
    id: 14,
    title:
        'Samsung 49-Inch CHG90 144Hz Curved Gaming Monitor (LC49HG90DMNXZA) – Super Ultrawide Screen QLED',
    price: 999.99,
    description:
        '49 INCH SUPER ULTRAWIDE 32:9 CURVED GAMING MONITOR with dual 27 inch side by side screens. Quantum dot (QLED) technology, HDR support and 144Hz refresh rate.',
    category: 'electronics',
    image: 'https://fakestoreapi.com/img/81Zt42ioCgL._AC_SX679_t.png',
    rating: const Rating(rate: 2.2, count: 140),
  ),
  Product(
    id: 15,
    title: 'BIYLACLESEN Women\'s 3-in-1 Snowboard Jacket Winter Coats',
    price: 56.99,
    description:
        'Note:The Jackets is US standard size, Please choose size as your usual wear Material: 100% Polyester; Detachable Liner Fabric: Warm Fleece. Detachable functional ski hood.',
    category: "women's clothing",
    image: 'https://fakestoreapi.com/img/51Y5NI-I5jL._AC_UX679_t.png',
    rating: const Rating(rate: 2.6, count: 235),
  ),
  Product(
    id: 16,
    title:
        'Lock and Love Women\'s Removable Hooded Faux Leather Moto Biker Jacket',
    price: 29.95,
    description:
        '100% POLYURETHANE (shell) 100% POLYESTER (lining). Faux leather material for style and comfort / 2 pockets of front, 2-For-One Hooded denim style faux leather jacket.',
    category: "women's clothing",
    image: 'https://fakestoreapi.com/img/81XH0e8fefL._AC_UY879_t.png',
    rating: const Rating(rate: 2.9, count: 340),
  ),
  Product(
    id: 17,
    title: 'Rain Jacket Women Windbreaker Striped Climbing Raincoats',
    price: 39.99,
    description:
        'Lightweight, skin-friendly, comfortable and breathable. Waterproof design with adjustable drawstring waist and hood to keep you dry and warm in wet weather.',
    category: "women's clothing",
    image: 'https://fakestoreapi.com/img/71HblAHs5xL._AC_UY879_-2t.png',
    rating: const Rating(rate: 3.8, count: 679),
  ),
  Product(
    id: 18,
    title: 'MBJ Women\'s Solid Short Sleeve Boat Neck V Neck T-Shirt',
    price: 9.85,
    description:
        '95% RAYON 5% SPANDEX, Lightweight fabric with great stretch for comfort, Ribbed on sleeves and neckline / Double stitching on bottom hem.',
    category: "women's clothing",
    image: 'https://fakestoreapi.com/img/71z3kpMAYsL._AC_UY879_t.png',
    rating: const Rating(rate: 4.7, count: 130),
  ),
  Product(
    id: 19,
    title: 'Opna Women\'s Short Sleeve Moisture Wicking Athletic T-Shirt',
    price: 7.95,
    description:
        '100% Polyester, Machine wash, 100% cationic polyester interlock, Lightweight, roomy and highly breathable with moisture wicking fabric which helps to keep moisture away.',
    category: "women's clothing",
    image: 'https://fakestoreapi.com/img/51eg55uWmdL._AC_UX679_t.png',
    rating: const Rating(rate: 4.5, count: 146),
  ),
  Product(
    id: 20,
    title: 'DANVOUY Womens T Shirt Casual Cotton Short Sleeve',
    price: 12.99,
    description:
        '95%Cotton,5%Spandex, Features: Casual, Short Sleeve, Letter Print, V-Neck, Fashion Tees The fabric is soft and has some stretch. Suitable for Summer Casual, Home, Party.',
    category: "women's clothing",
    image: 'https://fakestoreapi.com/img/61pHAEJ4NML._AC_UX679_t.png',
    rating: const Rating(rate: 3.6, count: 145),
  ),
];
