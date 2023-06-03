import 'package:final_project/utils/newTweet.dart';
import 'package:final_project/views/homepage/HomeScreen.dart';
import 'package:final_project/views/profile/Profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../NotificationScreen/NotificationScreen.dart';
import '../SearchScreen/SearchScreen.dart';

class FeedScreen extends StatefulWidget {
  final String currentUsedId;

  const FeedScreen({super.key, required this.currentUsedId});

  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  int _selectedTab = 0;
  @override
  void initState() {
    print("inside feed");
    print(widget.currentUsedId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        HomeScreen(
          currentUserId: widget.currentUsedId,
        ),
        SearchScreen(
          currentUserId: widget.currentUsedId,
        ),
        NotificationsScreen(
          currentUserId: widget.currentUsedId,
        ),
        Profile(
          currentUserId: widget.currentUsedId,
          visitedUserId: widget.currentUsedId,
        ),
      ].elementAt(_selectedTab),
      bottomNavigationBar: CupertinoTabBar(
          onTap: (index) {
            setState(() {
              _selectedTab = index;
            });
          },
          activeColor: Colors.blue,
          currentIndex: _selectedTab,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home)),
            BottomNavigationBarItem(icon: Icon(Icons.search)),
            BottomNavigationBarItem(icon: Icon(Icons.notifications)),
            BottomNavigationBarItem(icon: Icon(Icons.person)),
          ]),
    );
  }
}
