import 'package:flutter/material.dart';
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
                    onPressed: () {
                      // Handle cart button press
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.person),
                    onPressed: () {
                      //Get.to(const ProfileScreen());
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
              const SizedBox(width: 10),
              TextButton(
                onPressed: () {
                  // Handle search button press
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
          const SizedBox(height: 20),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: const [
                ProductCard(
                  imageUrl:
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwITOPrrqywiHe2kmT6w2paaDVD3JJYEiBsg&s',
                  name: 'Corn',
                  price: '25',
                ),
                ProductCard(
                  imageUrl:
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwITOPrrqywiHe2kmT6w2paaDVD3JJYEiBsg&s',
                  name: 'Cucumber',
                  price: '115',
                ),
                ProductCard(
                  imageUrl:
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwITOPrrqywiHe2kmT6w2paaDVD3JJYEiBsg&s',
                  name: 'Gourds',
                  price: '110',
                ),
                ProductCard(
                  imageUrl:
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwITOPrrqywiHe2kmT6w2paaDVD3JJYEiBsg&s',
                  name: 'Pumpkin',
                  price: '125',
                ),
              ],
            ),
          ),
        ],
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
            height: 70,
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
              // Handle add to cart button press
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
