import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_services_app/pages/BookingsPage.dart';
import 'package:home_services_app/pages/EditProfilePage.dart';
import 'package:home_services_app/pages/FavouritePage.dart';
import 'package:home_services_app/pages/Notification.dart';
import 'package:home_services_app/utils/Widgets.dart';
import 'package:home_services_app/utils/textstyle.dart';

import '../auth/loginScreen.dart';
import '../auth/services/auth_services.dart';
import '../utils/toast.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {

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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Account",
          style: pageHeadings,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              gap(20),
              const Center(
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQzWb5Zt6BAR_mKGXNqf6SpHBBJjiQFiAMAZQ&s'),

                ),
              ),
              gap(10),
              const Text("Saran. S",
              style: subHeadings,
              ),
              gap(10),
              const Text('saran@gmail.com',
              style: TextStyle(color: Colors.black87,fontSize: 16),
              ),
              gap(30),
              ListTile(
                leading: const Icon(Icons.person,size: 20,),
                title: const Text('My Profile',
                  style: iconText,
                ),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>editprofile()));
                },
                trailing: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>editprofile()));
                    },
                    child: const Icon(Icons.edit,size: 20,)),
              ),
              const Divider(
                height: 2,
                thickness: 1,
              ),
              drawerWidget(Icons.notifications_outlined, 'Notification', () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationPage()));
              }),
              drawerWidget(Icons.message, "Bookings", (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>BookingsPage()));
              }),
              drawerWidget(Icons.favorite_border, 'Favorite', () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>FavouritePage()));
              }),
              drawerWidget(Icons.history, 'History', () => null),
              drawerWidget(CupertinoIcons.money_dollar_circle, 'Refer & Earn', () => null),
              drawerWidget(Icons.help_center_outlined, 'Help', () => null),
              drawerWidget(Icons.contact_phone_sharp, 'Contact Us', () => null),
              drawerWidget(Icons.logout, 'Logout', () {
                _showLogoutDialog(context);
              }),
            ],
          ),
        )      ),
    );
  }
}
