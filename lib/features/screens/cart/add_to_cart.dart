// import 'package:flutter/material.dart';

// class PackagePages extends StatefulWidget {
//   static String routeName = 'packagepage';
//   const PackagePages({super.key});

//   @override
//   State<PackagePages> createState() => _PackagePagesState();
// }

// class _PackagePagesState extends State<PackagePages> {
//   final List<int> _quantities = [0, 0, 0];

//   void _incrementQuantity(int index) {
//     setState(() {
//       _quantities[index]++;
//     });
//   }

//   void _decrementQuantity(int index) {
//     setState(() {
//       if (_quantities[index] > 0) {
//         _quantities[index]--;
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Package"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 "Note: Select based on your preferences. Don't forget to add to cart to confirm your ticket.",
//                 style: TextStyle(fontSize: 16),
//               ),
//               const SizedBox(height: 20),
//               _buildTicketCard(
//                   r"VIP Ticket ($900)",
//                   "A VIP ticket offers an elevated event experience. It's your golden pass to a world of exclusive perks and privileges. Imagine your attendees skipping the queues, enjoying premium seating, and indulging in complimentary treats.",
//                   0,
//                   900.0),
//               const SizedBox(height: 15),
//               _buildTicketCard(
//                   r"Gold Ticket ($400)",
//                   "A Gold ticket often represents a premium or exclusive offer, usually providing special access or privileges. It can be associated with VIP treatment, enhanced experiences, or unique benefits compared to standard tickets.",
//                   1,
//                   400.0),
//               const SizedBox(height: 15),
//               _buildTicketCard(
//                   r"Silver Ticket ($300)",
//                   "A Silver ticket represents standard access, providing an affordable option with basic privileges and experiences at the event.",
//                   2,
//                   300.0),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildTicketCard(
//       String title, String description, int index, double price) {
//     return Container(
//       padding: const EdgeInsets.all(10.0),
//       color: Colors.grey[300],
//       child: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               title,
//               style: const TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 10),
//             Row(
//               children: [
//                 Flexible(
//                   child: Text(
//                     description,
//                     style: const TextStyle(fontSize: 14),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(
//                   children: [
//                     const Text("Qty"),
//                     Row(
//                       children: [
//                         CircleAvatar(
//                           radius: 20,
//                           backgroundColor: Colors.white,
//                           child: IconButton(
//                             onPressed: () => _decrementQuantity(index),
//                             icon: const Icon(Icons.remove),
//                           ),
//                         ),
//                         const SizedBox(width: 20),
//                         Text(
//                           _quantities[index].toString(),
//                           style: const TextStyle(fontSize: 20),
//                         ),
//                         const SizedBox(width: 20),
//                         CircleAvatar(
//                           radius: 20,
//                           backgroundColor: Colors.white,
//                           child: IconButton(
//                             onPressed: () => _incrementQuantity(index),
//                             icon: const Icon(Icons.add),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     // Navigator.push(
//                     //     context,
//                     //     MaterialPageRoute(
//                     //         builder: (context) => BookTicketPage()));
//                   },
//                   child: const Text('Add to Cart'),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:KrishiKranti/features/screens/payment/esewa_payment.dart';
import 'package:flutter/material.dart';
import 'package:esewa_flutter/esewa_flutter.dart';

class CartPage extends StatefulWidget {
  final String productName;
  final String productImage;
  final double productPrice;

  const CartPage({
    super.key,
    required this.productName,
    required this.productImage,
    required this.productPrice,
  });

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final List<Map<String, dynamic>> _cartItems = [];

  @override
  void initState() {
    super.initState();
    _cartItems.add({
      'name': widget.productName,
      'image': widget.productImage,
      'price': widget.productPrice,
      'quantity': 1,
    });
  }

  void _incrementQuantity(int index) {
    setState(() {
      _cartItems[index]['quantity']++;
    });
  }

  void _decrementQuantity(int index) {
    setState(() {
      if (_cartItems[index]['quantity'] > 1) {
        _cartItems[index]['quantity']--;
      }
    });
  }

  double get _totalCost {
    double total = 0;
    for (var item in _cartItems) {
      total += item['quantity'] * item['price'];
    }
    return total;
  }

  void _processPayment() async {
    final eSewaConfig = ESewaConfig.dev(
      amt: _totalCost,
      pid: DateTime.now().millisecondsSinceEpoch.toString(),
      su: 'https://www.marvel.com/hello', // Success URL
      fu: 'https://www.marvel.com/hello', // Failure URL
      // Optional parameters
      txAmt: 0.0, // Tax amount
      psc: 0.0, // Service charge
      pdc: 0.0, // Delivery charge
    );

    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EsewaPaymentScreen(
          paymentConfig: eSewaConfig,
        ),
      ),
    );

    if (result != null && result is PaymentResult) {
      if (result.isSuccess) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('Payment successful! Ref Id: ${result.refId}')),
        );
        // Handle payment success
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Payment failed: ${result.errorMessage}')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.green[50],
        elevation: 0,
        title: const Text("My Cart", style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: _cartItems.isEmpty
          ? const Center(child: Text('Your cart is empty'))
          : Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: _cartItems.length,
                      itemBuilder: (context, index) {
                        final item = _cartItems[index];
                        return Column(
                          children: [
                            const SizedBox(height: 60),
                            _buildCartItem(
                              item['name'],
                              item['image'],
                              item['price'],
                              item['quantity'],
                              index,
                            ),
                            const SizedBox(height: 60),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Total:',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Rs. ${_totalCost.toStringAsFixed(2)}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const SizedBox(height: 40),
                            ElevatedButton(
                              onPressed: _processPayment,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green, // Button color
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15.0, horizontal: 20.0),
                                textStyle: const TextStyle(fontSize: 16),
                              ),
                              child: const Text('Checkout'),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget _buildCartItem(
      String name, String image, double price, int quantity, int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Image.network(
            image,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('Rs. ${price.toStringAsFixed(2)}'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () => _decrementQuantity(index),
                        ),
                        Text('$quantity'),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () => _incrementQuantity(index),
                        ),
                      ],
                    ),
                    Text('Rs. ${(price * quantity).toStringAsFixed(2)}'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

enum Environment {
  test,
  live,
}

class PaymentResult {
  final bool isSuccess;
  final String refId;
  final String errorMessage;

  PaymentResult({
    required this.isSuccess,
    required this.refId,
    required this.errorMessage,
  });
}
