import 'package:final_project/utils/tweet.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        HomeScreen(),
        SearchScreen(),
        NotificationScreen(),
        Profile(
          currentUserId: widget.currentUsedId,
          visitedUserId: widget.currentUsedId,
        ),
      ].elementAt(_selectedTab),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.push(
      //         context, MaterialPageRoute(builder: (context) => NewTweet()));
      //   },
      //   child: Image.asset(
      //     "lib/assets/newtweet.png",
      //   ),
      // ),
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
