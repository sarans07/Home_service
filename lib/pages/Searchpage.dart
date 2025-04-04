import 'package:flutter/material.dart';

import '../components/Widgets.dart';
import '../model/datas_services.dart';
import '../utils/textstyle.dart';
import 'ItemProvider.dart';
import 'package:get/get.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            gap(20),
            Text(
              "Search",
              style: pageHeadings,
            ),
            gap(10),
            searchWidget(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Number of items per row
                    crossAxisSpacing: 10.0, // Horizontal spacing between items
                    mainAxisSpacing: 10.0, // Vertical spacing between items
                    childAspectRatio: 0.85, // Aspect ratio for grid items
                  ),
                  itemCount: popularImages.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Get.to(ItemsProvidersScreen());
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.21,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.19,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(20),
                              topLeft: Radius.circular(20),
                            ),
                            image: DecorationImage(
                              image: NetworkImage(popularImages[index]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            gap(20),
          ],
        ),
      ),
    );
  }
}
