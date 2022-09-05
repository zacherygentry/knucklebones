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
        column1: [null, null, null],
        column2: [null, null, null],
        column3: [null, null, null],
        currentRoll: null,
      ),
    );
    await _matchesRef.child(key).set(match.toJson());
    return key;
  }
}

final databaseProvider = Provider((ref) => Database());
