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

    ref.read(sumProvider.notifier).state = value;
  }

  static void clear(WidgetRef ref) {
    ref.read(inputLabelProvider.notifier).state = "";
  }

  static void clearAll(WidgetRef ref) {
    ref.read(sumProvider.notifier).state = "0.0";
    ref.read(inputLabelProvider.notifier).state = "";
  }
}
