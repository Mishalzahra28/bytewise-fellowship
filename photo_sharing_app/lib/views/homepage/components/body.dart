import 'package:flutter/material.dart';
import '../../../components/customButton.dart';
import '../../../components/dialog_box.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../../../components/feed.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => getImages());
  }

  late File selectedImage;
  late String selectedFile;
  final FirebaseStorage storage = FirebaseStorage.instance;
  List<String> imageUrls = [];

  void selectImage() async {
    ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
    selectedFile = file!.name;
    print('${file.path}');
    selectedImage = File(file.path);
  }

  void uploadImage() {
    upload_to_firebase(selectedImage, selectedFile);
  }

  Future<void> upload_to_firebase(File file, String imageName) async {
    try {
      final FirebaseStorage storage = FirebaseStorage.instance;
      final Reference ref = storage.ref().child('images/$imageName');
      await ref.putFile(file);
      final String downloadURL = await ref.getDownloadURL();
      print('File uploaded successfully. Download URL: $downloadURL');
      // Navigator.of(context).pop();
    } catch (e) {
      print(e.toString());
    }
  }

  void upload() {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog_box(
            selectImage: selectImage,
            upload: uploadImage,
          );
        });
  }

  Future<void> getImages() async {
    try {
      ListResult result = await storage.ref('images/').listAll();
      for (var ref in result.items) {
        String url = await ref.getDownloadURL();
        setState(() {
          imageUrls.add(url);
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Feed(imageUrls: imageUrls),
          customButton(text: 'Upload', onClick: upload)
        ],
      ),
    );
  }
}
