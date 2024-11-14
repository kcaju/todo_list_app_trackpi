import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/controller/database_controller.dart';
import 'package:todo_list_app/utils/color_constants.dart';
import 'package:todo_list_app/widgets/custom_textfield.dart';

class TaskAddingScreen extends StatefulWidget {
  const TaskAddingScreen({super.key});

  @override
  State<TaskAddingScreen> createState() => _TaskAddingScreenState();
}

class _TaskAddingScreenState extends State<TaskAddingScreen> {
  String? selectedPriority = "High";
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  String status = 'Pending';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.blue,
      appBar: AppBar(
        backgroundColor: ColorConstants.blue,
        leading: Icon(
          Icons.sort,
          color: ColorConstants.white,
          size: 25,
        ),
        title: Text(
          "Add Your Tasks",
          style: TextStyle(
            color: ColorConstants.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextfield(
              hintText: "Title",
              controller: title,
            ),
            SizedBox(
              height: 15,
            ),
            CustomTextfield(
              controller: description,
              hintText: "Descripton",
              isDescription: true,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Choose Priority:",
              style: TextStyle(fontSize: 22, color: ColorConstants.white),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Transform.scale(
                  scale: 1.3,
                  child: Radio(
                    value: 'High',
                    activeColor: ColorConstants.green,
                    groupValue: selectedPriority,
                    onChanged: (value) {
                      setState(() {
                        selectedPriority = value;
                      });
                    },
                  ),
                ),
                Text(
                  "High",
                  style: TextStyle(
                      color: selectedPriority == 'High'
                          ? ColorConstants.green
                          : ColorConstants.white,
                      fontSize: 20),
                ),
                SizedBox(
                  width: 20,
                ),
                Transform.scale(
                  scale: 1.3,
                  child: Radio(
                    value: 'Medium',
                    groupValue: selectedPriority,
                    activeColor: ColorConstants.orange,
                    onChanged: (value) {
                      setState(() {
                        selectedPriority = value;
                      });
                    },
                  ),
                ),
                Text(
                  "Medium",
                  style: TextStyle(
                      color: selectedPriority == 'Medium'
                          ? ColorConstants.orange
                          : ColorConstants.white,
                      fontSize: 20),
                ),
                SizedBox(
                  width: 20,
                ),
                Transform.scale(
                  scale: 1.3,
                  child: Radio(
                    value: 'Low',
                    groupValue: selectedPriority,
                    activeColor: ColorConstants.red,
                    onChanged: (value) {
                      setState(() {
                        selectedPriority = value;
                      });
                    },
                  ),
                ),
                Text(
                  "Low",
                  style: TextStyle(
                      color: selectedPriority == 'Low'
                          ? ColorConstants.red
                          : ColorConstants.white,
                      fontSize: 20),
                ),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: SizedBox(
                height: 50,
                width: 150,
                child: ElevatedButton(
                    onPressed: () async {
                      //add task to local database
                      if (title.text.isNotEmpty &&
                          description.text.isNotEmpty) {
                        await context.read<DatabaseController>().addTask(
                            title: title.text,
                            priority: selectedPriority ?? "High",
                            description: description.text,
                            status: status);

                        description.clear();
                        title.clear();
                      } else {}
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll(ColorConstants.buttonblue)),
                    child: Text(
                      "Save",
                      style: TextStyle(
                          color: ColorConstants.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
