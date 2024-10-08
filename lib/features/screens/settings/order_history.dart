// import 'package:flutter/material.dart';

// class MyOrdersPage extends StatelessWidget {
//   final List<Order> orders = [
//     Order(
//       id: '99102',
//       date: '20-Aug-2024, 09:45 AM',
//       deliveryStatus: 'Estimated Delivery on 25 Aug',
//       imageUrl:
//           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSoIJjbXvJZeiMDlC1KQpUEgsKXLs8V91bRhg&s', // Replace with your network image URL
//       statusColor: Colors.green,
//     ),
//     Order(
//       id: '87346',
//       date: '16-July-2024, 02:00 PM',
//       deliveryStatus: 'Delivered on 15 Feb',
//       imageUrl:
//           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSoIJjbXvJZeiMDlC1KQpUEgsKXLs8V91bRhg&s', // Replace with your network image URL
//       statusColor: Colors.red,
//     ),
//     Order(
//       id: '87420',
//       date: '07-March-2024, 08:29 PM',
//       deliveryStatus: 'Delivered on 15 March',
//       imageUrl:
//           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSoIJjbXvJZeiMDlC1KQpUEgsKXLs8V91bRhg&s', // Replace with your network image URL
//       statusColor: Colors.red,
//     ),
//     Order(
//       id: '19873',
//       date: '27-Feb-2024, 03:01 PM',
//       deliveryStatus: 'Delivered on 3 March',
//       imageUrl:
//           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSoIJjbXvJZeiMDlC1KQpUEgsKXLs8V91bRhg&s', // Replace with your network image URL
//       statusColor: Colors.red,
//     ),
//     Order(
//       id: '81872',
//       date: '09-Feb-2024, 12:07 PM',
//       deliveryStatus: 'Delivered on 15 Feb',
//       imageUrl:
//           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSoIJjbXvJZeiMDlC1KQpUEgsKXLs8V91bRhg&s', // Replace with your network image URL
//       statusColor: Colors.red,
//     ),
//   ];

//   MyOrdersPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('My Orders'),
//         backgroundColor: Colors.white,
//         foregroundColor: Colors.black,
//         elevation: 0,
//         leading: const Icon(Icons.arrow_back, color: Colors.black),
//       ),
//       body: Container(
//         color: const Color(0xFFE0F7E7), // Background color
//         padding: const EdgeInsets.all(8.0),
//         child: ListView.builder(
//           itemCount: orders.length,
//           itemBuilder: (context, index) {
//             final order = orders[index];
//             return Padding(
//               padding: const EdgeInsets.only(bottom: 8.0),
//               child: Card(
//                 elevation: 4,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(15.0),
//                 ),
//                 child: ListTile(
//                   contentPadding: const EdgeInsets.all(8.0),
//                   leading: ClipRRect(
//                     borderRadius: BorderRadius.circular(8.0),
//                     child: Image.network(
//                       order.imageUrl,
//                       width: 50,
//                       height: 50,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   title: Text(
//                     'Order#: ${order.id}',
//                     style: const TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 16,
//                     ),
//                   ),
//                   subtitle: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         order.date,
//                         style: const TextStyle(color: Colors.grey),
//                       ),
//                       const SizedBox(height: 5),
//                       Text(
//                         order.deliveryStatus,
//                         style: TextStyle(color: order.statusColor),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// class Order {
//   final String id;
//   final String date;
//   final String deliveryStatus;
//   final String imageUrl;
//   final Color statusColor;

//   Order({
//     required this.id,
//     required this.date,
//     required this.deliveryStatus,
//     required this.imageUrl,
//     required this.statusColor,
//   });
// }import 'package:flutter/material.dart';
import 'package:KrishiKranti/utils/api_string.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class MyOrdersPage extends StatefulWidget {
  const MyOrdersPage({super.key});

  @override
  _MyOrdersPageState createState() => _MyOrdersPageState();
}

class _MyOrdersPageState extends State<MyOrdersPage> {
  List<CartItem> cartItems = [];
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    fetchCartItems();
  }

  Future<void> fetchCartItems() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    final url = Uri.parse('${ApiString.baseUrl}seller/products/');
    try {
      final response = await http.get(
        url,
        headers: token != null ? {"Authorization": "Bearer $token"} : {},
      );
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        setState(() {
          cartItems = data.map((item) => CartItem.fromJson(item)).toList();
          isLoading = false;
        });
      } else {
        setState(() {
          errorMessage = 'Failed to load cart items';
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = 'Error fetching cart items: $e';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Orders'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : errorMessage != null
              ? Center(child: Text(errorMessage!))
              : cartItems.isEmpty
                  ? const Center(child: Text('No orders found'))
                  : ListView.builder(
                      itemCount: cartItems.length,
                      itemBuilder: (context, index) {
                        final cartItem = cartItems[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: ListTile(
                              contentPadding: const EdgeInsets.all(8.0),
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  cartItem.product.productImage,
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                  loadingBuilder:
                                      (context, child, loadingProgress) {
                                    if (loadingProgress == null) {
                                      return child;
                                    } else {
                                      return Center(
                                        child: CircularProgressIndicator(
                                          value: loadingProgress
                                                      .expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  (loadingProgress
                                                          .expectedTotalBytes ??
                                                      1)
                                              : null,
                                        ),
                                      );
                                    }
                                  },
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Icon(Icons.error,
                                        color: Colors.red);
                                  },
                                ),
                              ),
                              title: Text(
                                '${cartItem.product.productName} (x${cartItem.quantity})',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              subtitle: Text(
                                'Price: \$${cartItem.price}',
                                style: const TextStyle(color: Colors.grey),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
    );
  }
}

class CartItem {
  final int id;
  final Cart cart;
  final int user;
  final Product product;
  final double price;
  final int quantity;

  CartItem({
    required this.id,
    required this.cart,
    required this.user,
    required this.product,
    required this.price,
    required this.quantity,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'] ?? 0,
      cart: Cart.fromJson(json['cart'] ?? {}),
      user: json['user'] ?? 0,
      product: Product.fromJson(json['product'] ?? {}),
      price: (json['price'] ?? 0.0).toDouble(),
      quantity: json['quantity'] ?? 0,
    );
  }
}

class Cart {
  final int id;
  final bool ordered;
  final double totalPrice;
  final int user;

  Cart({
    required this.id,
    required this.ordered,
    required this.totalPrice,
    required this.user,
  });

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      id: json['id'] ?? 0,
      ordered: json['ordered'] ?? false,
      totalPrice: (json['total_price'] ?? 0.0).toDouble(),
      user: json['user'] ?? 0,
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
      category: Category.fromJson(json['category'] ?? {}),
      productName: json['product_name'] ?? '',
      productPrice: (json['product_price'] ?? 0.0).toDouble(),
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
      categoryName: json['category_name'] ?? '',
    );
  }
}
