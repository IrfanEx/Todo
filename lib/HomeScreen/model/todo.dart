import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:todo/HomeScreen/utils.dart';

class TodoField {
  static const createdTime = 'createdTime';
}

final FirebaseAuth auth = FirebaseAuth.instance;
// String user_id;
// inputData() {
//   final User user = auth.currentUser;
//   final uid = user.uid;
//   user_id = uid;
//   // here you write the codes to input the data into firestore
// }
// String user_id = inputData();

class Todo {
  DateTime createdTime;
  String title;
  String id;
  String description;
  // String priority;
  String datetimepicker;
  bool isDone;

  Todo({
    @required this.createdTime,
    @required this.title,
    this.description = '',
    // this.priority = '',
    this.datetimepicker = '',
    this.id,
    this.isDone = false,
  });

  static Todo fromJson(Map<String, dynamic> json) => Todo(
        createdTime: Utils.toDateTime(json['createdTime']),
        title: json['title'],
        description: json['description'],
        // priority: json['priority'],
        datetimepicker: json['datetimepicker'],
        id: json['id'],
        isDone: json['isDone'],
      );

  Map<String, dynamic> toJson() => {
        'createdTime': Utils.fromDateTimeToJson(createdTime),
        'title': title,
        'description': description,
        // 'priority': priority,
        'datetimepicker': datetimepicker,
        'id': id,
        'isDone': isDone,
      };
}
