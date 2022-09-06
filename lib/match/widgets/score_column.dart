import 'package:flutter/material.dart';
import 'package:knucklebones/util/intersperse.dart';
import 'package:knucklebones/util/score.dart';

class ScoreColumn extends StatelessWidget {
  const ScoreColumn({
    Key? key,
    required this.scores,
  }) : super(key: key);
  final List<int> scores;

  @override
  Widget build(BuildContext context) {
    final int columnScore = calculateColumnScore(scores);

    return Column(
      children: [
        Text('${columnScore != 0 ? columnScore : ''}'),
        const SizedBox(height: 8),
        ...intersperse(
          const SizedBox(height: 4),
          scores.map(
            (value) => Container(
              width: 100,
              height: 100,
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
    );
  }
}
