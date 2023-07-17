import 'package:video_player_app/domain/entities/video_post.dart';
import 'package:video_player_app/features/video_post/datasource/video_post_datasource.dart';
import 'package:video_player_app/shared/data/local_video_post.dart';

class LocalVideoDatasourceImpl extends VideoPostDatasource {
  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userID) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) async {
    await Future.delayed(const Duration(seconds: 2));
    final List<VideoPost> newViedeos = videoPosts.map((e) => VideoPost.fromJson(e)).toList();

    return newViedeos;
  }
}
