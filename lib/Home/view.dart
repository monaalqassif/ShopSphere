import 'package:flutter/material.dart';
import '../products_Screen/view.dart';
import '../widgets/product_item.dart';
import '../widgets/banner_item.dart';
import '../search/view.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}




class _HomeScreenState extends State<HomeScreen> {
  List<String> featuredNames = ["Watch", "Nike Shoes", "Airpods"];
  List<String> featuredImages = [
    "assets/images/watch.png",
    "assets/images/shoes.png",
    "assets/images/Airpods.png",
  ];
  List<String> featuredPrices = [r"$40", r"$430", r"$333"];

  List<String> popularNames = ["LG TV", "Hoodie", "Jacket"];
  List<String> popularImages = [
    "assets/images/lg tv.png",
    "assets/images/hoodie.png",
    "assets/images/jacket.png",
  ];
  List<String> popularPrices = [r"$330", r"$50", r"$400"];

  List<Map<String, String>> banners = [
    {
      "image": "assets/images/logo.png",
      "title": "Get Winter Discount",
      "offer": "20% Off",
      "subtitle": "For Children",
    },
    {
      "image": "assets/images/Airpods.png",
      "title": "AirPods Sale",
      "offer": "30% Off",
      "subtitle": "Limited Time",
    },
    {
      "image": "assets/images/hoodie.png",
      "title": "Hoodie Collection",
      "offer": "40% Off",
      "subtitle": "Winter Fashion",
    },
    {
      "image": "assets/images/T-shirt.png",
      "title": "T-Shirts",
      "offer": "15% Off",
      "subtitle": "For Everyone",
    },
  ];


  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final userName = user?.email?.split('@').first ?? 'User';
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,


        title: Row(
          children: [
            const CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage("assets/images/profile.png"),
            ),
            SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  "Hello!",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  userName,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              radius: 22,
              backgroundColor: const Color(0xffF8F7F7),
              child: const Icon(
                Icons.notifications_none,
                color: Colors.black,
                size: 22,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(

        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),




          child: Column(
            children: [

              SizedBox(height: 16),



              SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SearchScreen(),
                    ),
                  );
                },
                child: AbsorbPointer(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Search here",
                      prefixIcon: Icon(Icons.search, color: Colors.grey),
                      filled: true,
                      fillColor: const Color(0xffF8F7F7),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: const BorderSide(color: Color(0xffF8F7F7)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: const BorderSide(color: Color(0xff5A4FCF)),
                      ),
                    ),
                  ),
                ),
              ),







              SizedBox(height: 20),
              BannerItem(banners: banners),
              SizedBox(height: 20),






// row خاص ب ال Featured و see all
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Featured",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ProductListScreen()),
                      );
                    },
                    child: Text(
                      "See All",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff5A4FCF),
                      ),
                    ),
                  ),
                ],
              ),






              SizedBox(height: 12),




              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                //   بيضيف كروت المنتجات جنب بعضها في خط أفقي واحد
                child: Row(


                 // (Loop)
                  children: List.generate(
                    featuredNames.length,
                        (i) => GestureDetector(
                      onTap: () {
                        final product = dummyProducts.firstWhere(
                              (p) => p.name == featuredNames[i],
                          orElse: () => dummyProducts[0],
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailsScreen(product: product),
                          ),
                        );
                      },
                      child: ProductItem(
                        productName: featuredNames[i],
                        productImage: featuredImages[i],
                        price: featuredPrices[i],

                      ),
                    ),
                  ),
                ),
              ),













            SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Most Popular",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ProductListScreen()),
                      );
                    },
                    child: Text(
                      "See All",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff5A4FCF),
                      ),
                    ),
                  ),
                ],
              ),








             SizedBox(height: 12),




              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    popularNames.length,
                        (i) => GestureDetector(
                      onTap: () {
                        final product = dummyProducts.firstWhere(
                              (p) => p.name == popularNames[i],
                          orElse: () => dummyProducts[0],
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailsScreen(product: product),
                          ),
                        );
                      },
                      child: ProductItem(
                        productName: popularNames[i],
                        productImage: popularImages[i],
                        price: popularPrices[i],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}