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
    await Get.find<DataController>().getSingleData(id.toString());
  }

  @override
  Widget build(BuildContext context) {
    _loadSingleTask();
    TextEditingController nameController = TextEditingController();
    TextEditingController detailController = TextEditingController();
    return Scaffold(body: GetBuilder<DataController>(
      builder: ((controller) {
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
                    hintText: '${controller.singleData['task_name']}',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFieldWidget(
                    textController: detailController,
                    hintText: '${controller.singleData['task_details']}',
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
