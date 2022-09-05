import 'package:freezed_annotation/freezed_annotation.dart';

part 'player.freezed.dart';
part 'player.g.dart';

@freezed
class Player with _$Player {
  const factory Player({
    required String id,
    required List<int?> column1,
    required List<int?> column2,
    required List<int?> column3,
    @JsonKey(name: 'current_roll') required int? currentRoll,
  }) = _Player;

  factory Player.fromJson(Map<String, Object?> json) => _$PlayerFromJson(json);
}
