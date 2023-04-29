import 'package:flutter/material.dart';
import '../../../components/customButton.dart';
import '../../../components/dialog_box.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  void upload() {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog_box(
              // controller: _textController,
              );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Center(
          child: Text(
            'Homepage',
            style: TextStyle(color: Colors.white),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [customButton(text: 'Upload', onClick: upload)],
        )
      ],
    ));
  }
}
