import 'package:flutter/material.dart';
import 'package:todo_list_app/utils/color_constants.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield(
      {super.key,
      required this.hintText,
      this.isDescription = false,
      required this.controller});
  final String hintText;
  final bool isDescription;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: TextStyle(color: ColorConstants.white, fontSize: 20),
      maxLines: isDescription ? 2 : 1,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: ColorConstants.white),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          )),
    );
  }
}
