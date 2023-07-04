import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practise/change_notifier_provider/change_notifier_provider.dart';

class ScreenNotifierView extends ConsumerWidget {
  const ScreenNotifierView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myController = ref.watch(controllerData);
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: ()=> myController.getData(),
            child: const Text("Just Coding")
        ),
      ),
    );
  }
}
