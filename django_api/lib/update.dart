import 'package:flutter/material.dart';
import 'package:http/http.dart';

class UpdatePage extends StatefulWidget {
  final Client client;
  final int id;
  final String first_name;
  final String last_name;
  final String email;
  final String password;
  final int age;
  final String city;
  const UpdatePage({
    Key? key,
    required this.client,
    required this.id,
    required this.first_name,
    required this.last_name,
    required this.email,
    required this.password,
    required this.age,
    required this.city,
  }) : super(key: key);

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  TextEditingController first_name = TextEditingController();
  TextEditingController last_name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController city = TextEditingController();
  int id = 0;
  @override
  void initState() {
    // TODO: implement initState
    first_name.text = widget.first_name;
    last_name.text = widget.last_name;
    email.text = widget.email;
    password.text = widget.password;
    age.text = widget.age.toString();
    city.text = widget.city;
    id = widget.id;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Student"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: const InputDecoration(hintText: 'Enter First Name'),
                controller: first_name,
                maxLength: 20,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: const InputDecoration(hintText: 'Enter Last Name'),
                controller: last_name,
                maxLength: 20,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: const InputDecoration(hintText: 'Enter Email'),
                controller: email,
                maxLength: 20,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: const InputDecoration(hintText: 'Enter  Password'),
                controller: password,
                maxLength: 20,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: const InputDecoration(hintText: 'Enter Age'),
                controller: age,
                maxLength: 20,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: const InputDecoration(hintText: 'Enter City Name'),
                controller: city,
                maxLength: 20,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  widget.client.put(
                      Uri.parse('http://192.168.1.2:8000/updatestudent/$id/'),
                      body: {
                        "first_name": first_name.text,
                        "last_name": last_name.text,
                        "email": email.text,
                        "password": password.text,
                        "age": age.text,
                        "city": city.text
                      });
                  Navigator.pop(context);
                },
                child: Text("update"))
          ],
        ),
      ),
    );
  }
}
