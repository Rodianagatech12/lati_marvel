import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.btnColor = Colors.red,
    this.txtColor = Colors.white,
    this.horizontalPadding = 32,
    this.inProgress = false,
  });

  final String label;
  final VoidCallback onPressed;
  final Color btnColor;
  final Color txtColor;
  final double horizontalPadding;
  final bool inProgress;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(btnColor), // تعديل هنا
      ),
      onPressed: inProgress ? null : onPressed, // Disable when in progress
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 15,
          horizontal: horizontalPadding,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            inProgress
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      backgroundColor: Colors.white24,
                      strokeWidth: 2,
                    ),
                  )
                : Text(
                    label,
                    style: TextStyle(color: txtColor),
                  ),
          ],
        ),
      ),
    );
  }
}
