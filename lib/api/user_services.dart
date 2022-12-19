import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/taskModel.dart';

class UserServices {

  Future<List<TaskModel>> getTasks() async {
    try {
      var url = Uri.parse('http://localhost:5000/tasks');
      var response = await http.get(url);
      // http.Response response = await http.get(Uri.parse('http://localhost:5000/tasks'));

      if (response.statusCode == 200) {

        // print(response.body.runtimeType);
        // print('Response status: ${response.statusCode}');
        // print('Response body: ${response.body}');
        // var data = jsonDecode(response.body);
        
        final data = json.decode(response.body) as List;
      



          // print("dato");
          // print( data.runtimeType);
        
        //  TaskModel task = new TaskModel.fromJson(data);
        //  final task = data.map((project) => TaskModel.fromJson(project)).toList();

        // return data;
        //  return task;
        return data.map((e) => TaskModel.fromJson(e)).toList();

      }
      // else{
      //   return null;
      // }

      
      // debugPrint('${response.body}');
    } catch (e) {
      print(e);
    }
    return [];
  }
}
