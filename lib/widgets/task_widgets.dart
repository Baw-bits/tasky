import 'package:flutter/material.dart';

class TaskWidget extends StatelessWidget {
  final String text;
  final Color color;
  const TaskWidget({Key? key, required this.text, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: MediaQuery.of(context).size.height / 14,
      decoration: BoxDecoration(
        color: Color(0xFFEDF0F8).withOpacity(0.5),
        borderRadius: BorderRadius.circular(1),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 20, color: color),
        ),
      ),
    );
  }
}
