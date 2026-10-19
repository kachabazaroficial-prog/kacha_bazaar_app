import 'package:flutter/material.dart';
import 'login_screen.dart';

class ProductDetailScreen extends StatelessWidget {
  final String productName;
  final String productPrice;
  final IconData productIcon;

  const ProductDetailScreen({
    super.key,
    required this.productName,
    required this.productPrice,
    required this.productIcon,
  });

  @override
  Widget build(BuildContext context) {
    // এখানে ধরে নিচ্ছি ইউজার এখনও লগইন করেনি (IsLoggedIn = false)
    bool isLoggedIn = false; 

    return Scaffold(
      appBar: AppBar(
        title: Text(productName),
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              color: Colors.green.shade50,
              child: Icon(productIcon, size: 100, color: Colors.green),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      productName,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      productPrice,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Text(
                  'Fresh and organic product directly sourced from local farms. Guaranteed quality and fast 30-minute delivery to your doorstep.',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      if (!isLoggedIn) {
                        // যদি লগইন না করা থাকে তবে লগইন পেজে পাঠিয়ে দেবে
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const LoginScreen()),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please login first to add items to cart!'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      } else {
                        // লগইন করা থাকলে কার্টে যোগ হবে
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Added to cart successfully!'),
                            backgroundColor: Colors.green,
                          ),
                        );
                      }
                    },
                    child: const Text(
                      'Add to Cart',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
