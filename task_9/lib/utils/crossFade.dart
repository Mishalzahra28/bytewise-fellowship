import 'package:flutter/material.dart';

class CrossFade extends StatefulWidget {
  const CrossFade({super.key});

  @override
  State<CrossFade> createState() => _CrossFadeState();
}

class _CrossFadeState extends State<CrossFade> {
  bool isFirst = true;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedCrossFade(
          duration: Duration(seconds: 2),
          firstChild: Image.asset('lib/assets/child1.jpg'),
          secondChild: Image.asset('lib/assets/child2.jpg'),
          crossFadeState:
              isFirst ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        ),
        ElevatedButton(
            onPressed: () {
              setState(() {
                isFirst = !isFirst;
              });
            },
            child: Text('Cross Fade'))
      ],
    );
  }
}
