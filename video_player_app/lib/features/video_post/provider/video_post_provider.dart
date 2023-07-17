import 'package:flutter/material.dart';
import 'package:video_player_app/domain/entities/video_post.dart';
import 'package:video_player_app/features/video_post/repository/video_post_repository.dart';
import 'package:video_player_app/shared/data/local_video_post.dart';

class VideoPostProvider extends ChangeNotifier {
  final VideoPostRepository videoPostRepository;

  bool initialLoading = true;
  List<VideoPost> videos = [];

  VideoPostProvider({required this.videoPostRepository});

  Future<void> loadNextPage() async {
    final newViedeos = await videoPostRepository.getTrendingVideosByPage(1);
    videos.addAll(newViedeos);
    initialLoading = false;
    notifyListeners();
  }
}
