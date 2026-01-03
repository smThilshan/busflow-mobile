import 'package:bus_flow_admin/config/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Header Text
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Please\nLogin!",
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                      color: AppColors.backgroundDark,
                    ),
                  ),
                ),
                const SizedBox(height: 100),

                // Illustration
                SizedBox(
                  height: size.height * 0.25,
                  child: SvgPicture.asset(
                    'assets/images/van.svg',
                    fit: BoxFit.contain,
                  ),
                ),

                const SizedBox(height: 60),

                // Username / Email Field
                TextField(
                  controller: _emailCtrl,
                  decoration: InputDecoration(
                    hintText: 'Username or Email',
                    prefixIcon: const Icon(Icons.person_outline),
                    filled: true,
                    fillColor: const Color(0xFFF5F5F5),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Color(0xFFD9D9D9)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Color(0xFFD9D9D9)),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Password Field
                TextField(
                  controller: _passwordCtrl,
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                    filled: true,
                    fillColor: const Color(0xFFF5F5F5),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Color(0xFFD9D9D9)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Color(0xFFD9D9D9)),
                    ),
                  ),
                ),

                const SizedBox(height: 8),

                // Forgot Password
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Login Button
                // BlocBuilder<AuthBloc, AuthState>(
                //   builder: (context, state) {
                //     return SizedBox(
                //       width: double.infinity,
                //       height: 48,
                //       child: ElevatedButton(
                //         style: ElevatedButton.styleFrom(
                //           backgroundColor: theme.primaryColor,
                //           shape: RoundedRectangleBorder(
                //             borderRadius: BorderRadius.circular(8),
                //           ),
                //         ),
                //         onPressed: state is AuthLoading
                //             ? null
                //             : () {
                //                 context.read<AuthBloc>().add(
                //                   LoginRequested(
                //                     _emailCtrl.text.trim(),
                //                     _passwordCtrl.text.trim(),
                //                   ),
                //                 );
                //               },
                //         child: state is AuthLoading
                //             ? const CircularProgressIndicator(
                //                 color: Colors.white,
                //               )
                //             : const Text(
                //                 "Login",
                //                 style: TextStyle(
                //                   fontSize: 16,
                //                   fontWeight: FontWeight.w600,
                //                 ),
                //               ),
                //       ),
                //     );
                //   },
                // ),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.colorScheme.primary,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 2,
                      shadowColor: theme.colorScheme.primary.withOpacity(0.3),
                    ),
                    onPressed: () {
                      // TODO: handle login later
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.3,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 60),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
