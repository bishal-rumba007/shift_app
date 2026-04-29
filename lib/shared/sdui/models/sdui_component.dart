class SDUIComponent {
  final String type;
  final Map<String, dynamic> props;

  SDUIComponent({
    required this.type,
    required this.props,
  });

  factory SDUIComponent.fromJson(Map<String, dynamic> json) {
    return SDUIComponent(
      type: json['type'] ?? 'unknown',
      props: json['props'] ?? {},
    );
  }
}