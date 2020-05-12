import 'package:bipolar_test/views/image_container.dart';
import 'package:flutter/material.dart';
import 'package:bipolar_test/models/list_model.dart';
import 'package:provider/provider.dart';
import 'package:bipolar_test/providers/imageProvider.dart';

class GetImageList extends StatefulWidget {
  @override
  _GetImageListState createState() => _GetImageListState();
}

class _GetImageListState extends State<GetImageList> {
  ImageList imageList;  

  @override
  void initState() {
    imageList = Provider.of<MyImageProvider>(context, listen: false).imageList;
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
        children: List.generate(imageList.images.length, (index) {
          return Center(
            child: ImageContainer(imageList.images[index].urls.regular,
                                  imageList.images[index].description,
                                  imageList.images[index].altDescription),
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
