import 'package:cinemapp/ui/screens/movies/tv_show/tv_show_screen.dart';
import 'package:cinemapp/ui/screens/screens.dart';
import 'package:cinemapp/ui/views/views.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return HomeScreen(childView: child);
      },
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) {
            return const HomeView();
          },
          routes: [
            GoRoute(
              path: 'movie/:id',
              name: MovieScreen.path,
              builder: (context, state) {
                final movieID = state.pathParameters['id'] ?? 'no-id';
                return MovieScreen(movieID: movieID);
              },
            ),
            GoRoute(
              path: 'tv-show/:id',
              name: TvShowScreen.path,
              builder: (context, state) {
                final tvShowID = state.pathParameters['id'] ?? 'no-id';
                return TvShowScreen(tvShowID: tvShowID);
              },
            ),
          ],
        ),
        GoRoute(
          path: '/favorites',
          builder: (context, state) {
            return const FavoritesView();
          },
        ),
        GoRoute(
          path: '/configuration',
          builder: (context, state) {
            return const ConfigurationView();
          },
        ),
      ],
    ),
  ],
);
