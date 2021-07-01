import 'package:flutter/material.dart';

class Layout extends StatelessWidget {
  Layout({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: Container(
          margin: const EdgeInsets.fromLTRB(24, 45, 24, 15),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).scaffoldBackgroundColor,
                spreadRadius: 24,
                blurRadius: 24,
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "About\nlife",
                style: TextStyle(
                  fontFamily: 'DancingScript',
                  fontSize: 30,
                  letterSpacing: 1.2,
                  height: 0.85,
                ),
              ),
              Row(
                children: [
                  actionIcon(child: Icon(Icons.search)),
                  actionIcon(
                    child: RotationTransition(
                      turns: AlwaysStoppedAnimation(45 / 360),
                      child: Icon(Icons.grid_view_rounded),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
          child: child,
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).scaffoldBackgroundColor,
              spreadRadius: 24,
              blurRadius: 24,
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            bottomNavSecondary(
              child: Icon(
                Icons.home_rounded,
                color: Theme.of(context).primaryColor,
              ),
            ),
            bottomNavSecondary(
              child: Icon(Icons.chat_rounded),
            ),
            bottomNavPrimary(
              context,
              child: Icon(Icons.add),
            ),
            bottomNavSecondary(
              child: Icon(Icons.notifications_rounded),
            ),
            bottomNavSecondary(
              child: Icon(Icons.person_rounded),
            ),
          ],
        ),
      ),
    );
  }

  Widget actionIcon({required Widget child, Function? callback}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(24),
          onTap: () => callback,
          child: Ink(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey[900]!,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(24),
            ),
            child: child,
          ),
        ),
      ),
    );
  }

  Widget bottomNavPrimary(BuildContext context,
      {required Widget child, Function? callback}) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(60),
        onTap: () => callback,
        child: Ink(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                Theme.of(context).primaryColor,
                Theme.of(context).accentColor,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: child,
        ),
      ),
    );
  }

  Widget bottomNavSecondary({required Widget child, Function? callback}) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        onTap: () => callback,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: child,
        ),
      ),
    );
  }
}
