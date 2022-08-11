import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasky/controller/data_controller.dart';
import 'package:tasky/utils/colors/app_colors.dart';

import '../widgets/button_widget.dart';
import '../widgets/textfield_widget.dart';

class ViewTask extends StatelessWidget {
  final int id;
  const ViewTask({Key? key, required this.id}) : super(key: key);

  _loadSingleTask() async {
    await Get.find<DataController>().getSingleData(id);
  }

  @override
  Widget build(BuildContext context) {
    _loadSingleTask();
    TextEditingController nameController = TextEditingController();
    TextEditingController detailController = TextEditingController();
    return Scaffold(body: GetBuilder<DataController>(
      builder: ((controller) {
        nameController.text =
            controller.singleData['task_name'] ?? "task name not found";
        detailController.text =
            controller.singleData['task_details'] ?? "details not found";
        return Container(
          height: double.maxFinite,
          width: double.maxFinite,
          padding: EdgeInsets.only(left: 20, right: 20),
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/addtask1.jpg'),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(children: [
                const SizedBox(
                  height: 60,
                ),
                IconButton(
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: AppColors.secondaryColor,
                    )),
              ]),
              Column(
                children: [
                  TextFieldWidget(
                    readOnly: true,
                    textController: nameController,
                    hintText: 'Task Name',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFieldWidget(
                    readOnly: true,
                    textController: detailController,
                    hintText: 'Task Details',
                    borderRadius: 15,
                    maxLine: 3,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 20,
              )
            ],
          ),
        );
      }),
    ));
  }
}
