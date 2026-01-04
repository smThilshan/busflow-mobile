abstract class AddTripEvent {}

class SubmitTripEvent extends AddTripEvent {
  final int noOfTrips;
  final DateTime date;
  final double fromIncome;
  final double toIncome;
  final double expenses;
  final double diesel;
  final double driverSalary;
  final double conductorSalary;

  SubmitTripEvent({
    required this.noOfTrips,
    required this.date,
    required this.fromIncome,
    required this.toIncome,
    required this.expenses,
    required this.diesel,
    required this.driverSalary,
    required this.conductorSalary,
  });
}
