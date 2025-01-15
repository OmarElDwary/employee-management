import 'dart:math';

import 'package:employees/models/employeesModel.dart';
import 'package:flutter/material.dart';
import '../services/employees_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Employees> employee = [];
  bool loading = true;
  getEmployees() async {
    employee = await EmployeesServices().getEmployees();
    loading = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getEmployees();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: loading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: employee.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(employee[index].username),
                  subtitle: Text(employee[index].email),
                );
              },
            ),
    );
  }
}
