import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subtitle;
  final String link;
  final IconData icon;

  const MenuItem(
      {required this.title, required this.subtitle, required this.link, required this.icon});
}

const List<MenuItem> appMenuItems = <MenuItem>[
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
  MenuItem(
      title: 'Indicadores de progreso',
      subtitle: 'Generales y controlados.',
      link: '/progress',
      icon: Icons.refresh_rounded),
  //      MenuItem(
  //     title: 'Tarjetas',
  //     subtitle: 'Variass tarjetas de Flutter.',
  //     link: '/cards',
  //     icon: Icons.credit_card_outlined),
  // MenuItem(
  //     title: 'Tarjetas',
  //     subtitle: 'Variass tarjetas de Flutter.',
  //     link: '/cards',
  //     icon: Icons.credit_card_outlined),
  // MenuItem(
  //     title: 'Tarjetas',
  //     subtitle: 'Variass tarjetas de Flutter.',
  //     link: '/cards',
  //     icon: Icons.credit_card_outlined),
  // MenuItem(
  //     title: 'Tarjetas',
  //     subtitle: 'Variass tarjetas de Flutter.',
  //     link: '/cards',
  //     icon: Icons.credit_card_outlined),
  // MenuItem(
  //     title: 'Tarjetas',
  //     subtitle: 'Variass tarjetas de Flutter.',
  //     link: '/cards',
  //     icon: Icons.credit_card_outlined),
];
