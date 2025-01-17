import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:employees/models/employeesModel.dart';

class EmployeesServices {
  String endpoint = "http://dummyjson.com/users";

  Future<List<Employees>> getEmployees() async {
    List<Employees> employees = [];

    try {
      final response = await http.get(Uri.parse(endpoint));
      var data = jsonDecode(response.body)['users'];
      data.forEach((el) {
        Employees employee = Employees.fromJson(el);
        employees.add(employee);
      });
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
    return employees;
  }
}
