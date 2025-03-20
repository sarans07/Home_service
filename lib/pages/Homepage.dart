import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:home_services_app/auth/loginScreen.dart';
import 'package:home_services_app/pages/AccountPage.dart';
import 'package:home_services_app/pages/BookingsPage.dart';
import 'package:home_services_app/pages/FavouritePage.dart';
import 'package:home_services_app/pages/HomeServices.dart';
import 'package:home_services_app/pages/Notification.dart';
import 'package:home_services_app/pages/ServicesProviders.dart';
import 'package:home_services_app/utils/Widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:home_services_app/utils/textstyle.dart';
import 'package:home_services_app/utils/toast.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../auth/services/auth_services.dart';
import '../utils/datas_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool isDarkMode = false;

  int _currentIndex = 0;
   int selectedIndex = -1;


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
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () async {
                await AuthServiceHelper.logout();
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
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
    return MaterialApp(
      theme: ThemeData.light(), // Light theme
      darkTheme: ThemeData.dark(), // Dark theme
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationPage()));
                    },
                    child: Icon(Icons.notifications_outlined,size: 20,)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Switch(
                  value: isDarkMode,
                  onChanged: (value) {
                    setState(() {
                      isDarkMode = value;
                    });
                  },
                ),
              )
            ],
          ),
          drawer: Drawer(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  UserAccountsDrawerHeader(
                    accountName: Text('Saran'),
                    accountEmail: Text('saran@gmail.com',
                    style: TextStyle(color: Colors.white70),
                    ),
                    currentAccountPicture: CircleAvatar(
                      child: Text('S'),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                  ),
                  drawerWidget(Icons.person, 'My Profile', (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>AccountPage()));
                  }),
                  drawerWidget(Icons.notifications_outlined, 'Notification', (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationPage()));
                  }),
                  drawerWidget(Icons.message, "Bookings", () => {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>BookingsPage())),
                  }),
                  drawerWidget(Icons.favorite_border, 'Favorite', () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>FavouritePage()));
                  }),
                  drawerWidget(Icons.history, 'History', () => null),
                  drawerWidget(CupertinoIcons.money_dollar_circle, 'Refer & Earn', () => null),
                  drawerWidget(Icons.help_center_outlined, 'Help', () => null),
                  drawerWidget(Icons.contact_phone_sharp, 'Contact Us', () => null),
                  drawerWidget(Icons.logout, 'Logout', (){
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
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ServicesProvidersScreen()));
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
                      Text("Home Services",
                      style: subHeadings,
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeServicesScreen()));
                        },
                        child: Text("View All",
                          style: TextStyle(color: Colors.orange,fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                  gap(10),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.14,
                    child: ListView.builder(
                      itemCount: servicesIconData.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 4),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ServicesProvidersScreen()));
                                    selectedIndex = index; // Update selected index
                                  });
                                },
                                child: CircleAvatar(
                                  radius: MediaQuery.of(context).size.height * 0.043,
                                  backgroundColor: selectedIndex == index
                                      ? Colors.black
                                      : Colors.grey[100],
                                  child: Icon(
                                    servicesIconData[index],
                                    size: 30,
                                    color: selectedIndex == index
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              serviceName[index],
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Home Appliances",
                        style: subHeadings,
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeServicesScreen()));
                        },
                        child: Text("View All",
                          style: TextStyle(color: Colors.orange,fontSize: 18),
                        ),
                      ),

                    ],
                  ),
                  gap(10),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.14,
                    child: ListView.builder(
                        itemCount: homeAppliancesIconData.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index){
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 4),
                                child: InkWell(
                                  onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ServicesProvidersScreen()));
                                },
                                  child: CircleAvatar(
                                    radius: MediaQuery.of(context).size.height*0.043,
                                    backgroundColor: Colors.grey[100],
                                    child: Icon(homeAppliancesIconData[index],size: 30,),
                                  ),
                                ),
                              ),
                              gap(10),
                              Text(homeAppliancesName[index],
                                style: servicesTeat,
                              ),

                            ],
                          );
                        }
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Services Offered",
                        style: subHeadings,
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeServicesScreen()));
                        },
                        child: Text("View All",
                          style: TextStyle(color: Colors.orange,fontSize: 18),
                        ),
                      ),


                    ],
                  ),
                  gap(10),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.14,
                    child: ListView.builder(
                        itemCount: homeServicesImages.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index){
                          return Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>ServicesProvidersScreen()));
                              },
                              child: Container(
                                height: MediaQuery.of(context).size.height*0.14,
                                width: MediaQuery.of(context).size.width*0.43,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 1.0,
                                      spreadRadius: 2,
                                      color: Colors.grey,

                                    ),
                                  ],
                                  image: DecorationImage(
                                    image: NetworkImage(homeServicesImages[index]['image']),
                                    fit: BoxFit.fill
                                  )
                                ),
                              ),
                            ),
                          );
                        }
                    ),
                  ),
                  gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Decorate Your Home",
                        style: subHeadings,
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeServicesScreen()));
                        },
                        child: Text("View All",
                          style: TextStyle(color: Colors.orange,fontSize: 18),
                        ),
                      ),


                    ],
                  ),
                  gap(10),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.14,
                    child: ListView.builder(
                        itemCount: homeDecorateImages.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index){
                          return Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>ServicesProvidersScreen()));
                              },
                              child: Container(
                                height: MediaQuery.of(context).size.height*0.14,
                                width: MediaQuery.of(context).size.width*0.43,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 1.0,
                                        spreadRadius: 2,
                                        color: Colors.grey,

                                      ),
                                    ],
                                    image: DecorationImage(
                                        image: NetworkImage(homeDecorateImages[index]),
                                        fit: BoxFit.fill
                                    )
                                ),
                              ),
                            ),
                          );
                        }
                    ),
                  ),
                  gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Near For You",
                        style: subHeadings,
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeServicesScreen()));
                        },
                        child: Text("View All",
                          style: TextStyle(color: Colors.orange,fontSize: 18),
                        ),
                      ),


                    ],
                  ),
                  gap(10),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.27,
                    child: ListView.builder(
                        itemCount: nearForYouImages.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index){
                          return Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>ServicesProvidersScreen()));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.grey[200]
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      height: MediaQuery.of(context).size.height*0.2,
                                      width: MediaQuery.of(context).size.width*0.7,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 1.0,
                                              spreadRadius: 1,
                                              color: Colors.grey,

                                            ),
                                          ],
                                          image: DecorationImage(
                                              image: NetworkImage(nearForYouImages[index]),
                                              fit: BoxFit.fill
                                          )
                                      ),
                                    ),
                                    gap(10),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(nearForYouServices[index],
                                        style: subHeadings,
                                        ),
                                        SizedBox(width: MediaQuery.of(context).size.width*0.2,),
                                        Container(
                                          height: MediaQuery.of(context).size.height*0.05,
                                          width: MediaQuery.of(context).size.width*0.2,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            color: Colors.orange,
                                          ),
                                          child: Center(child: Text('₹ ${nearForYouServicesPrice[index]}',
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
                        }
                    ),
                  ),
                  gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Recommended",
                        style: subHeadings,
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeServicesScreen()));
                        },
                        child: Text("View All",
                          style: TextStyle(color: Colors.orange,fontSize: 18),
                        ),
                      ),


                    ],
                  ),
                  gap(10),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*1.1,
                    child: ListView.builder(
                        itemCount: workersHomeServices.length,
                        scrollDirection: Axis.vertical,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index){
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>ServicesProvidersScreen()));
                              },
                              child: Container(
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
                                            SizedBox(width: 5,),
                                            Text(workersHomeServices[index]['name'],
                                              style: subHeadings,
                                            ),
                                          ],
                                        ),
                                        gap(10),

                                        Row(
                                          children: [
                                            Icon(Icons.call,size: 20,color: Colors.blue,),
                                            SizedBox(width: 5,),
                                            Text(workersHomeServices[index]['contact'],
                                              style: subHeadings,
                                            ),
                                          ],
                                        ),
                                        gap(10),
                                        Row(
                                          children: [
                                            Icon(Icons.location_on_outlined,size: 20,color: Colors.red,),
                                            SizedBox(width: 5,),
                                            Text(workersHomeServices[index]['location'],
                                              style: subHeadings,
                                            ),
                                          ],
                                        ),
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
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
