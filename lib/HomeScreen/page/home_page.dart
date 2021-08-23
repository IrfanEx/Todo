import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/HomeScreen/api/firebase_api.dart';
import 'package:todo/HomeScreen/model/todo.dart';
import 'package:todo/HomeScreen/provider/todos.dart';
import 'package:todo/HomeScreen/widget/add_todo_dialog_widget.dart';
import 'package:todo/HomeScreen/widget/completed_list_widget.dart';
import 'package:todo/HomeScreen/widget/todo_list_widget.dart';
import 'package:todo/main.dart';

// String userID;
// String valueChoose;
// List listItem = ["Low","Medium","High"];

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Are you sure?'),
            content: new Text('Do you want to exit an App'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('No'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: new Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    final _auth = FirebaseAuth.instance;
    final tabs = [
      TodoListWidget(),
      CompletedListWidget(),
    ];

    return new WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: Text(MyApp.title),
          leading: null,
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  _auth.signOut();
                  Navigator.pop(context);
                },
                icon: Icon(Icons.close))
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white.withOpacity(0.7),
          selectedItemColor: Colors.white,
          currentIndex: selectedIndex,
          onTap: (index) => setState(() {
            selectedIndex = index;
          }),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.fact_check_outlined),
              label: 'Todos',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.done, size: 28),
              label: 'Completed',
            ),
          ],
        ),
        body: StreamBuilder<List<Todo>>(
          stream: FirebaseApi.readTodos(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              default:
                if (snapshot.hasError) {
                  return buildText('Something Went Wrong Try later');
                } else {
                  final todos = snapshot.data;
                  final provider = Provider.of<TodosProvider>(context);
                  provider.setTodos(todos);
                  // userID = snapshot.data.single.id;
                  return tabs[selectedIndex];
                }
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: Color(0xFFeb06ff),
          onPressed: () => showDialog(
            context: context,
            builder: (context) => AddTodoDialogWidget(),
            barrierDismissible: false,
          ),
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

Widget buildText(String text) => Center(
      child: Text(
        text,
        style: TextStyle(fontSize: 24, color: Colors.white),
      ),
    );
