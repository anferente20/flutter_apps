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
    title: 'Riverpod Counter',
    subtitle: 'Contador con Riverpod.',
    link: '/counter',
    icon: Icons.add,
  ),
  MenuItem(
    title: 'Theme Selector',
    subtitle: 'Cambio de preferencias de tema.',
    link: '/theme-selector',
    icon: Icons.color_lens_outlined,
  ),
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
  MenuItem(
      title: 'Snackbars y diáloos',
      subtitle: 'Mensajes en pantalla.',
      link: '/snackbar',
      icon: Icons.info_outline_rounded),
  MenuItem(
      title: 'Animaciones',
      subtitle: 'Statefull Widget animado.',
      link: '/animated',
      icon: Icons.check_box_outline_blank_outlined),
  MenuItem(
      title: 'UI Controls',
      subtitle: 'Controles de flutter.',
      link: '/ui-control',
      icon: Icons.car_rental_outlined),
  MenuItem(
      title: 'Onboarding',
      subtitle: '¿Ya sabes cómo usar nuestra app?.',
      link: '/app-tutorial',
      icon: Icons.abc_outlined),
  MenuItem(
      title: 'Infinite Scroll',
      subtitle: 'Imágenes variadas.',
      link: '/infinite',
      icon: Icons.list_alt_rounded),
];
