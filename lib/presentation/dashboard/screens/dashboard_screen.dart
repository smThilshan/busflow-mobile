import 'package:bus_flow_admin/presentation/common/widgets/greeting_text.dart';
import 'package:bus_flow_admin/presentation/common/widgets/info_banner_widget.dart';
import 'package:bus_flow_admin/presentation/dashboard/widgets/dashboard_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool isOnline = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    final String today = DateFormat('dd MMMM, yyyy').format(DateTime.now());

    return Scaffold(
      // backgroundColor: theme.colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
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
                    const SizedBox(height: 40),

                    DashboardCard(
                      icon: Icons.add_circle_outline,
                      title: "Add New Trip",
                      subtitle: "Add new completed trips & hires",
                      onTap: () {},
                    ),
                    const SizedBox(height: 16),
                    DashboardCard(
                      icon: Icons.remove_circle_outline,
                      title: "Expense",
                      subtitle: "Mainternance and other expenses",
                      // trailingText: "11",
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
