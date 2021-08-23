import 'package:flutter/material.dart';
import 'package:todo/constants.dart';
import 'datetime/widget/datetime_picker_widget.dart';
import 'package:todo/HomeScreen/page/home_page.dart';

class TodoFormWidget extends StatelessWidget {
  final String title;
  final String description;
  // final String priority;
  final String datetimepicker;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;
  // final ValueChanged<String> onChangedPriority;
  final ValueChanged<String> onChangedDatetimepicker;
  final VoidCallback onSavedTodo;

  const TodoFormWidget({
    Key key,
    this.title = '',
    this.description = '',
    // this.priority = '',
    this.datetimepicker = '',
    @required this.onChangedTitle,
    @required this.onChangedDescription,
    // @required this.onChangedPriority,
    @required this.onChangedDatetimepicker,
    @required this.onSavedTodo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        reverse: true,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            buildTitle(),
            SizedBox(height: 8),
            buildDescription(),
            SizedBox(height: 8),
            // buildPriority(),
            // SizedBox(height: 10),
            buildDateTime(),
            SizedBox(height: 16),
            buildButton(),
          ],
        ),
      );

  Widget buildTitle() => TextFormField(
        maxLines: 1,
        initialValue: title,
        onChanged: onChangedTitle,
        validator: (title) {
          if (title.isEmpty) {
            return 'The title cannot be empty';
          }
          return null;
        },
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Title',
        ),
      );

  Widget buildDescription() => TextFormField(
        maxLines: 5,
        initialValue: description,
        onChanged: onChangedDescription,
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Description',
        ),
      );


  // Widget buildPriority() => DropdownButtonFormField(
  //   value: valueChoose,
  //   isExpanded: true,
  //   onChanged: onChangedPriority,
  //   icon: Icon(Icons.arrow_drop_down_circle),
  //       iconSize: 22.0,
  //       iconEnabledColor: kPrimaryColor,
  //       items: <String>['Low', 'Medium', 'High']
  //           .map<DropdownMenuItem<String>>((String value) {
  //         return DropdownMenuItem<String>(
  //           value: value,
  //           child: Text(value),
  //         );
  //       }).toList(),
  //       validator: (priority) {
  //         if (title.isEmpty) {
  //           return 'The title cannot be empty';
  //         }
  //         return null;
  //       },
  //       decoration: InputDecoration(
  //         border: UnderlineInputBorder(),
  //         labelText: 'Priority',
  //       ),
  //     );

  Widget buildDateTime() => DatetimePickerWidget();

  Widget buildButton() => SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.black),
          ),
          onPressed: () {
            onSavedTodo();
          },
          child: Text('Save'),
        ),
      );
}
