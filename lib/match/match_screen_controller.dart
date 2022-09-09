import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:knucklebones/models/match/match.dart';
import 'package:knucklebones/models/player/player.dart';
import 'package:knucklebones/services/database.dart';

class MatchScreenController {
  late final String matchId;
  late final User user;
  late final WidgetRef _ref;

  bool _initialized = false;
  void init(
      {required String matchId, required User user, required WidgetRef ref}) {
    if (_initialized) {
      return;
    }

    this.matchId = matchId;
    this.user = user;
    _ref = ref;
    _initialized = true;
  }

  Future<void> joinMatch() async {
    final database = _ref.watch(databaseProvider);
    await database.joinMatch(matchId, user.uid);
  }

  Player? myPlayer(Match match) {
    return user.uid == match.player1?.id ? match.player1 : match.player2;
  }

  Player? otherPlayer(Match match) {
    return user.uid == match.player1?.id ? match.player2 : match.player1;
  }

  bool isPlayer1(Match match) {
    return user.uid == match.player1?.id;
  }

  bool isPlayersTurn(Match match) {
    return (isPlayer1(match) && match.state == GameState.player1) ||
        (!isPlayer1(match) && match.state == GameState.player2);
  }

  Future<void> rollDie(Match match) {
    final database = _ref.watch(databaseProvider);
    return database.rollDie(matchId, isPlayer1(match));
  }

  Future<void> addRollToColumn(Match match, int roll, int columnNumber) {
    final database = _ref.watch(databaseProvider);
    return database.addRollToColumn(
        matchId, roll, columnNumber, isPlayer1(match));
  }
}

final matchScreenControllerProvider =
    Provider.autoDispose<MatchScreenController>(
  (_) => MatchScreenController(),
);
