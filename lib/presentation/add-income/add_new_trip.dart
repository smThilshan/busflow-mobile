import 'package:bus_flow_admin/core/ui/app_spacing.dart';
import 'package:bus_flow_admin/presentation/common/widgets/custom_action_btn.dart';
import 'package:bus_flow_admin/presentation/common/widgets/custom_dropdown_widget.dart';
import 'package:bus_flow_admin/presentation/common/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddNewTrip extends StatefulWidget {
  const AddNewTrip({super.key});

  @override
  State<AddNewTrip> createState() => _AddNewTripState();
}

class _AddNewTripState extends State<AddNewTrip> {
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
      appBar: AppBar(
        title: const Text("Add New Trip"),
        leading: BackButton(), // optional, automatically appears
      ),
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
                        label: "Trips",
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
                        label: "Date",
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
                  label: "From Kalpitiya",
                  controller: _fromController,
                  hint: "From Kalpitiya",
                ),
                SizedBox(height: AppSpacing.sm),
                CustomTextField(
                  label: "To Puttalam",
                  controller: _toController,
                  hint: "To Puttalam",
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
                SizedBox(height: AppSpacing.lg),

                CustomActionBtn(
                  text: "Add",
                  onPressed: () {
                    context.push('/preview-new-trip');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
