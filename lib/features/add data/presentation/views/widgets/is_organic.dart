import 'package:flutter/material.dart';
import 'package:fruits_hub_dash_board/features/add%20data/presentation/views/widgets/custom_checkbox.dart';

class IsOrganic extends StatefulWidget {
  const IsOrganic({super.key, required this.onChanged});
  final ValueChanged<bool> onChanged;
  @override
  State<IsOrganic> createState() => _IsOrganicState();
}

class _IsOrganicState extends State<IsOrganic> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckbox(
          isChecked: isChecked,
          onChecked: (value) {
            isChecked = value;
            widget.onChanged(value);
            setState(() {});
          },
        ),

        Expanded(
          child: Text(
            "هل هذا المنتج عضوي؟",
            textAlign: TextAlign.end,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
