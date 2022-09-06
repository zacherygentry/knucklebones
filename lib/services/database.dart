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
}

final databaseProvider = Provider((ref) => Database());

final matchStreamProvider = StreamProvider.autoDispose.family<Match, String>(
  (ref, id) {
    final database = ref.watch(databaseProvider);
    return database._matchesRef.child(id).onValue.map((event) =>
        Match.fromJson(event.snapshot.value as Map<String, dynamic>));
  },
);
