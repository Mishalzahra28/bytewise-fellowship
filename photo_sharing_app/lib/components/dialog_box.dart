import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';
import './customButton.dart';
import 'package:flutter/material.dart';
import './customField.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firabase_storage;
import 'package:firebase_core/firebase_core.dart';

class Dialog_box extends StatelessWidget {
  Dialog_box({
    super.key,
  });
  XFile? file;
  String imageURL = '';
  late String selectedFile;
  late Uint8List selectedImageInBytes;

  void selectImage() async {
    ImagePicker imagePicker = ImagePicker();
    file = await imagePicker.pickImage(source: ImageSource.gallery);
    selectedFile = file!.name;
    print('${file?.path}');
  }

  void uploadImage() async {
    // Reference referenceRoot = FirebaseStorage.instance.ref();
    // Reference referenceDirImages = referenceRoot.child('images');
    // Reference referenceImageToUpload =
    //     referenceDirImages.child('${file?.name}');
    try {
      // await referenceImageToUpload.putFile(file!.path as File);
      // imageURL = await referenceImageToUpload.getDownloadURL();
      firabase_storage.UploadTask uploadTask;

      firabase_storage.Reference ref = firabase_storage.FirebaseStorage.instance
          .ref()
          .child('image')
          .child('/' + selectedFile);
      print('${ref} reff');
      final metadata =
          firabase_storage.SettableMetadata(contentType: 'image/jpeg');

      //uploadTask = ref.putFile(File(file.path));
      uploadTask = ref.putData(selectedImageInBytes, metadata);

      await uploadTask.whenComplete(() => null);
      imageURL = await ref.getDownloadURL();
      print('${imageURL} URLLL');
    } catch (error) {}
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
              // const customField(text: 'Enter Caption'),
              IconButton(
                  onPressed: selectImage,
                  icon: const Icon(Icons.camera_alt_outlined)),
              customButton(text: 'Upload', onClick: uploadImage)
            ],
          ),
        ));
  }
}
