import 'package:bus_flow_admin/domain/entities/hire_preview_data.dart';

abstract class AddHireState {}

class AddHireInitial extends AddHireState {}

class AddHirePreviewReady extends AddHireState {
  final HirePreviewData hirePreviewData;
  AddHirePreviewReady(this.hirePreviewData);
}
