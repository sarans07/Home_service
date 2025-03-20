import 'package:flutter/material.dart';
import 'package:home_services_app/pages/ServicesProviders.dart';
import 'package:home_services_app/utils/Widgets.dart';
import 'package:home_services_app/utils/textstyle.dart';

import '../utils/datas_services.dart';

class HomeServicesScreen extends StatefulWidget {
  const HomeServicesScreen({super.key});

  @override
  State<HomeServicesScreen> createState() => _HomeServicesScreenState();
}

class _HomeServicesScreenState extends State<HomeServicesScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text("Services",
            style: pageHeadings,
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height*0.4,
                  width: MediaQuery.of(context).size.width*1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                      image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSEirYM_BI0ia2dP8tss8TuKsKdeVatVgBp0w&s'),
                      fit: BoxFit.cover
                    )
                  ),
                ),
                gap(10),
                SizedBox(
                  height: MediaQuery.of(context).size.height*1.1,
                  child: ListView.builder(
                      itemCount: workersHomeServices.length,
                      scrollDirection: Axis.vertical,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index){
                        return InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>ServicesProvidersScreen()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  //color: Colors.grey[200]
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    height: MediaQuery.of(context).size.height*0.16,
                                    width: MediaQuery.of(context).size.width*0.35,
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
                                  const SizedBox(width: 60,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(workersHomeServices[index]['work'],
                                        style: subHeadings,
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
        )
    );
  }
}
