import 'package:cinemapp/ui/providers/providers.dart';
import 'package:cinemapp/ui/widgets/shared/appbar/custom_appbar.dart';
import 'package:cinemapp/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const path = 'home-screen';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeView(),
    );
  }
}

class HomeView extends ConsumerStatefulWidget {
  const HomeView({
    super.key,
  });

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    return nowPlayingMovies.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : Column(
            children: [
              const CustomAppbar(),
              MoviesSlideshow(movies: nowPlayingMovies)
            ],
          );
  }
}
