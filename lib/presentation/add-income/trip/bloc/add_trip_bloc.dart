import 'package:bus_flow_admin/domain/entities/trip_preview_data.dart';
import 'package:bus_flow_admin/presentation/add-income/trip/bloc/add_trip_event.dart';
import 'package:bus_flow_admin/presentation/add-income/trip/bloc/add_trip_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTripBloc extends Bloc<AddTripEvent, AddTripState> {
  AddTripBloc() : super(AddTripInitial()) {
    on<SubmitTripEvent>((event, emit) {
      final totalIncome = event.fromIncome + event.toIncome;

      final totalExpense =
          event.expenses +
          event.driverSalary +
          event.conductorSalary +
          event.diesel;

      final earned = totalIncome - totalExpense;

      emit(
        AddTripPreviewReady(
          TripPreviewData(
            fromIncome: event.fromIncome,
            toIncome: event.toIncome,
            totalIncome: totalIncome,
            driverSalary: event.driverSalary,
            conductorSalary: event.conductorSalary,
            diesel: event.diesel,
            expenses: event.expenses,
            totalExpense: totalExpense,
            earned: earned,
          ),
        ),
      );
    });
  }
}
