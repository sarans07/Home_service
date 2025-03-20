import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../utils/Widgets.dart';
import '../utils/datas_services.dart';
import '../utils/textstyle.dart';
import 'DashBoard.dart';


class ServicesProvidersScreen extends StatefulWidget {
  const ServicesProvidersScreen({super.key});

  @override
  State<ServicesProvidersScreen> createState() => _ServicesProvidersScreenState();
}

class _ServicesProvidersScreenState extends State<ServicesProvidersScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("Services Providers"),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height*1.1,
                  child: ListView.builder(
                      itemCount: workersHomeServices.length,
                      scrollDirection: Axis.vertical,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index){
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Stack(
                            children: [
                              Container(
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
                                          boxShadow: [
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
                                    SizedBox(width: 20,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(workersHomeServices[index]['work'],
                                          style: TextStyle(fontWeight: FontWeight.bold,color: Colors.orange,fontSize: 20),
                                        ),
                                        gap(10),
                                        Row(
                                          children: [
                                            Icon(CupertinoIcons.profile_circled,size: 20,),
                                            const SizedBox(width: 5,),
                                            Text(workersHomeServices[index]['name'],
                                              style: subHeadings,
                                            ),
                                          ],
                                        ),
                                        //gap(10),

                                        // Row(
                                        //   children: [
                                        //     Icon(Icons.call,size: 20,color: Colors.blue,),
                                        //     SizedBox(width: 5,),
                                        //     Text(workersHomeServices[index]['contact'],
                                        //       style: subHeadings,
                                        //     ),
                                        //   ],
                                        // ),
                                        // gap(10),
                                        // Row(
                                        //   children: [
                                        //     Icon(Icons.location_on_outlined,size: 20,color: Colors.red,),
                                        //     SizedBox(width: 5,),
                                        //     Text(workersHomeServices[index]['location'],
                                        //       style: subHeadings,
                                        //     ),
                                        //   ],
                                        // ),
                                        gap(10),
                                        RatingBar.builder(
                                          initialRating: workersHomeServices[index]['ratings'], // Default rating
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          itemSize: 20.0, // Size of each star
                                          itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                                          itemBuilder: (context, _) => Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          onRatingUpdate: (double value) {  },
                                        ),
                                        gap(10),
                                        Text('₹ ${workersHomeServices[index]['price']}/hr',
                                          style: subHeadings,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Positioned(
                                right: 20,
                                bottom: 20,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: StadiumBorder(),
                                  ),
                                  child: Text("Book", style: TextStyle(fontSize: 16)),
                                  onPressed: () {
                                    setState(() {
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(builder: (context) => DashBoardScreen()),
                                            (route) => false,
                                      );
                                    });
                                  },
                                ),
                              )
                            ],
                          ),
                        );
                      }
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}
