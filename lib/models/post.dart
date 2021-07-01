class Post {
  int userId;
  late DateTime postedAt;
  String content;
  List<int> likedUserIds;
  List<int> bookmarkedUserIds;
  String? mood;
  int numberOfComments;

  Post({
    required this.userId,
    required this.content,
    this.likedUserIds = const [],
    this.bookmarkedUserIds = const [],
    this.mood,
    this.numberOfComments = 0,
  }) {
    //? Dummy timestamp
    DateTime now = DateTime.now();
    this.postedAt = now.subtract(Duration(minutes: 24));
  }
}
