import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:knucklebones/match/match_screen_controller.dart';
import 'package:knucklebones/models/match/match.dart';
import 'package:knucklebones/util/intersperse.dart';

class ScoreColumn extends ConsumerWidget {
  const ScoreColumn({
    Key? key,
    required this.scores,
    required this.columnNumber,
    required this.match,
  }) : super(key: key);
  final List<int> scores;
  final Match match;
  final int columnNumber;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final matchScreenController = ref.watch(matchScreenControllerProvider);

    return Column(
      children: [
        InkWell(
          onTap: matchScreenController
                      .myPlayerColumn(match, columnNumber)
                      .where((n) => n != -1)
                      .length ==
                  3
              ? null
              : () => matchScreenController.addRollToColumn(
                    match,
                    matchScreenController.myPlayer(match)!.currentRoll,
                    columnNumber,
                  ),
          child: Column(
            children: [
              ...intersperse(
                const SizedBox(height: 4),
                scores.map(
                  (value) => Container(
                    width: 75,
                    height: 75,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        value != -1 ? '$value' : '',
                        style: const TextStyle(
                          fontSize: 48,
                        ),
                      ),
                    ),
                  ),
                ),
              ).toList()
            ],
          ),
        )
      ],
    );
  }
}
