import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_services_app/pages/CancelBooking.dart';
import 'package:home_services_app/utils/textstyle.dart';
import 'package:home_services_app/utils/toast.dart';

import '../utils/Widgets.dart';
import '../utils/datas_services.dart';

class BookingsPage extends StatefulWidget {
  const BookingsPage({super.key});

  @override
  State<BookingsPage> createState() => _BookingsPageState();
}

class _BookingsPageState extends State<BookingsPage> {

  void _showConfirmationDialog(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirm Cancellation"),
          content: const Text("Are you sure you want to cancel this booking?"),
          actions: [
            TextButton(
              child: const Text("No"),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            TextButton(
              child: const Text("Confirm"),
              onPressed: () {
                setState(() {
                  workersHomeServices.removeAt(index); // Remove the item
                });
                Messege.Show(messege: "Booking Has Cancelled");
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }

  void _showConfirmationDialogBookAgain() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirm Bookings"),
          content: const Text("Are you sure you want confirm this booking?"),
          actions: [
            TextButton(
              child: const Text("No"),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            TextButton(
              child: const Text("Confirm"),
              onPressed: () {
                Navigator.of(context).pop();
                Messege.Show(messege: "Booking Has Been Confirmed");
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2, // Number of tabs
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text("Bookings",
              style: pageHeadings,
            ),
            bottom: const TabBar(
              tabs: [
                Tab(text: 'Active'), // First tab
                Tab(text: 'History'), // Second tab
              ],
            ),
          ),
          body: TabBarView(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height*1.6,
                    child: ListView.builder(
                        itemCount: workersHomeServices.length,
                        scrollDirection: Axis.vertical,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index){
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Container(
                              height: MediaQuery.of(context).size.height*0.3,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.grey[200],
                              ),
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        height: MediaQuery.of(context).size.height*0.22,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            color: Colors.grey[200]
                                        ),
                                        child: Row(
                                          children: [
                                            Container(
                                              height: MediaQuery.of(context).size.height*0.2,
                                              width: MediaQuery.of(context).size.width*0.4,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(20),
                                                  boxShadow: const [
                                                    BoxShadow(
                                                      blurRadius: 1.0,
                                                      spreadRadius: 1,
                                                      color: Colors.grey,

                                                    ),
                                                  ],
                                                  image: DecorationImage(
                                                      image: NetworkImage(workersHomeServices[index]['image']),
                                                      fit: BoxFit.fill
                                                  )
                                              ),
                                            ),
                                            const SizedBox(width: 20,),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [

                                                gap(30),
                                                Text(workersHomeServices[index]['work'],
                                                  style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.orange,fontSize: 20),
                                                ),
                                                gap(10),
                                                Row(
                                                  children: [
                                                    const Icon(CupertinoIcons.profile_circled,size: 20,),
                                                    const SizedBox(width: 5,),
                                                    Text(workersHomeServices[index]['name'],
                                                      style: subHeadings,
                                                    ),
                                                  ],
                                                ),
                                                gap(10),

                                                Row(
                                                  children: [
                                                    const Icon(Icons.call,size: 20,color: Colors.blue,),
                                                    const SizedBox(width: 5,),
                                                    Text(workersHomeServices[index]['contact'],
                                                      style: subHeadings,
                                                    ),
                                                  ],
                                                ),
                                                gap(10),
                                                Row(
                                                  children: [
                                                    const Icon(Icons.location_on_outlined,size: 20,color: Colors.red,),
                                                    const SizedBox(width: 5,),
                                                    Text(workersHomeServices[index]['location'],
                                                      style: subHeadings,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Align(
                                          alignment: Alignment.topRight,
                                          child: workersHomeServices[index]['status']==0? const Text("Assigned",
                                              style: TextStyle(color: Colors.blue,fontSize: 20,fontWeight: FontWeight.bold)
                                          ):
                                          const Text("In progress",
                                            style: TextStyle(color: Colors.green,fontSize: 20,fontWeight: FontWeight.bold),
                                          )
                                        ),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10.0,left: 10.0),
                                    child: Divider(
                                      height: 10,
                                      thickness: 1,
                                      color: Colors.grey[400],
                                    ),
                                  ),
                                  gap(10),
                                  Center(
                                    child: TextButton(
                                      onPressed: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>CancelBookingScreen()));
                                      },
                                      child: const Text('Cancel',
                                      style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 20),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        }
                    ),
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height*1.6,
                    child: ListView.builder(
                        itemCount: workersHomeServices.length,
                        scrollDirection: Axis.vertical,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index){
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Container(
                              height: MediaQuery.of(context).size.height*0.3,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.grey[200],
                              ),
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        height: MediaQuery.of(context).size.height*0.22,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            color: Colors.grey[200]
                                        ),
                                        child: Row(
                                          children: [
                                            Container(
                                              height: MediaQuery.of(context).size.height*0.2,
                                              width: MediaQuery.of(context).size.width*0.4,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(20),
                                                  boxShadow: const [
                                                    BoxShadow(
                                                      blurRadius: 1.0,
                                                      spreadRadius: 1,
                                                      color: Colors.grey,

                                                    ),
                                                  ],
                                                  image: DecorationImage(
                                                      image: NetworkImage(workersHomeServices[index]['image']),
                                                      fit: BoxFit.fill
                                                  )
                                              ),
                                            ),
                                            const SizedBox(width: 20,),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [

                                                gap(30),
                                                Text(workersHomeServices[index]['work'],
                                                  style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.orange,fontSize: 20),
                                                ),
                                                gap(10),
                                                Row(
                                                  children: [
                                                    const Icon(CupertinoIcons.profile_circled,size: 20,),
                                                    const SizedBox(width: 5,),
                                                    Text(workersHomeServices[index]['name'],
                                                      style: subHeadings,
                                                    ),
                                                  ],
                                                ),
                                                gap(10),

                                                Row(
                                                  children: [
                                                    const Icon(Icons.call,size: 20,color: Colors.blue,),
                                                    const SizedBox(width: 5,),
                                                    Text(workersHomeServices[index]['contact'],
                                                      style: subHeadings,
                                                    ),
                                                  ],
                                                ),
                                                gap(10),
                                                Row(
                                                  children: [
                                                    const Icon(Icons.location_on_outlined,size: 20,color: Colors.red,),
                                                    const SizedBox(width: 5,),
                                                    Text(workersHomeServices[index]['location'],
                                                      style: subHeadings,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Align(
                                            alignment: Alignment.topRight,
                                            child: workersHomeServices[index]['status']==0? const Text("Cancelled",
                                                style: TextStyle(color: Colors.red,fontSize: 20,fontWeight: FontWeight.bold)
                                            ):
                                            const Text("Completed",
                                              style: TextStyle(color: Colors.green,fontSize: 20,fontWeight: FontWeight.bold),
                                            ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10.0,left: 10.0),
                                    child: Divider(
                                      height: 10,
                                      thickness: 1,
                                      color: Colors.grey[400],
                                    ),
                                  ),
                                  gap(10),
                                  Center(
                                    child: TextButton(
                                      onPressed: (){
                                        _showConfirmationDialogBookAgain();
                                      },
                                      child: const Text('Book Again',
                                        style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 20),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        }
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  }
}
