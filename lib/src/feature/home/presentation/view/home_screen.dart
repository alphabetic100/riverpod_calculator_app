import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_calculator_app/src/core/utils/colors/app_colors.dart';
import 'package:riverpod_calculator_app/src/feature/home/presentation/widget/action_button.dart';
import 'package:riverpod_calculator_app/src/feature/home/presentation/widget/input_field.dart';
import 'package:riverpod_calculator_app/src/feature/home/presentation/widget/number_pad.dart';
import 'package:riverpod_calculator_app/src/feature/home/provider/home_screen_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});
  static const String homeScreen = "/";
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: const Color(0xFF17181A),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.history,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),

                  // Calculator view
                ],
              ),

              InputField(),
              Expanded(child: Container()),
              SizedBox.fromSize(size: const Size.fromHeight(20)),
              Row(
                children: [
                  Expanded(
                    child: ActionButton(
                      onTap: () => HomeScreenProvider.clearAll(ref),
                      text: "AC",
                      color: AppColors.grey,
                      textColor: Colors.grey,
                      width: 50,
                    ),
                  ),
                  Expanded(
                    child: ActionButton(
                      onTap: () => HomeScreenProvider.clear(ref),
                      text: "C",
                      color: AppColors.grey,
                      textColor: Colors.grey,
                      width: 50,
                    ),
                  ),
                  Expanded(
                    child: ActionButton(
                      onTap: () => HomeScreenProvider.input(ref, value: "/"),
                      text: "/",
                      color: AppColors.deepBlue,
                      textColor: AppColors.lightBlue,
                      width: 50,
                    ),
                  ),
                  Expanded(
                    child: ActionButton(
                      onTap: () => HomeScreenProvider.input(ref, value: "*"),
                      text: "*",
                      color: AppColors.deepBlue,
                      textColor: AppColors.lightBlue,
                      width: 50,
                      fontSize: 40,
                    ),
                  ),
                ],
              ),

              Expanded(
                flex: 7,
                child: Row(
                  children: [
                    Expanded(
                      flex: 8,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Expanded(flex: 7, child: NumberPad()),

                          //Bottom buttons
                          Expanded(
                            flex: 2,

                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: ActionButton(
                                    onTap:
                                        () => HomeScreenProvider.input(
                                          ref,
                                          value: "0",
                                        ),
                                    text: "0",
                                    color: AppColors.deepBlue,
                                    textColor: AppColors.lightBlue,
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: ActionButton(
                                    onTap:
                                        () => HomeScreenProvider.input(
                                          ref,
                                          value: ".",
                                        ),

                                    text: ".",
                                    color: AppColors.deepBlue,
                                    textColor: AppColors.lightBlue,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    //Side buttons
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          ActionButton(
                            onTap:
                                () => HomeScreenProvider.input(ref, value: "-"),

                            text: "-",
                            color: AppColors.deepBlue,
                            textColor: AppColors.lightBlue,
                          ),
                          ActionButton(
                            onTap:
                                () => HomeScreenProvider.input(ref, value: "+"),

                            text: "+",
                            color: AppColors.deepBlue,
                            textColor: AppColors.lightBlue,
                          ),
                          Expanded(
                            flex: 2,
                            child: ActionButton(
                              onTap: () => HomeScreenProvider.calculate(ref),

                              text: "=",
                              color: const Color(0xFF1991FF),
                              textColor: const Color(0xFFB2DAFF),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
