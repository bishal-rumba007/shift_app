import 'package:flutter/material.dart';
import '../models/sdui_component.dart';

typedef WidgetBuilderFn = Widget Function(Map<String, dynamic> props);

class WidgetRegistry {
  static final Map<String, WidgetBuilderFn> _registry = {};

  static void register(String type, WidgetBuilderFn builder) {
    _registry[type] = builder;
  }

  static Widget build(SDUIComponent component) {
    final builder = _registry[component.type];

    if (builder == null) {
      return const SizedBox(); // fallback
    }

    return builder(component.props);
  }
}