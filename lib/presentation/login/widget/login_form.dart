import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: _emailCtrl,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              labelText: 'Email',
              prefixIcon: Icon(Icons.email_outlined),
            ),
            validator: (value) =>
                value!.isEmpty ? 'Please enter your email' : null,
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _passwordCtrl,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Password',
              prefixIcon: Icon(Icons.lock_outline),
            ),
            validator: (value) =>
                value!.isEmpty ? 'Please enter your password' : null,
          ),
          const SizedBox(height: 24),
          // SizedBox(
          //   width: size.width,
          //   height: 48,
          //   child: ElevatedButton(
          //     onPressed: auth.isLoading
          //         ? null
          //         : () {
          //             if (_formKey.currentState!.validate()) {
          //               auth.login(_emailCtrl.text, _passwordCtrl.text);
          //             }
          //           },
          //     child: auth.isLoading
          //         ? const CircularProgressIndicator(color: Colors.white)
          //         : const Text('Login'),
          //   ),
          // ),
        ],
      ),
    );
  }
}
