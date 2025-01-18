import 'dart:convert';

import 'package:employees/models/employeesModel.dart';
import 'package:employees/views/Screens/user_details.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../services/employees_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Employee> employee = [];
  bool loading = true;
  getEmployeeFromCached() async {
    final prefs = await SharedPreferences.getInstance();
    String data = prefs.getString("employeeData") ?? '';
    try {
      var jsonData = jsonDecode(data);
      jsonData.forEach((item) {
        employee.add(Employee.fromJson(item));
      });
    } catch (err) {
      print('Error: $err');
    }
    loading = false;
    setState(() {});
    print(data);
  }

  @override
  void initState() {
    super.initState();
    getEmployeeFromCached();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: employee.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  UserDetails(employee: employee[index])));
                    },
                    child: ListTile(
                      leading: Image.network(
                        employee[index].image,
                      ),
                      title: Text(
                        employee[index].username,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      subtitle: Column(
                        children: [
                          Text(
                              "${employee[index].firstName} ${employee[index].lastName}"),
                          Row(
                            children: [
                              Text(employee[index].email),
                            ],
                          ),
                        ],
                      ),
                      trailing: Icon(Icons.more_horiz),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
