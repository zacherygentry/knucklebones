import 'package:flutter/material.dart';
import 'package:knucklebones/models/player/player.dart';
import 'package:knucklebones/util/score.dart';

class TotalScoreText extends StatelessWidget {
  const TotalScoreText({Key? key, required this.player}) : super(key: key);
  final Player player;

  @override
  Widget build(BuildContext context) {
    return Text(
      "Total Score: ${calculateTotalScore(player)}",
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
