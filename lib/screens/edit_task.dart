import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tasky/controller/data_controller.dart';
import 'package:tasky/screens/all_task.dart';
import 'package:tasky/utils/colors/app_colors.dart';
import 'package:tasky/widgets/button_widget.dart';
import 'package:tasky/widgets/error_warning_ms.dart';
import 'package:tasky/widgets/textfield_widget.dart';
import 'package:get/get.dart';

class EditTask extends StatelessWidget {
  final int id;
  const EditTask({Key? key, required this.id}) : super(key: key);
  _loadingSingleTask() async {
    await Get.find<DataController>().getSingleData(id.toString());
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController detailController = TextEditingController();
    bool _dataValidation() {
      if (nameController.text.trim() == '') {
        Message.taskErrorOrWarning('Task name', 'Your task name is empty');
        return false;
      } else if (detailController.text.trim() == '') {
        Message.taskErrorOrWarning('Task detail', 'Your task detail is empty');
        return false;
      } else if (nameController.text.length <= 10) {
        Message.taskErrorOrWarning(
            'Task Name', 'Your task name should be at least 10 characters');
        return false;
      } else if (detailController.text.length <= 20) {
        Message.taskErrorOrWarning('Task details',
            'Your task details should be at least 20 characters');
        return false;
      }
      return true;
    }

    _loadingSingleTask();
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
              image: AssetImage('assets/addtask.jpg'),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.arrow_back),
                    color: AppColors.secondaryColor,
                  )
                ],
              ),
              Column(
                children: [
                  TextFieldWidget(
                    textController: nameController,
                    hintText: 'Text Name',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFieldWidget(
                    textController: detailController,
                    hintText: 'Task Detail',
                    borderRadius: 15,
                    maxLine: 3,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (_dataValidation()) {
                        Get.find<DataController>().postData(
                            nameController.text.trim(),
                            detailController.text.trim());
                        Get.to(() => AllTask(),
                            transition: Transition.circularReveal);
                      }
                    },
                    child: ButtonWidget(
                        textColor: Colors.white,
                        backgroundColor: AppColors.mainColor,
                        text: 'Add'),
                  )
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
