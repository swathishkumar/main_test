// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:main_test/controller/homescreen_controller.dart';
import 'package:main_test/view/homescreen/homescreen.dart';
import 'package:provider/provider.dart';

class AddDataScreen extends StatefulWidget {
  const AddDataScreen({super.key});

  @override
  State<AddDataScreen> createState() => _AddDataScreenState();
}

class _AddDataScreenState extends State<AddDataScreen> {
  static TextEditingController c3 = TextEditingController();
  static TextEditingController c4 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: c3,
              decoration: InputDecoration(label: Text("Name")),
            ),
            TextFormField(
              controller: c4,
              decoration: InputDecoration(label: Text("Role")),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  addingData();

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                child: Text("Add Data"))
          ],
        ),
      ),
    );
  }

  addingData() async {
    await Provider.of<Homescreencontroller>(context, listen: false)
        .addData(c3.text, c4.text);
    setState(() {
      Provider.of<Homescreencontroller>(context, listen: false).fetchData();
    });
  }
}
