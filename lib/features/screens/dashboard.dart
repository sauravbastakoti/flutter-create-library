import 'package:KrishiKranti/features/screens/cart/add_to_cart.dart';
import 'package:KrishiKranti/features/screens/cart/sell_vegetables.dart';
import 'package:KrishiKranti/features/screens/search/search.dart';
import 'package:KrishiKranti/features/screens/settings/user_informations.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardScreen extends StatefulWidget {
  final PageController pageController;
  static String routeName = '/dashboardScreen';
  const DashboardScreen({super.key, required this.pageController});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    // Handle back button press
                  },
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.shopping_cart),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.person),
                      onPressed: () {
                        Get.to(const UserInformations());
                      },
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: GestureDetector(
                      onTap: () {},
                      child: Row(
                        children: [
                          const SizedBox(width: 15),
                          const Icon(Icons.search, color: Color(0xFF706060)),
                          const SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Search for Products',
                                hintStyle: GoogleFonts.getFont(
                                  'Roboto Condensed',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18,
                                  color: const Color(0xFF706060),
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                TextButton(
                  onPressed: () {
                    Get.to(const Search());
                  },
                  child: Text(
                    'Search',
                    style: GoogleFonts.getFont(
                      'Roboto Condensed',
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: const Color(0xFF000000),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const CategoriesSection(),
            const SizedBox(height: 40),
            Column(
              children: [
                Container(
                  height: 200,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://cdn.britannica.com/17/196817-159-9E487F15/vegetables.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                FeatureButton(
                  label: 'Buy Vegetables',
                  icon: Icons.shopping_cart,
                  color: const Color(0xFF1B9527),
                  onTap: () {
                    // Add your onTap functionality here
                    print('Buy Vegetables tapped');
                  },
                ),
                FeatureButton(
                  label: 'Sell Vegetables',
                  icon: Icons.attach_money,
                  color: const Color.fromARGB(255, 31, 160, 44),
                  onTap: () {
                    Get.to(const SellVegetablesPage());
                    print('Sell Vegetables tapped');
                  },
                ),
                FeatureButton(
                  label: 'Rice Disease Detection',
                  icon: Icons.local_florist,
                  color: const Color(0xFF1B9527),
                  onTap: () {
                    // Add your onTap functionality here
                    print('Rice Disease Detection tapped');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Categories',
          style: GoogleFonts.getFont(
            'Roboto Condensed',
            fontWeight: FontWeight.w500,
            fontSize: 20,
            color: const Color(0xFF000000),
          ),
        ),
        const SizedBox(height: 10),
        const SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              CategoryButton(label: 'All'),
              CategoryButton(label: 'Leafy greens'),
              CategoryButton(label: 'Root Vegetables'),
              CategoryButton(label: 'Cruciferous'),
            ],
          ),
        ),
      ],
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String label;

  const CategoryButton({required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: ElevatedButton(
        onPressed: () {
          // Handle category button press
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: const Color(0xFF1B9527),
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(
          label,
          style: GoogleFonts.getFont(
            'Roboto Condensed',
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

class FeatureButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const FeatureButton(
      {super.key,
      required this.label,
      required this.icon,
      required this.color,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: ListTile(
            leading: Icon(icon, color: Colors.white),
            title: Text(
              label,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String price;

  const ProductCard({
    required this.imageUrl,
    required this.name,
    required this.price,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            imageUrl,
            height: 10,
            width: 10,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 10),
          Text(
            name,
            style: GoogleFonts.getFont(
              'Roboto Condensed',
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          Text(
            'Rs. $price',
            style: GoogleFonts.getFont(
              'Roboto Condensed',
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              //Get.to(const CartPage());
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: const Color(0xFF1B9527),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Text(
              'Add to Cart',
              style: GoogleFonts.getFont(
                'Roboto Condensed',
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ScanContent extends StatelessWidget {
  const ScanContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Scan Screen Content'),
      ),
    );
  }
}
