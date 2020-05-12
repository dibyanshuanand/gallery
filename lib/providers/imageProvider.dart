import 'package:bipolar_test/models/list_model.dart';
import 'package:bipolar_test/utils/commons.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:async';

class MyImageProvider extends ChangeNotifier {
  ImageList imageList;
  String url = "https://api.unsplash.com/collections/1580860/photos/?client_id=1EfUjV0I1JVR0gCSpoA9vcuy2-jgs6rge2oJ53IvPgI";

  Future<ImageList> fetchImages() async {
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        var responseJson = Commons.returnResponse(response);
        imageList = ImageList.fromJson(responseJson);
        return ImageList.fromJson(responseJson);
      } else {
        return null;
      }
    } on SocketException {
      return null;
    }
  }
}