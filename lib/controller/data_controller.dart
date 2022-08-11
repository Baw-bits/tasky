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
    } else {
      print('We did not get the body');
    }
    update();
    _isLoading = false;
  }

  Future<void> getSingleData(int id) async {
    _isLoading = true;
    Response response =
        await service.getData('${AppConstants.GET_TASK}' '?id=$id');
    if (response.statusCode == 200) {
      if (kDebugMode) {
        print('we got the single data' + jsonEncode(response.body));
        _singleData = response.body;
      }
    } else {
      print('he no work');
    }
    update();
    _isLoading = false;
  }

  Future<void> postData(String task, String taskDetail) async {
    _isLoading = true;
    Response response = await service.postData(AppConstants.POST_TASK,
        {"task_name": task, "task_details": taskDetail});
    if (response.statusCode == 200) {
      print('Post Successfully');
    } else {
      print('nooooo');
    }
    update();
    _isLoading = false;
  }

  Future<void> updateData(String task, String taskDetail, int id) async {
    _isLoading = true;
    Response response = await service.updateData(
        '${AppConstants.UPDATE_TASK}' '?id=$id',
        {"task_name": task, "task_details": taskDetail});
    if (response.statusCode == 200) {
      print('Post Successfully');
    } else {
      print('Post failed');
    }
    update();
    _isLoading = false;
  }

  Future<void> deleteData(int id) async {
    _isLoading = true;
    update();
    Response response = await service.deleteData(
      '${AppConstants.DELETE_TASK}' '?id=$id',
    );
    if (response.statusCode == 200) {
      print('Delete Successfully');
    } else {
      print('Delete failed');
    }
    await Future.delayed(Duration(seconds: 1), () {
      _isLoading = false;
      update();
    });
  }
}
