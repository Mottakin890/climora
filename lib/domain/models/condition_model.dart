class ConditionModel {
  final String text;
  final String icon;
  final int code;

  const ConditionModel({
    required this.text,
    required this.icon,
    required this.code,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConditionModel &&
          runtimeType == other.runtimeType &&
          text == other.text &&
          icon == other.icon &&
          code == other.code;

  @override
  int get hashCode => text.hashCode ^ icon.hashCode ^ code.hashCode;
}
