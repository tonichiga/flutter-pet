class MovieModel {
  final String? title;
  final String? duration;
  final String? rating;
  final String? url;
  final ImageModel? images;

  MovieModel({this.title, this.duration, this.rating, this.url, this.images});

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      title: json['title'],
      duration: json['duration'],
      rating: json['rating'],
      url: json['url'],
      images: json['images']['jpg'] as ImageModel,
    );
  }
}

class ImageModel {
  final String? imageUrl;
  final String? smallImageUrl;
  final String? largeImageUrl;

  ImageModel({this.imageUrl, this.smallImageUrl, this.largeImageUrl});
}
