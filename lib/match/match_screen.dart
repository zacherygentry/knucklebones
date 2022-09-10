import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:knucklebones/match/match_screen_controller.dart';
import 'package:knucklebones/match/widgets/opponent_board.dart';
import 'package:knucklebones/match/widgets/player_board.dart';
import 'package:knucklebones/models/match/match.dart';
import 'package:knucklebones/models/player/player.dart';
import 'package:knucklebones/services/authentication.dart';
import 'package:knucklebones/services/database.dart';
import 'package:knucklebones/util/score.dart';

class MatchScreen extends ConsumerWidget {
  const MatchScreen({
    Key? key,
    required this.matchId,
  }) : super(key: key);
  final String matchId;

  String statusText(
      Match match, Player myPlayer, Player otherPlayer, bool isPlayersTurn) {
    if (match.state == GameState.finished) {
      if (calculateTotalScore(myPlayer) > calculateTotalScore(otherPlayer)) {
        return "You won!";
      } else if (calculateTotalScore(myPlayer) <
          calculateTotalScore(otherPlayer)) {
        return "You lost!";
      } else {
        return "It's a tie!";
      }
    } else {
      return "${isPlayersTurn ? 'Your' : 'Opponent\'s'} Turn";
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final matchScreenController = ref.watch(matchScreenControllerProvider);
    final matchAsyncValue = ref.watch(matchStreamProvider(matchId));
    final user = ref.watch(authUserProvider);

    return Scaffold(
      body: Center(
        child: user.when(
          data: (user) {
            matchScreenController.init(
              matchId: matchId,
              user: user,
              ref: ref,
            );
            return matchAsyncValue.when(
              data: (match) {
                if (matchScreenController.user.uid != match.player1?.id &&
                    matchScreenController.user.uid != match.player2?.id) {
                  matchScreenController.joinMatch();
                }
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: OpponentBoard(
                        player: matchScreenController.otherPlayer(match),
                        match: match,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Text(
                        statusText(
                          match,
                          matchScreenController.myPlayer(match)!,
                          matchScreenController.otherPlayer(match)!,
                          matchScreenController.isPlayersTurn(match),
                        ),
                      ),
                    ),
                    Expanded(
                      child: PlayerBoard(
                        player: matchScreenController.myPlayer(match),
                        match: match,
                      ),
                    ),
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
