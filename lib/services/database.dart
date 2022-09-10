import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:knucklebones/models/match/match.dart';
import 'package:knucklebones/models/player/player.dart';

class Database {
  FirebaseDatabase instance = FirebaseDatabase.instance;

  DatabaseReference get _matchesRef => instance.ref('matches');

  Future<String> createMatch(String playerId) async {
    final key = _matchesRef.push().key!;
    final Match match = Match(
      id: key,
      state: GameState.player1,
      player1: Player(
        id: playerId,
        column1: [-1, -1, -1],
        column2: [-1, -1, -1],
        column3: [-1, -1, -1],
        currentRoll: -1,
      ),
    );
    await _matchesRef.child(key).set(match.toJson());
    return key;
  }

  Future<void> joinMatch(String matchId, String playerId) async {
    Player player2 = Player(
      id: playerId,
      column1: [-1, -1, -1],
      column2: [-1, -1, -1],
      column3: [-1, -1, -1],
      currentRoll: -1,
    );

    print("Joining match as player 2");

    return await _matchesRef
        .child(matchId)
        .child('player2')
        .update(player2.toJson());
  }

  Future<void> rollDie(String matchId, bool isPlayer1) async {
    return await _matchesRef
        .child(matchId)
        .child(isPlayer1 ? 'player1' : 'player2')
        .update({'current_roll': Random().nextInt(6) + 1});
  }

  Future<void> addRollToColumn(
      String matchId, int roll, int columnNumber, bool isPlayer1) async {
    if (roll == -1) {
      return;
    }

    final playerSnapshot =
        _matchesRef.child(matchId).child(isPlayer1 ? 'player1' : 'player2');
    final opponentSnapshot =
        _matchesRef.child(matchId).child(isPlayer1 ? 'player2' : 'player1');

    final player = Player.fromJson(
        (await playerSnapshot.get()).value as Map<String, dynamic>);
    final opponent = Player.fromJson(
        (await opponentSnapshot.get()).value as Map<String, dynamic>);

    List<int> column;
    List<int> opponentColumn;
    if (columnNumber == 1) {
      column = player.column1.toList();
      opponentColumn = opponent.column1.toList();
    } else if (columnNumber == 2) {
      column = player.column2.toList();
      opponentColumn = opponent.column2.toList();
    } else {
      column = player.column3.toList();
      opponentColumn = opponent.column3.toList();
    }
    if (column.where((n) => n != -1).length == 3) {
      return;
    }

    opponentColumn = opponentColumn.map((n) => n == roll ? -1 : n).toList();
    for (var i = 0; i < column.length; i++) {
      if (column[i] == -1) {
        column[i] = roll;
        break;
      }
    }

    final newPlayer = player.copyWith(
      column1: columnNumber == 1 ? column : player.column1,
      column2: columnNumber == 2 ? column : player.column2,
      column3: columnNumber == 3 ? column : player.column3,
      currentRoll: -1,
    );

    final newOpponent = opponent.copyWith(
      column1: columnNumber == 1 ? opponentColumn : opponent.column1,
      column2: columnNumber == 2 ? opponentColumn : opponent.column2,
      column3: columnNumber == 3 ? opponentColumn : opponent.column3,
    );

    await _matchesRef
        .child(matchId)
        .child(isPlayer1 ? 'player1' : 'player2')
        .update(
          newPlayer.toJson(),
        );
    await _matchesRef
        .child(matchId)
        .child(isPlayer1 ? 'player2' : 'player1')
        .update(
          newOpponent.toJson(),
        );

    if (newPlayer.column1.where((n) => n != -1).length == 3 &&
        newPlayer.column2.where((n) => n != -1).length == 3 &&
        newPlayer.column3.where((n) => n != -1).length == 3) {
      await _matchesRef.child(matchId).update({'state': GameState.finished});
    } else {
      await nextTurn(matchId);
    }
  }

  Future<void> nextTurn(String matchId) async {
    final matchSnapshot = await _matchesRef.child(matchId).get();
    final match = Match.fromJson(matchSnapshot.value as Map<String, dynamic>);

    final newMatch = match.copyWith(
      state: match.state == GameState.player1
          ? GameState.player2
          : GameState.player1,
    );

    return await _matchesRef.child(matchId).update(newMatch.toJson());
  }
}

final databaseProvider = Provider((ref) => Database());

final matchStreamProvider = StreamProvider.autoDispose.family<Match, String>(
  (ref, id) {
    final database = ref.watch(databaseProvider);
    return database._matchesRef.child(id).onValue.map((event) =>
        Match.fromJson(event.snapshot.value as Map<String, dynamic>));
  },
);
