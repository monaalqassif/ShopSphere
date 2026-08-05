import 'package:flutter/material.dart';
import 'package:final_project/products_Screen/view.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Product> results = [];

  void search(String query) {
    setState(() {
      results = dummyProducts
          .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          autofocus: true,
          onChanged: search,
          decoration: const InputDecoration(hintText: "Search"),
        ),
      ),
      body: ListView.builder(
        itemCount: results.length,
        itemBuilder: (context, index) {
          final product = results[index];
          return ListTile(
            leading: Image.asset(product.imagePath, width: 50, height: 50, fit: BoxFit.cover),
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
                MaterialPageRoute(builder: (context) => ProductDetailsScreen(product: product)),
              );
            },
          );
        },
      ),
    );
  }
}