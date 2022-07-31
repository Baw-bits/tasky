import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tasky/utils/colors/app_colors.dart';
import 'package:tasky/widgets/button_widget.dart';
import 'package:tasky/widgets/textfield_widget.dart';
import 'package:get/get.dart';

class AddTask extends StatelessWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController detailController = TextEditingController();
    return Scaffold(
      body: Container(
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
                ButtonWidget(
                    textColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    text: 'Add')
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 20,
            )
          ],
        ),
      ),
    );
  }
}
