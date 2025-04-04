import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/textstyle.dart';
import '../components/toast.dart';
import 'DashBoard.dart';

class CheckoutScreen extends StatefulWidget {
  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  String _selectedOption = 'Option 1';

  String _paymentMethod = "1";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Checkout')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Product Details',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Card(
              child: ListTile(
                leading: Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRowhS6T81nrKVN9WTK6LM_VEeTQ7RCAzWhmA&s',
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
                title: Text('Elegant Gold Necklace', style: subHeadings),
                subtitle: Text('Price: \$1200', style: subHeadings),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Shipping Address',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Radio<String>(
                  value: 'Option 1',
                  groupValue: _selectedOption,
                  onChanged: (value) {
                    setState(() {
                      _selectedOption = value!;
                    });
                  },
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "3/989, Avinashi, Coimbatore.",
                  style: subHeadings,
                )
              ],
            ),
            Row(
              children: [
                Radio<String>(
                  value: 'Option 2',
                  groupValue: _selectedOption,
                  onChanged: (value) {
                    setState(() {
                      _selectedOption = value!;
                    });
                  },
                ),
                Text(
                  "Sitra, Office",
                  style: subHeadings,
                )
              ],
            ),
            ElevatedButton(onPressed: () {}, child: Text("Add Address")),
            SizedBox(height: 20),
            Text(
              'Payment Method',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Column(
              children: [
                ListTile(
                  leading: Icon(Icons.credit_card),
                  title: Text('Credit/Debit Card'),
                  trailing: Radio(
                    value: "1",
                    groupValue: _paymentMethod,
                    onChanged: (value) {
                      _paymentMethod = value!;
                    },
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.paypal),
                  title: Text('PayPal'),
                  trailing: Radio(
                    value: "2",
                    groupValue: _paymentMethod,
                    onChanged: (value) {
                      setState(() {
                        _paymentMethod = value!;
                      });
                    },
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.money),
                  title: Text('Cash on Delivery'),
                  trailing: Radio(
                    value: "3",
                    groupValue: _paymentMethod,
                    onChanged: (value) {
                      setState(() {
                        _paymentMethod = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Get.to(DashBoardScreen());
                  Messege.Show(messege: "Your Order Has Been Placed");
                },
                child: Text('Place Order', style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
