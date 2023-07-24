import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_item.dart';
import 'package:widgets_app/presentation/widgets/drawers/side_menu.dart';
import 'package:widgets_app/presentation/widgets/texts/custom_list_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sccafoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: sccafoldKey,
      appBar: AppBar(
        title: const Text('Flutter + Material3'),
      ),
      body: const HomeView(),
      drawer: SideMenu(menuOptions: appMenuItems, scaffoldKey: sccafoldKey),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const menuItems = appMenuItems;

    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: menuItems.length,
      itemBuilder: (context, index) {
        return CustomListTile(
          menuItem: menuItems[index],
          onTap: () {
            context.push(menuItems[index].link);
          },
        );
      },
    );
  }
}
