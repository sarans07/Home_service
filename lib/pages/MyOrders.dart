import 'package:flutter/material.dart';

import '../model/datas_services.dart';
import '../utils/textstyle.dart';
import 'CheckOut_Screen.dart';
import 'package:get/get.dart';

class MyOrdersScreen extends StatelessWidget {
  final List<Map<String, String>> orders = [
    {
      'image': 'https://example.com/jewelry1.jpg',
      'name': 'Gold Necklace',
      'price': '\$1200',
      'date': 'March 10, 2025'
    },
    {
      'image': 'https://example.com/jewelry2.jpg',
      'name': 'Diamond Earrings',
      'price': '\$950',
      'date': 'February 22, 2025'
    },
    {
      'image': 'https://example.com/jewelry3.jpg',
      'name': 'Silver Bracelet',
      'price': '\$350',
      'date': 'January 5, 2025'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Orders'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: orders.length,
          itemBuilder: (context, index) {
            final order = orders[index];
            return Card(
              elevation: 3,
              margin: EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                leading: Image.network(recommendedForYouImages[index],
                    width: 50, height: 50, fit: BoxFit.cover),
                title: Text(recommendedForYouItemsNames[index],
                    style: subHeadings),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Price: ${recommendedForYouItemsPrices[index]}',
                      style: subHeadings,
                    ),
                  ],
                ),
                trailing: ElevatedButton(
                  onPressed: () {
                    Get.to(CheckoutScreen());
                  },
                  child: Text(
                    'Order Again',
                    style: subHeadings,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
