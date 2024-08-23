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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greatticket/features/screens/cart/confirm_booking.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final List<int> _quantities = [1, 1, 1];
  final List<double> _prices = [97.0, 120.0, 77.0];

  void _incrementQuantity(int index) {
    setState(() {
      _quantities[index]++;
    });
  }

  void _decrementQuantity(int index) {
    setState(() {
      if (_quantities[index] > 1) {
        _quantities[index]--;
      }
    });
  }

  double get _totalCost {
    double total = 0;
    for (int i = 0; i < _quantities.length; i++) {
      total += _quantities[i] * _prices[i];
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.green[50],
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text("My Cart", style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            _buildCartItem(
                "Cabbage",
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNZzWjxoOwNcCnnarroe4-Jnm_aswJo8QTvg&s",
                0),
            _buildCartItem(
                "Carrot",
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNZzWjxoOwNcCnnarroe4-Jnm_aswJo8QTvg&s",
                1),
            _buildCartItem(
                "Carrot",
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNZzWjxoOwNcCnnarroe4-Jnm_aswJo8QTvg&s",
                1),
            _buildCartItem(
                "Carrot",
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNZzWjxoOwNcCnnarroe4-Jnm_aswJo8QTvg&s",
                1),

            // _buildCartItem(
            //     "Onion",
            //     "ahttps://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNZzWjxoOwNcCnnarroe4-Jnm_aswJo8QTvg&s",
            //     2),

            ///  const Spacer(),
            _buildTotalSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildCartItem(String name, String imagePath, int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Image.network(imagePath, width: 50, height: 50),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        _quantityButton(
                            Icons.remove, () => _decrementQuantity(index)),
                        const SizedBox(width: 10),
                        Text(
                          _quantities[index].toString(),
                          style: const TextStyle(fontSize: 18),
                        ),
                        const SizedBox(width: 10),
                        _quantityButton(
                            Icons.add, () => _incrementQuantity(index)),
                      ],
                    ),
                    Text(
                      "Rs. ${_prices[index].toStringAsFixed(2)}",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _quantityButton(IconData icon, VoidCallback onPressed) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(icon, size: 16),
        onPressed: onPressed,
      ),
    );
  }

  Widget _buildTotalSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(color: Colors.grey[300]!, blurRadius: 10)],
      ),
      child: Column(
        children: [
          _buildTotalRow("Sub-total", _totalCost),
          _buildTotalRow("Delivery Fee", 0.0),
          const Divider(),
          _buildTotalRow("Total Cost", _totalCost),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Get.to(const ConfirmBookingPage(
                name: 'name',
                date: 'date',
                time: 'time',
                price: 'price',
              ));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              padding:
                  const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
            ),
            child: const Text(
              "Checkout",
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTotalRow(String label, double amount) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontSize: 16)),
          Text("Rs. ${amount.toStringAsFixed(2)}",
              style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
