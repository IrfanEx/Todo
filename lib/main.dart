import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/Screens/Welcome/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'HomeScreen/provider/todos.dart';
import 'HomeScreen/widget/datetime/datetimepage.dart';
import 'constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Todo App With Firebase';
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
    create: (context) => TodosProvider(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        primarySwatch: Colors.pink,
        scaffoldBackgroundColor: Color(0xFFf6f5ee),
      ),
      home: WelcomeScreen(),
    ),
  );
}
