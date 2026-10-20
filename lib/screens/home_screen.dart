import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAlignment.start,
            children: [
              // 1. Header Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 18,
                          backgroundColor: Color(0xFFE2E8F0),
                          child: Icon(Icons.person_outline, color: Colors.black54),
                        ),
                        const SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAlignment.start,
                          children: [
                            RichText(
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Kacha ',
                                    style: TextStyle(
                                      color: Color(0xFF1E5631),
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'sans-serif',
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Bazaar',
                                    style: TextStyle(
                                      color: Color(0xFFE67E22),
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'sans-serif',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Row(
                              children: [
                                Icon(Icons.location_on_outlined, size: 14, color: Colors.black80),
                                SizedBox(width: 2),
                                Text(
                                  'India',
                                  style: TextStyle(fontSize: 13, color: Colors.black80, fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.black26),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      ),
                      child: const Text(
                        'Login/Register',
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 13),
                      ),
                    ),
                  ],
                ),
              ),

              // 2. Search Bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: '"Search for fresh products, veggies, or groceries...',
                    hintStyle: TextStyle(fontSize: 13, color: Colors.grey.shade600),
                    suffixIcon: const Icon(Icons.search, color: Colors.black80, size: 22),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: Colors.black12),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: Colors.black12),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // 3. Banner Slider with Indicators
              SizedBox(
                height: 125,
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection('banners').snapshots(),
                  builder: (context, snapshot) {
                    var docs = snapshot.data?.docs ?? [];
                    if (docs.isEmpty) {
                      return ListView(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        children: [
                          _buildBannerCard('GET 50% OFF', 'on your First Order!', Colors.green.shade100, Colors.green.shade900, 'https://images.unsplash.com/photo-1590779033100-9f60a05a013d?w=300'),
                          _buildBannerCard('FLASH SALE:', 'Fresh Vegetables!', Colors.blue.shade100, Colors.blue.shade900, 'https://images.unsplash.com/photo-1540420773420-3366772f4999?w=300'),
                          _buildBannerCard('WEEKEND DEALS:', 'Best Grocery Offers!', Colors.amber.shade100, Colors.amber.shade900, 'https://images.unsplash.com/photo-1610832958506-aa56368176cf?w=300'),
                        ],
                      );
                    }
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: docs.length,
                      itemBuilder: (context, index) {
                        var banner = docs[index].data() as Map<String, dynamic>;
                        return _buildBannerCard(
                          banner['title'] ?? 'GET 50% OFF',
                          banner['subtitle'] ?? 'on your First Order!',
                          Colors.green.shade100,
                          Colors.green.shade900,
                          banner['image'] ?? 'https://images.unsplash.com/photo-1590779033100-9f60a05a013d?w=300',
                        );
                      },
                    );
                  },
                ),
              ),

              // Banner Indicator Dots
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(width: 16, height: 5, decoration: BoxDecoration(color: Colors.green.shade800, borderRadius: BorderRadius.circular(10))),
                  const SizedBox(width: 4),
                  Container(width: 5, height: 5, decoration: const BoxDecoration(color: Colors.black26, shape: BoxShape.circle)),
                  const SizedBox(width: 4),
                  Container(width: 5, height: 5, decoration: const BoxDecoration(color: Colors.black26, shape: BoxShape.circle)),
                  const SizedBox(width: 4),
                  Container(width: 5, height: 5, decoration: const BoxDecoration(color: Colors.black26, shape: BoxShape.circle)),
                ],
              ),

              const SizedBox(height: 16),

              // 4. Quick Special Stores (₹1 Store, Fresh Item, Morning Store, Evening Store)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SizedBox(
                  height: 40,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildQuickStoreChip('₹1 Store', Icons.monetization_on, Colors.purple.shade700, Colors.purple.shade50),
                      _buildQuickStoreChip('FRESH ITEM', Icons.eco, Colors.green.shade800, Colors.green.shade50),
                      _buildQuickStoreChip('MORNING STORE', Icons.wb_sunny, Colors.orange.shade800, Colors.orange.shade50),
                      _buildQuickStoreChip('EVENING STORE', Icons.nights_stay, Colors.indigo.shade800, Colors.indigo.shade50),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // 5. Shop by Categories
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text('Shop by Categories', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black80)),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection('categories').snapshots(),
                  builder: (context, snapshot) {
                    var docs = snapshot.data?.docs ?? [];
                    List<Map<String, dynamic>> categoriesList = docs.isNotEmpty
                        ? docs.map((d) => d.data() as Map<String, dynamic>).toList()
                        : [
                            {'name': 'Vegetables', 'color': 0xFFDCFCE7, 'image': 'https://images.unsplash.com/photo-1597362925123-77861d3fbac7?w=150'},
                            {'name': 'Fruits', 'color': 0xFFFEF3C7, 'image': 'https://images.unsplash.com/photo-1619566636858-adf3ef46400b?w=150'},
                            {'name': 'Dairy', 'color': 0xFFE0F2FE, 'image': 'https://images.unsplash.com/photo-1628088062854-d1870b4553da?w=150'},
                            {'name': 'Meat', 'color': 0xFFFEE2E2, 'image': 'https://images.unsplash.com/photo-1607623814075-e51df1bdc82f?w=150'},
                            {'name': 'Snacks', 'color': 0xFFFEF3C7, 'image': 'https://images.unsplash.com/photo-1621939514649-280e2ee25f60?w=150'},
                            {'name': 'Beverages', 'color': 0xFFFFEDD5, 'image': 'https://images.unsplash.com/photo-1551024709-8f23befc6f87?w=150'},
                            {'name': 'Staples', 'color': 0xFFFEF3C7, 'image': 'https://images.unsplash.com/photo-1586201375761-83865001e31c?w=150'},
                            {'name': 'Personal Care', 'color': 0xFFE0F2FE, 'image': 'https://images.unsplash.com/photo-1556228720-195a672e8a03?w=150'},
                          ];

                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        childAspectRatio: 0.8,
                      ),
                      itemCount: categoriesList.length,
                      itemBuilder: (context, index) {
                        var cat = categoriesList[index];
                        return _buildCategoryItem(
                          cat['name'] ?? '',
                          cat['image'] ?? '',
                          Color(cat['color'] ?? 0xFFDCFCE7),
                        );
                      },
                    );
                  },
                ),
              ),

              const SizedBox(height: 20),

              // 6. Featured Products
              _buildProductSectionHeader('Featured Products'),
              _buildProductHorizontalList('products'),

              const SizedBox(height: 20),

              // 7. Best Sellers
              _buildProductSectionHeader('Best Sellers'),
              _buildProductHorizontalList('best_sellers'),

              const SizedBox(height: 20),

              // 8. Seasonal Specials
              _buildProductSectionHeader('Seasonal Specials'),
              _buildProductHorizontalList('seasonal_specials'),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),

      // 9. Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF1E5631),
        unselectedItemColor: Colors.black80,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
        unselectedLabelStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          const BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: 'Category'),
          BottomNavigationBarItem(
            icon: Badge(
              label: const Text('3'),
              backgroundColor: const Color(0xFF1E5631),
              child: const Icon(Icons.shopping_cart_outlined),
            ),
            label: 'Cart',
          ),
          const BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined), label: 'Order'),
          const BottomNavigationBarItem(icon: Icon(Icons.help_outline), label: 'Help'),
        ],
      ),
    );
  }

  Widget _buildQuickStoreChip(String label, IconData icon, Color textColor, Color bgColor) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: textColor.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Icon(icon, size: 16, color: textColor),
          const SizedBox(width: 6),
          Text(label, style: TextStyle(color: textColor, fontWeight: FontWeight.bold, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildBannerCard(String title, String subtitle, Color bgColor, Color textColor, String imageUrl) {
    return Container(
      width: 260,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title, style: TextStyle(fontWeight: FontWeight.w900, fontSize: 15, color: textColor)),
                Text(subtitle, style: TextStyle(fontSize: 11, color: textColor, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(color: textColor, borderRadius: BorderRadius.circular(12)),
                  child: const Text('SHOP NOW', style: TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(imageUrl, width: 75, height: 75, fit: BoxFit.cover, errorBuilder: (c, e, s) => const Icon(Icons.fastfood, size: 50)),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(String name, String imageUrl, Color bgColor) {
    return Column(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(18)),
            child: Center(
              child: imageUrl.isNotEmpty
                  ? Image.network(imageUrl, fit: BoxFit.contain, errorBuilder: (c, e, s) => const Icon(Icons.category, color: Colors.green))
                  : const Icon(Icons.category, color: Colors.green),
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(name, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Colors.black80), textAlign: TextAlign.center, maxLines: 1),
      ],
    );
  }

  Widget _buildProductSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black80)),
          const Icon(Icons.chevron_right, color: Colors.black80),
        ],
      ),
    );
  }

  Widget _buildProductHorizontalList(String collectionName) {
    return SizedBox(
      height: 230,
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection(collectionName).snapshots(),
        builder: (context, snapshot) {
          var docs = snapshot.data?.docs ?? [];
          List<Map<String, dynamic>> products = docs.isNotEmpty
              ? docs.map((d) => d.data() as Map<String, dynamic>).toList()
              : [
                  {'title': 'Premium Red Tomatoes (1kg)', 'price': '85', 'oldPrice': '95', 'image': 'https://images.unsplash.com/photo-1592924357228-91a4daadcfea?w=200', 'hasAdd': true},
                  {'title': 'Fresh Farm Milk (1L)', 'price': '60', 'oldPrice': '', 'image': 'https://images.unsplash.com/photo-1563636619-e9143da7973b?w=200', 'hasAdd': false},
                  {'title': 'Organic Basmati Rice (5kg)', 'price': '360', 'oldPrice': '399', 'image': 'https://images.unsplash.com/photo-1586201375761-83865001e31c?w=200', 'hasAdd': false},
                  {'title': 'Crispy Potato Chips', 'price': '80', 'oldPrice': '', 'image': 'https://images.unsplash.com/photo-1566478989037-eec170784d0b?w=200', 'hasAdd': false},
                ];

          return ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            itemCount: products.length,
            itemBuilder: (context, index) {
              var product = products[index];
              return _buildProductCard(
                product['title'] ?? '',
                '₹${product['price'] ?? '0'}',
                product['oldPrice'] != null && product['oldPrice'].toString().isNotEmpty ? '₹${product['oldPrice']}' : '',
                product['image'] ?? '',
                product['hasAdd'] ?? (index == 0),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildProductCard(String title, String price, String oldPrice, String imageUrl, bool hasAddBtn) {
    return Container(
      width: 150,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.black12),
      ),
      child: Column(
        crossAxisAlignment: CrossAlignment.start,
        children: [
          Expanded(
            child: Center(
              child: imageUrl.isNotEmpty
                  ? Image.network(imageUrl, fit: BoxFit.contain, errorBuilder: (c, e, s) => const Icon(Icons.image, size: 40, color: Colors.grey))
                  : const Icon(Icons.image, size: 40, color: Colors.grey),
            ),
          ),
          const SizedBox(height: 8),
          Text(title, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black80), maxLines: 2, overflow: TextOverflow.ellipsis),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAlignment.start,
                children: [
                  if (oldPrice.isNotEmpty)
                    Text(oldPrice, style: const TextStyle(fontSize: 10, color: Colors.grey, decoration: TextDecoration.lineThrough)),
                  Text(price, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black)),
                ],
              ),
              if (hasAddBtn)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: const Color(0xFF1E5631), width: 1.5),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text('+ADD', style: TextStyle(color: Color(0xFF1E5631), fontSize: 10, fontWeight: FontWeight.bold)),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
