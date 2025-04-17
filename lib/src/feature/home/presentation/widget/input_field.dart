import 'package:flutter/material.dart';
import 'package:riverpod_calculator_app/src/core/utils/colors/app_colors.dart';

class InputField extends StatelessWidget {
  const InputField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const TextField(
          maxLines: 1,
          style: TextStyle(fontSize: 40, color: Colors.white),
          textAlign: TextAlign.right,
          decoration: InputDecoration(
            hintStyle: TextStyle(fontSize: 50, color: Colors.white),
            border: InputBorder.none,
            filled: true,
            fillColor: AppColors.seceondarycolor,
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          ),
        ),
        Container(
          color: AppColors.seceondarycolor,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: const Align(
            alignment: Alignment.bottomRight,
            child: Text(
              "=0",
              style: TextStyle(fontSize: 45, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
