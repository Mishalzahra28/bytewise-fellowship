import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';
import './customButton.dart';
import 'package:flutter/material.dart';
import './customField.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';

class Dialog_box extends StatelessWidget {
  Dialog_box({
    super.key,
  });
  late File selectedImage;
  String imageURL = '';
  late String selectedFile;
  late Uint8List selectedImageInBytes;

  void selectImage() async {
    ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
    selectedFile = file!.name;
    print('${file.path}');
    selectedImage = File(file.path);
  }

  void uploadImage() {
    upload(selectedImage, selectedFile);
  }

  Future<void> upload(File file, String imageName) async {
    try {
      final FirebaseStorage storage = FirebaseStorage.instance;
      final Reference ref = storage.ref().child('images/$imageName');
      await ref.putFile(file);
      final String downloadURL = await ref.getDownloadURL();
      print('File uploaded successfully. Download URL: $downloadURL');
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor: Colors.white,
        content: Container(
          height: 240,
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: selectImage,
                  icon: const Icon(Icons.camera_alt_outlined)),
              customButton(text: 'Upload', onClick: uploadImage)
            ],
          ),
        ));
  }
}
