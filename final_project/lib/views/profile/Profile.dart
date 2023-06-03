import "package:flutter/cupertino.dart";
import 'package:flutter/material.dart';
import "../../services/DatabaseService.dart";
import "../../services/authServices.dart";
import "../../services/constants.dart";
import "../../Models/UserModels.dart";
import "../splashScreen/splash.dart";
import "../../Models/Tweet.dart";
import "../../utils/TweetContainer.dart";
import "../EditProfileScreen/EditProfileScreen.dart";

class Profile extends StatefulWidget {
  final String currentUserId;
  final String visitedUserId;

  const Profile(
      {super.key, required this.currentUserId, required this.visitedUserId});
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  // int _followersCount = 0;
  // int _followingCount = 0;
  // bool _isFollowing = false;
  // int _profileSegmentedValue = 0;
  // List<Tweet> _allTweets = [];
  // List<Tweet> _mediaTweets = [];

  // final Map<int, Widget> _profileTabs = <int, Widget>{
  //   0: const Padding(
  //     padding: EdgeInsets.symmetric(vertical: 10),
  //     child: Text(
  //       'Tweets',
  //       style: TextStyle(
  //         fontSize: 13,
  //         fontWeight: FontWeight.w700,
  //         color: Colors.white,
  //       ),
  //     ),
  //   ),
  //   1: const Padding(
  //     padding: EdgeInsets.symmetric(vertical: 10),
  //     child: Text(
  //       'Media',
  //       style: TextStyle(
  //         fontSize: 13,
  //         fontWeight: FontWeight.w700,
  //         color: Colors.white,
  //       ),
  //     ),
  //   ),
  // };

  // Widget buildProfileWidgets(UserModel author) {
  //   switch (_profileSegmentedValue) {
  //     case 0:
  //       return ListView.builder(
  //           shrinkWrap: true,
  //           physics: NeverScrollableScrollPhysics(),
  //           itemCount: _allTweets.length,
  //           itemBuilder: (context, index) {
  //             return TweetContainer(
  //               currentUserId: widget.currentUserId,
  //               author: author,
  //               tweet: _allTweets[index],
  //             );
  //           });
  //       break;
  //     case 1:
  //       return ListView.builder(
  //           shrinkWrap: true,
  //           physics: NeverScrollableScrollPhysics(),
  //           itemCount: _mediaTweets.length,
  //           itemBuilder: (context, index) {
  //             return TweetContainer(
  //               currentUserId: widget.currentUserId,
  //               author: author,
  //               tweet: _mediaTweets[index],
  //             );
  //           });
  //       break;
  //     default:
  //       return Center(
  //           child: Text('Something wrong', style: TextStyle(fontSize: 25)));
  //       break;
  //   }
  // }

  // getFollowersCount() async {
  //   int followersCount =
  //       await DatabaseService.followersNum(widget.visitedUserId);
  //   if (mounted) {
  //     setState(() {
  //       _followersCount = followersCount;
  //     });
  //   }
  // }

  // getFollowingCount() async {
  //   int followingCount =
  //       await DatabaseService.followingNum(widget.visitedUserId);
  //   if (mounted) {
  //     setState(() {
  //       _followingCount = followingCount;
  //     });
  //   }
  // }

  // followOrUnFollow() {
  //   if (_isFollowing) {
  //     unFollowUser();
  //   } else {
  //     followUser();
  //   }
  // }

  // unFollowUser() {
  //   DatabaseService.unFollowUser(widget.currentUserId, widget.visitedUserId);
  //   setState(() {
  //     _isFollowing = false;
  //     _followersCount--;
  //   });
  // }

  // followUser() {
  //   DatabaseService.followUser(widget.currentUserId, widget.visitedUserId);
  //   setState(() {
  //     _isFollowing = true;
  //     _followersCount++;
  //   });
  // }

  // setupIsFollowing() async {
  //   bool isFollowingThisUser = await DatabaseService.isFollowingUser(
  //       widget.currentUserId, widget.visitedUserId);
  //   setState(() {
  //     _isFollowing = isFollowingThisUser;
  //   });
  // }

  // getAllTweets() async {
  //   List<Tweet> userTweets =
  //       await DatabaseService.getUserTweets(widget.visitedUserId)
  //           as List<Tweet>;
  //   if (mounted) {
  //     setState(() {
  //       _allTweets = userTweets;
  //       _mediaTweets =
  //           _allTweets.where((element) => element.image.isNotEmpty).toList();
  //     });
  //   }
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   getFollowersCount();
  //   getFollowingCount();
  //   print("printing snapshot");
  //   print(usersRef.doc(widget.visitedUserId).toString());
  //   setupIsFollowing();
  //   getAllTweets();
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //       backgroundColor: Colors.white,
  //       body: FutureBuilder(
  //         future: usersRef.doc(widget.visitedUserId).get(),
  //         builder: (BuildContext context, AsyncSnapshot snapshot) {
  //           if (!snapshot.hasData) {
  //             return Center(
  //               child: CircularProgressIndicator(
  //                 valueColor: AlwaysStoppedAnimation(Colors.blue),
  //               ),
  //             );
  //           }
  //           UserModel userModel = UserModel.fromDoc(snapshot.data);
  //           return ListView(
  //             physics: const BouncingScrollPhysics(
  //                 parent: AlwaysScrollableScrollPhysics()),
  //             children: [
  //               Container(
  //                 height: 150,
  //                 decoration: BoxDecoration(
  //                   color: Colors.blue,
  //                   image: userModel.coverImage.isEmpty
  //                       ? null
  //                       : DecorationImage(
  //                           fit: BoxFit.cover,
  //                           image: NetworkImage(userModel.coverImage),
  //                         ),
  //                 ),
  //                 child: Padding(
  //                   padding: const EdgeInsets.symmetric(
  //                       horizontal: 20, vertical: 10),
  //                   child: Row(
  //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       SizedBox.shrink(),
  //                       widget.currentUserId == widget.visitedUserId
  //                           ? PopupMenuButton(
  //                               icon: const Icon(
  //                                 Icons.more_horiz,
  //                                 color: Colors.white,
  //                                 size: 30,
  //                               ),
  //                               itemBuilder: (_) {
  //                                 return <PopupMenuItem<String>>[
  //                                   new PopupMenuItem(
  //                                     child: Text('Logout'),
  //                                     value: 'logout',
  //                                   )
  //                                 ];
  //                               },
  //                               onSelected: (selectedItem) {
  //                                 if (selectedItem == 'logout') {
  //                                   AuthService.logout();
  //                                   Navigator.pushReplacement(
  //                                       context,
  //                                       MaterialPageRoute(
  //                                           builder: (context) =>
  //                                               SplashScreen()));
  //                                 }
  //                               },
  //                             )
  //                           : SizedBox(),
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //               Container(
  //                 transform: Matrix4.translationValues(0.0, -40.0, 0.0),
  //                 padding: EdgeInsets.symmetric(horizontal: 20),
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                       crossAxisAlignment: CrossAxisAlignment.end,
  //                       children: [
  //                         CircleAvatar(
  //                           radius: 45,
  //                           backgroundImage: userModel.profilePicture.isEmpty
  //                               ? AssetImage('lib/assets/profile.jpg')
  //                                   as ImageProvider
  //                               : NetworkImage(userModel.profilePicture),
  //                         ),
  //                         widget.currentUserId == widget.visitedUserId
  //                             ? GestureDetector(
  //                                 onTap: () async {
  //                                   await Navigator.push(
  //                                     context,
  //                                     MaterialPageRoute(
  //                                       builder: (context) => EditProfileScreen(
  //                                         user: userModel,
  //                                       ),
  //                                     ),
  //                                   );
  //                                   setState(() {});
  //                                 },
  //                                 child: Container(
  //                                   width: 100,
  //                                   height: 35,
  //                                   padding:
  //                                       EdgeInsets.symmetric(horizontal: 10),
  //                                   decoration: BoxDecoration(
  //                                     borderRadius: BorderRadius.circular(20),
  //                                     color: Colors.white,
  //                                     border: Border.all(color: Colors.blue),
  //                                   ),
  //                                   child: const Center(
  //                                     child: Text(
  //                                       'Edit',
  //                                       style: TextStyle(
  //                                         fontSize: 17,
  //                                         color: Colors.blue,
  //                                         fontWeight: FontWeight.bold,
  //                                       ),
  //                                     ),
  //                                   ),
  //                                 ),
  //                               )
  //                             : GestureDetector(
  //                                 onTap: followOrUnFollow,
  //                                 child: Container(
  //                                   width: 100,
  //                                   height: 35,
  //                                   padding:
  //                                       EdgeInsets.symmetric(horizontal: 10),
  //                                   decoration: BoxDecoration(
  //                                     borderRadius: BorderRadius.circular(20),
  //                                     color: _isFollowing
  //                                         ? Colors.white
  //                                         : Colors.blue,
  //                                     border: Border.all(color: Colors.blue),
  //                                   ),
  //                                   child: Center(
  //                                     child: Text(
  //                                       _isFollowing ? 'Following' : 'Follow',
  //                                       style: TextStyle(
  //                                         fontSize: 17,
  //                                         color: _isFollowing
  //                                             ? Colors.blue
  //                                             : Colors.white,
  //                                         fontWeight: FontWeight.bold,
  //                                       ),
  //                                     ),
  //                                   ),
  //                                 ),
  //                               ),
  //                       ],
  //                     ),
  //                     SizedBox(height: 10),
  //                     Text(
  //                       userModel.name,
  //                       style: const TextStyle(
  //                         fontSize: 20,
  //                         fontWeight: FontWeight.bold,
  //                       ),
  //                     ),
  //                     SizedBox(height: 10),
  //                     Text(
  //                       userModel.bio,
  //                       style: const TextStyle(
  //                         fontSize: 15,
  //                       ),
  //                     ),
  //                     SizedBox(height: 15),
  //                     Row(
  //                       children: [
  //                         Text(
  //                           '$_followingCount Following',
  //                           style: const TextStyle(
  //                             fontSize: 16,
  //                             fontWeight: FontWeight.w500,
  //                             letterSpacing: 2,
  //                           ),
  //                         ),
  //                         SizedBox(width: 20),
  //                         Text(
  //                           '$_followersCount Followers',
  //                           style: const TextStyle(
  //                             fontSize: 16,
  //                             fontWeight: FontWeight.w500,
  //                             letterSpacing: 2,
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                     SizedBox(height: 20),
  //                     Container(
  //                       width: MediaQuery.of(context).size.width,
  //                       child: CupertinoSlidingSegmentedControl(
  //                         groupValue: _profileSegmentedValue,
  //                         thumbColor: Colors.blue,
  //                         backgroundColor: Colors.blueGrey,
  //                         children: _profileTabs,
  //                         onValueChanged: (i) {
  //                           setState(() {
  //                             _profileSegmentedValue = i!;
  //                           });
  //                         },
  //                       ),
  //                     )
  //                   ],
  //                 ),
  //               ),
  //               buildProfileWidgets(userModel),
  //             ],
  //           );
  //         },
  //       ));
  // }

  int _followersCount = 0;
  int _followingCount = 0;
  bool _isFollowing = false;
  int _profileSegmentedValue = 0;
  List<Tweet> _allTweets = [];
  List<Tweet> _mediaTweets = [];

  final Map<int, Widget> _profileTabs = <int, Widget>{
    0: const Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        'Tweets',
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
    ),
    1: const Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        'Media',
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
    ),
  };

  Widget buildProfileWidgets(UserModel author) {
    switch (_profileSegmentedValue) {
      case 0:
        return ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: _allTweets.length,
            itemBuilder: (context, index) {
              return TweetContainer(
                currentUserId: widget.currentUserId,
                author: author,
                tweet: _allTweets[index],
              );
            });
        break;
      case 1:
        return ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: _mediaTweets.length,
            itemBuilder: (context, index) {
              return TweetContainer(
                currentUserId: widget.currentUserId,
                author: author,
                tweet: _mediaTweets[index],
              );
            });
        break;
      default:
        return Center(
            child: Text('Something wrong', style: TextStyle(fontSize: 25)));
        break;
    }
  }

  getFollowersCount() async {
    int followersCount =
        await DatabaseService.followersNum(widget.visitedUserId);
    if (mounted) {
      setState(() {
        _followersCount = followersCount;
      });
    }
  }

  getFollowingCount() async {
    int followingCount =
        await DatabaseService.followingNum(widget.visitedUserId);
    if (mounted) {
      setState(() {
        _followingCount = followingCount;
      });
    }
  }

  followOrUnFollow() {
    if (_isFollowing) {
      unFollowUser();
    } else {
      followUser();
    }
  }

  unFollowUser() {
    DatabaseService.unFollowUser(widget.currentUserId, widget.visitedUserId);
    setState(() {
      _isFollowing = false;
      _followersCount--;
    });
  }

  followUser() {
    DatabaseService.followUser(widget.currentUserId, widget.visitedUserId);
    setState(() {
      _isFollowing = true;
      _followersCount++;
    });
  }

  setupIsFollowing() async {
    bool isFollowingThisUser = await DatabaseService.isFollowingUser(
        widget.currentUserId, widget.visitedUserId);
    setState(() {
      _isFollowing = isFollowingThisUser;
    });
  }

  getAllTweets() async {
    List<Tweet> userTweets =
        await DatabaseService.getUserTweets(widget.visitedUserId)
            as List<Tweet>;
    if (mounted) {
      setState(() {
        _allTweets = userTweets;
        _mediaTweets =
            _allTweets.where((element) => element.image.isNotEmpty).toList();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getFollowersCount();
    getFollowingCount();
    setupIsFollowing();
    getAllTweets();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: FutureBuilder(
          future: usersRef.doc(widget.visitedUserId).get(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.blue),
                ),
              );
            }
            UserModel userModel = UserModel.fromDoc(snapshot.data);
            return ListView(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              children: [
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    image: userModel.coverImage.isEmpty
                        ? null
                        : DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(userModel.coverImage),
                          ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox.shrink(),
                        widget.currentUserId == widget.visitedUserId
                            ? PopupMenuButton(
                                icon: Icon(
                                  Icons.more_horiz,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                itemBuilder: (_) {
                                  return <PopupMenuItem<String>>[
                                    new PopupMenuItem(
                                      child: Text('Logout'),
                                      value: 'logout',
                                    )
                                  ];
                                },
                                onSelected: (selectedItem) {
                                  if (selectedItem == 'logout') {
                                    AuthService.logout();
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SplashScreen()));
                                  }
                                },
                              )
                            : SizedBox(),
                      ],
                    ),
                  ),
                ),
                Container(
                  transform: Matrix4.translationValues(0.0, -40.0, 0.0),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          CircleAvatar(
                            radius: 45,
                            backgroundImage: userModel.profilePicture.isEmpty
                                ? AssetImage('lib/assets/profile.jpg')
                                    as ImageProvider
                                : NetworkImage(userModel.profilePicture),
                          ),
                          widget.currentUserId == widget.visitedUserId
                              ? GestureDetector(
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => EditProfileScreen(
                                          user: userModel,
                                        ),
                                      ),
                                    );
                                    setState(() {});
                                  },
                                  child: Container(
                                    width: 100,
                                    height: 35,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white,
                                      border: Border.all(color: Colors.blue),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        'Edit',
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : GestureDetector(
                                  onTap: followOrUnFollow,
                                  child: Container(
                                    width: 100,
                                    height: 35,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: _isFollowing
                                          ? Colors.white
                                          : Colors.blue,
                                      border: Border.all(color: Colors.blue),
                                    ),
                                    child: Center(
                                      child: Text(
                                        _isFollowing ? 'Following' : 'Follow',
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: _isFollowing
                                              ? Colors.blue
                                              : Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        userModel.name,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        userModel.bio,
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          Text(
                            '$_followingCount Following',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 2,
                            ),
                          ),
                          SizedBox(width: 20),
                          Text(
                            '$_followersCount Followers',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 2,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: CupertinoSlidingSegmentedControl(
                          groupValue: _profileSegmentedValue,
                          thumbColor: Colors.blue,
                          backgroundColor: Colors.blueGrey,
                          children: _profileTabs,
                          onValueChanged: (i) {
                            setState(() {
                              _profileSegmentedValue = i!;
                            });
                          },
                        ),
                      )
                    ],
                  ),
                ),
                buildProfileWidgets(userModel),
              ],
            );
          },
        ));
  }
}
