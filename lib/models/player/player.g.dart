// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Player _$$_PlayerFromJson(Map<String, dynamic> json) => _$_Player(
      id: json['id'] as String,
      column1:
          (json['column1'] as List<dynamic>).map((e) => e as int?).toList(),
      column2:
          (json['column2'] as List<dynamic>).map((e) => e as int?).toList(),
      column3:
          (json['column3'] as List<dynamic>).map((e) => e as int?).toList(),
      currentRoll: json['current_roll'] as int?,
    );

Map<String, dynamic> _$$_PlayerToJson(_$_Player instance) => <String, dynamic>{
      'id': instance.id,
      'column1': instance.column1,
      'column2': instance.column2,
      'column3': instance.column3,
      'current_roll': instance.currentRoll,
    };
