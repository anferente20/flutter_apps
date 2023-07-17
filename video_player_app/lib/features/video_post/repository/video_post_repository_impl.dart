import 'package:video_player_app/domain/entities/video_post.dart';
import 'package:video_player_app/features/video_post/datasource/video_post_datasource.dart';
import 'package:video_player_app/features/video_post/repository/video_post_repository.dart';

class VideoPostRepositoryImpl extends VideoPostRepository {
  VideoPostDatasource videoPostDatasource;

  VideoPostRepositoryImpl({required this.videoPostDatasource});

  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userID) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) {
    return videoPostDatasource.getTrendingVideosByPage(page);
  }
}
