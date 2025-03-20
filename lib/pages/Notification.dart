import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_services_app/utils/textstyle.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Notification"),
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_outlined,size: 20,),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height*1,
              child: ListView.builder(
                itemCount: 20,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index){
                    return SingleChildScrollView(
                      child: Card(
                        child: ListTile(
                          leading: Icon(Icons.notifications_active,size: 20,),
                          title: Text('Service Alert!',
                          style: subHeadings,
                          ),
                          subtitle: Text("You have to be On Time"),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    )
    );
  }
}
