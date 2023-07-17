class VideoPost {
  final String caption;
  final String videoUrl;
  final int likes;
  final int views;

  VideoPost({required this.caption, required this.videoUrl, this.likes = 0, this.views = 0});

  factory VideoPost.fromJson(Map<String, dynamic> json) => VideoPost(
      caption: json['name'],
      videoUrl: json['videoUrl'],
      likes: json['likes'] ?? 0,
      views: json['views'] ?? 0);
}
