abstract class AddHireEvent {}

class SubmitHireEvent extends AddHireEvent {
  final int noOfDays;
  final DateTime date;
  final String fromStartLocation;
  final String toReachLocation;
  final double hireAmount;
  final double otherExpenses;
  final double diesel;
  final double driverSalary;
  final double conductorSalary;

  SubmitHireEvent({
    required this.noOfDays,
    required this.date,
    required this.fromStartLocation,
    required this.toReachLocation,
    required this.hireAmount,
    required this.diesel,
    required this.otherExpenses,
    required this.driverSalary,
    required this.conductorSalary,
  });
}
