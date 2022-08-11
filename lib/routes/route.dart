import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasky/screens/add_task.dart';
import 'package:tasky/screens/all_task.dart';
import 'package:tasky/screens/edit_task.dart';
import 'package:tasky/screens/home_screen.dart';
import 'package:tasky/screens/view_task.dart';

class RoutesClass {
  static String home = '/';
  static String allTask = '/allTask';
  static String addTask = '/addTask';
  static String editTask = '/editTask';
  static String viewTask = '/viewTask';

  static String getHomeRoute() => home;
  static String getViewAllTaskRoute() => allTask;
  static String getAddTaskRoute() => addTask;
  static String getEditTaskRoute(String id) => '$editTask?id=$id';
  static String getViewTaskRoute(String id) => '$viewTask?id=$id';

  static List<GetPage> routes = [
    GetPage(name: home, page: () => const HomeScreen()),
    GetPage(
        name: allTask,
        page: () => const AllTask(),
        transition: Transition.fade,
        transitionDuration: const Duration(milliseconds: 500)),
    GetPage(
        name: editTask,
        page: () {
          var id = Get.parameters['id'];
          return EditTask(id: int.parse(id!));
        },
        transitionDuration: const Duration(milliseconds: 500)),
    GetPage(
        name: addTask,
        page: () => const AddTask(),
        transition: Transition.fade,
        transitionDuration: const Duration(milliseconds: 500)),
    GetPage(
        name: viewTask,
        page: () {
          var id = Get.parameters['id'];
          return ViewTask(id: int.parse(id!));
        },
        transition: Transition.zoom,
        transitionDuration: const Duration(milliseconds: 500))
  ];
}
