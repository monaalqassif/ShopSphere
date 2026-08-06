

// product الموجوده في ال home
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String productName;
  final String productImage;
  final String price;


  const ProductItem({
    super.key,
    required this.productName,
    required this.productImage,
    required this.price,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      margin: EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xffF8F8F8),
        borderRadius: BorderRadius.circular(16),

      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(productImage, height: 100, width: double.infinity, fit: BoxFit.cover),
          ),
          SizedBox(height: 8),
          Text(productName, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(price, style: const TextStyle(color: Color(0xff5A4FCF), fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}