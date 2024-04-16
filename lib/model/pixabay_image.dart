class PixabayImage {
  final int id;
  // final String pageURL;
  // final String type;
  // final List<String> tags;
  final String previewURL;
  // final int previewWidth;
  // final int previewHeight;
  // final String webformatURL;
  // final int webformatWidth;
  // final int webformatHeight;
  final String largeImageURL;
  // final String fullHDURL;
  // final String imageURL;
  // final int imageWidth;
  // final int imageHeight;
  // final int imageSize;
  final int views;
  // final int downloads;
  final int likes;
  // final int comments;
  // final int userId;
  // final String user;
  // final String userImageURL;

  PixabayImage({
    required this.id,
    // required this.pageURL,
    // required this.type,
    // required this.tags,
    required this.previewURL,
    // required this.previewWidth,
    // required this.previewHeight,
    // required this.webformatURL,
    // required this.webformatWidth,
    // required this.webformatHeight,
    required this.largeImageURL,
    // required this.fullHDURL,
    // required this.imageURL,
    // required this.imageWidth,
    // required this.imageHeight,
    // required this.imageSize,
    required this.views,
    // required this.downloads,
    required this.likes,
    // required this.comments,
    // required this.userId,
    // required this.user,
    // required this.userImageURL,
  });

  factory PixabayImage.fromJson(Map<String, dynamic> json) => PixabayImage(
        id: json['id'] as int,
        // pageURL: json['pageURL'] as String,
        // type: json['type'] as String,
        // // tags: (json['tags'] as List<dynamic>).cast<String>(),
        previewURL: json['previewURL'] as String,
        // previewWidth: json['previewWidth'] as int,
        // previewHeight: json['previewHeight'] as int,
        // webformatURL: json['webformatURL'] as String,
        // webformatWidth: json['webformatWidth'] as int,
        // webformatHeight: json['webformatHeight'] as int,
        largeImageURL: json['largeImageURL'] as String,
        // fullHDURL: json['fullHDURL'] as String,
        // imageURL: json['imageURL'] as String,
        // imageWidth: json['imageWidth'] as int,
        // imageHeight: json['imageHeight'] as int,
        // imageSize: json['imageSize'] as int,
        views: json['views'] as int,
        // downloads: json['downloads'] as int,
        likes: json['likes'] as int,
        // comments: json['comments'] as int,
        // userId: json['user_id'] as int,
        // user: json['user'] as String,
        // userImageURL: json['userImageURL'] as String,
      );
}
