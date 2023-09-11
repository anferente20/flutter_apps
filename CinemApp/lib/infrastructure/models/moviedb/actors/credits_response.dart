class CreditsResponse {
  final int id;
  final List<Cast> cast;

  CreditsResponse({
    required this.id,
    required this.cast,
  });

  factory CreditsResponse.fromJson(Map<String, dynamic> json) =>
      CreditsResponse(
        id: json["id"],
        cast: List<Cast>.from(json["cast"].map((x) => Cast.fromJson(x))),
      );
}

class Cast {
  final bool adult;
  final int id;
  final String name;
  final String originalName;
  final double popularity;
  final String? profilePath;
  final String? character;
  final int? order;

  Cast({
    required this.adult,
    required this.id,
    required this.name,
    required this.originalName,
    required this.popularity,
    required this.profilePath,
    this.character,
    this.order,
  });

  factory Cast.fromJson(Map<String, dynamic> json) => Cast(
        adult: json["adult"],
        id: json["id"],
        name: json["name"],
        originalName: json["original_name"],
        popularity: json["popularity"]?.toDouble(),
        profilePath: json["profile_path"],
        character: json["character"],
        order: json["order"],
      );
}
