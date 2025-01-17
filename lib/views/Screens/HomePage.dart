import 'package:employees/models/employeesModel.dart';
import 'package:flutter/material.dart';
import '../../services/employees_services.dart';

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
                );
              },
            ),
    );
  }
}
