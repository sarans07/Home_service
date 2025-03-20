import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_services_app/utils/Widgets.dart';
import 'package:home_services_app/utils/textstyle.dart';
import 'package:home_services_app/utils/toast.dart';

class CancelBookingScreen extends StatefulWidget {
  const CancelBookingScreen({super.key});

  @override
  State<CancelBookingScreen> createState() => _CancelBookingScreenState();
}

class _CancelBookingScreenState extends State<CancelBookingScreen> {
  String _refundButton = 'Cash';
  String _refundButton1 = 'Reason';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Cancel Booking",
            style: subHeadings,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width * 1,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey[300]),
                  child: Column(
                    children: [
                      gap(20),
                      Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.16,
                            width: MediaQuery.of(context).size.width * 0.3,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTMUI53f7LVNeO0uEdzGo6pRwpYJRGhSMdMhw&s'),
                                    fit: BoxFit.fill)),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            children: [
                              Text(
                                "Kitchen Cleaning",
                                style: subHeadings,
                              ),
                              gap(10),
                              Text("A to Z Agencies"),
                              gap(10),
                              Row(
                                children: [
                                  Icon(
                                    CupertinoIcons.clock_solid,
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text('9:00 am Friday')
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                      gap(50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 0,
                          ),
                          Text('2300 sqft || 4 BHK'),
                          Text(
                            "₹ 2999",
                            style: subHeadings,
                          )
                        ],
                      )
                    ],
                  ),
                ),
                gap(20),
                Text(
                  'Order Summary',
                  style: subHeadings,
                ),
                gap(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Bill Amount"),
                    Text("2699"),
                  ],
                ),
                gap(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("GST"),
                    Text("150"),
                  ],
                ),
                gap(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("SGST"),
                    Text("150"),
                  ],
                ),
                Divider(
                  height: 20,
                  thickness: 2,
                  color: Colors.grey,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total Amount",
                      style: subHeadings,
                    ),
                    Text(
                      "2999",
                      style: subHeadings,
                    ),
                  ],
                ),
                Divider(
                  height: 20,
                  thickness: 2,
                  color: Colors.grey,
                ),
                Text(
                  "Refund Method",
                  style: subHeadings,
                ),
                gap(10),
                RadioListTile<String>(
                    title: const Text('Cash'),
                    value: 'Option 1',
                    groupValue: _refundButton,
                    onChanged: (value) {
                      setState(() {
                        _refundButton = value!;
                      });
                    }),
                gap(10),
                RadioListTile<String>(
                    title: const Text('Gpay'),
                    value: 'Option 2',
                    groupValue: _refundButton,
                    onChanged: (value) {
                      setState(() {
                        _refundButton = value!;
                      });
                    }),
                gap(10),
                RadioListTile<String>(
                    title: const Text('Other'),
                    value: 'Option 3',
                    groupValue: _refundButton,
                    onChanged: (value) {
                      setState(() {
                        _refundButton = value!;
                      });
                    }),
                gap(10),
                Text(
                  "Reason For Cancelling the services",
                  style: subHeadings,
                ),
                gap(10),
                RadioListTile<String>(
                    title: const Text('Booked By Mistake'),
                    value: 'Option 1',
                    groupValue: _refundButton1,
                    onChanged: (value) {
                      setState(() {
                        _refundButton1 = value!;
                      });
                    }),
                gap(10),
                RadioListTile<String>(
                    title: const Text('On That Time we are not available'),
                    value: 'Option 2',
                    groupValue: _refundButton1,
                    onChanged: (value) {
                      setState(() {
                        _refundButton1 = value!;
                      });
                    }),
                gap(10),
                RadioListTile<String>(
                    title: const Text('Other reasons'),
                    value: 'Option 3',
                    groupValue: _refundButton1,
                    onChanged: (value) {
                      setState(() {
                        _refundButton1 = value!;
                      });
                    }),
                gap(50),
              ],
            ),
          ),
        ),
        bottomSheet: BottomSheet(
          elevation: 10,
          enableDrag: false,
          builder: (context) {
            return Padding(
              padding: EdgeInsets.all(10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(MediaQuery.of(context).size.width, 45),
                  shape: StadiumBorder(),
                ),
                child: Padding(padding: EdgeInsets.symmetric(horizontal: 8.0), child: Text("Cancel Service")),
                onPressed: () {
                    Navigator.pop(context);
                    Messege.Show(messege: "Your Booking Has Bees Cancelled");
                  }
              ),
            );
          },
          onClosing: () {},
        ),

      ),
    );
  }
}
