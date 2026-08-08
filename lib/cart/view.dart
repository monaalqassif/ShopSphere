import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final uid = FirebaseAuth.instance.currentUser?.uid;

    if (uid == null) {
      return const Scaffold(
        body: Center(child: Text('Please login to view cart')),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,

        title: const Text(
          'My Cart',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(uid)
            .collection('cart')
            .orderBy('createdAt', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.shopping_bag_outlined, size: 70, color: Colors.grey.shade400),
                  const SizedBox(height: 16),
                  Text(
                    'Your cart is empty',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            );
          }

          final cartItems = snapshot.data!.docs;
          double totalPrice = 0;
          for (var doc in cartItems) {
            final data = doc.data() as Map<String, dynamic>;
            totalPrice += (data['price'] as num).toDouble() * (data['quantity'] as int);
          }

          return Column(
            children: [
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: cartItems.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final doc = cartItems[index];
                    final item = doc.data() as Map<String, dynamic>;
                    final currentQuantity = item['quantity'] as int;

                    return Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              item['imagePath'] ?? '',
                              width: 70,
                              height: 70,
                              fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) => Container(
                                width: 70,
                                height: 70,
                                color: Colors.grey.shade200,
                                child: const Icon(Icons.image_not_supported),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item['name'] ?? '',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                if (item['size'] != null) ...[
                                  const SizedBox(height: 4),
                                  Text(
                                    'Size: ${item['size']}',
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                                const SizedBox(height: 4),
                                Text(
                                  '\$${(item['price'] as num).toInt()}',
                                  style: const TextStyle(
                                    color: Color(0xFF6C5CE7),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.delete_outline, color: Colors.grey.shade500),
                            onPressed: () async {
                              await doc.reference.delete();
                            },
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            decoration: BoxDecoration(
                              color: const Color(0xFF6C5CE7).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    if (currentQuantity > 1) {
                                      await doc.reference.update({'quantity': currentQuantity - 1});
                                    } else {
                                      await doc.reference.delete();
                                    }
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.all(6),
                                    child: Icon(Icons.remove, size: 16, color: Color(0xFF6C5CE7)),
                                  ),
                                ),
                                Text(
                                  '$currentQuantity',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    color: Color(0xFF6C5CE7),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    await doc.reference.update({'quantity': currentQuantity + 1});
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.all(6),
                                    child: Icon(Icons.add, size: 16, color: Color(0xFF6C5CE7)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                  boxShadow: [
                    BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, -4)),
                  ],
                ),
                child: SafeArea(
                  top: false,
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Total', style: TextStyle(color: Colors.grey, fontSize: 13)),
                          Text(
                            '\$${totalPrice.toStringAsFixed(2)}',
                            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Expanded(
                        flex: 2,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF6C5CE7),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          onPressed: () async {
                            for (var item in cartItems) {
                              await item.reference.delete();
                            }
                            await FirebaseFirestore.instance
                                .collection('users')
                                .doc(uid)
                                .collection('orders')
                                .doc('active_order')
                                .delete();

                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Order placed successfully!')),
                              );
                            }
                          },
                          child: const Text(
                            'Checkout',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}