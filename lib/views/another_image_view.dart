import 'package:bipolar_test/views/image_container.dart';
import 'package:flutter/material.dart';
import 'package:bipolar_test/models/list_model.dart';
import 'package:provider/provider.dart';
import 'package:bipolar_test/providers/anotherImageProvider.dart';

class GetPictureList extends StatefulWidget {
  @override
  _GetPictureListState createState() => _GetPictureListState();
}

class _GetPictureListState extends State<GetPictureList> {
  ImageList pictureList;  

  @override
  void initState() {
    pictureList = Provider.of<AnotherImageProvider>(context, listen: false).imageList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.only(left: 5.0, top: 5.0, right: 5.0),
      color: const Color(0xFFFFFFFF),
      width: screenWidth,
      child: GridView.count(
        mainAxisSpacing: 15.0,
        crossAxisSpacing: 15.0,
        crossAxisCount: 2,
        childAspectRatio: 9 / 16,
        children: List.generate(pictureList.images.length, (index) {
          return Center(
            child: ImageContainer(pictureList.images[index].urls.regular,
                                  pictureList.images[index].description,
                                  pictureList.images[index].altDescription),
          );
        }),
      ),      
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
