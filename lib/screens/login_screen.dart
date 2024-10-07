import 'package:flutter/material.dart';
import 'package:lati_marvel/widget/main_button.dart';
import 'package:lati_marvel/widget/text_feilds/text_field_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 50),
            const SizedBox(height: 20),
            const TextFieldWidget(
                formLabel: "Username"), // استخدام TextFieldWidget هنا
            const SizedBox(height: 16),
            const TextFieldWidget(
                formLabel: "Password"), // استخدام TextFieldWidget هنا
            const SizedBox(height: 50),
            MainButton(
              label: "Login",
              onPressed: () {
                // هنا يمكنك إضافة عملية تسجيل الدخول
              },
            ),
          ],
        ),
      ),
    );
  }
}
