import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_item.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key, required this.menuOptions, required this.scaffoldKey});
  final List<MenuItem> menuOptions;
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;

    return NavigationDrawer(
        selectedIndex: navDrawerIndex,
        onDestinationSelected: (value) {
          setState(() {
            navDrawerIndex = value;
          });
          context.push(widget.menuOptions[value].link);
          widget.scaffoldKey.currentState?.closeDrawer();
        },
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(30, hasNotch ? 5 : 15, 20, 10),
            child: const Text('Menu'),
          ),
          ...widget.menuOptions.sublist(0, 3).map((item) =>
              NavigationDrawerDestination(icon: Icon(item.icon), label: Text(item.title))),
          const Padding(
            padding: EdgeInsets.fromLTRB(30, 20, 30, 10),
            child: Divider(),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(30, hasNotch ? 5 : 15, 20, 10),
            child: const Text('More options'),
          ),
          ...widget.menuOptions.sublist(3).map((item) =>
              NavigationDrawerDestination(icon: Icon(item.icon), label: Text(item.title))),
          const Padding(
            padding: EdgeInsets.fromLTRB(30, 20, 30, 10),
            child: Divider(),
          )
        ]);
  }
}
