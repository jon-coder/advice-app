import 'dart:convert';
import 'package:equatable/equatable.dart';

import '../../domain/entities/advice_entity.dart';

class AdviceModel extends AdviceEntity with EquatableMixin {
  AdviceModel({
    required id,
    required advice,
  }) : super(advice: advice, id: id);

  Map<String, dynamic> toMap() {
    return {
      'advice_id': id,
      'advice': advice,
    };
  }

  factory AdviceModel.fromMap(Map<String, dynamic> map) {
    return AdviceModel(
      id: map['advice_id'] ?? 0,
      advice: map['advice'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AdviceModel.fromJson(String source) => AdviceModel.fromMap(jsonDecode(source));
}
