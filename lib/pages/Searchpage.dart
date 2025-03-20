import 'package:flutter/material.dart';
import 'package:home_services_app/pages/ServicesProviders.dart';
import 'package:home_services_app/utils/Widgets.dart';
import 'package:home_services_app/utils/datas_services.dart';
import 'package:home_services_app/utils/textstyle.dart';

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
            const Text(
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
                  itemCount: homeServicesImages.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ServicesProvidersScreen(),
                          ),
                        );
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.21,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.19,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  topLeft: Radius.circular(20),
                                ),
                                image: DecorationImage(
                                  image: NetworkImage(homeServicesImages[index]['image']),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            gap(5),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  homeServicesImages[index]['name'],
                                  style: subHeadings,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            gap(50),
          ],
        ),
      ),
    );
  }
}
