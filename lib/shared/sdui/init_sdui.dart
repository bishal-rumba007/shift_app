import 'package:flutter/material.dart';
import 'registry/widget_registry.dart';

void initSDUI() {
  WidgetRegistry.register("text", (props) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Text(
        props["text"] ?? "",
        style: const TextStyle(fontSize: 16),
      ),
    );
  });

  WidgetRegistry.register("button", (props) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(props["label"] ?? "Button"),
    );
  });

  WidgetRegistry.register("card", (props) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Text(props["title"] ?? ""),
      ),
    );
  });
}