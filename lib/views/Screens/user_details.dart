import 'package:employees/models/employeesModel.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Widgets/info_widget.dart';

// ignore: must_be_immutable
class UserDetails extends StatefulWidget {
  Employee employee;
  UserDetails({super.key, required this.employee});

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(12.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(widget.employee.image),
              Text(
                widget.employee.username,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
              ),
              Text("${widget.employee.firstName} ${widget.employee.lastName}",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18)),
              SizedBox(height: 10),
              Info(
                title1: 'Age',
                title2: 'Gender',
                title3: 'Blood Group',
                t2: widget.employee.gender,
                t1: widget.employee.age.toString(),
                t3: widget.employee.bloodGroup,
              ),
              SizedBox(height: 10),
              Info(
                  title1: 'Role',
                  title2: 'Eye Color',
                  title3: 'Height',
                  t1: widget.employee.role,
                  t2: widget.employee.eyeColor,
                  t3: widget.employee.height.toString()),
              SizedBox(height: 10),
              Text(
                "Works at: ${widget.employee.company.name}",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 10),
              Text("BirthDate ${widget.employee.birthDate}")
            ],
          ),
        ),
      ),
    );
  }
}
