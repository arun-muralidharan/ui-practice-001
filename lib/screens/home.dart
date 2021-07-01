import 'package:about_life/data/posts.dart';
import 'package:about_life/controllers/homeController.dart';
import 'package:about_life/widgets/layout.dart';
import 'package:about_life/widgets/people.dart';
import 'package:about_life/widgets/post_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  HomeController _homeController = Get.put(HomeController());
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 3,
      vsync: this,
      initialIndex: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: GetBuilder<HomeController>(
        builder: (_homeController) => Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              "Hello ${_homeController.user.firstName}!  \u{1F970}",
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            Text(
              "What's bothering you?",
              style: Theme.of(context)
                  .textTheme
                  .subtitle2
                  ?.copyWith(color: Theme.of(context).disabledColor),
            ),
            SizedBox(height: 36),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image.network(
                    _homeController.user.imageURI ??
                        "https://via.placeholder.com/100x100",
                    height: 66,
                    width: 66,
                  ),
                ),
                SizedBox(width: 24),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Share anything you want.',
                      hintStyle: Theme.of(context)
                          .textTheme
                          .subtitle2
                          ?.copyWith(color: Theme.of(context).disabledColor),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[900],
                      contentPadding: const EdgeInsets.all(24),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 36),
            Container(
              height: 100,
              width: double.infinity,
              child: TabBarView(
                controller: _tabController,
                children: [
                  People(people: _homeController.recent()),
                  People(people: _homeController.friends()),
                  People(people: _homeController.newbies()),
                ],
              ),
            ),
            SizedBox(height: 24),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey[850]!,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(24),
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
              child: TabBar(
                controller: _tabController,
                labelColor: Theme.of(context).textTheme.bodyText2?.color,
                unselectedLabelColor:
                    Theme.of(context).textTheme.bodyText2?.color,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Theme.of(context).accentColor,
                ),
                tabs: const [
                  Tab(text: "Recent"),
                  Tab(text: "Friends"),
                  Tab(text: "Newbies"),
                ],
              ),
            ),
            SizedBox(height: 36),
            ...posts.map((_post) => PostCard(post: _post)).toList(),
          ],
        ),
      ),
    );
  }
}
