import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:main_test/model/apimodelsample.dart';

class Homescreencontroller with ChangeNotifier {
  SampleApiModel? resmodel;
  fetchData() async {
    final url = Uri.parse("http://3.84.189.66/flutter_exam/employees/");
    var response = await http.get(url);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      var decodeData = jsonDecode(response.body);

      resmodel = SampleApiModel.fromJson(decodeData);
      print(resmodel?.data!.employee?.first.id);

      notifyListeners();
    } else {
      print("api failed");
    }
  }

  deleteData(int id) async {
    final url = Uri.parse("http://3.84.189.66/flutter_exam/employees/$id/");
    var response = await http.delete(url);
    if (response.statusCode == 200) {
      var decodeData = jsonDecode(response.body);

      resmodel = SampleApiModel.fromJson(decodeData);

      notifyListeners();
    } else {
      print("api failed");
    }
  }

  addData(name, role) async {
    final url = Uri.parse("http://3.84.189.66/flutter_exam/employees/create/");
    var responseAdd = await http.post(body: {"name": name, "role": role}, url);
    if (responseAdd.statusCode == 200) {
      var decodeData = jsonDecode(responseAdd.body);
      resmodel = SampleApiModel.fromJson(decodeData);
      notifyListeners();
    } else {
      print("Data added successfully...");
    }
  }
}
