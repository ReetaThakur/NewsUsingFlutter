


class Sources {
  String id;
  String name;
  String description;
  String url;
  String category;
  String language;
  String country;

  Sources({
    required this.id,
    required this.name,
    required this.description,
    required this.url,
    required this.category,
    required this.language,
    required this.country
});

  factory Sources.fromJson(Map<String, dynamic> json){
    return Sources(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      url: json['url'] as String,
      category: json['category'] as String,
      language: json['language'] as String,
      country: json['country'] as String
    );
  }

}