import 'package:bus_flow_admin/core/ui/app_spacing.dart';
import 'package:bus_flow_admin/domain/entities/hire_preview_data.dart';
import 'package:bus_flow_admin/presentation/common/widgets/custom_action_btn.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PreviewNewHire extends StatefulWidget {
  const PreviewNewHire({super.key});

  @override
  State<PreviewNewHire> createState() => _PreviewNewHireState();
}

class _PreviewNewHireState extends State<PreviewNewHire> {
  @override
  Widget build(BuildContext context) {
    final previewData = GoRouterState.of(context).extra as HirePreviewData;

    // data
    final incomeData = [
      {"label": "Hire Amount", "amount": previewData.hireAmount},
    ];

    final expenseData = [
      {"label": "Diesel Expense", "amount": previewData.diesel},
      {"label": "Driver Salary", "amount": previewData.driverSalary},
      {"label": "Conductor Salary", "amount": previewData.conductorSalary},
      {"label": "Expenses", "amount": previewData.otherExpenses},
      {"label": "Total", "amount": previewData.totalExpense},
    ];

    final summaryData = {
      "Total Income": previewData.hireAmount,
      "Total Expense": previewData.totalExpense,
      "Earned": previewData.hireAmount - previewData.totalExpense,
    };

    return Scaffold(
      appBar: AppBar(title: const Text("Confirmation")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Income Section
              buildSection("Income", incomeData),
              SizedBox(height: AppSpacing.lg),

              /// Expense Section
              buildSection("Expenses", expenseData, showNote: true),
              SizedBox(height: AppSpacing.lg),

              /// Summary Section
              const Text(
                "Summary",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: AppSpacing.md),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: summaryData.entries.map((e) {
                  final bool isEarned = e.key == "Earned";
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            e.key,
                            style: TextStyle(
                              fontWeight: isEarned
                                  ? FontWeight.bold
                                  : FontWeight.w500,
                              color: isEarned
                                  ? Colors.green.shade800
                                  : Colors.black87,
                              fontSize: isEarned ? 16 : 15,
                            ),
                          ),
                        ),

                        Expanded(
                          child: Text(
                            "${e.value.toStringAsFixed(2)} LKR",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: isEarned ? 18 : 16,
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
              SizedBox(height: AppSpacing.xl),
              CustomActionBtn(
                text: "Save",
                onPressed: () {
                  context.push("/");
                },
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
