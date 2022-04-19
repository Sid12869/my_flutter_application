class Video {}

class SearchVideo {
  final SearchVideoId id;

  const SearchVideo({
    required this.id,
  });

  factory SearchVideo.fromJson(Map<String, dynamic> json) {
    return SearchVideo(
      id: SearchVideoId.fromJson(json['id']),
    );
  }
}

class SearchVideoList {
  final List<SearchVideo> items;

  const SearchVideoList({
    required this.items,
  });

  factory SearchVideoList.fromJson(Map<String, dynamic> json) {
    var list = json['items'] as List;
    var searchedVideos = SearchVideoList(
        items: list.map((i) => SearchVideo.fromJson(i)).toList());
    return searchedVideos;
  }
}

class SearchVideoId {
  final String videoId;

  const SearchVideoId({
    required this.videoId,
  });

  factory SearchVideoId.fromJson(Map<String, dynamic> json) {
    return SearchVideoId(
      videoId: json['videoId'],
    );
  }
}
