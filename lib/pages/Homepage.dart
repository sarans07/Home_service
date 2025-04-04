import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../auth/loginScreen.dart';
import '../auth/services/auth_services.dart';
import '../components/Widgets.dart';
import '../model/datas_services.dart';
import '../utils/textstyle.dart';
import '../components/toast.dart';
import 'AccountPage.dart';
import 'CartPage.dart';
import 'FavouritePage.dart';
import 'MyOrders.dart';
import 'Notification.dart';
import 'ItemProvider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirm Logout"),
          content: const Text("Are you sure you want to logout?"),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () async {
                await AuthServiceHelper.logout();
                Get.offAll(LoginScreen());
                Messege.Show(messege: "You has been Successfully Loged Out");
              },
              child: const Text("Logout"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange[100],
          centerTitle: true,
          title: Text(
            "ATTS Jewellers",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.orange,
              wordSpacing: 10,
              letterSpacing: 2,
              shadows: <Shadow>[
                Shadow(
                  offset: Offset(1.0, 1.0),
                  blurRadius: 3.0,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                Shadow(
                  offset: Offset(1.0, 1.0),
                  blurRadius: 8.0,
                  color: Color.fromARGB(125, 0, 0, 255),
                ),
              ],
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                  onTap: () {
                    Get.to(MyOrdersScreen());
                  },
                  child: Icon(
                    Icons.shopping_cart_sharp,
                    size: 20,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                  onTap: () {
                    Get.to(NotificationPage());
                  },
                  child: Icon(
                    Icons.notifications_outlined,
                    size: 20,
                  )),
            ),
          ],
        ),
        drawer: Drawer(
          child: SingleChildScrollView(
            child: Column(
              children: [
                UserAccountsDrawerHeader(
                  accountName: Text('Saran'),
                  accountEmail: Text(
                    'saran@gmail.com',
                    style: TextStyle(color: Colors.white70),
                  ),
                  currentAccountPicture: CircleAvatar(
                    child: Text('S'),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                ),
                drawerWidget(Icons.person, 'My Profile', () {
                  Get.to(AccountPage());
                }),
                drawerWidget(Icons.notifications_outlined, 'Notification', () {
                  Get.to(NotificationPage());
                }),
                drawerWidget(Icons.shopping_cart_outlined, "MyCart", () {
                  Get.to(CartPage());
                }),
                drawerWidget(Icons.favorite_border, 'Favorite', () {
                  Get.to(FavouritePage());
                }),
                drawerWidget(Icons.history, 'My Orders', () {
                  Get.to(MyOrdersScreen());
                }),
                drawerWidget(CupertinoIcons.money_dollar_circle, 'Refer & Earn',
                    () => null),
                drawerWidget(Icons.help_center_outlined, 'Help', () => null),
                drawerWidget(
                    Icons.contact_phone_sharp, 'Contact Us', () => null),
                drawerWidget(Icons.logout, 'Logout', () {
                  _showLogoutDialog(context);
                })
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                gap(5),
                searchWidget(),
                gap(10),
                CarouselSlider.builder(
                  //carouselController: _carouselController,
                  itemCount: homeCarouuselImages.length,
                  itemBuilder: (context, index, realIndex) {
                    return InkWell(
                      onTap: () {
                        Get.to(ItemsProvidersScreen());
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(homeCarouuselImages[index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                  options: CarouselOptions(
                    height: 200,
                    autoPlay: true,
                    viewportFraction: 1,
                    enlargeCenterPage: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  ),
                ),
                gap(10),
                AnimatedSmoothIndicator(
                  activeIndex: _currentIndex,
                  count: homeCarouuselImages.length,
                  effect: ExpandingDotsEffect(
                    activeDotColor: Colors.blue,
                    dotHeight: 8,
                    dotWidth: 8,
                  ),
                  onDotClicked: (index) {
                    // _carouselController.animateToPage(index);
                  },
                ),
                gap(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Category",
                      style: subHeadings,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(ItemsProvidersScreen());
                      },
                      child: Text(
                        "View All",
                        style: TextStyle(color: Colors.orange, fontSize: 18),
                      ),
                    ),
                  ],
                ),
                gap(10),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.14,
                  child: ListView.builder(
                    itemCount: categoryImages.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  Get.to(ItemsProvidersScreen());
                                });
                              },
                              child: CircleAvatar(
                                radius:
                                    MediaQuery.of(context).size.height * 0.043,
                                backgroundImage:
                                    NetworkImage(categoryImages[index]),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            categoryImagesName[index],
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                gap(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Recommended For You",
                      style: subHeadings,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(ItemsProvidersScreen());
                      },
                      child: Text(
                        "View All",
                        style: TextStyle(color: Colors.orange, fontSize: 18),
                      ),
                    ),
                  ],
                ),
                gap(10),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.27,
                  child: ListView.builder(
                      itemCount: recommendedForYouImages.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: InkWell(
                            onTap: () {
                              Get.to(ItemsProvidersScreen());
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.grey[200]),
                              child: Column(
                                children: [
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.2,
                                    width:
                                        MediaQuery.of(context).size.width * 0.7,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20)),
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
                                  gap(10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        recommendedForYouItemsNames[index],
                                        style: subHeadings,
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.2,
                                      ),
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.05,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.2,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.orange,
                                        ),
                                        child: Center(
                                          child: Text(
                                            '₹ ${recommendedForYouItemsPrices[index]}',
                                            style: subHeadings,
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                gap(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Popular",
                      style: subHeadings,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(ItemsProvidersScreen());
                      },
                      child: Text(
                        "View All",
                        style: TextStyle(color: Colors.orange, fontSize: 18),
                      ),
                    ),
                  ],
                ),
                gap(10),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 1,
                  child: GridView.builder(
                    itemCount: popularImages.length,
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: InkWell(
                          onTap: () {
                            Get.to(ItemsProvidersScreen());
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.3,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.grey[200]),
                            child: Column(
                              children: [
                                Container(
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
                                        ),
                                      ],
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              popularImages[index]),
                                          fit: BoxFit.fill)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
