import 'package:cinemapp/ui/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
      path: '/',
      name: HomeScreen.path,
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: 'movie/:id',
          name: MovieScreen.path,
          builder: (context, state) {
            final movieID = state.pathParameters['id'] ?? 'no-id';
            return MovieScreen(movieID: movieID);
          },
        ),
      ]),
  GoRoute(
    path: '/theme-selector',
    name: ThemeSelectorScreen.path,
    builder: (context, state) => const ThemeSelectorScreen(),
  ),
]);
