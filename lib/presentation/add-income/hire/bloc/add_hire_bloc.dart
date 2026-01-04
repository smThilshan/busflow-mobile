import 'package:bus_flow_admin/domain/entities/hire_preview_data.dart';
import 'package:bus_flow_admin/presentation/add-income/hire/bloc/add_hire_event.dart';
import 'package:bus_flow_admin/presentation/add-income/hire/bloc/add_hire_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddHireBloc extends Bloc<AddHireEvent, AddHireState> {
  AddHireBloc() : super(AddHireInitial()) {
    on<SubmitHireEvent>((event, emit) {
      final totalIncome = event.hireAmount;

      final totalExpense =
          event.diesel +
          event.driverSalary +
          event.conductorSalary +
          event.otherExpenses;

      final earned = totalIncome - totalExpense;

      emit(
        AddHirePreviewReady(
          HirePreviewData(
            noOfDays: event.noOfDays,
            date: event.date,
            fromStartLocation: event.fromStartLocation,
            toReachLocation: event.toReachLocation,
            hireAmount: event.hireAmount,
            otherExpenses: event.otherExpenses,
            diesel: event.diesel,
            driverSalary: event.driverSalary,
            conductorSalary: event.conductorSalary,
            earned: earned,
            totalExpense: totalExpense,
          ),
        ),
      );
    });
  }
}
