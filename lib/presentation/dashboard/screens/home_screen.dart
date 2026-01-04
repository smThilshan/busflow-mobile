import 'package:bus_flow_admin/core/ui/app_spacing.dart';
import 'package:bus_flow_admin/presentation/common/widgets/greeting_text.dart';
import 'package:bus_flow_admin/presentation/common/widgets/info_banner_widget.dart';
import 'package:bus_flow_admin/presentation/dashboard/widgets/dashboard_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isOnline = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final String today = DateFormat('dd MMMM, yyyy').format(DateTime.now());

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Greeting
              GreetingText(name: "Thilshan"),
              SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Today: $today",
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "NB-2231",
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              InfoBanner(),

              const SizedBox(height: 12),
              // SizedBox(height: size.height * 0.04),

              // Cards
              Expanded(
                child: ListView(
                  children: [
                    const SizedBox(height: 30),

                    DashboardCard(
                      icon: Icons.add_circle_outline,
                      title: "Add Trip",
                      subtitle: "Add new completed trips",
                      onTap: () {
                        context.push("/add-new-trip");
                      },
                    ),
                    SizedBox(height: AppSpacing.md),
                    DashboardCard(
                      icon: Icons.add_circle_outline,
                      title: "Add Hire",
                      subtitle: "Add new completed hires",
                      onTap: () {
                        context.push("/add-new-hire");
                      },
                    ),
                    SizedBox(height: AppSpacing.md),
                    DashboardCard(
                      icon: Icons.remove_circle_outline,
                      title: "Expense",
                      subtitle: "Maintenance and other expenses",

                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
