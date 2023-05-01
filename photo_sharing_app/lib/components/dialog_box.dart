import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';
import './customButton.dart';
import 'package:flutter/material.dart';
import './customField.dart';

class Dialog_box extends StatelessWidget {
  VoidCallback upload;
  VoidCallback? selectImage;
  Dialog_box({super.key, required this.upload, required this.selectImage});

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
              customButton(text: 'Upload', onClick: upload)
            ],
          ),
        ));
  }
}
