import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:knucklebones/models/player/player.dart';

part 'match.freezed.dart';
part 'match.g.dart';

enum GameState {
  @JsonValue('player1')
  player1,
  @JsonValue('player2')
  player2,
  @JsonValue('finished')
  finished
}

@freezed
class Match with _$Match {
  const factory Match({
    required String id,
    @JsonKey(name: 'state') required GameState state,
    Player? player1,
    Player? player2,
  }) = _Match;

  factory Match.fromJson(Map<String, Object?> json) => _$MatchFromJson(json);
}
