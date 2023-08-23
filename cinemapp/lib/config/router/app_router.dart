import 'package:cinemapp/ui/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    path: '/',
    name: HomeScreen.path,
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
      path: '/theme-selector',
      builder: (context, state) => const ThemeSelectorScreen()),
]);
