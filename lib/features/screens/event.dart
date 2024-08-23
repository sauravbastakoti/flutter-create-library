// // import 'package:flutter/material.dart';

// // class Events extends StatefulWidget {
// //   final PageController pageController;
// //   static String routeName = '/events';
// //   const Events({super.key, required this.pageController});

// //   @override
// //   State<Events> createState() => _EventsState();
// // }

// // class _EventsState extends State<Events> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return const Scaffold(
// //       body: Column(
// //         children: [
// //           Text('events'),
// //         ],
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';

// import 'package:google_fonts/google_fonts.dart';

// class Categories extends StatelessWidget {
//   final PageController pageController;
//   static String routeName = '/events';

//   const Categories({super.key, required this.pageController});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFD4FCE4),
//       body: Padding(
//         padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 IconButton(
//                   icon: const Icon(Icons.arrow_back),
//                   onPressed: () {
//                     // Handle back button press
//                   },
//                 ),
//                 Row(
//                   children: [
//                     IconButton(
//                       icon: const Icon(Icons.shopping_cart),
//                       onPressed: () {
//                         // Handle cart button press
//                       },
//                     ),
//                     IconButton(
//                       icon: const Icon(Icons.person),
//                       onPressed: () {
//                         //   Get.to(const ProfileScreen());
//                       },
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             const SizedBox(height: 20),
//             Container(
//               height: 50,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(30),
//               ),
//               child: Row(
//                 children: [
//                   const SizedBox(width: 15),
//                   const Icon(Icons.search, color: Color(0xFF706060)),
//                   const SizedBox(width: 10),
//                   Expanded(
//                     child: TextField(
//                       decoration: InputDecoration(
//                         hintText: 'Search for Products',
//                         hintStyle: GoogleFonts.getFont(
//                           'Roboto Condensed',
//                           fontWeight: FontWeight.w400,
//                           fontSize: 18,
//                           color: const Color(0xFF706060),
//                         ),
//                         border: InputBorder.none,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 20),
//             Text(
//               'Categories',
//               style: GoogleFonts.getFont(
//                 'Roboto Condensed',
//                 fontWeight: FontWeight.w500,
//                 fontSize: 20,
//                 color: const Color(0xFF000000),
//               ),
//             ),
//             const SizedBox(height: 10),
//             SizedBox(
//               height: 60,
//               child: ListView(
//                 scrollDirection: Axis.horizontal,
//                 children: [
//                   _buildCategoryChip(
//                     'All',
//                     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQRyX_ZPWyqk8VFCXe4QnGhAnK5gd28OfPjMw&s',
//                   ),
//                   _buildCategoryChip(
//                     'Leafy greens',
//                     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQRyX_ZPWyqk8VFCXe4QnGhAnK5gd28OfPjMw&s',
//                   ),
//                   _buildCategoryChip(
//                     'Root Vegetables',
//                     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwITOPrrqywiHe2kmT6w2paaDVD3JJYEiBsg&s',
//                   ),
//                   _buildCategoryChip(
//                     'Cruciferous',
//                     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_segST6eQM_DDYlmBzvb3fNCjp5OuzFWAhA&s',
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 20),
//             Text(
//               'All Items',
//               style: GoogleFonts.getFont(
//                 'Roboto Condensed',
//                 fontWeight: FontWeight.w500,
//                 fontSize: 20,
//                 color: const Color(0xFF000000),
//               ),
//             ),
//             const SizedBox(height: 10),
//             Expanded(
//               child: GridView.count(
//                 crossAxisCount: 2,
//                 crossAxisSpacing: 10,
//                 mainAxisSpacing: 10,
//                 children: List.generate(4, (index) {
//                   return _buildItemCard(
//                     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1ONLsNmWg9fNMjVgTpRVlv7PMUjNTtCYXKw&s',
//                     'Item $index',
//                     'Rs. ${index * 25 + 25}',
//                   );
//                 }),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildCategoryChip(String label, String imageUrl) {
//     return Padding(
//       padding: const EdgeInsets.only(right: 10),
//       child: Chip(
//         avatar: CircleAvatar(
//           backgroundImage: NetworkImage(imageUrl),
//         ),
//         label: Text(
//           label,
//           style: GoogleFonts.getFont(
//             'Roboto Condensed',
//             fontWeight: FontWeight.w400,
//             fontSize: 16,
//             color: const Color(0xFF000000),
//           ),
//         ),
//         backgroundColor: Colors.white,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(20),
//         ),
//       ),
//     );
//   }

//   Widget _buildItemCard(String imageUrl, String title, String price) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Expanded(
//             child: Image.network(
//               imageUrl,
//               fit: BoxFit.cover,
//               width: double.infinity,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               title,
//               style: GoogleFonts.getFont(
//                 'Roboto Condensed',
//                 fontWeight: FontWeight.w500,
//                 fontSize: 16,
//                 color: const Color(0xFF000000),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8.0),
//             child: Text(
//               price,
//               style: GoogleFonts.getFont(
//                 'Roboto Condensed',
//                 fontWeight: FontWeight.w400,
//                 fontSize: 14,
//                 color: const Color(0xFF706060),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: ElevatedButton(
//               onPressed: () {
//                 // Handle add to cart button press
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: const Color(0xC91B9527),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//               ),
//               child: Text(
//                 'Add to Cart',
//                 style: GoogleFonts.getFont(
//                   'Roboto Condensed',
//                   fontWeight: FontWeight.w700,
//                   fontSize: 14,
//                   color: const Color(0xFFFFFFFF),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:KrishiKranti/features/screens/cart/add_to_cart.dart';
import 'package:KrishiKranti/utils/api_string.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class Categories extends StatefulWidget {
  final PageController pageController;
  static String routeName = '/events';

  const Categories({super.key, required this.pageController});

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<Product> _products = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }

  Future<void> _fetchProducts() async {
    final response =
        await http.get(Uri.parse('${ApiString.baseUrl}product?search='));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final products =
          (data['data'] as List).map((json) => Product.fromJson(json)).toList();

      setState(() {
        _products = products;
        _isLoading = false;
      });
    } else {
      // Handle error
      setState(() {
        _isLoading = false;
      });
      throw Exception('Failed to load products');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD4FCE4),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.shopping_cart),
                      onPressed: () {
                        // Navigate to cart page
                        Get.to(() => const CartPage(
                              productName: '',
                              productImage: '',
                              productPrice: 0.0,
                            ));
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.person),
                      onPressed: () {
                        // Handle profile button press
                      },
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
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
            const SizedBox(height: 20),
            Text(
              'All Items',
              style: GoogleFonts.getFont(
                'Roboto Condensed',
                fontWeight: FontWeight.w500,
                fontSize: 20,
                color: const Color(0xFF000000),
              ),
            ),
            const SizedBox(height: 10),
            if (_isLoading)
              const Center(child: CircularProgressIndicator())
            else
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: _products.length,
                  itemBuilder: (context, index) {
                    final product = _products[index];
                    return _buildItemCard(
                      product.productImage,
                      product.productName,
                      'Rs. ${product.productPrice.toStringAsFixed(2)}',
                      product,
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildItemCard(
      String imageUrl, String title, String price, Product product) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: GoogleFonts.getFont(
                'Roboto Condensed',
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: const Color(0xFF000000),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              price,
              style: GoogleFonts.getFont(
                'Roboto Condensed',
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: const Color(0xFF706060),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                // Navigate to cart page with product data
                Get.to(() => CartPage(
                      productName: product.productName,
                      productImage: product.productImage,
                      productPrice: product.productPrice,
                    ));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xC91B9527),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Text(
                'Add to Cart',
                style: GoogleFonts.getFont(
                  'Roboto Condensed',
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: const Color(0xFFFFFFFF),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Product {
  final int productId;
  final Category category;
  final String productName;
  final double productPrice;
  final String productDescription;
  final String productImage;
  final int seller;

  Product({
    required this.productId,
    required this.category,
    required this.productName,
    required this.productPrice,
    required this.productDescription,
    required this.productImage,
    required this.seller,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productId: json['product_id'] ?? 0,
      category: Category.fromJson(json['category']),
      productName: json['product_name'] ?? 'Unknown',
      productPrice: (json['product_price'] != null)
          ? json['product_price'].toDouble()
          : 0.0,
      productDescription: json['product_description'] ?? '',
      productImage: json['product_image'] ?? '',
      seller: json['seller'] ?? 0,
    );
  }
}

class Category {
  final int categoryId;
  final String categoryName;

  Category({
    required this.categoryId,
    required this.categoryName,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      categoryId: json['category_id'] ?? 0,
      categoryName: json['category_name'] ?? 'Unknown',
    );
  }
}
