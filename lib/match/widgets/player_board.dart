import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:knucklebones/match/widgets/score_column.dart';
import 'package:knucklebones/models/player/player.dart';
import 'package:knucklebones/services/database.dart';

class PlayerBoard extends ConsumerWidget {
  const PlayerBoard({Key? key, required this.player}) : super(key: key);
  final Player? player;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final database = ref.watch(databaseProvider);

    return Stack(
      children: [
        Column(
          children: [
            Text("Current Roll: ${player?.currentRoll ?? ''}"),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Roll'),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScoreColumn(scores: player?.column1 ?? []),
            const SizedBox(width: 48),
            ScoreColumn(scores: player?.column2 ?? []),
            const SizedBox(width: 48),
            ScoreColumn(scores: player?.column3 ?? []),
          ],
        ),
      ],
    );
  }
}
