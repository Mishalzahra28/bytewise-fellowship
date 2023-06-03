import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../services/DatabaseService.dart';
import '../services/StorageService.dart';
import '../utils/button.dart';
import '../services/Models/Tweet.dart';

class NewTweet extends StatefulWidget {
  final String currentUserId;

  const NewTweet({super.key, required this.currentUserId});
  @override
  _NewTweetState createState() => _NewTweetState();
}

class _NewTweetState extends State<NewTweet> {
  late String _tweetText;
  late File _pickedImage;
  bool _loading = false;

  handleImageFromGallery() async {
    try {
      ImagePicker imagePicker = ImagePicker();
      XFile? imageFile =
          await imagePicker.pickImage(source: ImageSource.gallery);
      if (imageFile != null) {
        setState(() {
          _pickedImage = imageFile as File;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(
          'Tweet',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 20),
            TextField(
              maxLength: 280,
              maxLines: 7,
              decoration: InputDecoration(
                hintText: 'Enter your Tweet',
              ),
              onChanged: (value) {
                _tweetText = value;
              },
            ),
            SizedBox(height: 10),
            _pickedImage == null
                ? SizedBox.shrink()
                : Column(
                    children: [
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: FileImage(_pickedImage),
                            )),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
            GestureDetector(
              onTap: handleImageFromGallery,
              child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.blue,
                    width: 2,
                  ),
                ),
                child: Icon(
                  Icons.camera_alt,
                  size: 50,
                  color: Colors.blue,
                ),
              ),
            ),
            SizedBox(height: 20),
            CustomBtn(
              text: 'Tweet',
              onBtnPressed: () async {
                setState(() {
                  _loading = true;
                });
                if (_tweetText != null && _tweetText.isNotEmpty) {
                  String image;
                  if (_pickedImage == null) {
                    image = '';
                  } else {
                    image =
                        await StorageService.uploadTweetPicture(_pickedImage);
                  }
                  Tweet tweet = Tweet(
                    id: "",
                    text: _tweetText,
                    image: image,
                    authorId: widget.currentUserId,
                    likes: 0,
                    retweets: 0,
                    timestamp: Timestamp.fromDate(
                      DateTime.now(),
                    ),
                  );
                  DatabaseService.createTweet(tweet);
                  Navigator.pop(context);
                }
                setState(() {
                  _loading = false;
                });
              },
            ),
            SizedBox(height: 20),
            _loading ? CircularProgressIndicator() : SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
