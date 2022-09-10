import 'package:flutter/material.dart';
import 'package:knucklebones/match/widgets/score_column.dart';
import 'package:knucklebones/match/widgets/total_score_text.dart';
import 'package:knucklebones/models/match/match.dart';
import 'package:knucklebones/models/player/player.dart';

class OpponentBoard extends StatelessWidget {
  const OpponentBoard({Key? key, required this.player, required this.match})
      : super(key: key);
  final Player? player;
  final Match match;

  @override
  Widget build(BuildContext context) {
    if (player == null) {
      return const Text(
        "Waiting for opponent...",
        style: TextStyle(fontSize: 24),
      );
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScoreColumn(
              scores: player?.column1 ?? [],
              columnNumber: 1,
              match: match,
            ),
            const SizedBox(width: 48),
            ScoreColumn(
              scores: player?.column2 ?? [],
              columnNumber: 2,
              match: match,
            ),
            const SizedBox(width: 48),
            ScoreColumn(
              scores: player?.column3 ?? [],
              columnNumber: 3,
              match: match,
            ),
          ],
        ),
        const SizedBox(height: 8),
        TotalScoreText(player: player!),
      ],
    );
  }
}
