import 'package:firebase_auth/firebase_auth.dart';
import 'package:knucklebones/models/match/match.dart';

class MatchScreenController {
  MatchScreenController({required this.match, required this.user});
  final Match match;
  final User? user;
}
