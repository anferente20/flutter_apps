import 'package:flutter/material.dart';

class CustomExpansionTile extends StatelessWidget {
  const CustomExpansionTile(
      {required this.title, required this.subtitle, required this.information, super.key});
  final String title;
  final String subtitle;
  final List<Widget> information;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(title),
      subtitle: Text(subtitle),
      children: information,
    );
  }
}
