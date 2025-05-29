import 'package:flutter/material.dart';
import 'package:fruits_hub_dash_board/core/widgets/custom_button.dart';

class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButton(text: "Add Data", onPressed: () {}, isVisible: true),
        ],
      ),
    );
  }
}
