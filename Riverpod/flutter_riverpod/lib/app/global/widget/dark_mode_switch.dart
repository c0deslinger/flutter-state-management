import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../providers.dart';

class DarkModeSwitch extends HookConsumerWidget {
  const DarkModeSwitch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var darkModeEnabled = ref.watch(appThemeStateNotifier);

    return Switch(
      value: darkModeEnabled.isDarkModeEnabled,
      onChanged: (enabled) {
        if (enabled) {
          ref.read(appThemeStateNotifier).setDarkTheme();
        } else {
          ref.read(appThemeStateNotifier).setLightTheme();
        }
      },
    );
  }
}
