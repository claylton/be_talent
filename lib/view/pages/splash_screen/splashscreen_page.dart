import 'package:be_talent/controller/employees_controller.dart';
import 'package:be_talent/model/employee_model.dart';
import 'package:be_talent/view/pages/home/home_page.dart';
import 'package:be_talent/view/pages/splash_screen/splashscreen_error.dart';
import 'package:be_talent/view/pages/splash_screen/splashscreen_loading.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class SplashscreenPage extends StatefulWidget {
  const SplashscreenPage({super.key});

  @override
  State<SplashscreenPage> createState() => _SplashscreenPageState();
}

class _SplashscreenPageState extends State<SplashscreenPage> {
  late final EmployeesController controller;
  late bool hasError;

  @override
  void initState() {
    super.initState();
    hasError = true;
    controller = EmployeesController(dio: Dio());
    loadEmployeesData();
  }

  Future<void> loadEmployeesData() async {
    setState(() {
      hasError = false;
    });
    var maybeData = await controller.getAllEmployees();
    if (maybeData.isRight) {
      setState(() {
        hasError = true;
      });
    } else {
      var employees = maybeData.left;
      goToHomePage(employees);
    }
  }

  void goToHomePage(List<EmployeeModel> employees) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage(employees: employees)),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (hasError) {
      return SplashscreenError(
        reloadData: loadEmployeesData,
      );
    }
    return const SplashscreenLoading();
  }
}
