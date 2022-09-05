import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:knucklebones/home/home_screen.dart';
import 'package:knucklebones/match/match_screen.dart';

final GoRouter router = GoRouter(routes: <GoRoute>[
  GoRoute(
    path: '/',
    builder: (BuildContext context, GoRouterState state) {
      return const HomeScreen();
    },
  ),
  GoRoute(
    path: '/match/:id',
    builder: (BuildContext context, GoRouterState state) {
      return MatchScreen(matchId: state.params['id']!);
    },
  ),
], urlPathStrategy: UrlPathStrategy.path);
