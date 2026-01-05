import 'dart:math';

import 'package:bus_flow_admin/core/ui/app_spacing.dart';
import 'package:bus_flow_admin/presentation/common/widgets/custom_action_btn.dart';
import 'package:bus_flow_admin/presentation/common/widgets/custom_datepicker_widget.dart';
import 'package:bus_flow_admin/presentation/common/widgets/custom_dropdown_widget.dart';
import 'package:bus_flow_admin/presentation/common/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  final _formKey = GlobalKey<FormState>();
  DateTime? selectedDate;
  final TextEditingController _expensesController = TextEditingController();
  String? expenseCategory;
  final List<String> expenseCategories = [
    "Fuel",
    "Maintenance & Repair",
    "Oil / Lubricants / Brake Pads",
    "Electrical / Wiring / Lights",
    "Tyres & Spares",
    "Cleaning / Washing",
    "Permit / License / Insurance",
    "Commission",
    "Fine / Penalty",
    "Body / Painting",
    "Other",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Expense"), leading: BackButton()),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(AppSpacing.lg),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomDatePicker(
                    label: "Date",
                    selectedDate: selectedDate,
                    onDateSelected: (date) {
                      setState(() {
                        selectedDate = date;
                      });
                    },
                  ),
                  SizedBox(height: AppSpacing.md),
                  CustomDropdown<String>(
                    label: "Expense Category",
                    value: expenseCategory,
                    items: expenseCategories,
                    onChanged: (value) {
                      setState(() {
                        expenseCategory = value;
                      });
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
                        return "Expense amount is required";
                      }
                      final numValue = double.tryParse(value);
                      if (numValue == null || numValue < 0) {
                        return "Enter a valid amount";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: AppSpacing.md),
                  CustomActionBtn(
                    text: "Add",
                    onPressed: () {
                      final isValid = _formKey.currentState!.validate();
                      if (!isValid) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Please fix the highlighted fields"),
                          ),
                        );
                        return;
                      }

                      // Dropdown validation
                      if (expenseCategory == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Please select expense category"),
                          ),
                        );
                        return;
                      }

                      // Date validation
                      if (selectedDate == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Please select a date")),
                        );
                        return;
                      }

                      context.push('/');
                      // context.read<AddTripBloc>().add(
                      //   SubmitTripEvent(
                      //     noOfTrips: int.parse(noOfTrips!),
                      //     date: selectedDate!,
                      //     fromIncome: double.parse(_fromIncomeController.text),
                      //     toIncome: double.parse(_toIncomeController.text),
                      //     expenses: double.parse(_expensesController.text),
                      //     diesel: double.parse(_dieselController.text),
                      //     driverSalary: double.parse(
                      //       _driverSalaryController.text,
                      //     ),
                      //     conductorSalary: double.parse(
                      //       _conductorSalaryController.text,
                      //     ),
                      //   ),
                      // );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
