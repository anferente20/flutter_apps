import 'package:cinemapp/ui/views/views.dart';
import 'package:cinemapp/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    required this.pageIndex,
    super.key,
  });
  final int pageIndex;

  static const path = 'home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with AutomaticKeepAliveClientMixin {
  late PageController pageController;
  final views = const [HomeView(), FavoritesView(), ConfigurationView()];

  @override
  void initState() {
    super.initState();
    pageController = PageController(keepPage: true);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    if (pageController.hasClients) {
      pageController.animateToPage(
        widget.pageIndex,
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 250),
      );
    }
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(pageIndex: widget.pageIndex),
      body: PageView(
        controller: pageController,
        children: views,
      ),
    );
  }
}
