import 'package:about_life/controllers/homeController.dart';
import 'package:about_life/models/person.dart';
import 'package:about_life/models/post.dart';
import 'package:about_life/providers/users.dart';
import 'package:about_life/utils/post_card_clipper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostCard extends StatelessWidget {
  PostCard({Key? key, required this.post}) : super(key: key);

  final Post post;
  final HomeController _homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    Person? user = getUser(post.userId);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey[800]!,
              width: 2,
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
            gradient: LinearGradient(
              colors: [
                Colors.grey[800]!,
                Colors.grey[850]!,
                Colors.grey[900]!,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
              stops: [0, 0.3, 1],
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(user?.imageURI ??
                                "https://via.placeholder.com/100x100"),
                          ),
                        ),
                      ),
                      SizedBox(width: 24),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              (user?.firstName ?? "") +
                                  " " +
                                  (user?.secondName ?? ""),
                              style: Theme.of(context).textTheme.headline6),
                          SizedBox(height: 6),
                          Text(getTimeString(post.postedAt),
                              style: Theme.of(context).textTheme.overline),
                        ],
                      ),
                    ],
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(18),
                      onTap: () {},
                      child: Ink(
                        height: 45,
                        width: 60,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey[850]!,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Icon(Icons.more_horiz),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 24),
              Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  height: 76,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        _homeController.toggleLikePost(post);
                      },
                      child: Ink(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.favorite,
                              color: post.likedUserIds
                                      .contains(_homeController.user.id)
                                  ? Theme.of(context).accentColor
                                  : null,
                            ),
                            SizedBox(width: 12),
                            Text(post.likedUserIds.length.toString()),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          transform: Matrix4.translationValues(0, -100, 0),
          child: ClipPath(
            clipper: PostCardClipper(),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                    Color.fromARGB(70, 0, 0, 0),
                    BlendMode.darken,
                  ),
                  image: AssetImage("images/PostBG.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(12),
                          child: Ink(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 18,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white24,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(post.mood ?? ""),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 48),
                  Text(post.content),
                  SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(12),
                          child: Ink(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 18,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.black26,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.chat_bubble_rounded),
                                SizedBox(width: 12),
                                Text(post.numberOfComments.toString() +
                                    " Comments"),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            _homeController.toggleBookmarkPost(post);
                          },
                          child: Ink(
                            padding: const EdgeInsets.all(12),
                            child: post.bookmarkedUserIds
                                    .contains(_homeController.user.id)
                                ? Icon(
                                    Icons.bookmark_rounded,
                                    color: Theme.of(context).primaryColor,
                                  )
                                : Icon(Icons.bookmark_border_rounded),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  String getTimeString(DateTime postedAt) {
    Duration duration = DateTime.now().difference(postedAt);
    if (duration.inDays > 0)
      return duration.inDays.toString() + " days ago";
    else if (duration.inHours > 0)
      return duration.inHours.toString() + " hours ago";
    else if (duration.inMinutes > 0)
      return duration.inMinutes.toString() + " minutes ago";
    else
      return duration.inSeconds.toString() + " seconds ago";
  }
}
