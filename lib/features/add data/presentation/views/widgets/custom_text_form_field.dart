import 'package:flutter/material.dart';
import 'package:fruits_hub_dash_board/core/utils/app_colors.dart';
import 'package:fruits_hub_dash_board/core/utils/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.keyboardType = TextInputType.text,
    required this.hint,
    this.suffixIcon,
    required this.onSaved,
    this.obscureText = false,
    this.validator,
  });
  final void Function(String?)? onSaved;
  final TextInputType? keyboardType;
  final String hint;
  final Widget? suffixIcon;
  final bool obscureText;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'هذا الحقل مطلوب';
        }
        return null;
      },
      obscureText: obscureText,
      onSaved: onSaved,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        suffixIconColor: Color(0xffC9CECF),
        fillColor: AppColors.textFieldColor,
        filled: true,
        hintText: hint,
        hintStyle: AppTextStyles.bold13.copyWith(color: Color(0xFF949D9E)),
        labelStyle: AppTextStyles.bold13.copyWith(color: Color(0xFF949D9E)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: Colors.grey.withOpacity(.2)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: Colors.grey.withOpacity(.2)),
        ),
      ),
    );
  }
}
