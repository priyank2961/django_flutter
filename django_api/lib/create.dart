import 'package:flutter/material.dart';
import 'package:http/http.dart';

class CreatePage extends StatefulWidget {
  final Client client;
  const CreatePage({
    Key? key,
    required this.client,
  }) : super(key: key);

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  TextEditingController first_name = TextEditingController();
  TextEditingController last_name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController city = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Enroll Student"),
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
                  widget.client.post(
                      Uri.parse('http://192.168.1.2:8000/createstudent/'),
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
                child: const Text("ADD Student"))
          ],
        ),
      ),
    );
  }
}
