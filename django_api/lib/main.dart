import 'dart:convert';
import 'package:django_api/create.dart';
import 'package:django_api/student.dart';
import 'package:django_api/update.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  http.Client client = http.Client();
  List<student> students = [];
  @override
  void initState() {
    _retrieveStudents();
    super.initState();
  }

  void _retrieveStudents() async {
    students = [];
    List response = json.decode((await client.get(Uri.parse(
        // 'http://172.16.12.36:8000/'
        'http://192.168.1.2:8000/'))).body);
    for (var element in response) {
      students.add(student.fromMap(element));
    }
    setState(() {});
  }

  void deleteStudent(int id) {
    http.delete(
      Uri.parse(
          // 'http://172.16.12.36:8000/deletestudent/$id/'
          'http://192.168.1.2:8000/deletestudent/$id/'),
    );
    _retrieveStudents();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          _retrieveStudents();
        },
        child: ListView.builder(
          itemCount: students.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(students[index].first_name),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => UpdatePage(
                          client: client,
                          id: students[index].id,
                          first_name: students[index].first_name,
                          last_name: students[index].last_name,
                          email: students[index].email,
                          password: students[index].password,
                          age: students[index].age,
                          city: students[index].city,
                        )));
              },
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () => deleteStudent(students[index].id),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CreatePage(
                  client: client,
                ))),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
