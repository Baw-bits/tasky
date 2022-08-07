import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tasky/controller/data_controller.dart';
import 'package:tasky/utils/colors/app_colors.dart';
import 'package:tasky/widgets/button_widget.dart';
import 'package:tasky/widgets/task_widgets.dart';
import 'package:get/get.dart';

class AllTask extends StatelessWidget {
  const AllTask({Key? key}) : super(key: key);
  _loadData() {
    Get.find<DataController>().getData();
  }

  @override
  Widget build(BuildContext context) {
    _loadData();
    List myData = ['Try Harder', 'Try Smarter'];
    final leftEditting = Container(
      margin: const EdgeInsets.only(bottom: 10),
      color: const Color(0xff2e3253),
      child: const Icon(
        Icons.edit,
        color: Colors.white,
      ),
      alignment: Alignment.centerLeft,
    );
    final rightDeletingIcon = Container(
      margin: const EdgeInsets.only(bottom: 10),
      color: Colors.redAccent,
      child: const Icon(
        Icons.delete,
        color: Colors.white,
      ),
      alignment: Alignment.centerRight,
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 20, top: 60),
            alignment: Alignment.topLeft,
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: Icon(
                Icons.arrow_back,
                color: AppColors.secondaryColor,
              ),
            ),
            width: double.maxFinite,
            height: MediaQuery.of(context).size.height / 3.2,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/header1.jpg'),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: [
                Icon(
                  Icons.home,
                  color: AppColors.secondaryColor,
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.5),
                      color: Colors.black),
                ),
                Expanded(child: Container()),
                Icon(
                  Icons.calendar_month_sharp,
                  color: AppColors.secondaryColor,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  '2',
                  style:
                      TextStyle(fontSize: 20, color: AppColors.secondaryColor),
                )
              ],
            ),
          ),
          Flexible(
            child: GetBuilder<DataController>(builder: (controller) {
              return ListView.builder(
                  itemCount: controller.myData.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      background: leftEditting,
                      secondaryBackground: rightDeletingIcon,
                      onDismissed: (DismissDirection direction) {},
                      confirmDismiss: (DismissDirection direction) async {
                        if (direction == DismissDirection.startToEnd) {
                          showModalBottomSheet(
                              barrierColor: Colors.transparent,
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (_) {
                                return Container(
                                  height: 550,
                                  decoration: BoxDecoration(
                                      color: const Color(0xff2e3253)
                                          .withOpacity(0.4),
                                      borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20))),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ButtonWidget(
                                            textColor: Colors.white,
                                            backgroundColor:
                                                AppColors.mainColor,
                                            text: 'View'),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        ButtonWidget(
                                            textColor: Colors.white,
                                            backgroundColor:
                                                AppColors.mainColor,
                                            text: 'Edit'),
                                      ],
                                    ),
                                  ),
                                );
                              });
                          return false;
                        } else {
                          return Future.delayed(Duration(seconds: 1),
                              () => direction == DismissDirection.endToStart);
                        }
                      },
                      key: ObjectKey(index),
                      child: Container(
                        margin:
                            EdgeInsets.only(left: 20, right: 20, bottom: 10),
                        child: TaskWidget(
                            text: controller.myData[index]['task_name'],
                            color: Colors.blueGrey),
                      ),
                    );
                  });
            }),
          ),
        ],
      ),
    );
  }
}
