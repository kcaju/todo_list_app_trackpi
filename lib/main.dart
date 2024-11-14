import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/controller/database_controller.dart';
import 'package:todo_list_app/view/bottomnav_screen/bottomnav_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseController.initDB();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DatabaseController(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BottomnavScreen(),
      ),
    );
  }
}
