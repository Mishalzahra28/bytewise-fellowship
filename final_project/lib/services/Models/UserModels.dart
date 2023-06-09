import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String id;
  String name;
  String profilePicture;
  String email;
  String bio;
  String coverImage;

  UserModel(
      {required this.id,
      required this.name,
      required this.profilePicture,
      required this.email,
      required this.bio,
      required this.coverImage});

  factory UserModel.fromDoc(DocumentSnapshot doc) {
    print("inside usermodel");
    print(doc);
    print(doc.exists);
    return UserModel(
      id: doc.id,
      name: doc['name'],
      profilePicture: doc['profilePicture'],
      email: doc['email'],
      bio: doc['bio'],
      coverImage: doc['coverImage'],
    );
  }
}
