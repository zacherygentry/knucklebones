import 'package:flutter/material.dart';

class MatchScreen extends StatefulWidget {
  const MatchScreen({Key? key, required this.matchId}) : super(key: key);
  final String matchId;

  @override
  State<MatchScreen> createState() => _MatchScreenState();
}

class _MatchScreenState extends State<MatchScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Match Screen"),
      ),
    );
  }
}
