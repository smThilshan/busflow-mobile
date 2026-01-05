import 'package:bus_flow_admin/core/ui/app_spacing.dart';
import 'package:bus_flow_admin/presentation/add-income/trip/bloc/add_trip_bloc.dart';
import 'package:bus_flow_admin/presentation/add-income/trip/bloc/add_trip_event.dart';
import 'package:bus_flow_admin/presentation/add-income/trip/bloc/add_trip_state.dart';
import 'package:bus_flow_admin/presentation/common/widgets/custom_action_btn.dart';
import 'package:bus_flow_admin/presentation/common/widgets/custom_datepicker_widget.dart';
import 'package:bus_flow_admin/presentation/common/widgets/custom_dropdown_widget.dart';
import 'package:bus_flow_admin/presentation/common/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AddNewTrip extends StatefulWidget {
  const AddNewTrip({super.key});

  @override
  State<AddNewTrip> createState() => _AddNewTripState();
}

class _AddNewTripState extends State<AddNewTrip> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _fromIncomeController = TextEditingController();
  final TextEditingController _toIncomeController = TextEditingController();
  final TextEditingController _expensesController = TextEditingController();
  final TextEditingController _driverSalaryController = TextEditingController();
  final TextEditingController _conductorSalaryController =
      TextEditingController();
  final TextEditingController _dieselController = TextEditingController();
  String? noOfTrips;
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add New Trip"), leading: BackButton()),
      body: BlocListener<AddTripBloc, AddTripState>(
        listener: (context, state) {
          if (state is AddTripPreviewReady) {
            context.push('/preview-new-trip', extra: state.tripPreviewData);
          }
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: CustomDropdown<String>(
                            label: "Trips",
                            value: noOfTrips,
                            items: ["01", "02", "03"],
                            onChanged: (value) {
                              setState(() {
                                noOfTrips = value;
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: AppSpacing.md),
                        Expanded(
                          child: CustomDatePicker(
                            label: "Date",
                            selectedDate: selectedDate,
                            onDateSelected: (date) {
                              setState(() {
                                selectedDate = date;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: AppSpacing.md),
                    CustomTextField(
                      label: "Kalpitiya → Puttalam Income",
                      controller: _fromIncomeController,
                      hint: "Rs 000.00",
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter income';
                        }
                        final numValue = double.tryParse(value);
                        if (numValue == null || numValue <= 0) {
                          return "Enter a valid amount";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: AppSpacing.sm),
                    CustomTextField(
                      label: "Puttalam → Kalpitiya Income",
                      controller: _toIncomeController,
                      hint: "Rs 000.00",
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter income';
                        }
                        final numValue = double.tryParse(value);
                        if (numValue == null || numValue <= 0) {
                          return "Enter a valid amount";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: AppSpacing.sm),
                    CustomTextField(
                      label: "Diesel Expense",
                      controller: _dieselController,
                      hint: "Rs 000.00",
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter diesel expense';
                        }
                        final numValue = double.tryParse(value);
                        if (numValue == null || numValue <= 0) {
                          return "Enter a valid amount";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: AppSpacing.sm),
                    CustomTextField(
                      label: "Expenses",
                      controller: _expensesController,
                      hint: "Rs 000.00",
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter other expenses';
                        }
                        final numValue = double.tryParse(value);
                        if (numValue == null || numValue <= 0) {
                          return "Enter a valid amount";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: AppSpacing.sm),
                    CustomTextField(
                      label: "Driver Salary",
                      controller: _driverSalaryController,
                      hint: "Rs 000.00",
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter driver salary';
                        }
                        final numValue = double.tryParse(value);
                        if (numValue == null || numValue <= 0) {
                          return "Enter a valid amount";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: AppSpacing.sm),
                    CustomTextField(
                      label: "Conductor Salary",
                      controller: _conductorSalaryController,
                      hint: "Rs 000.00",
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter conductor salary';
                        }
                        final numValue = double.tryParse(value);
                        if (numValue == null || numValue <= 0) {
                          return "Enter a valid amount";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: AppSpacing.lg),

                    CustomActionBtn(
                      text: "Add",
                      onPressed: () {
                        final isValid = _formKey.currentState!.validate();
                        if (!isValid) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Please fix the highlighted fields',
                              ),
                            ),
                          );
                        }

                        // Dropdown validation
                        if (noOfTrips == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Please select number of trips"),
                            ),
                          );
                          return;
                        }

                        // Date validation
                        if (selectedDate == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Please select a date"),
                            ),
                          );
                          return;
                        }

                        context.read<AddTripBloc>().add(
                          SubmitTripEvent(
                            noOfTrips: int.parse(noOfTrips!),
                            date: selectedDate!,
                            fromIncome: double.parse(
                              _fromIncomeController.text,
                            ),
                            toIncome: double.parse(_toIncomeController.text),
                            expenses: double.parse(_expensesController.text),
                            diesel: double.parse(_dieselController.text),
                            driverSalary: double.parse(
                              _driverSalaryController.text,
                            ),
                            conductorSalary: double.parse(
                              _conductorSalaryController.text,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
