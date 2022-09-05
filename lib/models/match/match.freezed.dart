// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'match.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Match _$MatchFromJson(Map<String, dynamic> json) {
  return _Match.fromJson(json);
}

/// @nodoc
mixin _$Match {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'state')
  GameState get state => throw _privateConstructorUsedError;
  Player? get player1 => throw _privateConstructorUsedError;
  Player? get player2 => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MatchCopyWith<Match> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchCopyWith<$Res> {
  factory $MatchCopyWith(Match value, $Res Function(Match) then) =
      _$MatchCopyWithImpl<$Res>;
  $Res call(
      {String id,
      @JsonKey(name: 'state') GameState state,
      Player? player1,
      Player? player2});

  $PlayerCopyWith<$Res>? get player1;
  $PlayerCopyWith<$Res>? get player2;
}

/// @nodoc
class _$MatchCopyWithImpl<$Res> implements $MatchCopyWith<$Res> {
  _$MatchCopyWithImpl(this._value, this._then);

  final Match _value;
  // ignore: unused_field
  final $Res Function(Match) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? state = freezed,
    Object? player1 = freezed,
    Object? player2 = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as GameState,
      player1: player1 == freezed
          ? _value.player1
          : player1 // ignore: cast_nullable_to_non_nullable
              as Player?,
      player2: player2 == freezed
          ? _value.player2
          : player2 // ignore: cast_nullable_to_non_nullable
              as Player?,
    ));
  }

  @override
  $PlayerCopyWith<$Res>? get player1 {
    if (_value.player1 == null) {
      return null;
    }

    return $PlayerCopyWith<$Res>(_value.player1!, (value) {
      return _then(_value.copyWith(player1: value));
    });
  }

  @override
  $PlayerCopyWith<$Res>? get player2 {
    if (_value.player2 == null) {
      return null;
    }

    return $PlayerCopyWith<$Res>(_value.player2!, (value) {
      return _then(_value.copyWith(player2: value));
    });
  }
}

/// @nodoc
abstract class _$$_MatchCopyWith<$Res> implements $MatchCopyWith<$Res> {
  factory _$$_MatchCopyWith(_$_Match value, $Res Function(_$_Match) then) =
      __$$_MatchCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      @JsonKey(name: 'state') GameState state,
      Player? player1,
      Player? player2});

  @override
  $PlayerCopyWith<$Res>? get player1;
  @override
  $PlayerCopyWith<$Res>? get player2;
}

/// @nodoc
class __$$_MatchCopyWithImpl<$Res> extends _$MatchCopyWithImpl<$Res>
    implements _$$_MatchCopyWith<$Res> {
  __$$_MatchCopyWithImpl(_$_Match _value, $Res Function(_$_Match) _then)
      : super(_value, (v) => _then(v as _$_Match));

  @override
  _$_Match get _value => super._value as _$_Match;

  @override
  $Res call({
    Object? id = freezed,
    Object? state = freezed,
    Object? player1 = freezed,
    Object? player2 = freezed,
  }) {
    return _then(_$_Match(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as GameState,
      player1: player1 == freezed
          ? _value.player1
          : player1 // ignore: cast_nullable_to_non_nullable
              as Player?,
      player2: player2 == freezed
          ? _value.player2
          : player2 // ignore: cast_nullable_to_non_nullable
              as Player?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Match implements _Match {
  const _$_Match(
      {required this.id,
      @JsonKey(name: 'state') required this.state,
      this.player1,
      this.player2});

  factory _$_Match.fromJson(Map<String, dynamic> json) =>
      _$$_MatchFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'state')
  final GameState state;
  @override
  final Player? player1;
  @override
  final Player? player2;

  @override
  String toString() {
    return 'Match(id: $id, state: $state, player1: $player1, player2: $player2)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Match &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.state, state) &&
            const DeepCollectionEquality().equals(other.player1, player1) &&
            const DeepCollectionEquality().equals(other.player2, player2));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(state),
      const DeepCollectionEquality().hash(player1),
      const DeepCollectionEquality().hash(player2));

  @JsonKey(ignore: true)
  @override
  _$$_MatchCopyWith<_$_Match> get copyWith =>
      __$$_MatchCopyWithImpl<_$_Match>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MatchToJson(
      this,
    );
  }
}

abstract class _Match implements Match {
  const factory _Match(
      {required final String id,
      @JsonKey(name: 'state') required final GameState state,
      final Player? player1,
      final Player? player2}) = _$_Match;

  factory _Match.fromJson(Map<String, dynamic> json) = _$_Match.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'state')
  GameState get state;
  @override
  Player? get player1;
  @override
  Player? get player2;
  @override
  @JsonKey(ignore: true)
  _$$_MatchCopyWith<_$_Match> get copyWith =>
      throw _privateConstructorUsedError;
}
