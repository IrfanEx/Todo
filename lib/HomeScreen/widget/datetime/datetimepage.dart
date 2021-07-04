// import 'package:todo/HomeScreen/widget/datetime/widget/button_widget.dart';
// import 'package:todo/HomeScreen/widget/datetime/widget/date_range_picker_widget.dart';
// import 'package:todo/HomeScreen/widget/datetime/widget/datetime_picker_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// class MyApp extends StatelessWidget {
//   static final String title = 'Date (Range) & Time';
//
//   @override
//   Widget build(BuildContext context) => MaterialApp(
//     debugShowCheckedModeBanner: false,
//     title: title,
//     theme: ThemeData(
//       primaryColor: Colors.black,
//     ),
//     home: MainPage(),
//   );
// }
//
// class MainPage extends StatefulWidget {
//   @override
//   _MainPageState createState() => _MainPageState();
// }
//
// class _MainPageState extends State<MainPage> {
//   int index = 0;
//
//   @override
//   Widget build(BuildContext context) => Scaffold(
//     bottomNavigationBar: buildBottomBar(),
//     body: buildPages(),
//   );
//
//   Widget buildBottomBar() {
//     final style = TextStyle(color: Colors.white);
//
//     return BottomNavigationBar(
//       backgroundColor: Theme.of(context).primaryColor,
//       selectedItemColor: Colors.white,
//       unselectedItemColor: Colors.white70,
//       currentIndex: index,
//       items: [
//         BottomNavigationBarItem(
//           icon: Text('DatePicker', style: style),
//           title: Text('Basic'),
//         ),
//         BottomNavigationBarItem(
//           icon: Text('DatePicker', style: style),
//           title: Text('Advanced'),
//         ),
//       ],
//       onTap: (int index) => setState(() => this.index = index),
//     );
//   }
//
//   Widget buildPages() {
//     switch (index) {
//       case 0:
//         return Scaffold(
//           backgroundColor: Colors.lightBlue,
//           body: Padding(
//             padding: EdgeInsets.all(32),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 DateRangePickerWidget(),
//               ],
//             ),
//           ),
//         );
//       case 1:
//         return Scaffold(
//           backgroundColor: Colors.lightBlue,
//           body: Padding(
//             padding: EdgeInsets.all(32),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 DatetimePickerWidget(),
//               ],
//             ),
//           ),
//         );
//       default:
//         return Container();
//     }
//   }
// }
