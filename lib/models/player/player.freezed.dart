// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'player.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Player _$PlayerFromJson(Map<String, dynamic> json) {
  return _Player.fromJson(json);
}

/// @nodoc
mixin _$Player {
  String get id => throw _privateConstructorUsedError;
  List<int?> get column1 => throw _privateConstructorUsedError;
  List<int?> get column2 => throw _privateConstructorUsedError;
  List<int?> get column3 => throw _privateConstructorUsedError;
  @JsonKey(name: 'current_roll')
  int? get currentRoll => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlayerCopyWith<Player> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayerCopyWith<$Res> {
  factory $PlayerCopyWith(Player value, $Res Function(Player) then) =
      _$PlayerCopyWithImpl<$Res>;
  $Res call(
      {String id,
      List<int?> column1,
      List<int?> column2,
      List<int?> column3,
      @JsonKey(name: 'current_roll') int? currentRoll});
}

/// @nodoc
class _$PlayerCopyWithImpl<$Res> implements $PlayerCopyWith<$Res> {
  _$PlayerCopyWithImpl(this._value, this._then);

  final Player _value;
  // ignore: unused_field
  final $Res Function(Player) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? column1 = freezed,
    Object? column2 = freezed,
    Object? column3 = freezed,
    Object? currentRoll = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      column1: column1 == freezed
          ? _value.column1
          : column1 // ignore: cast_nullable_to_non_nullable
              as List<int?>,
      column2: column2 == freezed
          ? _value.column2
          : column2 // ignore: cast_nullable_to_non_nullable
              as List<int?>,
      column3: column3 == freezed
          ? _value.column3
          : column3 // ignore: cast_nullable_to_non_nullable
              as List<int?>,
      currentRoll: currentRoll == freezed
          ? _value.currentRoll
          : currentRoll // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$$_PlayerCopyWith<$Res> implements $PlayerCopyWith<$Res> {
  factory _$$_PlayerCopyWith(_$_Player value, $Res Function(_$_Player) then) =
      __$$_PlayerCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      List<int?> column1,
      List<int?> column2,
      List<int?> column3,
      @JsonKey(name: 'current_roll') int? currentRoll});
}

/// @nodoc
class __$$_PlayerCopyWithImpl<$Res> extends _$PlayerCopyWithImpl<$Res>
    implements _$$_PlayerCopyWith<$Res> {
  __$$_PlayerCopyWithImpl(_$_Player _value, $Res Function(_$_Player) _then)
      : super(_value, (v) => _then(v as _$_Player));

  @override
  _$_Player get _value => super._value as _$_Player;

  @override
  $Res call({
    Object? id = freezed,
    Object? column1 = freezed,
    Object? column2 = freezed,
    Object? column3 = freezed,
    Object? currentRoll = freezed,
  }) {
    return _then(_$_Player(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      column1: column1 == freezed
          ? _value._column1
          : column1 // ignore: cast_nullable_to_non_nullable
              as List<int?>,
      column2: column2 == freezed
          ? _value._column2
          : column2 // ignore: cast_nullable_to_non_nullable
              as List<int?>,
      column3: column3 == freezed
          ? _value._column3
          : column3 // ignore: cast_nullable_to_non_nullable
              as List<int?>,
      currentRoll: currentRoll == freezed
          ? _value.currentRoll
          : currentRoll // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Player implements _Player {
  const _$_Player(
      {required this.id,
      required final List<int?> column1,
      required final List<int?> column2,
      required final List<int?> column3,
      @JsonKey(name: 'current_roll') required this.currentRoll})
      : _column1 = column1,
        _column2 = column2,
        _column3 = column3;

  factory _$_Player.fromJson(Map<String, dynamic> json) =>
      _$$_PlayerFromJson(json);

  @override
  final String id;
  final List<int?> _column1;
  @override
  List<int?> get column1 {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_column1);
  }

  final List<int?> _column2;
  @override
  List<int?> get column2 {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_column2);
  }

  final List<int?> _column3;
  @override
  List<int?> get column3 {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_column3);
  }

  @override
  @JsonKey(name: 'current_roll')
  final int? currentRoll;

  @override
  String toString() {
    return 'Player(id: $id, column1: $column1, column2: $column2, column3: $column3, currentRoll: $currentRoll)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Player &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other._column1, _column1) &&
            const DeepCollectionEquality().equals(other._column2, _column2) &&
            const DeepCollectionEquality().equals(other._column3, _column3) &&
            const DeepCollectionEquality()
                .equals(other.currentRoll, currentRoll));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(_column1),
      const DeepCollectionEquality().hash(_column2),
      const DeepCollectionEquality().hash(_column3),
      const DeepCollectionEquality().hash(currentRoll));

  @JsonKey(ignore: true)
  @override
  _$$_PlayerCopyWith<_$_Player> get copyWith =>
      __$$_PlayerCopyWithImpl<_$_Player>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PlayerToJson(
      this,
    );
  }
}

abstract class _Player implements Player {
  const factory _Player(
          {required final String id,
          required final List<int?> column1,
          required final List<int?> column2,
          required final List<int?> column3,
          @JsonKey(name: 'current_roll') required final int? currentRoll}) =
      _$_Player;

  factory _Player.fromJson(Map<String, dynamic> json) = _$_Player.fromJson;

  @override
  String get id;
  @override
  List<int?> get column1;
  @override
  List<int?> get column2;
  @override
  List<int?> get column3;
  @override
  @JsonKey(name: 'current_roll')
  int? get currentRoll;
  @override
  @JsonKey(ignore: true)
  _$$_PlayerCopyWith<_$_Player> get copyWith =>
      throw _privateConstructorUsedError;
}
