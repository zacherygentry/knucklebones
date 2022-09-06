import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:knucklebones/match/widgets/player_board.dart';
import 'package:knucklebones/models/match/match.dart';
import 'package:knucklebones/services/authentication.dart';
import 'package:knucklebones/services/database.dart';

class MatchScreen extends ConsumerWidget {
  const MatchScreen({
    Key? key,
    required this.matchId,
  }) : super(key: key);
  final String matchId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final matchAsyncValue = ref.watch(matchStreamProvider(matchId));
    final database = ref.watch(databaseProvider);
    final user = ref.watch(authUserProvider);

    return Scaffold(
      body: Center(
        child: user.when(
          data: (user) {
            return matchAsyncValue.when(
              data: (match) {
                if (user.uid != match.player1?.id) {
                  database.joinMatch(matchId, user.uid);
                }

                final myPlayer = user.uid == match.player1?.id
                    ? match.player1
                    : match.player2;

                final otherPlayer = user.uid == match.player1?.id
                    ? match.player2
                    : match.player1;

                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: PlayerBoard(player: otherPlayer)),
                    Text(
                      'Current Turn: ${match.state == GameState.player1 ? 'Player 1' : 'Player 2'}',
                    ),
                    Expanded(child: PlayerBoard(player: myPlayer)),
                  ],
                );
              },
              error: (error, stackTrace) {
                return Text(error.toString());
              },
              loading: () => const CircularProgressIndicator(),
            );
          },
          error: (error, stackTrace) => Text(error.toString()),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
