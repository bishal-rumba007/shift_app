import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/sdui/parser/sdui_parser.dart';
import '../../../shared/sdui/renderer/sdui_renderer.dart';
import '../../../shared/config/presentation/state/config_notifier.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncConfig = ref.watch(configProvider);

    return asyncConfig.when(
      loading: () =>
          const Scaffold(body: Center(child: CircularProgressIndicator())),

      error: (e, _) =>
          Scaffold(body: Center(child: Text('Error: $e'))),

      data: (config) {
        final raw = config.rawConfig;

        final home = raw['sdui']?['home'] ?? [];

        final components = SDUIParser.parse(home);

        return Scaffold(
          body: SafeArea(
            child: SDUIRenderer.render(components),
          ),
        );
      },
    );
  }
}