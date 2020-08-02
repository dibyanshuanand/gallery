import 'package:bipolar_test/models/list_model.dart';
import 'package:bipolar_test/utils/commons.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:async';

class AnotherImageProvider extends ChangeNotifier {
  ImageList imageList;
  String url = "https://api.unsplash.com/collections/139386/photos/?client_id=<Enter client id>"; // TODO: Enter client id to access API

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
