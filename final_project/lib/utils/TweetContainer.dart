import 'package:flutter/material.dart';
import '../services/Models/Tweet.dart';
import '../services/Models/UserModels.dart';
import '../services/DatabaseService.dart';

class TweetContainer extends StatefulWidget {
  final Tweet tweet;
  final UserModel author;
  final String currentUserId;

  const TweetContainer(
      {super.key,
      required this.tweet,
      required this.author,
      required this.currentUserId});
  @override
  _TweetContainerState createState() => _TweetContainerState();
}

class _TweetContainerState extends State<TweetContainer> {
  int _likesCount = 0;
  bool _isLiked = false;

  initTweetLikes() async {
    bool isLiked =
        await DatabaseService.isLikeTweet(widget.currentUserId, widget.tweet);
    if (mounted) {
      setState(() {
        _isLiked = isLiked;
      });
    }
  }

  likeTweet() {
    if (_isLiked) {
      DatabaseService.unlikeTweet(widget.currentUserId, widget.tweet);
      setState(() {
        _isLiked = false;
        _likesCount--;
      });
    } else {
      DatabaseService.likeTweet(widget.currentUserId, widget.tweet);
      setState(() {
        _isLiked = true;
        _likesCount++;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _likesCount = widget.tweet.likes;
    initTweetLikes();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: widget.author.profilePicture.isEmpty
                    ? AssetImage('assets/placeholder.png') as ImageProvider
                    : NetworkImage(widget.author.profilePicture),
              ),
              SizedBox(width: 10),
              Text(
                widget.author.name,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          Text(
            widget.tweet.text,
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          widget.tweet.image.isEmpty
              ? SizedBox.shrink()
              : Column(
                  children: [
                    SizedBox(height: 15),
                    Container(
                      height: 250,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(widget.tweet.image),
                          )),
                    )
                  ],
                ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      _isLiked ? Icons.favorite : Icons.favorite_border,
                      color: _isLiked ? Colors.blue : Colors.black,
                    ),
                    onPressed: likeTweet,
                  ),
                  Text(
                    _likesCount.toString() + ' Likes',
                  ),
                ],
              ),
              Text(
                widget.tweet.timestamp.toDate().toString().substring(0, 19),
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
          SizedBox(height: 10),
          Divider()
        ],
      ),
    );
  }
}
