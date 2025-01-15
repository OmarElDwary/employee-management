import 'package:dio/dio.dart';
import 'package:employees/models/employeesModel.dart';

class EmployeesServices {
  String endpoint = "http://dummyjson.com/users";

  Future<List<Employees>> getEmployees() async {
    List<Employees> employees = [];

    try {
      var response = await Dio().get(endpoint);
      var data = response.data['users'];
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
