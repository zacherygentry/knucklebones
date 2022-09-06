import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authUserProvider = FutureProvider((ref) async {
  final user = await FirebaseAuth.instance.signInAnonymously();

  return user.user!;
});
