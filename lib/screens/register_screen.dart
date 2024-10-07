import 'package:flutter/material.dart';
import 'package:lati_marvel/widget/main_button.dart';
import 'package:lati_marvel/widget/text_feilds/text_field_widget.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 50),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Image.asset("assets/YourCustomLogo.png"),
            // ),
            const SizedBox(height: 20),
            const TextFieldWidget(formLabel: "Email"),
            const SizedBox(height: 16),
            const TextFieldWidget(formLabel: "Password"),
            const SizedBox(height: 16),
            const TextFieldWidget(formLabel: "Confirm Password"),
            const SizedBox(height: 50),
            MainButton(
              label: "Register",
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
