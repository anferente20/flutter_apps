import 'package:cinemapp/ui/views/views.dart';
import 'package:cinemapp/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    required this.pageIndex,
    super.key,
  });
  final int pageIndex;

  static const path = 'home-screen';
  final views = const [HomeView(), SizedBox(), FavoritesView(), ConfigurationView()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(pageIndex: pageIndex),
      body: IndexedStack(
        index: pageIndex,
        children: views,
      ),
    );
  }
}
