import 'package:flutter/material.dart';
import 'package:fruits_hub_dash_board/features/add%20data/presentation/views/widgets/custom_checkbox.dart';

class IsFeatured extends StatefulWidget {
  const IsFeatured({super.key, required this.onChanged});
  final ValueChanged<bool> onChanged;
  @override
  State<IsFeatured> createState() => _IsFeaturedState();
}

class _IsFeaturedState extends State<IsFeatured> {
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
        Spacer(),
        Expanded(
          child: Text(
            "هل تريد تمييز هذا المنتج؟",
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
