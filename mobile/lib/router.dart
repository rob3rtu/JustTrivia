import 'package:go_router/go_router.dart';
import 'package:mobile/screens/home.dart';
import 'package:mobile/screens/login.dart';
import 'package:mobile/screens/profile.dart';

GoRouter goRouter() {
  return GoRouter(
      initialLocation: "/",
      redirect: (context, state) {
        //subject to change
        const isAuthenticated = false;

        return !isAuthenticated ? '/login' : null;
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
