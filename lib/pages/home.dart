import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/taskModel.dart';

import '../api/user_services.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//  TaskModel? _actividad;
// final List<TaskModel> tasks = [];
  final List<TaskModel> tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("material app"),
        actions: [
          IconButton(
              onPressed: () async {
                // var _data = await UserServices().getTasks();
                // print(_data);
                // var tasks = await UserServices().getTasks();
                tasks.addAll(await UserServices().getTasks());

                print(tasks);
                setState(() {});
              },
              icon: Icon(Icons.add_card))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          // color: Colors.amber,
      
          // color: Colors.blue,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // MaterialButton(
              //     child: Container(
              //         padding:
              //             EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              //         color: Colors.red,
              //         child: Text(
              //           'boton',
              //           style: TextStyle(color: Colors.white),
              //         )),
              //     onPressed: () async {
              //       var _data = await UserServices().getTasks();
              //       print(_data);
              //       // this._actividad = await UserServices().getTasks();
              //       // print("presionaste el boton");
      
              //       // print(_actividad);
              //     }),
              // Text('hola'),
      
              for (TaskModel task in tasks)
                ExpansionTile(
                  title: Text(task.title!),
                  subtitle: Text(task.description!),
                  children: [
                    ListTile(
                      leading: Icon(Icons.task),
                      title: Text(task.title!),
                    )
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
