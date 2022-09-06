int calculateColumnScore(List<int> scores) {
  int columnScore = 0;
  Map<int, int> scoreMap = {};

  for (int score in scores) {
    if (score == -1) {
      continue;
    }

    if (scoreMap.containsKey(score)) {
      scoreMap[score] = scoreMap[score]! + 1;
    } else {
      scoreMap[score] = 1;
    }
  }

  for (int score in scoreMap.keys) {
    if (scoreMap[score] == 1) {
      columnScore += score;
    } else if (scoreMap[score] == 2) {
      columnScore += score * 4;
    } else if (scoreMap[score] == 3) {
      columnScore += score * 9;
    }
  }

  return columnScore;
}
