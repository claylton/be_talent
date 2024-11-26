abstract class EmployeesError {
  final String message;

  const EmployeesError(this.message);
}

class EmploeesDefaultError extends EmployeesError {
  EmploeesDefaultError(super.message);
}
