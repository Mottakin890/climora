import 'package:climora/domain/models/condition_model.dart';

class ConditionEntities extends ConditionModel {
  ConditionEntities({
    required super.text,
    required super.icon,
    required super.code,
  });
  factory ConditionEntities.fromJson(Map<String, dynamic> json) {
    return ConditionEntities(
      text: json['text'] as String? ?? '',
      icon: json['icon'] as String? ?? '',
      code: json['code'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {'text': text, 'icon': icon, 'code': code};
  }
}
