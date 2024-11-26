import 'package:be_talent/model/employee_model.dart';
import 'package:be_talent/view/resources/colors.dart';
import 'package:be_talent/view/widgets/header_widget.dart';
import 'package:be_talent/view/widgets/search_bar_widget.dart';
import 'package:be_talent/view/widgets/table_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final List<EmployeeModel> employees;
  const HomePage({super.key, required this.employees});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController searchController = TextEditingController();

  late List<EmployeeModel> employeesFiltered;

  @override
  void initState() {
    super.initState();
    employeesFiltered = widget.employees;
  }

  void onChanged(String text) {
    setState(() {
      if (text.isEmpty) {
        employeesFiltered = widget.employees;
      } else {
        employeesFiltered = widget.employees.where((employee) {
          return employee.name.toLowerCase().contains(text.toLowerCase());
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderWidget(),
            SearchBarWidget(
              controller: searchController,
              onChanged: onChanged,
            ),
            TableWidget(
              employees: employeesFiltered,
            ),
          ],
        ),
      ),
    );
  }
}
