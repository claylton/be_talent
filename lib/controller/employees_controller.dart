import 'package:be_talent/errors/emploees_error.dart';
import 'package:be_talent/model/employee_model.dart';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';

class EmployeesController {
  final String url;
  final Dio dio;

  EmployeesController({
    required this.dio,
    this.url = "http://10.0.0.6:3000/employees",
  });

  Future<Either<List<EmployeeModel>, EmployeesError>> getAllEmployees() async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      final response = await dio.get(url);

      var employees = List<EmployeeModel>.from(
          response.data.map((e) => EmployeeModel.fromMap(e)));

      return Left(employees);
    } on Exception catch (e) {
      print(e);
      return Right(EmploeesDefaultError(e.toString()));
    }
  }
}
