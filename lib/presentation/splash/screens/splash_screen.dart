import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to SplashPage after 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      context.go('/splash');
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      // backgroundColor: , // Or AppColors.background
      body: Center(
        child: SvgPicture.asset(
          'assets/images/van.svg', // your original SVG
          // width: MediaQuery.of(context).size.width * 0.4,
          // height: MediaQuery.of(context).size.height * 0.2,
          // fit: BoxFit.contain,
        ),
      ),
    );
  }
}
