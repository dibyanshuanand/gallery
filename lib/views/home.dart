import 'package:bipolar_test/views/another_image_view.dart';
import 'package:bipolar_test/views/image_view.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Sample', style: TextStyle(color: Colors.black),),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          bottom: TabBar(
              unselectedLabelColor: Colors.black54,
              indicatorSize: TabBarIndicatorSize.label,
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.grey),
              tabs: [
                Tab(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: Colors.grey[600], width: 1)),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Lifestyle"),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: Colors.grey[600], width: 1)),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Cats"),
                    ),
                  ),
                ),
              ]),
        ),
        body: TabBarView(children: [
          GetImageList(),
          GetPictureList(),
        ]),
      )),
    );
  }
}
