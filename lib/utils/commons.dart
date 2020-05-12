import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:bipolar_test/networking/AppException.dart';

class Commons {
    static dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = jsonDecode(response.body.toString());
        print(responseJson);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:

      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}