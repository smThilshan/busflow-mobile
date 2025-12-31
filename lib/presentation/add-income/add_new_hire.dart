import 'package:bus_flow_admin/core/ui/app_spacing.dart';
import 'package:bus_flow_admin/presentation/common/widgets/custom_action_btn.dart';
import 'package:bus_flow_admin/presentation/common/widgets/custom_dropdown_widget.dart';
import 'package:bus_flow_admin/presentation/common/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class AddNewHire extends StatefulWidget {
  const AddNewHire({super.key});

  @override
  State<AddNewHire> createState() => _AddNewHireState();
}

class _AddNewHireState extends State<AddNewHire> {
  final TextEditingController _fromController = TextEditingController();
  final TextEditingController _toController = TextEditingController();
  final TextEditingController _expensesController = TextEditingController();
  final TextEditingController _driverSalaryController = TextEditingController();
  final TextEditingController _conductorSalaryController =
      TextEditingController();
  String? selectedBus;
  String? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // SizedBox(height: 60),
                Row(
                  children: [
                    Expanded(
                      child: CustomDropdown<String>(
                        hint: "Days",
                        value: selectedBus,
                        items: ["01", "02", "03"],
                        itemLabel: (bus) => "Bus No: $bus",
                        onChanged: (value) {
                          setState(() {
                            selectedBus = value;
                          });
                        },
                      ),
                    ),
                    const SizedBox(width: AppSpacing.md),
                    Expanded(
                      child: CustomDropdown<String>(
                        hint: "Date",
                        value: selectedBus,
                        items: ["2231", "2232", "2233"],
                        itemLabel: (bus) => "Bus No: $bus",
                        onChanged: (value) {
                          setState(() {
                            selectedBus = value;
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
                ),
                SizedBox(height: AppSpacing.sm),
                CustomTextField(
                  label: "To ",
                  controller: _toController,
                  hint: "Destination",
                ),
                SizedBox(height: AppSpacing.sm),
                CustomTextField(
                  label: "Expenses",
                  controller: _expensesController,
                  hint: "Rs 000.00",
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: AppSpacing.sm),
                CustomTextField(
                  label: "Driver Salary",
                  controller: _driverSalaryController,
                  hint: "Rs 000.00",
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: AppSpacing.sm),
                CustomTextField(
                  label: "Conductor Salary",
                  controller: _conductorSalaryController,
                  hint: "Rs 000.00",
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: AppSpacing.sm),

                CustomActionBtn(text: "Add", onPressed: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
