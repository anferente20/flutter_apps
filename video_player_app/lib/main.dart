import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player_app/config/theme/app_theme.dart';
import 'package:video_player_app/features/video_post/datasource/local_video_datasource_impl.dart';
import 'package:video_player_app/features/video_post/repository/video_post_repository.dart';
import 'package:video_player_app/features/video_post/repository/video_post_repository_impl.dart';
import 'package:video_player_app/presentation/features/screens/discover/discover_screen.dart';
import 'package:video_player_app/features/video_post/provider/video_post_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final videoPostRepository =
        VideoPostRepositoryImpl(videoPostDatasource: LocalVideoDatasourceImpl());

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            lazy: false,
            create: (_) =>
                VideoPostProvider(videoPostRepository: videoPostRepository)..loadNextPage())
      ],
      child: MaterialApp(
          title: 'Material App',
          debugShowCheckedModeBanner: false,
          theme: AppTheme().theme(),
          home: const DiscoverScreen()),
    );
  }
}
