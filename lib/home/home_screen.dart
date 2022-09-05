import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:knucklebones/home/widgets/create_join_button.dart';
import 'package:knucklebones/services/database.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final database = ref.watch(databaseProvider);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Knucklebones",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            CreateJoinButton(
              text: 'Create a Match',
              onPressed: () async {
                final userCredential =
                    await FirebaseAuth.instance.signInAnonymously();

                database.createMatch(userCredential.user!.uid).then(
                      (key) => GoRouter.of(context).go('/match/$key'),
                    );
              },
            ),
          ],
        ),
      ),
    );
  }
}
