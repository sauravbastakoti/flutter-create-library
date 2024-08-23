import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  final List<NotificationItem> newNotifications = [
    NotificationItem(
      title: "New Listing Available!",
      message:
          "Fresh organic carrots are now available from a nearby farm. Don't miss out!",
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTzzmJtCa3MKdHJOtm8ta9boc0GPJ9UXwvefw&s', // Replace with your network image URL
      timeAgo: '9m ago',
    ),
    NotificationItem(
      title: "Price Drop Alert!",
      message:
          "Tomatoes you were watching have dropped in price. Grab them before they're gone!",
      icon: Icons.notification_important,
      iconColor: Colors.red,
      timeAgo: '1hr ago',
    ),
    NotificationItem(
      title: "Order Received!",
      message:
          "A buyer has placed an order for 5kg of your fresh spinach. Prepare for delivery.",
      icon: Icons.shopping_cart,
      iconColor: Colors.black,
      timeAgo: '57m ago',
    ),
  ];

  final List<NotificationItem> earlierNotifications = [
    NotificationItem(
      title: "Order Shipped!",
      message:
          "Your order of 3kg of onions has been shipped. Track its journey.",
      icon: Icons.local_shipping,
      iconColor: Colors.green,
      timeAgo: '1 day ago',
    ),
    NotificationItem(
      title: "Fresh Vegetables on Sale!",
      message:
          "Get 20% off on fresh spinach and carrots from local farms. Limited time offer!",
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTzzmJtCa3MKdHJOtm8ta9boc0GPJ9UXwvefw&s', // Replace with your network image URL
      timeAgo: '2 days ago',
    ),
  ];

  NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Container(
        color: const Color(0xFFE0F7E7), // Background color
        child: ListView(
          padding: const EdgeInsets.all(8.0),
          children: [
            _buildSectionTitle("New"),
            ...newNotifications.map((notification) {
              return _buildNotificationCard(notification);
            }),
            _buildSectionTitle("Earlier"),
            ...earlierNotifications.map((notification) {
              return _buildNotificationCard(notification);
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildNotificationCard(NotificationItem notification) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.all(8.0),
          leading: notification.imageUrl != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    notification.imageUrl!,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                )
              : Icon(
                  notification.icon,
                  size: 50,
                  color: notification.iconColor,
                ),
          title: Text(
            '"${notification.title}"',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.red,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(notification.message),
              const SizedBox(height: 5),
              Text(
                notification.timeAgo,
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NotificationItem {
  final String title;
  final String message;
  final String? imageUrl;
  final IconData? icon;
  final Color? iconColor;
  final String timeAgo;

  NotificationItem({
    required this.title,
    required this.message,
    this.imageUrl,
    this.icon,
    this.iconColor,
    required this.timeAgo,
  });
}
