import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_calculator_app/src/core/utils/colors/app_colors.dart';
import 'package:riverpod_calculator_app/src/feature/home/provider/home_screen_provider.dart';

class NumberPad extends ConsumerWidget {
  const NumberPad({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 9,
      reverse: true,
      padding: const EdgeInsets.only(top: 10),
      // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //   crossAxisCount: 4,
      //   mainAxisSpacing: 10,
      //   crossAxisSpacing: 10,
      // ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemBuilder: (_, index) {
        return InkWell(
          onTap: () {
            // Handle number pad button tap
            log("Number ${index + 1} tapped");

            HomeScreenProvider.input(ref, value: (index + 1).toString());
          },
          child: Container(
            height: 50,
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: AppColors.seceondarycolor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                (index + 1).toString(),
                style: const TextStyle(
                  color: AppColors.lightBlue,
                  fontSize: 30,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
