import 'package:flutter/material.dart';

class HireScreen extends StatelessWidget {
  const HireScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hires')),
      body: const Center(child: Text('This is the Hire Screen')),
    );
  }
}
