import 'package:bus_flow_admin/presentation/common/widgets/custom_dropdown_widget.dart';
import 'package:flutter/material.dart';

class AddNewTrip extends StatefulWidget {
  const AddNewTrip({super.key});

  @override
  State<AddNewTrip> createState() => _AddNewTripState();
}

class _AddNewTripState extends State<AddNewTrip> {
  @override
  Widget build(BuildContext context) {
    String? selectedBus;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomDropdown<String>(
                hint: "Select Bus",
                value: selectedBus,
                items: ["2231", "2232", "2233"],
                itemLabel: (bus) => "Bus No: $bus",
                onChanged: (value) {
                  setState(() {
                    selectedBus = value;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
