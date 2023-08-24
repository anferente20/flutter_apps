import 'package:flutter/material.dart';

class MovieScreen extends StatelessWidget {
  static const path = '/movie/';
  final String movieID;

  const MovieScreen({required this.movieID, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('MovieID: $movieID')),
    );
  }
}
