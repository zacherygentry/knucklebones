import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int? playerRoll;
  int? computerRoll;

  void playerRollDice() {
    setState(() {
      playerRoll = Random().nextInt(6) + 1;
    });
  }

  void computerRollDice() {
    setState(() {
      computerRoll = Random().nextInt(6) + 1;
    });
  }

  List<List<int?>> playerGameState = [
    [null, null, null],
    [null, null, null],
    [null, null, null]
  ];

  List<List<int?>> computerGameState = [
    [null, null, null],
    [null, null, null],
    [null, null, null]
  ];

  void addPlayerRoll(int roll, int column) {
    for (int i = 0; i < 3; i++) {
      if (playerGameState[i][column] == null) {
        setState(() {
          playerGameState[i][column] = roll;
        });
        break;
      }
    }
  }

  void addComputerRoll(int roll, int column) {
    for (int i = 0; i < 3; i++) {
      if (computerGameState[i][column] == null) {
        setState(() {
          computerGameState[i][column] = roll;
        });
        break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Column(
                  children: [
                    Text("Opponent"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int i = 0; i < 3; i++)
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              for (int j = 0; j < 3; j++)
                                Container(
                                  width: 50,
                                  height: 50,
                                  color: Colors.grey,
                                  child: Center(
                                    child: Text(
                                      computerGameState[j][i] == null
                                          ? ""
                                          : computerGameState[j][i].toString(),
                                    ),
                                  ),
                                ),
                              ElevatedButton(
                                onPressed: () {
                                  // use column index to add roll to playerGameState
                                  addComputerRoll(playerRoll!, i);
                                },
                                child: Text("Add here"),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Column(
                  children: [
                    const Text("Active Player"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int i = 0; i < 3; i++)
                          Column(
                            children: [
                              for (int j = 0; j < 3; j++)
                                Container(
                                  width: 50,
                                  height: 50,
                                  color: Colors.grey,
                                  child: Center(
                                    child: Text(
                                      playerGameState[j][i] == null
                                          ? ""
                                          : playerGameState[j][i].toString(),
                                    ),
                                  ),
                                ),
                              ElevatedButton(
                                onPressed: () {
                                  // use column index to add roll to playerGameState
                                  addPlayerRoll(playerRoll!, i);
                                },
                                child: Text("Add here"),
                              ),
                            ],
                          ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: playerRollDice,
                      child: const Text("Roll"),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      height: 50 * 1.33,
                      width: 50 * 1.33,
                      decoration: BoxDecoration(
                        border: Border.all(),
                      ),
                      child: Center(
                        child: Text(
                          playerRoll?.toString() ?? '',
                          style: const TextStyle(fontSize: 50),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
