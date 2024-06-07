import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/navigation/scaffold_with_nav.dart';
import 'package:mobile/screens/home.dart';
import 'package:mobile/screens/login.dart';
import 'package:mobile/screens/match/create_or_join.dart';
import 'package:mobile/screens/match/rules.dart';
import 'package:mobile/screens/profile.dart';
import 'package:mobile/screens/settings.dart';

GoRouter goRouter(User? user) {
  final GlobalKey<NavigatorState> rootNavigatorKey =
      GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> shellNavigatorKey =
      GlobalKey<NavigatorState>();

  return GoRouter(
      navigatorKey: rootNavigatorKey,
      initialLocation: "/",
      redirect: (context, state) {
        return user == null ? '/login' : null;
      },
      routes: <RouteBase>[
        GoRoute(
          name: "login",
          path: '/login',
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          name: "rules",
          path: '/rules',
          builder: (context, state) => RulesScreen(),
        ),
        GoRoute(
          name: "createOrJoin",
          path: '/createOrJoin',
          builder: (context, state) => const CreateOrJoinScreen(),
        ),
        ShellRoute(
            navigatorKey: shellNavigatorKey,
            builder: (context, state, child) {
              return ScaffoldWithNavigation(child: child);
            },
            routes: [
              GoRoute(
                name: "home",
                path: '/',
                builder: (context, state) => const HomeScreen(),
              ),
              GoRoute(
                name: 'profile',
                path: '/profile',
                builder: (context, state) => const ProfileScreen(),
              ),
              GoRoute(
                name: 'settings',
                path: '/settings',
                builder: (context, state) => const SettingsScreen(),
              ),
            ])
      ]);
}
