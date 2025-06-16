import 'package:flutter_riverpod/flutter_riverpod.dart';

final sumProvider = StateProvider<String>((ref) => "0.0");
final inputLabelProvider = StateProvider<String>((ref) => "");

class HomeScreenProvider {
  static void input(WidgetRef ref, {required String value}) {
    final currentState = ref.watch(inputLabelProvider);
    final operatorRegExp = RegExp(r'[-*+?/.]');

    if ((currentState.isEmpty && operatorRegExp.hasMatch(value)) ||
        operatorRegExp.hasMatch(
              currentState.isNotEmpty
                  ? currentState[currentState.length - 1]
                  : '',
            ) &&
            operatorRegExp.hasMatch(value)) {
      return;
    }

    ref.read(inputLabelProvider.notifier).state = currentState + value;
  }

  static void calculate(WidgetRef ref) {
    final value = ref.read(inputLabelProvider);
    final regex = RegExp(r'\d+|[+\-*/]');
    final tokens = regex.allMatches(value).map((m) => m.group(0)!).toList();

    if (tokens.isEmpty) {
      ref.read(sumProvider.notifier).state = '0';
      return;
    }

    List<String> ops = [];
    List<double> nums = [];

    void applyOperator() {
      if (nums.length < 2 || ops.isEmpty) return;
      double b = nums.removeLast();
      double a = nums.removeLast();
      String op = ops.removeLast();

      switch (op) {
        case '+':
          nums.add(a + b);
          break;
        case '-':
          nums.add(a - b);
          break;
        case '*':
          nums.add(a * b);
          break;
        case '/':
          nums.add(b != 0 ? a / b : 0);
          break;
      }
    }

    int precedence(String op) {
      if (op == '+' || op == '-') return 1;
      if (op == '*' || op == '/') return 2;
      return 0;
    }

    for (var token in tokens) {
      if (RegExp(r'\d+').hasMatch(token)) {
        nums.add(double.parse(token));
      } else if (RegExp(r'[+\-*/]').hasMatch(token)) {
        while (ops.isNotEmpty && precedence(ops.last) >= precedence(token)) {
          applyOperator();
        }
        ops.add(token);
      }
    }

    while (ops.isNotEmpty) {
      applyOperator();
    }

    final result = nums.isNotEmpty ? nums.first.toString() : '0';
    ref.read(sumProvider.notifier).state = result;
  }

  static void clear(WidgetRef ref) {
    ref.read(inputLabelProvider.notifier).state = "";
  }

  static void clearAll(WidgetRef ref) {
    ref.read(sumProvider.notifier).state = "0.0";
    ref.read(inputLabelProvider.notifier).state = "";
  }
}
