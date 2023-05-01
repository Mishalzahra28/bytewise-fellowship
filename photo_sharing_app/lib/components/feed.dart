import 'package:flutter/material.dart';
// class Feed extends StatefulWidget {
//   @override
//   _FeedState createState() => _FeedState();
// }

class Feed extends StatelessWidget {
  late List<String> imageUrls;
  Feed({super.key, required this.imageUrls});
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: imageUrls.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image.network(
            imageUrls[index],
            height: 200,
            width: 200,
          ),
        );
      },
    );
  }
}
