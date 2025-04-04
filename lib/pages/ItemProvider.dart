import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:home_services_app/pages/CheckOut_Screen.dart';
import 'package:home_services_app/pages/ItemDetailsPage.dart';
import '../components/Widgets.dart';
import '../model/datas_services.dart';
import '../utils/textstyle.dart';

class ItemsProvidersScreen extends StatefulWidget {
  const ItemsProvidersScreen({super.key});

  @override
  State<ItemsProvidersScreen> createState() => _ItemsProvidersScreenState();
}

class _ItemsProvidersScreenState extends State<ItemsProvidersScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("ATTS Items..."),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 1.1,
              child: ListView.builder(
                  itemCount: recommendedForYouImages.length,
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.grey[200]),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: (){
                                    Get.to(JewelleryItemScreen());
                                  },
                                  child: Container(
                                    height:
                                        MediaQuery.of(context).size.height * 0.2,
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
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
                                            image: NetworkImage(
                                                recommendedForYouImages[index]),
                                            fit: BoxFit.fill)),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                InkWell(
                                  onTap: (){
                                    Get.to(JewelleryItemScreen());
                                  },
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        recommendedForYouItemsNames[index],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.orange,
                                            fontSize: 20),
                                      ),
                                      gap(10),
                                      RatingBar.builder(
                                        initialRating:
                                            recommendedForYouItemsRatings[index],
                                        // Default rating
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemSize: 20.0,
                                        // Size of each star
                                        itemPadding:
                                            EdgeInsets.symmetric(horizontal: 1.0),
                                        itemBuilder: (context, _) => Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        onRatingUpdate: (double value) {},
                                      ),
                                      gap(10),
                                      Text(
                                        '₹ ${recommendedForYouItemsPrices[index]}',
                                        style: subHeadings,
                                      ),
                                    ],
                                  ),
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
                              child: Text("Buy Now",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold)),
                              onPressed: () {
                                setState(() {
                                  Get.to(JewelleryItemScreen());
                                });
                              },
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    ));
  }
}
