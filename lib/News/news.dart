class News {
  final String title;
  final String description;
  final String imageUrl;

  News({this.title, this.description, this.imageUrl});

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      title: json['title'] ?? "",
      description: json['description'] ?? "",
      imageUrl: json['urlToImage'] ?? "",
    );
  }
}
