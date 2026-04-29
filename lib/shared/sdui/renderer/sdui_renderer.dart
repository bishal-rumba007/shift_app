import 'package:flutter/material.dart';
import '../models/sdui_component.dart';
import '../registry/widget_registry.dart';

class SDUIRenderer {
  static Widget render(List<SDUIComponent> components) {
    if (components.isEmpty) {
      return const Center(
        child: Text("No UI configured"),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: components.map(WidgetRegistry.build).toList(),
    );
  }
}