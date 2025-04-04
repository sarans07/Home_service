import 'package:flutter/material.dart';

import '../model/datas_services.dart';
import '../utils/textstyle.dart';
import '../components/toast.dart';
import 'CheckOut_Screen.dart';
import 'package:get/get.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void updateQuantity(int index, int change) {
    setState(() {
      cartItems[index]['quantity'] =
          (cartItems[index]['quantity'] + change).clamp(1, 99);
    });
  }

  void deleteItem(int index) {
    setState(() {
      cartItems.removeAt(index);
      Messege.Show(messege: 'Your Item has been removed');
    });
  }

  double getTotalPrice() {
    return cartItems.fold(
        0, (total, item) => total + (item['price'] * item['quantity']));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Your Cart', style: pageHeadings),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartItems[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(item['image'],
                            width: 60, height: 60, fit: BoxFit.cover),
                      ),
                      title: Text(item['name'], style: subHeadings),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('\$ ${item['price']}', style: subHeadings),
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.remove, color: Colors.black),
                                onPressed: () => updateQuantity(index, -1),
                              ),
                              Text(
                                item['quantity'].toString(),
                                style: subHeadings,
                              ),
                              IconButton(
                                icon: Icon(Icons.add, color: Colors.black),
                                onPressed: () => updateQuantity(index, 1),
                              ),
                            ],
                          ),
                        ],
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.grey),
                        onPressed: () => deleteItem(index),
                      ),
                    ),
                  );
                },
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total:', style: pageHeadings),
                  Text('\$${getTotalPrice().toStringAsFixed(2)}',
                      style: subHeadings),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[200],
                padding: EdgeInsets.symmetric(vertical: 14, horizontal: 40),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              onPressed: () {
                Get.to(CheckoutScreen());
              },
              child: Text('Checkout', style: subHeadings),
            ),
          ],
        ),
      ),
    );
  }
}
