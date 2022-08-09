import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:tasky/utils/app_constants.dart';

class DataService extends GetConnect implements GetxService {
  Future<Response> getData(String uri) async {
    if (kDebugMode) {
      print(AppConstants.BASEURL + uri);
    }
    Response response = await get(AppConstants.BASEURL + uri,
        headers: {'Content-Type': 'application/json; charset=UTF-8'});
    return response;
  }

  Future<Response> postData(String uri, dynamic body) async {
    Response response = await post(AppConstants.BASEURL + uri, body,
        headers: {'Content-Type': 'application/json; charset=UTF-8'});

    return response;
  }

  Future<Response> updateData(String uri, dynamic body) async {
    Response response = await put(AppConstants.BASEURL + uri, body,
        headers: {'Content-Type': 'application/json; charset=UTF-8'});

    return response;
  }
}
