import 'package:flutter/material.dart';
import 'package:riverpod_calculator_app/src/feature/home/presentation/widget/input_field.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String homeScreen = "/";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF17181A),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
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
                  const InputField(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
