class Anime {
  final String id;
  final String title;
  final String description;
  final String director;
  final String image;
  final String movieBanner;

  const Anime({
    required this.id,
    required this.title,
    required this.description,
    required this.director,
    required this.image,
    required this.movieBanner
  });

  factory Anime.fromJson(Map<String, dynamic> json) {
    return Anime(
      id: json['id'], 
      title: json['title'], 
      description: json['description'], 
      director: json['director'],
      image: json['image'],
      movieBanner: json['movie_banner']
    );
  }
}