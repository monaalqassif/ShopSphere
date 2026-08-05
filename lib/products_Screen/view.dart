import 'package:flutter/material.dart';

class Product {
  final String id;
  final String name;
  final double price;
  final String imagePath;
  final double rating;
  final int reviewsCount;
  final String description;
  final List<String> sizes;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.imagePath,
    required this.rating,
    required this.reviewsCount,
    required this.description,
    required this.sizes,
  });
}

class AppState {
  static final Set<String> favoriteIds = {};
  static final Map<String, int> cartCounts = {};

  static bool isFavorite(String id) => favoriteIds.contains(id);

  static void toggleFavorite(String id) {
    if (favoriteIds.contains(id)) {
      favoriteIds.remove(id);
    } else {
      favoriteIds.add(id);
    }
  }

  static int quantityOf(String id) => cartCounts[id] ?? 0;

  static void increment(String id) {
    cartCounts[id] = quantityOf(id) + 1;
  }

  static void decrement(String id) {
    final current = quantityOf(id);
    if (current > 0) {
      cartCounts[id] = current - 1;
    }
  }
}

final List<Product> dummyProducts = [
  Product(
    id: '1',
    name: 'Watch',
    price: 40.0,
    imagePath: 'assets/images/watch.png',
    rating: 4.8,
    reviewsCount: 15,
    description:
    'A timeless classic watch designed with precision. Crafted from premium stainless steel, it offers both elegance and durability for your everyday wear.',
    sizes: ['S', 'M', 'L'],
  ),
  Product(
    id: '2',
    name: 'Nike Shoes',
    price: 430.0,
    imagePath: 'assets/images/shoes.png',
    rating: 4.5,
    reviewsCount: 20,
    description:
    'Culpa aliquam consequuntur veritatis at consequatur praesentium beatae temporibus nobis. Velit dolorem facilis neque autem. Itaque voluptatem expedita qui eveniet id veritatis eaque.',
    sizes: ['8', '10', '38', '40'],
  ),
  Product(
    id: '3',
    name: 'Blue Nike Shoes',
    price: 440.0,
    imagePath: 'assets/images/Blue Nike Shoes.png',
    rating: 4.7,
    reviewsCount: 18,
    description:
    'Stunning blue edition Nike shoes, engineered for maximum flexibility, breathability, and striking street style aesthetics.',
    sizes: ['39', '40', '41', '42', '43'],
  ),
  Product(
    id: '4',
    name: 'B&W Nike Shoes',
    price: 450.0,
    imagePath: 'assets/images/B&W Nike Shoes.png',
    rating: 4.9,
    reviewsCount: 33,
    description:
    'Classic black and white Nike shoes combining timeless color blocking with supreme comfort and durable rubber traction.',
    sizes: ['38', '39', '40', '41', '42'],
  ),
  Product(
    id: '5',
    name: 'Red Nike Shoes',
    price: 460.0,
    imagePath: 'assets/images/Red Nike Shoes.png',
    rating: 4.8,
    reviewsCount: 27,
    description:
    'Bold red Nike shoes designed to stand out. Features advanced cushioning technology for unmatched daily wear performance.',
    sizes: ['39', '40', '41', '42', '44'],
  ),
  Product(
    id: '6',
    name: 'LG TV',
    price: 330.0,
    imagePath: 'assets/images/lg tv.png',
    rating: 4.7,
    reviewsCount: 32,
    description:
    'Experience stunning 4K ultra HD resolution with vibrant colors and deep blacks. Smart TV capabilities allow you to stream your favorite shows seamlessly.',
    sizes: ['32"', '43"', '55"'],
  ),
  Product(
    id: '7',
    name: 'Airpods Pro',
    price: 333.0,
    imagePath: 'assets/images/Airpods.png',
    rating: 4.9,
    reviewsCount: 54,
    description:
    'Immersive sound quality with active noise cancellation and spatial audio. Designed for all-day comfort with a sleek wireless charging case.',
    sizes: ['One Size'],
  ),
  Product(
    id: '8',
    name: 'Airpods Max',
    price: 550.0,
    imagePath: 'assets/images/Airpods max.jpeg',
    rating: 4.9,
    reviewsCount: 40,
    description:
    'Over-ear headphones designed for high-fidelity audio, featuring active noise cancellation and transparency mode.',
    sizes: ['Standard'],
  ),
  Product(
    id: '9',
    name: 'Jacket',
    price: 50.0,
    imagePath: 'assets/images/jacket.png',
    rating: 4.3,
    reviewsCount: 12,
    description:
    'Stay warm and stylish with this modern winter jacket. Features wind-resistant fabric, cozy inner lining, and secure zippered pockets.',
    sizes: ['S', 'M', 'L', 'XL'],
  ),
  Product(
    id: '10',
    name: 'Hoodie',
    price: 400.0,
    imagePath: 'assets/images/hoodie.png',
    rating: 4.6,
    reviewsCount: 18,
    description:
    'Ultra-soft cotton blend hoodie built for ultimate comfort and streetwear style. Perfect for chilly evenings and casual everyday outings.',
    sizes: ['S', 'M', 'L', 'XL'],
  ),
  Product(
    id: '11',
    name: 'iPhone 15',
    price: 999.0,
    imagePath: 'assets/images/iphone 15.jpg',
    rating: 4.9,
    reviewsCount: 120,
    description:
    'Dynamic Island, a 48MP Main camera, and USB-C—all in a durable color-infused glass and aluminum design.',
    sizes: ['128GB', '256GB', '512GB'],
  ),
  Product(
    id: '12',
    name: 'iPhone 17',
    price: 1199.0,
    imagePath: 'assets/images/iPhone 17.webp',
    rating: 5.0,
    reviewsCount: 85,
    description:
    'The ultimate smartphone experience with next-gen processor, advanced camera capabilities, and stunning display.',
    sizes: ['256GB', '512GB', '1TB'],
  ),
  Product(
    id: '13',
    name: 'Thermal Cup',
    price: 35.0,
    imagePath: 'assets/images/Thermal Cup.jpg',
    rating: 4.4,
    reviewsCount: 25,
    description:
    'Keep your drinks hot or cold for hours with this double-wall vacuum insulated stainless steel thermal cup.',
    sizes: ['500ml', '750ml'],
  ),
  Product(
    id: '14',
    name: 'Wide-Leg Jeans',
    price: 65.0,
    imagePath: 'assets/images/Wide-Leg Jeans.jpeg',
    rating: 4.5,
    reviewsCount: 30,
    description:
    'Comfortable and trendy high-waisted wide-leg jeans crafted from premium denim for an effortless casual look.',
    sizes: ['S', 'M', 'L'],
  ),
  Product(
    id: '15',
    name: 'White Wide-Leg',
    price: 65.0,
    imagePath: 'assets/images/White Wide-Leg.webp',
    rating: 4.6,
    reviewsCount: 22,
    description:
    'Classic white wide-leg trousers that offer both elegance and extreme comfort for versatile styling options.',
    sizes: ['S', 'M', 'L'],
  ),
];

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {},
            ),
          ),
        ),
        title: const Text(
          'Products',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: GridView.builder(
          itemCount: dummyProducts.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.68,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemBuilder: (context, index) {
            final product = dummyProducts[index];
            final isFav = AppState.isFavorite(product.id);
            final quantity = AppState.quantityOf(product.id);

            return GestureDetector(
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ProductDetailsScreen(product: product),
                  ),
                );
                setState(() {});
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                            child: Image.asset(
                              product.imagePath,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            top: 8,
                            right: 8,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  AppState.toggleFavorite(product.id);
                                });
                              },
                              child: CircleAvatar(
                                radius: 16,
                                backgroundColor: Colors.white.withOpacity(0.85),
                                child: Icon(
                                  isFav
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  size: 18,
                                  color: isFav ? Colors.red : Colors.black54,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '\$${product.price.toInt()}',
                                  style: const TextStyle(
                                    color: Color(0xFF6C5CE7),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          if (quantity == 0)
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  AppState.increment(product.id);
                                });
                              },
                              child: const CircleAvatar(
                                radius: 14,
                                backgroundColor: Color(0xFF6C5CE7),
                                child: Icon(
                                  Icons.add,
                                  size: 16,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          else
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 4,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFF6C5CE7).withOpacity(0.1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        AppState.decrement(product.id);
                                      });
                                    },
                                    child: const Icon(
                                      Icons.remove,
                                      size: 16,
                                      color: Color(0xFF6C5CE7),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 6,
                                    ),
                                    child: Text(
                                      '$quantity',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                        color: Color(0xFF6C5CE7),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        AppState.increment(product.id);
                                      });
                                    },
                                    child: const Icon(
                                      Icons.add,
                                      size: 16,
                                      color: Color(0xFF6C5CE7),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ProductDetailsScreen extends StatefulWidget {
  final Product product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int selectedSizeIndex = 0;

  @override
  Widget build(BuildContext context) {
    final isFav = AppState.isFavorite(widget.product.id);
    final quantity = AppState.quantityOf(widget.product.id);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(30),
                  ),
                  child: Image.asset(
                    widget.product.imagePath,
                    height: 380,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                            ),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                            icon: Icon(
                              isFav ? Icons.favorite : Icons.favorite_border,
                              color: isFav ? Colors.red : Colors.black45,
                            ),
                            onPressed: () {
                              setState(() {
                                AppState.toggleFavorite(widget.product.id);
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.product.name,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '\$${widget.product.price.toInt()}',
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF6C5CE7),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 20),
                      const SizedBox(width: 4),
                      Text(
                        '${widget.product.rating}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '(${widget.product.reviewsCount} Review)',
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Description',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.product.description,
                    style: const TextStyle(
                      color: Colors.grey,
                      height: 1.5,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Size',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: List.generate(
                      widget.product.sizes.length,
                          (index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedSizeIndex = index;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 12),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 12,
                          ),
                          decoration: BoxDecoration(
                            color: selectedSizeIndex == index
                                ? Colors.black
                                : Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: Text(
                            widget.product.sizes[index],
                            style: TextStyle(
                              color: selectedSizeIndex == index
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'Quantity',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove, color: Colors.black87),
                          onPressed: () {
                            setState(() {
                              AppState.decrement(widget.product.id);
                            });
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            '$quantity',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add, color: Color(0xFF6C5CE7)),
                          onPressed: () {
                            setState(() {
                              AppState.increment(widget.product.id);
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF6C5CE7),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          onPressed: () {
                            if (quantity == 0) {
                              setState(() {
                                AppState.increment(widget.product.id);
                              });
                            }
                          },
                          child: const Text(
                            'Buy Now',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              AppState.increment(widget.product.id);
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: const Icon(
                              Icons.shopping_bag_outlined,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
