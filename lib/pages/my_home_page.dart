import 'package:flutter/material.dart';
import 'package:to_do_app/util/dialog_box.dart';
import 'package:to_do_app/util/todo_tile.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // text Controller
  final _controller = TextEditingController();

  // list of to do tasks
  List toDoList = [
    ["Complete OOP assignments", false],
    ["Buy a new Mouse for laptop", false],
    ["Complete lecture 33 of DSA on YT", false],
  ];

  // checkbox was tapped
  void checkBoxChanged(bool? value,int index){
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  // create new task
  void createNewTask(){
    showDialog(context: context, builder: (context){
      return DialogBox(
        controller: _controller,
        onSave: saveNewTask,
        onCancel: ()=> Navigator.of(context).pop(),
      );
    },);
  }

  // save new task
  void saveNewTask(){
    setState(() {
      toDoList.add([_controller.text,false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  // delete the task
  void deleteTask(int index){
    setState(() {
      toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.purple.shade100,
        appBar: AppBar(
          title: const Center(child: Text("To Do App")),
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          child: const Icon(Icons.add),
        ),
        body: ListView.builder(
            itemCount: toDoList.length,
            itemBuilder: (context, index) {
              return ToDoTile(
                taskName: toDoList[index][0],
                taskCompleted: toDoList[index][1],
                onChanged: (value) => checkBoxChanged(value,index),
                deleteFunction: (context) => deleteTask(index),
              );
            }));
  }
}
