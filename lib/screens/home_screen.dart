import 'package:flutter/material.dart';

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
              // 1. Header (Logo, Location, Login)
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
                          child: Icon(Icons.person, color: Colors.grey),
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
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Bazaar',
                                    style: TextStyle(
                                      color: Color(0xFFE67E22),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
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
                                  style: TextStyle(fontSize: 12, color: Colors.black80, fontWeight: FontWeight.w500),
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
                        side: const BorderSide(color: Colors.black12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      ),
                      child: const Text('Login/Register', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),

              // 2. Search Bar
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: '"Search for fresh products, veggies, or groceries...',
                    hintStyle: const TextStyle(fontSize: 13, color: Colors.grey),
                    suffixIcon: const Icon(Icons.search, color: Colors.black80),
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

              // 3. Banner Slider
              SizedBox(
                height: 120,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    _buildBannerCard('GET 50% OFF', 'on your First Order!', Colors.green.shade100, Colors.green.shade800),
                    _buildBannerCard('FLASH SALE:', 'Fresh Vegetables!', Colors.blue.shade100, Colors.blue.shade800),
                    _buildBannerCard('WEEKEND DEALS:', 'Best Grocery Offers!', Colors.orange.shade100, Colors.orange.shade800),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // 4. Shop by Categories
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text('Shop by Categories', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 4,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.8,
                  children: [
                    _buildCategoryItem('Vegetables', Icons.eco, const Color(0xFFDCFCE7)),
                    _buildCategoryItem('Fruits', Icons.apple, const Color(0xFFFEF3C7)),
                    _buildCategoryItem('Dairy', Icons.local_drink, const Color(0xFFE0F2FE)),
                    _buildCategoryItem('Meat', Icons.set_meal, const Color(0xFFFEE2E2)),
                    _buildCategoryItem('Snacks', Icons.cookie, const Color(0xFFFEF3C7)),
                    _buildCategoryItem('Beverages', Icons.local_bar, const Color(0xFFFFEDD5)),
                    _buildCategoryItem('Staples', Icons.rice_bowl, const Color(0xFFFEF3C7)),
                    _buildCategoryItem('Personal Care', Icons.sanitizer, const Color(0xFFE0F2FE)),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // 5. Featured Products
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Featured Products', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_forward_ios, size: 16)),
                  ],
                ),
              ),
              SizedBox(
                height: 230,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    _buildProductCard('Premium Red Tomatoes (1kg)', '₹85', '₹95', Icons.grass, true),
                    _buildProductCard('Fresh Farm Milk (1L)', '₹60', '', Icons.water_drop, false),
                    _buildProductCard('Organic Basmati Rice (5kg)', '₹360', '₹399', Icons.grain, false),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      
      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF1E5631),
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
        unselectedLabelStyle: const TextStyle(fontSize: 12),
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          const BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: 'Category'),
          BottomNavigationBarItem(
            icon: Badge(
              label: const Text('3'),
              backgroundColor: Colors.green,
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

  Widget _buildBannerCard(String title, String subtitle, Color bgColor, Color textColor) {
    return Container(
      width: 250,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: textColor)),
          Text(subtitle, style: TextStyle(fontSize: 12, color: textColor)),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(color: textColor, borderRadius: BorderRadius.circular(12)),
            child: const Text('SHOP NOW', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(String name, IconData icon, Color bgColor) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(16)),
            child: Center(child: Icon(icon, size: 32, color: Colors.green.shade800)),
          ),
        ),
        const SizedBox(height: 6),
        Text(name, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500), textAlign: TextAlign.center, maxLines: 1),
      ],
    );
  }

  Widget _buildProductCard(String title, String price, String oldPrice, IconData icon, bool hasAddBtn) {
    return Container(
      width: 150,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.black12),
      ),
      child: Column(
        crossAxisAlignment: CrossAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(12)),
              child: Center(child: Icon(icon, size: 48, color: Colors.green)),
            ),
          ),
          const SizedBox(height: 8),
          Text(title, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold), maxLines: 2, overflow: TextOverflow.ellipsis),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAlignment.start,
                children: [
                  if (oldPrice.isNotEmpty)
                    Text(oldPrice, style: const TextStyle(fontSize: 10, color: Colors.grey, decoration: TextDecoration.lineThrough)),
                  Text(price, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                ],
              ),
              if (hasAddBtn)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text('+ADD', style: TextStyle(color: Colors.green, fontSize: 10, fontWeight: FontWeight.bold)),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
