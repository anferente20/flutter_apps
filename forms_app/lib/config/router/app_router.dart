import 'package:forms_app/ui/screens/bloc_counter_screen.dart';
import 'package:forms_app/ui/screens/cubit_counter_screen.dart';
import 'package:forms_app/ui/screens/home_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    path: '/cubits',
    builder: (context, state) => const CubitCounterScreen(),
  ),
  GoRoute(
    path: '/bloc',
    builder: (context, state) => const BlocCounterScreen(),
  )
]);
