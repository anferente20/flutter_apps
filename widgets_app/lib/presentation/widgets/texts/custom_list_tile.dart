import 'package:flutter/material.dart';
import 'package:widgets_app/config/menu/menu_item.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({super.key, required this.menuItem, required this.onTap});

  final MenuItem menuItem;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      children: [
        ListTile(
          leading: Icon(menuItem.icon, color: colors.primary),
          onTap: onTap,
          subtitle: Text(menuItem.subtitle),
          title: Text(menuItem.title),
          trailing: Icon(Icons.arrow_forward_ios_outlined, color: colors.primary),
        ),
        const Divider(
          endIndent: 10,
          indent: 10,
          thickness: 2,
        )
      ],
    );
  }
}
