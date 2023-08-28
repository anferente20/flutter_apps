class StreamingProvidersResponse {
  final int id;
  final Results results;

  StreamingProvidersResponse({
    required this.id,
    required this.results,
  });

  factory StreamingProvidersResponse.fromJson(Map<String, dynamic> json) =>
      StreamingProvidersResponse(
        id: json["id"],
        results: Results.fromJson(json["results"]),
      );
}

class Results {
  final Map<String, Country> countries;

  Results({required this.countries});

  factory Results.fromJson(Map<String, dynamic> json) {
    Map<String, Country> countries = {};
    json.forEach((key, value) {
      countries.addAll({key: Country.fromJson(value)});
    });
    return Results(countries: countries);
  }
}

class Country {
  final String link;
  final List<MovieResult>? flatrate;
  final List<MovieResult>? rent;
  final List<MovieResult>? buy;
  final List<MovieResult>? ads;

  Country({
    required this.link,
    this.flatrate,
    this.rent,
    this.buy,
    this.ads,
  });

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        link: json["link"],
        flatrate: json["flatrate"] == null
            ? []
            : List<MovieResult>.from(
                json["flatrate"]!.map((x) => MovieResult.fromJson(x))),
        rent: json["rent"] == null
            ? []
            : List<MovieResult>.from(
                json["rent"]!.map((x) => MovieResult.fromJson(x))),
        buy: json["buy"] == null
            ? []
            : List<MovieResult>.from(
                json["buy"].map((x) => MovieResult.fromJson(x))),
        ads: json["ads"] == null
            ? []
            : List<MovieResult>.from(
                json["ads"]!.map((x) => MovieResult.fromJson(x))),
      );
}

class MovieResult {
  final String? logoPath;
  final int providerId;
  final String providerName;
  final int displayPriority;

  MovieResult({
    this.logoPath,
    required this.providerId,
    required this.providerName,
    required this.displayPriority,
  });

  factory MovieResult.fromJson(Map<String, dynamic> json) => MovieResult(
        logoPath: json["logo_path"],
        providerId: json["provider_id"],
        providerName: json["provider_name"],
        displayPriority: json["display_priority"],
      );

  Map<String, dynamic> toJson() => {
        "logo_path": logoPath,
        "provider_id": providerId,
        "provider_name": providerName,
        "display_priority": displayPriority,
      };
}
