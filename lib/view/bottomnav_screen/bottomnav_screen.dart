import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_app/utils/color_constants.dart';
import 'package:todo_list_app/view/completed_task_screen/completed_task_screen.dart';
import 'package:todo_list_app/view/homescreen/all_task_screen.dart';
import 'package:todo_list_app/view/pending_task_screen/pending_task_screen.dart';
import 'package:todo_list_app/view/task_adding_screen/task_adding_screen.dart';

class BottomnavScreen extends StatefulWidget {
  const BottomnavScreen({super.key});

  @override
  State<BottomnavScreen> createState() => _BottomnavScreenState();
}

class _BottomnavScreenState extends State<BottomnavScreen> {
  int selectedIndex = 0;
  List<Widget> bottomNavScreens = [
    TaskAddingScreen(),
    AllTaskScreen(),
    CompletedTaskScreen(),
    PendingTaskScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bottomNavScreens[selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: ColorConstants.blue,
          color: ColorConstants.black,
          onTap: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
          items: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.add_circle,
                  color: ColorConstants.green,
                  size: 35,
                ),
                Text(
                  "Add Tasks",
                  style: TextStyle(
                      color: ColorConstants.green,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            Column(
              children: [
                Icon(
                  Icons.list,
                  color: ColorConstants.green,
                  size: 35,
                ),
                Text(
                  "All Tasks",
                  style: TextStyle(
                      color: ColorConstants.green,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            Column(
              children: [
                Icon(
                  color: ColorConstants.green,
                  Icons.checklist_rtl,
                  size: 35,
                ),
                Text(
                  "Completed",
                  style: TextStyle(
                      color: ColorConstants.green,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            Column(
              children: [
                Icon(
                  color: ColorConstants.green,
                  Icons.schedule,
                  size: 35,
                ),
                Text(
                  "Pending",
                  style: TextStyle(
                      color: ColorConstants.green,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ]),
    );
  }
}
