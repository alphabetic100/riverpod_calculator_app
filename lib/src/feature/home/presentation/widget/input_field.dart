import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_calculator_app/src/core/utils/colors/app_colors.dart';
import 'package:riverpod_calculator_app/src/feature/home/provider/home_screen_provider.dart';

class InputField extends ConsumerWidget {
  InputField({super.key});
  final fillValue = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sum = ref.watch(sumProvider);
    final input = ref.watch(inputLabelProvider);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AbsorbPointer(
          absorbing: true,
          child: TextField(
            controller: fillValue..text = input,
            readOnly: true,
            maxLines: 1,
            style: const TextStyle(fontSize: 40, color: Colors.white),
            textAlign: TextAlign.right,
            decoration: const InputDecoration(
              hintStyle: TextStyle(fontSize: 50, color: Colors.white),
              border: InputBorder.none,
              filled: true,
              fillColor: AppColors.seceondarycolor,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
            ),
          ),
        ),
        Container(
          color: AppColors.seceondarycolor,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Align(
            alignment: Alignment.bottomRight,
            child: Text(
              "$sum",
              style: const TextStyle(fontSize: 45, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
