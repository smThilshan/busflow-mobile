import 'package:flutter/material.dart';

class GreetingText extends StatelessWidget {
  final String name;

  const GreetingText({super.key, required this.name});

  String _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) return "Good Morning";
    if (hour < 18) return "Good Afternoon";
    return "Good Evening";
  }

  @override
  Widget build(BuildContext context) {
    final greeting = _getGreeting();
    return Text(
      "$greeting $name!",
      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
        fontWeight: FontWeight.w800,
        color: Colors.black87,
      ),
    );
  }
}
