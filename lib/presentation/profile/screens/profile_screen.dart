import 'package:bus_flow_admin/presentation/common/widgets/custom_textfield.dart';
import 'package:bus_flow_admin/presentation/profile/widgets/avatar_widget.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController bankAccountNoController =
        TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Center(child: AvatarWidget(imageUrl: null)),
            const SizedBox(height: 30),

            Text("Personal Details"),
            const SizedBox(height: 10),
            CustomTextField(
              label: "Username",
              controller: bankAccountNoController,
            ),
            CustomTextField(
              label: "Password",
              controller: bankAccountNoController,
            ),

            const Divider(height: 40),
            Text("Bank Account Details"),
            const SizedBox(height: 10),
            CustomTextField(
              label: "Bank Account Number",
              controller: bankAccountNoController,
            ),
            CustomTextField(
              label: "Account Holder’s Name",
              controller: bankAccountNoController,
            ),
            CustomTextField(
              label: "IFSC Code",
              controller: bankAccountNoController,
            ),
          ],
        ),
      ),
    );
  }
}
