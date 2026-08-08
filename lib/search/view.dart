import 'package:flutter/material.dart';
import 'package:final_project/products_Screen/view.dart';


class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Product> results = [];

  final TextEditingController searchController = TextEditingController();

  void search(String query) {
    setState(() {
      results = dummyProducts
          .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void clearSearch() {
    searchController.clear();

    setState(() {
      results = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: TextField(
          controller: searchController,
          autofocus: true,
          onChanged: search,
          decoration: InputDecoration(
            hintText: "Search",


            suffixIcon: searchController.text.isNotEmpty
                ? IconButton(
              icon: const Icon(Icons.close),
              onPressed: clearSearch,
            )
                : null,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(

        itemCount: results.length,
        itemBuilder: (context, index) {
          final product = results[index];

          return ListTile(
            leading: Image.asset(
              product.imagePath,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            title: Text(product.name),
            subtitle: Text('\$${product.price.toInt()}'),
            trailing: IconButton(
              icon: const Icon(Icons.add_circle_outline),
              onPressed: () {
                setState(() {
                  AppState.increment(product.id);
                });
              },
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ProductDetailsScreen(product: product),
                ),
              );
            },
          );
        },
      ),
    );
  }
}