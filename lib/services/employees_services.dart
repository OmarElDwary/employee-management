import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:employees/models/employeesModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EmployeesServices {
  String endpoint = "http://dummyjson.com/users";

  Future<List<Employee>> getEmployees() async {
    List<Employee> employees = [];

    try {
      final response = await Dio().get(endpoint);
      var data = response.data['users'];
      var cached = jsonEncode(data); // storre all data and parse them
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('employeeData', cached);
      data.forEach((el) {
        Employee employee = Employee.fromJson(el);
        employees.add(employee);
      });
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
    return employees;
  }
}
