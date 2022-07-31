import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tasky/screens/add_task.dart';
import 'package:tasky/screens/all_task.dart';
import 'package:tasky/utils/colors/app_colors.dart';
import 'package:tasky/widgets/button_widget.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                text: 'Hello',
                style: TextStyle(
                  color: AppColors.mainColor,
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                    text: '\nStart your beautiful day',
                    style: TextStyle(
                      color: AppColors.smallTextColor,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 2.5,
            ),
            InkWell(
              onTap: () {
                Get.to(() => AddTask(),
                    transition: Transition.fade,
                    duration: Duration(milliseconds: 500));
              },
              child: ButtonWidget(
                  textColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  text: 'Add Task'),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 30,
            ),
            InkWell(
              onTap: () {
                Get.to(() => AllTask(),
                    transition: Transition.fade,
                    duration: Duration(seconds: 1));
              },
              child: ButtonWidget(
                  textColor: AppColors.smallTextColor,
                  backgroundColor: Colors.white,
                  text: 'View All'),
            ),
          ],
        ),
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/welcome.jpg"),
          ),
        ),
      ),
    );
  }
}
