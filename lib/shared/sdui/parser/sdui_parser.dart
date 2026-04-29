import '../models/sdui_component.dart';

class SDUIParser {
  static List<SDUIComponent> parse(dynamic json) {
    if (json is! List) {
      return [];
    }

    return json
        .whereType<Map<String, dynamic>>()
        .map((e) => SDUIComponent.fromJson(e))
        .toList();
  }
}