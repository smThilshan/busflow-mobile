import 'package:bus_flow_admin/core/ui/app_spacing.dart';
import 'package:bus_flow_admin/presentation/add-income/hire/bloc/add_hire_bloc.dart';
import 'package:bus_flow_admin/presentation/add-income/hire/bloc/add_hire_event.dart';
import 'package:bus_flow_admin/presentation/add-income/hire/bloc/add_hire_state.dart';
import 'package:bus_flow_admin/presentation/common/widgets/custom_action_btn.dart';
import 'package:bus_flow_admin/presentation/common/widgets/custom_datepicker_widget.dart';
import 'package:bus_flow_admin/presentation/common/widgets/custom_dropdown_widget.dart';
import 'package:bus_flow_admin/presentation/common/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AddNewHire extends StatefulWidget {
  const AddNewHire({super.key});

  @override
  State<AddNewHire> createState() => _AddNewHireState();
}

class _AddNewHireState extends State<AddNewHire> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _fromController = TextEditingController();
  final TextEditingController _toController = TextEditingController();
  final TextEditingController _expensesController = TextEditingController();
  final TextEditingController _driverSalaryController = TextEditingController();
  final TextEditingController _conductorSalaryController =
      TextEditingController();
  final TextEditingController _hireAmountController = TextEditingController();
  final TextEditingController _dieselExpenseController =
      TextEditingController();
  String? noOfDays;
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add New Hire"), leading: BackButton()),
      body: BlocListener<AddHireBloc, AddHireState>(
        listener: (context, state) {
          if (state is AddHirePreviewReady) {
            context.push('/preview-new-hire', extra: state.hirePreviewData);
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
                            label: "Days",
                            value: noOfDays,
                            items: ["01", "02", "03"],

                            onChanged: (value) {
                              setState(() {
                                noOfDays = value;
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
                      label: "From",
                      controller: _fromController,
                      hint: "From Starting Point",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter starting location';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: AppSpacing.sm),
                    CustomTextField(
                      label: "To ",
                      controller: _toController,
                      hint: "Destination",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter destination';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: AppSpacing.sm),
                    CustomTextField(
                      label: "Hire Amount",
                      controller: _hireAmountController,
                      hint: "Rs 000.00",
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Hire amount is required";
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
                      controller: _dieselExpenseController,
                      hint: "Rs 000.00",
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Diesel expense is required";
                        }
                        final numValue = double.tryParse(value);
                        if (numValue == null || numValue < 0) {
                          return "Enter a valid amount";
                        }
                        return null;
                      },
                    ),
                    CustomTextField(
                      label: "Expenses",
                      controller: _expensesController,
                      hint: "Rs 000.00",
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Other expenses is required";
                        }
                        final numValue = double.tryParse(value);
                        if (numValue == null || numValue < 0) {
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
                          return "Driver salary is required";
                        }
                        final numValue = double.tryParse(value);
                        if (numValue == null || numValue < 0) {
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
                          return "Conductor salary is required";
                        }
                        final numValue = double.tryParse(value);
                        if (numValue == null || numValue < 0) {
                          return "Enter a valid amount";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: AppSpacing.sm),

                    CustomActionBtn(
                      text: "Add",
                      onPressed: () {
                        final isValid = _formKey.currentState!.validate();
                        if (!isValid) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                "Please fix the highlighted fields",
                              ),
                            ),
                          );
                          return;
                        }

                        // Dropdown validation
                        if (noOfDays == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Please select number of days"),
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

                        // Submit
                        context.read<AddHireBloc>().add(
                          SubmitHireEvent(
                            noOfDays: int.parse(noOfDays!),
                            date: selectedDate!,
                            fromStartLocation: _fromController.text,
                            toReachLocation: _toController.text,
                            hireAmount: double.parse(
                              _hireAmountController.text,
                            ),
                            diesel: double.parse(_dieselExpenseController.text),
                            otherExpenses: double.parse(
                              _expensesController.text,
                            ),
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
