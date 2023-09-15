import 'package:cinemapp/ui/screens/movies/tv_show/tv_show_screen.dart';
import 'package:cinemapp/ui/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/home/0',
  routes: [
    GoRoute(
      path: '/home/:page',
      name: HomeScreen.path,
      builder: (context, state) => HomeScreen(
        pageIndex: int.parse(state.pathParameters['page'] ?? '0'),
      ),
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
  ],
);
