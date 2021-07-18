import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:todo/HomeScreen/utils.dart';

class TodoField {
  static const createdTime = 'createdTime';
}
final FirebaseAuth auth = FirebaseAuth.instance;
class Todo {
  DateTime createdTime;
  String title;
  String id;
  String description;
  String datetimepicker;
  bool isDone;

  Todo({
    @required this.createdTime,
    @required this.title,
    this.description = '',
    this.datetimepicker='',
    this.id,
    this.isDone = false,
  });

  static Todo fromJson(Map<String, dynamic> json) => Todo(
    createdTime: Utils.toDateTime(json['createdTime']),
    title: json['title'],
    description: json['description'],
    datetimepicker: json['datetimepicker'],
    id: json['id'],
    isDone: json['isDone'],
  );

  Map<String, dynamic> toJson() => {
    'createdTime': Utils.fromDateTimeToJson(createdTime),
    'title': title,
    'description': description,
    'datetimepicker': datetimepicker,
    'id': id,
    'isDone': isDone,
  };
}