import 'package:cinemapp/domain/entities/video/video.dart';
import 'package:cinemapp/infrastructure/models/moviedb/video/movie_video_response.dart';

class VideoMapper {
  static moviedbVideoToEntity(Result moviedbVideo) => Video(
      id: moviedbVideo.id,
      name: moviedbVideo.name,
      youtubeKey: moviedbVideo.key,
      publishedAt: moviedbVideo.publishedAt);
}
