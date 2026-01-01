import 'package:bus_flow_admin/core/ui/app_spacing.dart';
import 'package:bus_flow_admin/presentation/common/widgets/custom_action_btn.dart';
import 'package:flutter/material.dart';

class PreviewNewTrip extends StatefulWidget {
  const PreviewNewTrip({super.key});

  // Example data
  final List<Map<String, dynamic>> incomeData = const [
    {"label": "Date - Kalpitiya - Puttalam", "amount": 10200.00},
    {"label": "Puttalam - Kalpitiya", "amount": 10200.00},
    {"label": "Total", "amount": 20400.00},
  ];

  final List<Map<String, dynamic>> expenseData = const [
    {"label": "Diesel Expense", "amount": 8864.00},
    {"label": "Driver Salary", "amount": 2500.00},
    {"label": "Conductor Salary", "amount": 2000.00},
    {"label": "Expenses", "amount": 660.00},
    {"label": "Total", "amount": 14020.00},
  ];

  final Map<String, double> summaryData = const {
    "Total Income": 20400.00,
    "Total Expense": 14020.00,
    "Earned": 6380.00,
  };

  @override
  State<PreviewNewTrip> createState() => _PreviewNewTripState();
}

class _PreviewNewTripState extends State<PreviewNewTrip> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Income & Expense Preview")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Income Section
              buildSection("Income", widget.incomeData),

              const SizedBox(height: 32), // Big space
              /// Expense Section
              buildSection("Expenses", widget.expenseData, showNote: true),

              const SizedBox(height: 32), // Big space
              /// Summary Section
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: widget.summaryData.entries.map((e) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            e.key,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),

                        Expanded(
                          child: Text(
                            "${e.value.toStringAsFixed(2)} LKR",
                            textAlign: TextAlign.right,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              fontFeatures: [FontFeature.tabularFigures()],
                            ),
                          ),
                        ),
                        SizedBox(height: AppSpacing.md),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Helper to build Income / Expense sections
Widget buildSection(
  String title,
  List<Map<String, dynamic>> data, {
  bool showNote = false,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
      const SizedBox(height: 16),
      Column(
        children: data.map((item) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    item["label"] ?? "",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "${item["amount"].toStringAsFixed(2)} LKR",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFeatures: [FontFeature.tabularFigures()],
                        ),
                      ),
                      if (showNote && item.containsKey("note")) ...[
                        const SizedBox(width: 6),
                        Text(
                          item["note"],
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    ],
  );
}
