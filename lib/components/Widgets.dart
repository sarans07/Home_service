


 import 'package:flutter/material.dart';
import 'package:home_services_app/utils/textstyle.dart';

Widget drawerWidget(IconData? iconName, String? optionName, Function()? clickingOntap) {
  return Column(
    children: [
      ListTile(
        leading: Icon(iconName!,size: 20,),
        title: Text(optionName!,
        style: iconText,
        ),
        onTap: clickingOntap!,
      ),
      Divider(
        height: 2,
        thickness: 1,
      )
    ],
  );
}

Widget searchWidget() {
  return Container(
      decoration: BoxDecoration(
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(30)
    ),
    child: TextFormField(
      decoration: InputDecoration(
        suffixIcon: Icon(Icons.search,size: 20,),
        hintText: 'Search for Items',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none
        )
      ),
    ),
  );
}

Widget gap(double? height) {
  return SizedBox(
    height: height!,
  );
}