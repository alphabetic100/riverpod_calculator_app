import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:riverpod_calculator_app/src/core/utils/colors/app_colors.dart';

class NumberPad extends StatelessWidget {
  const NumberPad({super.key});

  @override
  Widget build(BuildContext context) {
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
