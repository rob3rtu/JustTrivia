import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/screens/home.dart';
import 'package:mobile/screens/login.dart';
import 'package:mobile/screens/profile.dart';

GoRouter goRouter(User? user) {
  return GoRouter(
      initialLocation: "/",
      redirect: (context, state) {
        return user == null ? '/login' : '/';
      },
      routes: <RouteBase>[
        GoRoute(
          name: "login",
          path: '/login',
          builder: (context, state) => const LoginScreen(),
        ),
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
      ]);
}
