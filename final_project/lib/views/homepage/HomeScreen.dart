import 'package:flutter/material.dart';

import '../../utils/newTweet.dart';
import '../../services/Models/Tweet.dart';
import '../../services/Models/UserModels.dart';
import "../../utils/TweetContainer.dart";
import "../../services/constants.dart";
import "../../services/DatabaseService.dart";

class HomeScreen extends StatefulWidget {
  final String currentUserId;

  const HomeScreen({super.key, required this.currentUserId});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List _followingTweets = [];
  bool _loading = false;

  buildTweets(Tweet tweet, UserModel author) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: TweetContainer(
        tweet: tweet,
        author: author,
        currentUserId: widget.currentUserId,
      ),
    );
  }

  showFollowingTweets(String currentUserId) {
    List<Widget> followingTweetsList = [];
    for (Tweet tweet in _followingTweets) {
      followingTweetsList.add(FutureBuilder(
          future: usersRef.doc(tweet.authorId).get(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              UserModel author = UserModel.fromDoc(snapshot.data);
              return buildTweets(tweet, author);
            } else {
              return SizedBox.shrink();
            }
          }));
    }
    return followingTweetsList;
  }

  setupFollowingTweets() async {
    setState(() {
      _loading = true;
    });
    List followingTweets =
        await DatabaseService.getHomeTweets(widget.currentUserId);
    if (mounted) {
      setState(() {
        _followingTweets = followingTweets;
        _loading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    setupFollowingTweets();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => NewTweet(
                          currentUserId: widget.currentUserId,
                        )));
          },
          child: Image.asset(
            "lib/assets/newtweet.png",
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.5,
          centerTitle: true,
          leading: Container(
            height: 40,
            child: Image.asset(
              'lib/assets/logo.png',
            ),
          ),
          title: const Text(
            'Feed',
            style: TextStyle(
              color: Colors.blue,
            ),
          ),
        ),
        body: RefreshIndicator(
          onRefresh: () => setupFollowingTweets(),
          child: ListView(
            physics: BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            children: [
              _loading ? LinearProgressIndicator() : SizedBox.shrink(),
              SizedBox(height: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 5),
                  Column(
                    children: _followingTweets.isEmpty && _loading == false
                        ? [
                            SizedBox(height: 5),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 25),
                              child: Text(
                                'There is No New Tweets',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            )
                          ]
                        : showFollowingTweets(widget.currentUserId),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
