import 'package:bus_flow_admin/domain/entities/trip_preview_data.dart';

abstract class AddTripState {}

class AddTripInitial extends AddTripState {}

class AddTripPreviewReady extends AddTripState {
  final TripPreviewData tripPreviewData;

  AddTripPreviewReady(this.tripPreviewData);
}
