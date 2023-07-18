import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/screens/screeens.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
  GoRoute(path: '/buttons', builder: (context, state) => const ButtonsScreen()),
  GoRoute(path: '/cards', builder: (context, state) => const CardsScreen()),
  GoRoute(path: '/animated', builder: (context, state) => const AnimatedScreen()),
  GoRoute(path: '/app-tutorial', builder: (context, state) => const AppTutorialScreen()),
  GoRoute(path: '/cards', builder: (context, state) => const CardsScreen()),
  GoRoute(path: '/infinite', builder: (context, state) => const InfiniteScrollScreen()),
  GoRoute(path: '/progress', builder: (context, state) => const ProgressScreen()),
  GoRoute(path: '/snackbar', builder: (context, state) => const SnackbarScreen()),
  GoRoute(path: '/ui-control', builder: (context, state) => const UIControlScreen()),
]);
