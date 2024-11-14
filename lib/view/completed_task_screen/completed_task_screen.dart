import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/controller/database_controller.dart';
import 'package:todo_list_app/utils/color_constants.dart';

class CompletedTaskScreen extends StatefulWidget {
  const CompletedTaskScreen({super.key});

  @override
  State<CompletedTaskScreen> createState() => _CompletedTaskScreenState();
}

class _CompletedTaskScreenState extends State<CompletedTaskScreen> {
  bool isCompleted = false;
  final Map<String, Color> priorityColors = {
    'High': ColorConstants.green,
    'Medium': ColorConstants.orange,
    'Low': ColorConstants.red,
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.blue,
      appBar: AppBar(
        backgroundColor: ColorConstants.blue,
        title: Text(
          "Completed Tasks",
          style: TextStyle(
            color: ColorConstants.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Consumer<DatabaseController>(
        builder: (context, dbProvider, child) {
          if (dbProvider.completedTasks.isEmpty) {
            return Center(
              child: Text(
                "No completed tasks.",
                style: TextStyle(
                  color: ColorConstants.white,
                  fontSize: 20,
                ),
              ),
            );
          }
          return ListView.separated(
              padding: EdgeInsets.all(10),
              itemBuilder: (context, index) {
                var task = dbProvider.completedTasks[index];
                Color priorityColor =
                    priorityColors[task['priority']] ?? ColorConstants.grey;
                return InkWell(
                  onLongPress: () async {
                    await dbProvider.deleteTask(id: task['id']);
                    setState(() {});
                  },
                  child: Stack(
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Text(
                                "Completed",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: ColorConstants.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    child: Icon(
                                      Icons.checklist,
                                      size: 30,
                                      color: ColorConstants.white,
                                    ),
                                    decoration: BoxDecoration(
                                        color: ColorConstants.brown,
                                        shape: BoxShape.circle),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      task['title'],
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: ColorConstants.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      task['description'],
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: ColorConstants.black,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Checkbox(value: true, onChanged: null)
                              ],
                            )
                          ],
                        ),
                        height: 120,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: ColorConstants.card,
                            borderRadius: BorderRadius.circular(15)),
                      ),
                      Positioned(
                        right: 0,
                        child: Container(
                          child: Center(
                            child: Text(
                              task['priority'],
                              style: TextStyle(
                                  color: priorityColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          height: 40,
                          width: 180,
                          decoration: BoxDecoration(
                              color: ColorConstants.blue,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.elliptical(40, 50))),
                        ),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(
                    height: 40,
                    child: Divider(
                      color: ColorConstants.grey,
                    ),
                  ),
              itemCount: dbProvider.completedTasks.length);
        },
      ),
    );
  }
}
