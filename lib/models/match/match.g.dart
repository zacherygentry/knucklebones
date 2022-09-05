// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Match _$$_MatchFromJson(Map<String, dynamic> json) => _$_Match(
      id: json['id'] as String,
      state: $enumDecode(_$GameStateEnumMap, json['state']),
      player1: json['player1'] == null
          ? null
          : Player.fromJson(json['player1'] as Map<String, dynamic>),
      player2: json['player2'] == null
          ? null
          : Player.fromJson(json['player2'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_MatchToJson(_$_Match instance) => <String, dynamic>{
      'id': instance.id,
      'state': _$GameStateEnumMap[instance.state]!,
      'player1': instance.player1?.toJson(),
      'player2': instance.player2?.toJson(),
    };

const _$GameStateEnumMap = {
  GameState.player1: 'player1',
  GameState.player2: 'player2',
  GameState.finished: 'finished',
};
