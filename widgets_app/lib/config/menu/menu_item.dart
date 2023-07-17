import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subtitle;
  final String link;
  final IconData icon;

  const MenuItem(
      {required this.title, required this.subtitle, required this.link, required this.icon});
}

const AppMenuItems = <MenuItem>[
  MenuItem(
      title: 'Botones',
      subtitle: 'Varios botones de Flutter.',
      link: '/buttons',
      icon: Icons.smart_button_outlined),
  MenuItem(
      title: 'Tarjetas',
      subtitle: 'Variass tarjetas de Flutter.',
      link: '/cards',
      icon: Icons.credit_card_outlined),
];
