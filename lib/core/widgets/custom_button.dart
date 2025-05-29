import 'package:flutter/material.dart';
import 'package:fruits_hub_dash_board/core/utils/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.isVisible,
  });
  final String text;
  final VoidCallback onPressed;
  final bool isVisible;
  // final void Function()? onPressed ;
  @override
  Widget build(BuildContext context) {
    return Visibility(
      maintainAnimation: true,
      maintainSize: true,
      maintainState: true,
      visible: isVisible,
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: const Color(0xFF1B5E37), // AppColors.primaryColor
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: AppTextStyles.bold16.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
