import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:tasky/services/services.dart';
import 'package:tasky/utils/app_constants.dart';

class DataController extends GetxController {
  DataService service = DataService();
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  List<dynamic> _myData = [];
  List<dynamic> get myData => _myData;
  Map<String, dynamic> _singleData = {};
  Map<String, dynamic> get singleData => _singleData;
  Future<void> getData() async {
    _isLoading = true;
    Response response = await service.getData(AppConstants.GET_TASKS);
    if (response.statusCode == 200) {
      _myData = response.body;
      print("we got body");
      update();
    } else {
      print('We did not get the body');
    }
  }

  Future<void> getSingleData(String id) async {
    _isLoading = true;
    Response response = await service.getData('${AppConstants.GET_TASK}' '$id');
    if (response.statusCode == 200) {
      if (kDebugMode) {
        print('we got the single data' + jsonEncode(response.body));
        _singleData = response.body;
      }
      update();
    } else {
      print('he no work');
    }
  }

  Future<void> postData(String task, String taskDetail) async {
    _isLoading = true;
    Response response = await service.postData(AppConstants.POST_TASK,
        {"task_name": task, "task_details": taskDetail});
    if (response.statusCode == 200) {
      update();
      print('Post Successfully');
    } else {
      print('nooooo');
    }
  }
}
